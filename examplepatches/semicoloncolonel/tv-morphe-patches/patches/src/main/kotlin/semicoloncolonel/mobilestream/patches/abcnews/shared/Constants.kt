package semicoloncolonel.mobilestream.patches.abcnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

// The Android TV app shares its package name with the phone app, but it is a
// separate build with its own version line (11.x on TV, 8.x on phones).
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "ABC News",
        packageName = "com.abc.abcnews",
        description = "The Android TV app. Patch the Android TV build: version code 53550563 for 11.12.0.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("11.12.0", versionCode = 53550563), devTarget("11.13.0", versionCode = 53550569)),
        formFactor = FormFactor.TV,
    )

    // The player's native library is in the ABI split, not in base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("ABC News", "libjni_mediax_player.so")
}
