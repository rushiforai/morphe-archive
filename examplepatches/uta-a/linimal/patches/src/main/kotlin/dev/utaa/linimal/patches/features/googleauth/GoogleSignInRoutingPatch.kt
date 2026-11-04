package dev.utaa.linimal.patches.features.googleauth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.utaa.linimal.patches.features.push.isOriginalCertificateSha1
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val SIGN_IN_HOOKS = "Ldev/utaa/linimal/extension/features/googleauth/GoogleAuthRoutingHooks;"
internal const val GMS_PACKAGE_NAME = "com.google.android.gms"
internal const val IDENTITY_SIGN_IN_ACTION = "com.google.android.gms.auth.api.identity.service.signin.START"

/** androidx.credentials の provider 選択。TV・車載では Play services 版を使う、という公式の分岐を目印にします。 */
private val credentialProviderFactoryFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("android.software.leanback", "android.hardware.type.automotive"),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[1] == OBJECT },
)

/** Play services 版 provider。class 名は R8 の keep 対象で、manifest の CREDENTIAL_PROVIDER_KEY から反射で作られます。 */
internal const val PLAY_SERVICES_PROVIDER = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
/** この version 以上の Google Play services では、Sign-In client より先に Identity Credentials API を使います。 */
internal const val PRE_U_MIN_GMS_APK_VERSION = 252400000

private val playServicesGetCredentialFingerprint = Fingerprint(
    definingClass = PLAY_SERVICES_PROVIDER,
    name = "onGetCredential",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 5 && method.parameterTypes[0] == "Landroid/content/Context;" },
    filters = listOf(app.morphe.patcher.literal(PRE_U_MIN_GMS_APK_VERSION)),
)

