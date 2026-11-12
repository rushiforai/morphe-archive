package dev.utaa.linimal.patches.features.googleauth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import dev.utaa.linimal.patches.features.push.fisCertificateHeaderPatch
import dev.utaa.linimal.patches.features.push.isOriginalCertificateSha1
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.patchStatusResourcePatch
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT

private const val CONTEXT = "Landroid/content/Context;"
private const val COMPONENT_NAME = "Landroid/content/ComponentName;"
private const val HOOKS_TYPE = "Ldev/utaa/linimal/extension/features/googleauth/GoogleAuthRoutingHooks;"
private const val SKIP_AUTH_SERVICE_CLIENT_HOOK = "$HOOKS_TYPE->shouldSkipAuthServiceClient($CONTEXT)$BOOLEAN"
private const val AUTH_SERVICE_COMPONENT_HOOK =
    "$HOOKS_TYPE->authServiceComponent($CONTEXT$COMPONENT_NAME)$COMPONENT_NAME"

/** GoogleAuthServiceClient を使える GMS の最小 version。GoogleAuthUtil の判定だけが持つ値です。 */
private const val AUTH_SERVICE_CLIENT_MIN_GMS_VERSION = 17895000

/**
 * `GoogleAuthUtil` の「GoogleAuthServiceClient を使うか」の判定。`static boolean (Context)` で、
 * GMS の version を 17895000 と比べ、自分の packageName を除外リストと照合します。
 */
private val authServiceClientGateFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = BOOLEAN,
    parameters = listOf(CONTEXT),
    filters = listOf(
        literal(AUTH_SERVICE_CLIENT_MIN_GMS_VERSION),
        methodCall(name = "getApplicationInfo"),
    ),
)

/**
 * `GoogleAuthUtil` が `GetToken` などの component を bind して呼び出す処理。
 * `static Object (Context, ComponentName, <callback>)` で、bind 失敗時のログ文字列を持ちます。
 */
internal val authServiceBindFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = OBJECT,
    parameters = listOf(CONTEXT, COMPONENT_NAME, "L"),
    filters = listOf(
        string("GoogleAuthUtil"),
        string("Could not bind to service."),
    ),
)

/**
 * MicroG-RE が LINE を公式証明書で申告できるよう、manifest に meta-data と、MicroG-RE を見つけるための
 * `<queries>` を加えます（ADR 0003）。MicroG-RE を使わない端末では何も参照しません。
 */
val googleAuthMicrogManifestPatch = resourcePatch(
    name = "Chat backup via MicroG-RE (manifest)",
    description = "MicroG-RE に公式 LINE の証明書を申告する meta-data を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // status の初期化より後に記録するため、component 登録と同じく status resource patch に依存します。
    dependsOn(patchStatusResourcePatch)

    execute {
        val certificate = Constants.LINE_ORIGINAL_CERTIFICATE_SHA1
        if (!isOriginalCertificateSha1(certificate)) {
            patchStatusCollector.record(googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_MICROG_MANIFEST))
            return@execute
        }
        val registered = try {
            document("AndroidManifest.xml").use { GoogleAuthMicrogManifest.register(it, certificate) }
            true
        } catch (_: GoogleAuthMicrogManifestException) {
            false
        }
        if (!registered) {
            // 一致 0 件の ERROR は runtime の parser が拒むため、他の resource patch と同じく TARGET_NOT_FOUND にします。
            patchStatusCollector.record(
                patchId = PatchId.GOOGLE_AUTH_MICROG_MANIFEST,
                expectedTargetCount = 1,
                actualTargetCount = 0,
                reason = "GoogleAuthMicrogManifestShapeMismatch",
            )
            return@execute
        }
        recordFeatureStatus(
            listOf(PatchId.GOOGLE_AUTH_MICROG_MANIFEST),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "GoogleAuthMicrogMetadataDeclared",
        )
    }
}

/**
 * 再署名で使えなくなる Google ドライブ連携（トークのバックアップ・復元）を、MicroG-RE 経由で戻します。
 * `GoogleAuthUtil` の token 要求だけを対象にし、GoogleAuthServiceClient の経路を使わせず、`GetToken` の
 * bind 先を hook で差し替えます。設定 OFF、MicroG-RE が未導入、例外時は hook が元の経路を返します。
 * FCM、FIS など他の GMS、LINE の認証と通信、Drive REST の内容には触れません。
 */
