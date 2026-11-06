package app.zdrgon.patches.rocketplayer.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ROCKET_PLAYER = Compatibility(
        name = "Rocket Player",
        packageName = "com.jrtstudio.AnotherMusicPlayer",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(version = "6.3.4")
        )
    )
}
