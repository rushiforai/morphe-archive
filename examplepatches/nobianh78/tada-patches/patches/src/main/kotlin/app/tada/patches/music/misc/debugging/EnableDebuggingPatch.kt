package app.tada.patches.music.misc.debugging

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.PreferenceScreen
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.debugging.enableDebuggingPatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference

@Suppress("unused")
val enableDebuggingPatch = enableDebuggingPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },
    // String feature flag does not appear to be present with YT Music.
    hookStringFeatureFlag = { false },
    hookLongFeatureFlag = { true },
    hookDoubleFeatureFlag = { true },
    preferenceScreen = PreferenceScreen.MISC,
    additionalDebugPreferences = listOf(SwitchPreference("tada_debug_protobuffer", summary = true))
)
