package app.v4n1x.patches.soundcloud.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SOUNDCLOUD = Compatibility(
        name = "SoundCloud",
        packageName = "com.soundcloud.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF5500,
        targets = listOf(
            AppTarget(
                version = "2026.07.03-release"
            ),
            AppTarget(
                version = "2026.08.19-release"
            )
        )
    )
}
