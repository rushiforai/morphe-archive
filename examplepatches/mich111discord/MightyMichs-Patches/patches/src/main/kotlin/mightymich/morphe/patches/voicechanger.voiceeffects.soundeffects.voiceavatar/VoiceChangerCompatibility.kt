package mightymich.morphe.patches.voicechanger.voiceeffects.soundeffects.voiceavatar


import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object VoiceChangerCompatibility {
    val VOICE_CHANGER = Compatibility(
        name = "Voice Changer",
        packageName = "voicechanger.voiceeffects.soundeffects.voiceavatar",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(
                version = "1.02.111.0915"
            )
        )
    )
}
