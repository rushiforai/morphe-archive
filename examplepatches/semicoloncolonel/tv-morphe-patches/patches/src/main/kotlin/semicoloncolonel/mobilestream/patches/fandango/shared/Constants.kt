package semicoloncolonel.mobilestream.patches.fandango.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fandango at Home",
        packageName = "air.com.vudu.air.DownloaderTablet",
        description = "The Android TV app, formerly Vudu. Patch the Android TV build: version code 179219068 " +
            "for 10.20.a016.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3D7CF4,
        // The Android TV build's version names end in .aNNN and the phone
        // build's in .rNNN, and each has its own version codes.
        targets = listOf(AppTarget("10.20.a016", versionCode = 179219068)),
        formFactor = FormFactor.TV,
    )

    // The native libraries are in the ABI split, not in base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("Fandango at Home", "libag3.so")
}
