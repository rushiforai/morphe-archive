package dev.utaa.linimal.patches.features.googleauth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.utaa.linimal.patches.features.push.isOriginalCertificateSha1
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val DIAGNOSTIC_HOOKS = "Ldev/utaa/linimal/extension/features/googleauth/GoogleAuthRoutingHooks;"
private const val TOKEN_ERROR_HOOK = "$DIAGNOSTIC_HOOKS->onTokenError(Ljava/lang/String;)V"
private const val BIND_FAILED_HOOK =
    "$DIAGNOSTIC_HOOKS->onAuthServiceBindFailed(Ljava/lang/String;Landroid/content/ComponentName;)V"
/** bind 先を差し替える hook（[googleAuthTokenRoutingPatch] が先頭に入れる）の名前。 */
private const val ROUTING_HOOK_NAME = "authServiceComponent"
internal const val TOKEN_ERROR_KEY = "Error"
internal const val BIND_FAILED_MESSAGE = "Could not bind to service."

/**
 * `GoogleAuthUtil` が token の応答 Bundle から TokenData を取り出し、無ければ `Error` を読む処理。
 * `static TokenData (Context, Bundle)` で、応答の key を文字列で持ちます。
 */
private val tokenResponseFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/google/android/gms/auth/TokenData;",
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;"),
    strings = listOf("tokenDetails", TOKEN_ERROR_KEY, "userRecoveryIntent"),
)

/**
 * MicroG-RE へ向けた token 要求が失敗したとき、失敗の種類を通知できるようにします（ADR 0003 の 2026-11-04 の変更）。
 * LINE はどの失敗も同じネットワークエラーの表示にまとめるため、利用者からは原因を切り分けられません。
 * 応答の `Error` を読んだ直後と、bind の失敗で例外を投げる直前に hook を呼ぶだけで、値と処理の流れは変えません。
 */
val googleAuthFailureDiagnosticsPatch = bytecodePatch(
    name = "MicroG-RE の認証エラーを通知する",
    description = "MicroG-RE を使った Google ドライブの認証が失敗したとき、失敗の種類を通知できるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(googleAccountPickerRoutingPatch)

    execute {
        val ids = listOf(PatchId.GOOGLE_AUTH_FAILURE_DIAGNOSTICS)
        if (!isOriginalCertificateSha1(Constants.LINE_ORIGINAL_CERTIFICATE_SHA1)) {
            patchStatusCollector.record(googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_FAILURE_DIAGNOSTICS))
            return@execute
        }
        val responses = tokenResponseFingerprint.matchAllOrNull().orEmpty()
        val binds = authServiceBindFingerprint.matchAllOrNull().orEmpty()
        if (responses.size != 1 || binds.size != 1) {
            recordUnappliedFeatureStatus(ids, 2, responses.size + binds.size, "GoogleAuthDiagnosticsTargetsNotUnique")
            return@execute
        }
        val response = responses.single().method
        val bind = binds.single().method
        val errorSite = tokenErrorSite(response.implementation?.instructions?.toList().orEmpty())
        val bindRegisterCount = bind.implementation?.registerCount ?: 0
        val componentRegister = bindRegisterCount - 2
        val bindSite = bindFailureSite(bind.implementation?.instructions?.toList().orEmpty(), componentRegister)
        // 注入位置より前に ComponentName の引数を書き換える命令が無いことを確かめます。bind 先を差し替える hook
        // （先に適用済み）が先頭で同じ register に結果を置くのは、差し替えた ComponentName なので除きます。
        // 注入位置より後ろ（SecurityException の処理など）での書き換えは、注入位置を通る経路に関係しません。
        val bindInstructions = bind.implementation?.instructions?.toList().orEmpty()
        val componentKept = bindSite != null &&
            !writesRegister(bindInstructions.take(bindSite.index), componentRegister, ignoreResultOf = ROUTING_HOOK_NAME)
        if (errorSite == null || bindSite == null || !componentKept) {
            recordUnsafeFeatureStatus(ids, 2, 2, "GoogleAuthDiagnosticsShapeMismatch")
            return@execute
        }

        // どちらも分岐先ではない位置（move-result の直後、const-string の直後）に入れ、結果を受け取らない呼び出しにします。
        response.addInstructions(
            errorSite.index,
            "invoke-static/range { v${errorSite.register} .. v${errorSite.register} }, $TOKEN_ERROR_HOOK",
        )
        bind.addInstructions(
            bindSite.index,
            "invoke-static/range { v${bindSite.register} .. v${bindSite.register + 1} }, $BIND_FAILED_HOOK",
        )
        recordFeatureStatus(ids, 2, 2, "GoogleAuthDiagnosticsGuarded")
    }
}

