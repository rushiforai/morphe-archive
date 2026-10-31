package io.github.hyperstown.patches.maps.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val MAPS_PACKAGE_NAME = "com.google.android.apps.maps"

    /**
     * Maps is signed with key rotation. Android 13 and newer see the rotated v3.1 signer,
     * older versions see the original signer.
     */
    const val MAPS_CERTIFICATE_SHA256 =
        "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
    const val MAPS_CERTIFICATE_SHA256_ANDROID_13 =
        "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053"

    /** SHA-1 of the original signer, the identity MicroG-RE presents to Google for Maps. */
    const val MAPS_CERTIFICATE_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"

    const val EXTENSION_PACKAGE = "Lio/github/hyperstown/extension/maps/"

    val COMPATIBILITY_MAPS = Compatibility(
        name = "Google Maps",
        packageName = MAPS_PACKAGE_NAME,
        // APKMirror publishes universal "nodpi" APKs of every Maps release.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        signatures = setOf(MAPS_CERTIFICATE_SHA256, MAPS_CERTIFICATE_SHA256_ANDROID_13),
        targets = listOf(
            AppTarget(version = "26.42.02.997557324"),
            // Every hook is located by behaviour rather than by obfuscated names,
            // and patching stops instead of guessing if one cannot be found.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
