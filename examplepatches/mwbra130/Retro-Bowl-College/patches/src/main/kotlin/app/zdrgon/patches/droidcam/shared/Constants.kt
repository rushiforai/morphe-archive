package app.zdrgon.patches.droidcam.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DROIDCAM = Compatibility(
        name = "DroidCam",
        packageName = "com.dev47apps.obsdroidcam",
        // APKM bundle: Morphe merges the split bundle (including the
        // config.<abi> split, which holds the native libraries) into a
        // single APK before patching.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x03A9F4,
        targets = listOf(
            AppTarget(version = "9.0"),
        ),
    )
}