val googleAuthTokenRoutingPatch = bytecodePatch(
    name = "Chat backup via MicroG-RE",
    description = "Google ドライブ連携の token 要求を、実行時設定で MicroG-RE へ向けられるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(fisCertificateHeaderPatch, googleAuthMicrogManifestPatch)

    execute {
        if (!isOriginalCertificateSha1(Constants.LINE_ORIGINAL_CERTIFICATE_SHA1)) {
            patchStatusCollector.record(googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_TOKEN_ROUTING))
            return@execute
        }

        val gates = authServiceClientGateFingerprint.matchAllOrNull().orEmpty()
        val binds = authServiceBindFingerprint.matchAllOrNull().orEmpty()
        if (gates.size != 1 || binds.size != 1) {
            recordGoogleAuthTargetMismatch(gates.size, binds.size)
            return@execute
        }

        val gate = gates.single().method
        val bind = binds.single().method
        val gateContext = staticParameterRegisters(gate.implementation?.registerCount ?: 0, parameterCount = 1)
        val bindParameters = staticParameterRegisters(bind.implementation?.registerCount ?: 0, parameterCount = 3)
        // 判定の先頭で結果を置く local register が 1 つ要ります。
        // gate は v0 を、bind は引数の register を move-result（8 bit）の宛先に使います。
        if (
            gateContext == null || gateContext.first < 1 ||
            bindParameters == null || bindParameters.first + 1 > MAX_MOVE_RESULT_REGISTER
        ) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.GOOGLE_AUTH_TOKEN_ROUTING),
                expectedTargetCount = 2,
                actualTargetCount = 2,
                reason = "GoogleAuthUtilRegisterShapeMismatch",
            )
            return@execute
        }

        val contextRegister = gateContext.first
        gate.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { v$contextRegister .. v$contextRegister }, $SKIP_AUTH_SERVICE_CLIENT_HOOK
                move-result v0
                if-eqz v0, :keep
                const/4 v0, 0x0
                return v0
                :keep
                nop
            """.trimIndent(),
        )

        // 引数は Context、ComponentName、callback の順。高位 register でも壊れないよう range で呼びます。
        val bindContext = bindParameters.first
        val bindComponent = bindParameters.first + 1
        bind.addInstructions(
            0,
            """
                invoke-static/range { v$bindContext .. v$bindComponent }, $AUTH_SERVICE_COMPONENT_HOOK
                move-result-object v$bindComponent
            """.trimIndent(),
        )
        recordFeatureStatus(
            listOf(PatchId.GOOGLE_AUTH_TOKEN_ROUTING),
            expectedTargetCount = 2,
            actualTargetCount = 2,
            reason = "GoogleAuthRoutingGuarded",
        )
    }
}

private const val MAX_MOVE_RESULT_REGISTER = 255

/**
 * 対象が一意でない build では何も注入しません。過剰一致は ERROR、どちらかが見つからなければ
 * 見つかった数に応じて TARGET_NOT_FOUND か PARTIAL を記録し、設定画面で操作できないようにします。
 */
private fun recordGoogleAuthTargetMismatch(gateCount: Int, bindCount: Int) {
    if (gateCount > 1 || bindCount > 1) {
        recordUnsafeFeatureStatus(
            listOf(PatchId.GOOGLE_AUTH_TOKEN_ROUTING),
            expectedTargetCount = 2,
            actualTargetCount = gateCount + bindCount,
            reason = "GoogleAuthUtilTargetsNotUnique",
        )
        return
    }
    patchStatusCollector.record(
        patchId = PatchId.GOOGLE_AUTH_TOKEN_ROUTING,
        expectedTargetCount = 2,
        actualTargetCount = gateCount + bindCount,
        reason = "GoogleAuthUtilTargetsMissing",
    )
}

/**
 * static メソッドの引数が入る register の範囲。引数はすべて 1 register 幅（参照型）である前提で、
 * 末尾の [parameterCount] 個を返します。register 数が足りなければ null です。
 */
internal fun staticParameterRegisters(registerCount: Int, parameterCount: Int): IntRange? {
    val first = registerCount - parameterCount
    if (parameterCount < 1 || first < 0) {
        return null
    }
    return first until registerCount
}

/** 公式証明書の SHA-1 が未設定の build。LINE を変更していないため DISABLED として記録します。 */
internal fun googleAuthNotConfiguredRecord(patchId: PatchId) = PatchStatusRecord(
    patchId = patchId,
    status = PatchStatus.DISABLED,
    expectedTargetCount = 0,
    actualTargetCount = 0,
    reason = "GoogleAuthOriginalCertificateNotConfigured",
)
