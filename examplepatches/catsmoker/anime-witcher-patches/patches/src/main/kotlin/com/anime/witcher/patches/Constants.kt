package com.anime.witcher.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val COMPATIBILITY_ANIME_WITCHER = Compatibility(
    name = "Anime Witcher",
    packageName = "com.anime.witcher",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "1.4.8"
        )
    )
)
