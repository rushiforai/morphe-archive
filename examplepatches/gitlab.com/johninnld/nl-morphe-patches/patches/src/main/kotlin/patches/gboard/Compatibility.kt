package patches.gboard

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"

// Google ships 18.6.3 as separate armeabi-v7a (176071765) and arm64-v8a
// (176071766) builds whose versionName embeds the ABI, and publishes each
// build in minAPI26 and minAPI32 variants. The lowest supported variant
// sets the catalog minSdk; the extension targets the same Android 8.0+.
private fun gboardTargets(experimental: Boolean) = listOf(
    AppTarget(
        version = "18.6.3.1002251336-release-armeabi-v7a", minSdk = 26,
        versionCodes = mapOf(SupportedAbi.ARMEABI_V7A to 176071765),
        isExperimental = experimental,
    ),
    AppTarget(
        version = "18.6.3.1002251336-release-arm64-v8a", minSdk = 26,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 176071766),
        isExperimental = experimental,
    ),
)

private val gboardSignatures = setOf(
    // Google's rotated Gboard signer (Android 13+) and its original signer (Android 7-12).
    "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
    "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
)

internal val gboard = Compatibility(
    name = "Gboard", packageName = GBOARD_PACKAGE, apkFileType = ApkFileType.APK,
    appIconColor = 0x4285F4,
    signatures = gboardSignatures,
    targets = gboardTargets(experimental = false),
)

/**
 * The same builds, flagged as experimental for a patch that still needs field confirmation.
 * Morphe surfaces the flag on the patch's compatible versions, so it does not change the
 * catalogue entry of any other Gboard patch.
 */
internal val gboardExperimental = Compatibility(
    name = "Gboard", packageName = GBOARD_PACKAGE, apkFileType = ApkFileType.APK,
    appIconColor = 0x4285F4,
    signatures = gboardSignatures,
    targets = gboardTargets(experimental = true),
)

internal val originalInput = patches.shared.originalInput(gboard)
