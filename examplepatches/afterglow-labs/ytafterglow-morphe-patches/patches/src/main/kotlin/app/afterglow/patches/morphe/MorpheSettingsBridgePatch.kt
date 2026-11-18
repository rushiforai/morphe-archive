package app.afterglow.patches.morphe

import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.youtube.misc.settings.settingsPatch

/** Link Afterglow's root page to the original settings Activity and feature controls. */
internal val morpheSettingsBridgePatch = bytecodePatch {
    dependsOn(morpheSettingsBridgeResourcesPatch, settingsPatch, afterglowSettingsPatch)
    execute {
        Fingerprint(
            definingClass = "$EXTENSION_PACKAGE/ui/MorpheSettingsBridge;",
            name = "isInstalled",
            parameters = emptyList(),
            returnType = "Z"
        ).method.returnEarly(true)
        morpheSettingsBridgeRequested = true
    }
}
