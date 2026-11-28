package semicoloncolonel.mobilestream.patches.moviesanywhere.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Movies Anywhere",
        packageName = "com.moviesanywhere.goo",
        description = "The Android TV app. Patch the Android TV build: version code 46063572 for 1.33.0-tv.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5A2D82,
        // The phone build has its own version names (1.54.0) and codes.
        targets = listOf(AppTarget("1.33.0-tv", versionCode = 46063572)),
        formFactor = FormFactor.TV,
    )

    // The native libraries are in the ABI split, not in base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("Movies Anywhere", "libimagepipeline.so")
}
