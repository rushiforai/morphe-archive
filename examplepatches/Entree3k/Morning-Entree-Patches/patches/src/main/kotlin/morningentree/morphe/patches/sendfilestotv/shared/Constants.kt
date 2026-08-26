package morningentree.morphe.patches.sendfilestotv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Send Files To TV",
        packageName = "com.yablio.sendfilestotv",
        appIconColor = 0x1565C0,
        apkFileType = ApkFileType.APKS,
        targets = listOf(AppTarget("1.4.22")),
    )
}
