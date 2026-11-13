package dev.utaa.cutlog.patches.auth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.utaa.cutlog.patches.shared.Constants
import org.w3c.dom.Element

private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val HOOK = "Ldev/utaa/cutlog/extension/auth/GoogleAuth;"
private const val GMS = "com.google.android.gms"
private const val MICROG = "app.revanced.android.gms"
private const val ACTION = "$GMS.auth.api.identity.service.signin.START"
private const val ROUTED_ACTION = "$MICROG.auth.api.identity.service.signin.START"
private const val ROUTING_FIELD = "cutlogUseMicrog"
private const val PROVIDER = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
private const val PRE_U_VERSION = 252400000
// APK signer, not the Play source stamp; verified from setlog 1.3 (76).
private const val ORIGINAL_CERTIFICATE_SHA1 = "5e5253b605de7a5c9b2b03a36632ba3316288c8a"

private val factoryFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("android.software.leanback", "android.hardware.type.automotive"),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[1] == OBJECT },
)
private val getCredentialFingerprint = Fingerprint(
    definingClass = PROVIDER,
    name = "onGetCredential",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 5 && method.parameterTypes[0] == CONTEXT },
    filters = listOf(app.morphe.patcher.literal(PRE_U_VERSION)),
)
private val signInActionFingerprint = Fingerprint(
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(ACTION),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
)
private val serviceConfigFingerprint = Fingerprint(
    name = "<init>",
    parameters = listOf(STRING, "Z"),
    strings = listOf(GMS),
    custom = { _, classDef ->
        classDef.instanceFields.count { it.type == STRING } == 2 &&
            classDef.instanceFields.count { it.type == "Z" } == 1
    },
)

private val microgManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { resource ->
            val document = resource
            val manifest = document.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Google login: application missing from manifest")
            val key = "$MICROG.SPOOFED_PACKAGE_SIGNATURE"
            val metadata = application.getElementsByTagName("meta-data")
            check((0 until metadata.length).none {
                (metadata.item(it) as Element).getAttribute("android:name") == key
            }) { "Google login: original certificate metadata already declared" }
            document.createElement("meta-data").also {
                it.setAttribute("android:name", key)
                it.setAttribute("android:value", ORIGINAL_CERTIFICATE_SHA1)
                application.appendChild(it)
            }
            val packages = manifest.getElementsByTagName("package")
            if ((0 until packages.length).none {
                    (packages.item(it) as Element).getAttribute("android:name") == MICROG
                }) {
                val queries = manifest.getElementsByTagName("queries").item(0)
                    ?: document.createElement("queries").also { manifest.insertBefore(it, application) }
                document.createElement("package").also {
                    it.setAttribute("android:name", MICROG)
                    queries.appendChild(it)
                }
            }
        }
    }
}

