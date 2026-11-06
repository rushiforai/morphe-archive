package app.zdrgon.patches.mp3tagger.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SMART_MP3_TAGGER = Compatibility(
        name = "Smart MP3 Tagger",
        packageName = "tageditor.automatictageditor.audiotagging.audioedit.mp3edit",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(version = "26.8.130")
        )
    )
}
