package app.bookspiko.patches.books.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PLAY_BOOKS_PACKAGE = "com.google.android.apps.books"

    /**
     * Versions the fingerprints were verified against, newest first.
     * The trailing target without a version lets other releases be tried experimentally:
     * every patch fails loudly instead of patching the wrong code when a fingerprint no longer fits.
     */
    val COMPATIBILITY_PLAY_BOOKS = Compatibility(
        name = "Google Play Books",
        packageName = PLAY_BOOKS_PACKAGE,
        description = "Sign in with ReVanced GmsCore and read with your own fonts.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A73E8,
        // Lets Morphe Manager confirm that a downloaded APK is Google's original.
        signatures = setOf(
            // Android 13+ (APK Signature Scheme v3.1, rotated key)
            "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
            // Android 12L and earlier
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
        ),
        targets = listOf(
            // List only the newest version, and replace it when bumping.
            // Play Books puts the build number in its version name ("2026.9.18.0 (389836)"), so Morphe
            // cannot compare the names as numbers and sorts them as text: "2026.9.4.2 (…)" sorts
            // above "2026.9.18.0 (…)" and Morphe Manager would recommend the older one. The target
            // without a version below still lets other versions be patched.
            AppTarget(version = "2026.10.16.0 (395681)", versionCode = 395681, minSdk = 32),
            AppTarget(version = null, versionCodes = null, isExperimental = true),
        ),
    )

    const val EXTENSION_PACKAGE = "Lapp/morphe/extension/playbooks"
    const val GMS_EXTENSION_CLASS = "$EXTENSION_PACKAGE/gms/GmsCoreSupport;"
    const val FONT_EXTENSION_CLASS = "$EXTENSION_PACKAGE/fonts/ReaderFontPatch;"
    const val FONT_SETTINGS_ACTIVITY = "app.morphe.extension.playbooks.fonts.FontSettingsActivity"
}
