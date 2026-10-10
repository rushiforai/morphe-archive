package app.tada.patches.music.misc.audio

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_26_or_greater
import app.tada.patches.music.misc.playservice.versionCheckPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MusicActivityOnCreateFingerprint
import app.tada.patches.shared.misc.audio.tracks.forceOriginalAudioPatch

@Suppress("unused")
val forceOriginalAudioPatch = forceOriginalAudioPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    fixUseLocalizedAudioTrackFlag = { !is_9_26_or_greater },
    forcedServerAdaptiveStreaming = { is_9_26_or_greater },
    mainActivityOnCreateFingerprint = MusicActivityOnCreateFingerprint,
    subclassExtensionClassDescriptor = "Lapp/morphe/extension/music/patches/ForceOriginalAudioPatch;",
    preferenceScreen = PreferenceScreen.MISC,
)
