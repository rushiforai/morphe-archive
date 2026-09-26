package mightymich.morphe.patches.audioeditor.musiceditor.soundeditor.songeditor

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object AudioEditorCompatibility {
    val AUDIO_EDITOR = Compatibility(
        name = "Audio Editor", // App name as it appears in the Android launcher.
        packageName = "audioeditor.musiceditor.soundeditor.songeditor",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF5722, // Orange color, typical for audio editing apps.
        targets = listOf(
            // App version confirmed 100% working.
            AppTarget(
                version = "2.01.64.0916"
            )
        )
    )
}
