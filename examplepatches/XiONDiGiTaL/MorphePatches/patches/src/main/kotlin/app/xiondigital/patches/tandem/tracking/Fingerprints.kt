package app.xiondigital.patches.tandem.tracking

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `com.adjust.sdk.Adjust.initSdk(AdjustConfig)` in Tandem 6.38.0.
 *
 * Adjust is the attribution SDK bundled with Tandem; the app starts it from a single call site
 * (`AdjustConfig` built with the app token `w9jqbcact05c`, followed by `Adjust.enable()` and
 * `Adjust.onResume()`). The SDK's classes are not obfuscated, and `initSdk` is the only entry point
 * that binds the session, so this one method is the whole surface.
 */
internal object AdjustInitSdkFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "initSdk",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)
