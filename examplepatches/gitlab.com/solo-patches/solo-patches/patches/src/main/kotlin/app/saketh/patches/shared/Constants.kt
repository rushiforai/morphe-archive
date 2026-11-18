package app.saketh.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WEBNOVEL = Compatibility(
        name = "WebNovel",
        packageName = "com.qidian.Int.reader",
        // APKMirror ships recent releases as a bundle.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x28FFF2,
        targets = listOf(
            AppTarget(version = "8.24.2")
        )
    )
}