/** Identity API の Sign-In client が bind に使う action を返す override。 */
private val identitySignInActionFingerprint = Fingerprint(
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(IDENTITY_SIGN_IN_ACTION),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * 再署名した LINE で使えなくなる「Google でログイン」を、MicroG-RE 経由で行えるようにします（ADR 0004）。
 * Google ID token を要求するときだけ Play services 版の Credential provider を選ばせ、その Identity Sign-In client の
 * bind 先を MicroG-RE へ向けます。設定 OFF、MicroG-RE が未導入、例外時は hook が元の値を返します。
 * パスキー・パスワード、他の GMS client、LINE の認証通信には触れません。
 */
val googleSignInRoutingPatch = bytecodePatch(
    name = "MicroG-RE で Google アカウントのログインを行う",
    description = "Google アカウントでのログインを、実行時設定で MicroG-RE へ向けられるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(googleAuthTokenRoutingPatch)

    execute {
        val ids = listOf(PatchId.GOOGLE_AUTH_SIGN_IN_ROUTING)
        if (!isOriginalCertificateSha1(Constants.LINE_ORIGINAL_CERTIFICATE_SHA1)) {
            patchStatusCollector.record(googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_SIGN_IN_ROUTING))
            return@execute
        }
        val factories = credentialProviderFactoryFingerprint.matchAllOrNull().orEmpty()
        val actions = identitySignInActionFingerprint.matchAllOrNull().orEmpty()
        val getCredentials = playServicesGetCredentialFingerprint.matchAllOrNull().orEmpty()
        if (factories.size != 1 || actions.size != 1 || getCredentials.size != 1) {
            recordUnappliedFeatureStatus(ids, 5, factories.size + actions.size + getCredentials.size,
                "GoogleSignInTargetsNotUnique")
            return@execute
        }
        val legacyBranch = signInClientBranch(getCredentials.single().originalMethod)
        val factory = factories.single()
        val action = actions.single()
        val provider = factory.originalMethod.returnType
        // 同じ class の、manifest の CREDENTIAL_PROVIDER_KEY から Play services 版を作る公式の method です。
        val playServices = factory.originalClassDef.methods.filter {
            it.parameterTypes.isEmpty() && it.returnType == provider && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasString("androidx.credentials.CREDENTIAL_PROVIDER_KEY")
        }
        val client = action.originalClassDef
        val base = client.superclass?.let { classDefByOrNull(it) }?.superclass?.let { classDefByOrNull(it) }
        val packageGetter = base?.methods?.filter { isGmsPackageGetter(it) }.orEmpty()
        val dynamicLookupName = base?.let { dynamicLookupName(it, packageGetter.singleOrNull()?.name, action.originalMethod.name) }
        val dynamicLookup = client.methods.filter {
            it.name == dynamicLookupName && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        val factoryRegisters = factory.method.implementation?.registerCount ?: 0
        if (playServices.size != 1 || packageGetter.size != 1 || dynamicLookup.size != 1 ||
            client.methods.any { it.name == packageGetter.single().name && it.parameterTypes.isEmpty() } ||
            factoryRegisters < 3 || !returnsConstant(action.originalMethod, Opcode.CONST_STRING) ||
            !returnsConstant(dynamicLookup.single(), Opcode.CONST_4) || legacyBranch == null) {
            recordUnsafeFeatureStatus(ids, 5, 3, "GoogleSignInShapeMismatch")
            return@execute
        }

        // 引数は (factory, request) で連続します。v0 は先頭ではまだ使われていません。
        // Play services 版を作れなければ（null）、元の provider 選択を続けます。
        // 生成時の例外も元の選択へ戻すため、Play services 版の生成を try で囲みます。
        factory.method.addInstructionsWithLabels(0, """
            invoke-static/range { p0 .. p1 }, $SIGN_IN_HOOKS->shouldUsePlayServicesCredentialProvider($OBJECT$OBJECT)Z
            move-result v0
            if-eqz v0, :keep
            invoke-virtual/range { p0 .. p0 }, ${reference(playServices.single())}
            move-result-object v0
            if-eqz v0, :keep
            return-object v0
            move-exception v0
            :keep
            nop
        """.trimIndent())
        // 生成の invoke と move-result だけを catch-all で囲み、handler は move-exception に置きます。
        val factoryBody = checkNotNull(factory.method.implementation)
        val create = factoryBody.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == playServices.single().name &&
                it.opcode == Opcode.INVOKE_VIRTUAL_RANGE
        }
        val handler = factoryBody.instructions.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
        check(create in 0 until handler && factoryBody.instructions[create + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        factoryBody.addCatch(factoryBody.newLabelForIndex(create), factoryBody.newLabelForIndex(create + 2),
            factoryBody.newLabelForIndex(handler))

        // 「新しい API を使うか」の結果を hook に通します。元の結果が false でも、向け替えの準備のため必ず呼びます。
        val branch = checkNotNull(legacyBranch)
        getCredentials.single().method.addInstructions(branch.resultIndex + 1, """
            invoke-static { v${branch.result}, v${branch.context}, v${branch.request} }, $SIGN_IN_HOOKS->useIdentityCredentialsApi(ZLandroid/content/Context;$OBJECT)Z
            move-result v${branch.result}
        """.trimIndent())

        // 元の override は this の register に定数を上書きして返すため、同じ定数を返す method に置き換えます。
        val mutableClient = mutableClassDefBy(client.type)
        val actionOverride = constantReturn(action.originalMethod, """
            const-string v0, "$IDENTITY_SIGN_IN_ACTION"
            invoke-static { p0, v0 }, $SIGN_IN_HOOKS->identitySignInAction($OBJECT$STRING)$STRING
            move-result-object v0
            return-object v0
        """)
        val lookupValue = ((dynamicLookup.single().implementation!!.instructions.first()) as NarrowLiteralInstruction).narrowLiteral
        val lookup = constantReturn(dynamicLookup.single(), """
            const/4 v0, $lookupValue
            invoke-static { p0, v0 }, $SIGN_IN_HOOKS->identitySignInDynamicLookup(${OBJECT}Z)Z
            move-result v0
            return v0
        """)
        val getter = packageGetter.single()
        val superType = checkNotNull(client.superclass)
        val override = generated(client.type, getter.name, STRING, AccessFlags.PUBLIC.value, """
            invoke-super { p0 }, $superType->${getter.name}()$STRING
            move-result-object v0
            invoke-static { p0, v0 }, $SIGN_IN_HOOKS->identitySignInPackage($OBJECT$STRING)$STRING
            move-result-object v0
            return-object v0
        """)
        for (replaced in listOf(actionOverride, lookup)) {
            mutableClient.methods.removeIf { it.name == replaced.name && it.parameterTypes.isEmpty() }
            mutableClient.virtualMethods.removeIf { it.name == replaced.name && it.parameterTypes.isEmpty() }
        }
        for (method in listOf(actionOverride, lookup, override)) {
            mutableClient.methods.add(method)
            mutableClient.virtualMethods.add(method)
        }
        recordFeatureStatus(ids, 5, 5, "GoogleSignInRoutingGuarded")
    }
}

/** 引数なしの元 method と同じ名前・戻り値・access flag で、register を 2 つ持つ method を作ります。 */
private fun constantReturn(original: Method, body: String) =
    generated(original.definingClass, original.name, original.returnType, original.accessFlags, body)

private fun generated(owner: String, name: String, result: String, flags: Int, body: String): MutableMethod {
    val implementation = MutableMethodImplementation(2)
    implementation.addInstruction(BuilderInstruction10x(Opcode.NOP))
    val method = MutableMethod(ImmutableMethod(owner, name, emptyList(), result, flags, null, null, implementation))
    method.addInstructions(0, body.trimIndent())
    method.implementation!!.removeInstruction(method.implementation!!.instructions.size - 1)
    return method
}

private fun Method.hasString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

/** PRE_U の version 判定の結果 register と、その false 側で Sign-In client へ渡す Context・request の register。 */
internal data class SignInClientBranch(val resultIndex: Int, val result: Int, val context: Int, val request: Int)

/**
 * `isAvailableOnDevice(252400000)` の結果を受ける位置と、false 側で `new X(Context)` → `X.g(request, …)` を呼ぶ register。
 * どれも 4 bit に収まり、判定から呼び出しまでの間に書き換えられないことを確かめます。
 */
internal fun signInClientBranch(method: Method): SignInClientBranch? {
    val body = method.implementation?.instructions?.toList() ?: return null
    val request = method.parameterTypes.getOrNull(1)?.toString() ?: return null
    val literal = body.indexOfFirst {
        it is com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction &&
            it.opcode != Opcode.CONST_WIDE && it.wideLiteral == PRE_U_MIN_GMS_APK_VERSION.toLong()
    }
    if (literal < 0) return null
    val literalRegister = (body[literal] as OneRegisterInstruction).registerA
    val call = (literal + 1 until body.size).firstOrNull { index ->
        val ref = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "isAvailableOnDevice" && ref.parameterTypes.map(CharSequence::toString) == listOf("I")
    } ?: return null
    if ((body[call] as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction)?.registerD != literalRegister ||
        body.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT) return null
    val result = (body[call + 1] as OneRegisterInstruction).registerA
    val sends = (call + 2 until body.size).filter { index ->
        val ref = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        body[index].opcode == Opcode.INVOKE_VIRTUAL && ref?.returnType == "V" && ref.parameterTypes.size == 4 &&
            ref.parameterTypes[0].toString() == request
    }
    val send = sends.firstOrNull() ?: return null
    val owner = ((body[send] as ReferenceInstruction).reference as MethodReference).definingClass
    val init = (send - 1 downTo call + 2).firstOrNull { index ->
        val ref = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        body[index].opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == owner && ref.name == "<init>" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
    } ?: return null
    val context = (body[init] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
    val requestRegister = (body[send] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
    if (result > 15 || context > 15 || requestRegister > 15) return null
    // 判定直後の if-eqz の飛び先（false 側）から呼び出しまでに、Context と request へ書き込む命令がないこと。
    val jump = body.getOrNull(call + 2) as? com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction ?: return null
    if (body[call + 2].opcode != Opcode.IF_EQZ || (body[call + 2] as OneRegisterInstruction).registerA != result) return null
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val target = addresses.indexOf(addresses[call + 2] + jump.codeOffset)
    if (target <= call + 2 || target > init) return null
    val written = (target until init).any { index ->
        body[index].opcode.setsRegister() &&
            (body[index] as? OneRegisterInstruction)?.registerA in setOf(context, requestRegister)
    }
    if (written) return null
    return SignInClientBranch(call + 1, result, context, requestRegister)
}

/** `const-string "com.google.android.gms"` と return だけの、GMS client 共通の bind 先 getter。 */
internal fun isGmsPackageGetter(method: Method): Boolean {
    val body = method.implementation?.instructions?.toList() ?: return false
    return method.parameterTypes.isEmpty() && method.returnType == STRING &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && !AccessFlags.FINAL.isSet(method.accessFlags) &&
        body.map { it.opcode } == listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT) &&
        ((body[0] as ReferenceInstruction).reference as StringReference).string == GMS_PACKAGE_NAME
}

/** 接続処理で bind 先・action の直後に呼ばれる boolean getter の名前。dynamic lookup を使うかどうかです。 */
internal fun dynamicLookupName(base: ClassDef, packageGetter: String?, actionGetter: String): String? {
    if (packageGetter == null) return null
    for (method in base.methods) {
        val calls = method.implementation?.instructions?.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref -> ref.definingClass == base.type }
        }?.toList() ?: continue
        for (index in 0 until calls.size - 2) {
            val (first, second, third) = Triple(calls[index], calls[index + 1], calls[index + 2])
            if (first.name == packageGetter && first.returnType == STRING && second.name == actionGetter &&
                second.returnType == STRING && third.parameterTypes.isEmpty() && third.returnType == "Z") {
                return third.name
            }
        }
    }
    return null
}

/** 定数を 1 つ置いて返すだけの method。同じ定数を返す method へ置き換えても挙動が変わらない形かを確かめます。 */
internal fun returnsConstant(method: Method, opcode: Opcode): Boolean {
    val body = method.implementation?.instructions?.toList() ?: return false
    return method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        body.size == 2 && body[0].opcode == opcode &&
        (body[0] as OneRegisterInstruction).registerA == (body[1] as? OneRegisterInstruction)?.registerA &&
        (opcode != Opcode.CONST_STRING ||
            ((body[0] as ReferenceInstruction).reference as StringReference).string == IDENTITY_SIGN_IN_ACTION)
}

private fun reference(method: Method) = method.definingClass + "->" + method.name +
    method.parameterTypes.joinToString("", "(", ")") + method.returnType
