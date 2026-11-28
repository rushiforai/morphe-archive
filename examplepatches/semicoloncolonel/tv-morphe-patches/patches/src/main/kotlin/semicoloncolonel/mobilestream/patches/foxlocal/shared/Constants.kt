package semicoloncolonel.mobilestream.patches.foxlocal.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox Local",
        packageName = "com.fox.fts.android",
        description = "The Android TV app. Patch the Android TV build: version code 202610272 for 2.18.1.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x031840,
        // The phone build shares the package name but has its own version
        // names (7.22.0) and codes.
        targets = listOf(AppTarget("2.18.1", versionCode = 202610272), devTarget("2.19.1", versionCode = 202611202)),
        formFactor = FormFactor.TV,
    )

    // The native libraries, Hermes among them, are in the ABI split, not in
    // base.apk.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("Fox Local", "libhermesvm.so")
}