/** hook を入れる位置と、hook に渡す先頭の register。 */
internal data class InjectionSite(val index: Int, val register: Int)

/**
 * `const-string "Error"`、`Bundle.getString(String)`（`BaseBundle` で参照されることもあります）、`move-result-object` の並びを 1 つだけ探し、
 * その直後の位置と、エラー文字列が入った register を返します。
 */
internal fun tokenErrorSite(instructions: List<Instruction>): InjectionSite? {
    val sites = instructions.indices.mapNotNull { index ->
        val constString = instructions[index]
        if (constString.opcode != Opcode.CONST_STRING || constString.stringValue() != TOKEN_ERROR_KEY) {
            return@mapNotNull null
        }
        val call = instructions.getOrNull(index + 1) ?: return@mapNotNull null
        val method = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val isGetString = call.opcode == Opcode.INVOKE_VIRTUAL && method.definingClass in BUNDLE_CLASSES &&
            method.name == "getString" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
        val result = instructions.getOrNull(index + 2)
        if (!isGetString || result?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            return@mapNotNull null
        }
        InjectionSite(index + 3, (result as OneRegisterInstruction).registerA)
    }
    return sites.singleOrNull()?.takeIf { it.register <= MAX_RANGE_REGISTER }
}

/**
 * bind 失敗のメッセージを置く `const-string` を 1 つだけ探し、その直後の位置と、メッセージの register を返します。
 * hook はメッセージと ComponentName を連続した 2 つの register で受け取るため、メッセージの次の register が
 * ComponentName の引数であることを確かめます。引数が書き換えられていないかは [writesRegister] で別に確かめます。
 */
internal fun bindFailureSite(instructions: List<Instruction>, componentRegister: Int): InjectionSite? {
    val messages = instructions.withIndex().filter {
        it.value.opcode == Opcode.CONST_STRING && it.value.stringValue() == BIND_FAILED_MESSAGE
    }
    val message = messages.singleOrNull() ?: return null
    val register = (message.value as OneRegisterInstruction).registerA
    if (register + 1 != componentRegister || componentRegister > MAX_RANGE_REGISTER) {
        return null
    }
    return InjectionSite(message.index + 1, register)
}

/**
 * [register] に値を書き込む命令があるかどうか。[ignoreResultOf] と同じ名前の Linimal の hook の結果を受け取る
 * `move-result-object` は数えません。
 */
internal fun writesRegister(
    instructions: List<Instruction>,
    register: Int,
    ignoreResultOf: String? = null,
): Boolean = instructions.withIndex().any { (index, instruction) ->
    if (!instruction.opcode.setsRegister() || (instruction as? OneRegisterInstruction)?.registerA != register) {
        return@any false
    }
    val previous = (instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? MethodReference
    val isHookResult = instruction.opcode == Opcode.MOVE_RESULT_OBJECT && ignoreResultOf != null &&
        previous?.definingClass == DIAGNOSTIC_HOOKS && previous.name == ignoreResultOf
    !isHookResult
}

private val BUNDLE_CLASSES = setOf("Landroid/os/Bundle;", "Landroid/os/BaseBundle;")

/** range invoke が指定できる register の上限。 */
private const val MAX_RANGE_REGISTER = 65534

private fun Instruction.stringValue(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
