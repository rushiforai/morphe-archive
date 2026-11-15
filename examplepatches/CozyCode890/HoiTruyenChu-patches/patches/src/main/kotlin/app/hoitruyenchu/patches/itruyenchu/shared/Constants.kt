package app.hoitruyenchu.patches.itruyenchu.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    private const val EXTENSION_PATCHES = "Lapp/hoitruyenchu/extension/itruyenchu/patches"

    const val EXTENSION_TTS_CONTROLLER = "$EXTENSION_PATCHES/tts/TtsController;"
    const val EXTENSION_AUTO_SYNC = "$EXTENSION_PATCHES/sync/AutoSyncPatch;"
    const val EXTENSION_SYNC_SCRIPT = "$EXTENSION_PATCHES/sync/SyncScript;"
    const val EXTENSION_CHAPTER_TITLES = "$EXTENSION_PATCHES/titles/ChapterTitlesPatch;"
    const val EXTENSION_FIX_GOOGLE_LOGIN = "$EXTENSION_PATCHES/login/FixGoogleLoginPatch;"
    const val EXTENSION_TTS_MEDIA_SESSION = "$EXTENSION_PATCHES/media/TtsMediaSession;"
    const val EXTENSION_RESUME_LISTENING = "$EXTENSION_PATCHES/resume/ResumeListeningPatch;"

    val COMPATIBILITY_ITRUYENCHU = Compatibility(
        name = "iTruyenChu",
        packageName = "com.ngoctieucac.itruyenchu",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(
            // Version the patches were developed and tested against.
            AppTarget(version = "2.1.0"),
            // The hooks target expo-speech / React Native / AsyncStorage internals, not app code,
            // so newer app versions very likely work as well.
            AppTarget(version = null, isExperimental = true),
        )
    )
}
