package semicoloncolonel.mobilestream.patches.foxnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox News",
        packageName = "com.foxnews.android",
        description = "The Android TV app. Patch the Android TV build: version code 2026101618 for 5.6.0.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x003366,
        // The phone build shares the package name but has its own version
        // names (5.50.0) and codes.
        targets = listOf(AppTarget("5.6.0", versionCode = 2026101618)),
        formFactor = FormFactor.TV,
    )

    // The native libraries are in the ABI split, not in base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("Fox News", "libcomScore.so")
}