/** Keep the app's nonce, result parser, timeout, backend exchange and encryption identity flow intact. */
@Suppress("unused")
val googleSignInPatch = bytecodePatch(
    name = "MicroG-RE Google ログイン",
    description = "Google ID token の取得だけを公式 MicroG-RE 経由にします。setlog のサーバー認証は変更しません。",
) {
    compatibleWith(Constants.SETLOG_COMPATIBILITY)
    dependsOn(microgManifestPatch)
    extendWith("extensions/cutlog.mpe")

    execute {
        val factory = factoryFingerprint.matchAllOrNull().orEmpty().singleOrNull()
            ?: throw PatchException("Google login: provider factory is not unique")
        val acquire = getCredentialFingerprint.matchAllOrNull().orEmpty().singleOrNull()
            ?: throw PatchException("Google login: credential acquisition is not unique")
        val action = signInActionFingerprint.matchAllOrNull().orEmpty().singleOrNull()
            ?: throw PatchException("Google login: Sign-In service action is not unique")
        val config = serviceConfigFingerprint.matchAllOrNull().orEmpty().singleOrNull()
            ?: throw PatchException("Google login: service connection configuration is not unique")
        val factoryContext = factory.originalClassDef.instanceFields.singleOrNull { it.type == CONTEXT }
            ?: throw PatchException("Google login: factory context missing")
        val createProvider = factory.originalClassDef.methods.singleOrNull {
            it.parameterTypes.isEmpty() && it.returnType == factory.originalMethod.returnType &&
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.hasString("androidx.credentials.CREDENTIAL_PROVIDER_KEY")
        } ?: throw PatchException("Google login: Play services provider constructor missing")
        val base = classDefBy(action.originalClassDef.superclass!!)
        val baseContext = base.instanceFields.singleOrNull { it.type == CONTEXT && AccessFlags.PUBLIC.isSet(it.accessFlags) }
            ?: throw PatchException("Google login: client context missing")
        // This R8 build inlines the service package into the connection config, unlike LINE's SDK.
        val connect = base.methods.singleOrNull { method ->
            val calls = method.implementation?.instructions?.mapNotNull { it.methodReference() }.orEmpty()
            calls.any { it.definingClass == config.originalClassDef.type && it.name == "<init>" } &&
                calls.any { it.definingClass == base.type && it.name == action.originalMethod.name }
        } ?: throw PatchException("Google login: client connection method missing")
        val calls = connect.implementation!!.instructions.mapNotNull { it.methodReference() }.toList()
        val actionIndex = calls.indexOfFirst { it.definingClass == base.type && it.name == action.originalMethod.name }
        val lookupName = calls.getOrNull(actionIndex + 1)?.takeIf {
            it.definingClass == base.type && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }?.name ?: throw PatchException("Google login: dynamic lookup getter missing")
        val lookup = action.originalClassDef.methods.singleOrNull {
            it.name == lookupName && it.parameterTypes.isEmpty() && it.returnType == "Z"
        } ?: throw PatchException("Google login: dynamic lookup override missing")
        check(action.originalMethod.constantBody(Opcode.CONST_STRING) && lookup.constantBody(Opcode.CONST_4)) {
            "Google login: unexpected Sign-In getter bodies"
        }
        val constructor = action.originalClassDef.directMethods.single { it.name == "<init>" }
        check(constructor.parameterTypes.first() == CONTEXT)
        val constructorBody = constructor.implementation!!.instructions.toList()
        val finish = constructorBody.indices.single { constructorBody[it].opcode == Opcode.RETURN_VOID }
        check(constructor.implementation!!.registerCount < 16)
        val superIndex = constructorBody.indices.single {
            val ref = constructorBody[it].methodReference()
            ref?.definingClass == base.type && ref.name == "<init>"
        }
        val thisRegister = when (val call = constructorBody[superIndex]) {
            is RegisterRangeInstruction -> call.startRegister
            is FiveRegisterInstruction -> call.registerC
            else -> throw PatchException("Google login: unsupported client constructor")
        }
        check(thisRegister < 16 && (superIndex + 1 until finish).none {
            constructorBody[it].opcode.setsRegister() &&
                (constructorBody[it] as? OneRegisterInstruction)?.registerA == thisRegister
        }) { "Google login: initialized client register overwritten" }
        val scratch = if (thisRegister == 0) 1 else 0
        check(factory.method.implementation!!.registerCount in 3..16)
        val branch = identityBranch(acquire.originalMethod)
            ?: throw PatchException("Google login: legacy Identity Sign-In branch changed")
        val configBody = config.originalMethod.implementation!!.instructions.toList()
        val packageLiteral = configBody.indexOfLast { it.stringReference() == GMS }
        check(packageLiteral >= 0)
        val packageRegister = (configBody[packageLiteral] as OneRegisterInstruction).registerA
        val packageStore = (packageLiteral + 1 until configBody.size).firstOrNull {
            configBody[it].opcode == Opcode.IPUT_OBJECT &&
                (configBody[it] as OneRegisterInstruction).registerA == packageRegister &&
                ((configBody[it] as ReferenceInstruction).reference as? FieldReference)?.type == STRING
        } ?: throw PatchException("Google login: service package assignment missing")
        val configOwner = (configBody[packageStore] as TwoRegisterInstruction).registerB
        val actionStore = configBody.take(packageLiteral).single {
            it.opcode == Opcode.IPUT_OBJECT &&
                ((it as ReferenceInstruction).reference as? FieldReference)?.type == STRING
        }
        val actionField = (actionStore as ReferenceInstruction).reference as FieldReference
        check((actionStore as TwoRegisterInstruction).registerB == configOwner)
        check((packageLiteral + 1 until packageStore).none {
            configBody[it].opcode.setsRegister() &&
                (configBody[it] as? OneRegisterInstruction)?.registerA == packageRegister
        })

        factory.method.addInstructionsWithLabels(0, """
            iget-object v0, p0, ${factoryContext.definingClass}->${factoryContext.name}:$CONTEXT
            invoke-static { v0, p1 }, $HOOK->shouldUseMicrog($CONTEXT$OBJECT)Z
            move-result v0
            if-eqz v0, :original
            invoke-virtual/range { p0 .. p0 }, ${createProvider.reference()}
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            nop
        """.trimIndent())
        acquire.method.addInstructions(branch.index + 1, """
            invoke-static { v${branch.result}, v${branch.context}, v${branch.request} }, $HOOK->useIdentityCredentialsApi(Z$CONTEXT$OBJECT)Z
            move-result v${branch.result}
        """.trimIndent())

        val client = action.classDef
        check(client.fields.none { it.name == ROUTING_FIELD })
        client.fields.add(MutableField(ImmutableField(client.type, ROUTING_FIELD,
            "Z", AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, null, null)))
        // Pin the decision per client: no global time window or cross-request one-shot flag.
        val mutableConstructor = client.methods.single { it.name == constructor.name && it.parameterTypes == constructor.parameterTypes }
        mutableConstructor.addInstructions(finish, """
            iget-object v$scratch, v$thisRegister, ${baseContext.definingClass}->${baseContext.name}:$CONTEXT
            invoke-static { v$scratch }, $HOOK->isTrustedMicrogInstalled($CONTEXT)Z
            move-result v$scratch
            iput-boolean v$scratch, v$thisRegister, ${client.type}->$ROUTING_FIELD:Z
        """.trimIndent())
        val routedAction = replacement(action.originalMethod, """
            iget-boolean v0, p0, ${client.type}->$ROUTING_FIELD:Z
            if-eqz v0, :original
            const-string v0, "$ROUTED_ACTION"
            return-object v0
            :original
            const-string v0, "$ACTION"
            return-object v0
        """)
        val routedLookup = replacement(lookup, """
            iget-boolean v0, p0, ${client.type}->$ROUTING_FIELD:Z
            if-eqz v0, :original
            const/4 v0, 0x0
            return v0
            :original
            const/4 v0, 0x1
            return v0
        """)
        for (method in listOf(routedAction, routedLookup)) {
            client.methods.removeIf { it.name == method.name && it.parameterTypes.isEmpty() }
            client.methods.add(method)
        }
        config.method.addInstructions(packageStore, """
            iget-object v$packageRegister, v$configOwner, ${actionField.definingClass}->${actionField.name}:$STRING
            invoke-static { v$packageRegister }, $HOOK->servicePackage($STRING)$STRING
            move-result-object v$packageRegister
        """.trimIndent())
    }
}

