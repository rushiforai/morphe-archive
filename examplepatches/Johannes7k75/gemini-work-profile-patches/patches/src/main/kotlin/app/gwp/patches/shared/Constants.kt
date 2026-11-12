package app.gwp.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val GOOGLE_PACKAGE = "com.google.android.googlequicksearchbox"
    const val GEMINI_PACKAGE = "com.google.android.apps.bard"

    /** Suffix of the cloned packages. Kept as ".morphe" so existing clones can be updated in place. */
    const val CLONE_SUFFIX = ".morphe"
    const val GOOGLE_CLONE_PACKAGE = GOOGLE_PACKAGE + CLONE_SUFFIX
    const val GEMINI_CLONE_PACKAGE = GEMINI_PACKAGE + CLONE_SUFFIX

    /** microG-RE (MorpheApp / ReVanced GmsCore family) package and vendor prefix. */
    const val MICROG_VENDOR = "app.revanced"
    const val MICROG_PACKAGE = "$MICROG_VENDOR.android.gms"
    const val MICROG_EXTENDED_ACCESS = "$MICROG_VENDOR.gms.EXTENDED_ACCESS"

    /** SHA-1 of Google's release certificate for the Google app (what microG presents to Google servers). */
    const val GOOGLE_APP_SIGNATURE_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"

    val COMPATIBILITY_GOOGLE = Compatibility(
        name = "Google",
        packageName = GOOGLE_PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4285F4,
        targets = listOf(
            // Patches locate code by stable strings and code shape, so new versions are expected to work.
            AppTarget(version = null, isExperimental = true),
            AppTarget(version = "17.72.17.ve.arm64"),
            AppTarget(version = "17.70.11.ve.arm64"),
        )
    )

    val COMPATIBILITY_GEMINI = Compatibility(
        name = "Gemini",
        packageName = GEMINI_PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4E7CF6,
        targets = listOf(
            AppTarget(version = null, isExperimental = true),
            AppTarget(version = "1.0.995038376"),
        )
    )
}
