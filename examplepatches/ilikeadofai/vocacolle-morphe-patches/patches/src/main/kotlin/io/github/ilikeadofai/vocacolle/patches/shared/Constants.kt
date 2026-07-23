package io.github.ilikeadofai.vocacolle.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val VOCACOLLE = Compatibility(
        name = "VocaColle",
        packageName = "jp.nicovideo.nicobox",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "7.40.0")
        )
    )
}