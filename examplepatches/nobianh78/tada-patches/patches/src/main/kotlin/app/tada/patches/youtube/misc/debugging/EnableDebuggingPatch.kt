package app.tada.patches.youtube.misc.debugging

import app.tada.patches.shared.misc.debugging.enableDebuggingPatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playservice.is_20_40_or_greater
import app.tada.patches.youtube.misc.playservice.is_20_41_or_greater
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val enableDebuggingPatch = enableDebuggingPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            versionCheckPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE)
    },
    executeBlock = { },
    hookStringFeatureFlag = { true },
    // 20.40 has changes not worth supporting.
    hookLongFeatureFlag = { !is_20_40_or_greater || is_20_41_or_greater},
    hookDoubleFeatureFlag = { !is_20_40_or_greater || is_20_41_or_greater},
    preferenceScreen = PreferenceScreen.MISC,
    additionalDebugPreferences = listOf(SwitchPreference("tada_debug_protobuffer", summary = true))
)
