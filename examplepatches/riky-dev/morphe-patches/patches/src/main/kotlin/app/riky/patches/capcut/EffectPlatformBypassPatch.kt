package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

/**
 * Bypasses the ByteDance Shark WAF block that prevents CapCut 9.0.0 from loading
 * effects, transitions and templates ("Nessuna connessione ad Internet").
 *
 * Root cause: EffectManagerModule passes .platform("android") when building the
 * EffectConfiguration. ByteDance's Shark security layer returns
 *   {"message":"shark block reinstall","status_code":-5}
 * for ALL requests with device_platform=android from this app version.
 *
 * Fix: force the platform parameter to "windows" before it is stored and forwarded
 * to mKNEffectConfigBuilder. The server returns status_code=0 with the full
 * catalog (18 categories, 144+ effects). CDN assets are cross-platform .zip bundles.
 */
@Suppress("unused")
val effectPlatformBypassPatch = bytecodePatch(
    name = "Bypass effects region restriction",
    description = "Fixes effects/transitions not loading (Shark WAF block) by spoofing " +
        "device_platform from \"android\" to \"windows\" in effect API requests.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // Prepend const-string p1, "windows" so both the local `platform` field
        // and the mKNEffectConfigBuilder receive "windows" instead of "android".
        EffectConfigurationBuilderPlatformFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "windows"
            """,
        )

        // Force device_id to "0" in effect requests so ByteDance Shark WAF
        // does not cross-reference the device ID with an Android registration,
        // allowing category effect items to load seamlessly from any network/VPN.
        EffectConfigurationBuilderDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "0"
            """,
        )
        EffectConfigurationSetDeviceIdFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "0"
            """,
        )
    }
}
