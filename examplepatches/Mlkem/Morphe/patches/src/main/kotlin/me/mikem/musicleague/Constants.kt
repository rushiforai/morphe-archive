package me.mikem.musicleague

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val MUSIC_LEAGUE = Compatibility(
    name = "Music League",
    packageName = "com.musicleague.app",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x9E00C4,
    targets = listOf(
        AppTarget(version = "1.4.9"),
    ),
)
