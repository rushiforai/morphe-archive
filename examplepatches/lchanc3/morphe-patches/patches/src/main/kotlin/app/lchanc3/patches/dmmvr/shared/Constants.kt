package app.lchanc3.patches.dmmvr.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    val COMPATIBILITY_DMM_VR = Compatibility(
        name = "DMM VR動画プレイヤー",
        packageName = "com.dmm.app.oculusgearplayer",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1D1D1D,
        targets = listOf(
            // The hand tracking patch writes machine code at fixed offsets of
            // libil2cpp.so, which every Unity build moves around, so only the
            // build it was written against is claimed.
            AppTarget(version = "9.0.0"),
        ),
    )
}
