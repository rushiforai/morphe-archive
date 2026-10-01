package mightymich.morphe.patches.ringtonemaker.musiccutter.customringtones.freeringtonemake

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object RingtoneMakerCompatibility {
    val RINGTONE_MAKER = Compatibility(
        name = "Ringtone Maker: Music Cutter",
        packageName = "ringtonemaker.musiccutter.customringtones.freeringtonemake",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "1.01.99.0909")
        )
    )
}
