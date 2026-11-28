package semicoloncolonel.mobilestream.patches.cbsnews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.requireNativeLibsPatch

// The Android TV app is a different package from the phone app
// (com.treemolabs.apps.cbsnews) and is built on CBS Sports' Android TV app.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CBS News",
        packageName = "com.cbsnews.ott",
        description = "The Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("8.6.0-1792693002", versionCode = 100002032)),
        formFactor = FormFactor.TV,
    )

    // ObjectBox's native library loads at launch and is in the ABI split.
    internal val REQUIRE_NATIVE_LIBS = requireNativeLibsPatch("CBS News", "libobjectbox-jni.so")
}
