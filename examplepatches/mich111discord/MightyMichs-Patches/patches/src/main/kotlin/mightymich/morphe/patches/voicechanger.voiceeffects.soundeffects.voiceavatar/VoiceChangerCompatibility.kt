package mightymich.morphe.patches.voicechanger.voiceeffects.soundeffects.voiceavatar

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object AudioEditorCompatibility {
    val AUDIO_EDITOR = Compatibility(
        name = "Voice Changer", // App name as it appears in the Android launcher.
        packageName = "voicechanger.voiceeffects.soundeffects.voiceavatar",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF5722,
        targets = listOf(
            // App version confirmed 100% working.
            AppTarget(
                version = "1.02.111.0915"
            )
        )
    )
}
