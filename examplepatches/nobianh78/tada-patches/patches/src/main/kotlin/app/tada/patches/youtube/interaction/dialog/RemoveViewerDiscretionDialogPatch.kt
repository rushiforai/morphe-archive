package app.tada.patches.youtube.interaction.dialog

import app.tada.patches.shared.interaction.dialog.removeViewerDiscretionDialogPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE

@Suppress("unused")
val removeViewerDiscretionDialogPatch = removeViewerDiscretionDialogPatch(
    block = {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
        )

        compatibleWith(COMPATIBILITY_YOUTUBE)
    },
    preferenceScreen = PreferenceScreen.GENERAL
)