private data class IdentityBranch(val index: Int, val result: Int, val context: Int, val request: Int)

/** Find the version result and the Context/request registers passed to the existing Sign-In controller. */
private fun identityBranch(method: Method): IdentityBranch? {
    val body = method.implementation!!.instructions.toList()
    val literal = body.indexOfFirst { it is WideLiteralInstruction && it.wideLiteral == PRE_U_VERSION.toLong() }
    if (literal < 0) return null
    val call = (literal + 1 until body.size).firstOrNull { body[it].methodReference()?.name == "isAvailableOnDevice" }
        ?: return null
    if (body.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT || body.getOrNull(call + 2)?.opcode != Opcode.IF_EQZ) return null
    val requestType = method.parameterTypes[1].toString()
    val send = (call + 3 until body.size).firstOrNull {
        val ref = body[it].methodReference()
        body[it].opcode == Opcode.INVOKE_VIRTUAL && ref?.returnType == "V" &&
            ref.parameterTypes.size == 4 && ref.parameterTypes[0].toString() == requestType
    } ?: return null
    val owner = body[send].methodReference()!!.definingClass
    val init = (send - 1 downTo call + 3).firstOrNull {
        val ref = body[it].methodReference()
        body[it].opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == owner &&
            ref.name == "<init>" && ref.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
    } ?: return null
    val result = (body[call + 1] as OneRegisterInstruction).registerA
    val context = (body[init] as FiveRegisterInstruction).registerD
    val request = (body[send] as FiveRegisterInstruction).registerD
    if (maxOf(result, context, request) > 15) return null
    val contextParameter = method.implementation!!.registerCount - method.parameterTypes.size
    for ((register, parameter) in listOf(context to contextParameter, request to contextParameter + 1)) {
        if (register == parameter) continue
        val write = (call - 1 downTo 0).firstOrNull {
            body[it].opcode.setsRegister() && (body[it] as? OneRegisterInstruction)?.registerA == register
        } ?: return null
        if (body[write].opcode !in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16) ||
            (body[write] as? TwoRegisterInstruction)?.registerB != parameter) return null
    }
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val jump = body[call + 2] as? OffsetInstruction ?: return null
    val target = addresses.indexOf(addresses[call + 2] + jump.codeOffset)
    if (target <= call + 2 || target > init) return null
    if ((target until init).any {
            body[it].opcode.setsRegister() &&
                (body[it] as? OneRegisterInstruction)?.registerA in setOf(context, request)
        }) return null
    return IdentityBranch(call + 1, result, context, request)
}

private fun Method.hasString(value: String) = implementation?.instructions?.any { it.stringReference() == value } == true
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.stringReference() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodReference() =
    (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Method.reference() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType
private fun Method.constantBody(opcode: Opcode): Boolean {
    val body = implementation!!.instructions.toList()
    return body.size == 2 && body[0].opcode == opcode &&
        (body[0] as OneRegisterInstruction).registerA == (body[1] as? OneRegisterInstruction)?.registerA
}
private fun replacement(original: Method, code: String): MutableMethod {
    val method = MutableMethod(ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(2)))
    method.addInstructionsWithLabels(0, code.trimIndent())
    return method
}
