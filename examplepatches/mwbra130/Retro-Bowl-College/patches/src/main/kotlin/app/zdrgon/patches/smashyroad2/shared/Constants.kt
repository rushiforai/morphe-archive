package app.zdrgon.patches.smashyroad2.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMASHY_ROAD_2 = Compatibility(
        name = "Smashy Road 2",
        packageName = "com.rkgames.basisgame",
        // XAPK: Morphe merges the split bundle (including config.arm64_v8a.apk,
        // which holds the native libraries) into a single APK before patching.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF8C00,
        targets = listOf(
            AppTarget(version = "1.54"),
            AppTarget(version = "1.45"),
        ),
    )
}
