package semicoloncolonel.mobilestream.patches.moviesanywhere.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Movies Anywhere",
        packageName = "com.moviesanywhere.goo",
        description = "The phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x5A2D82,
        // The Android TV build has its own version names (1.33.0-tv) and codes.
        targets = listOf(AppTarget("1.54.0", versionCode = 46063561)),
    )

    // The native libraries are in the ABI split, not in base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("Movies Anywhere", "libimagepipeline.so")
}
