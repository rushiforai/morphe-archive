package app.template.patches.whereismytrain

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.WHEREISMYTRAIN_COMPATIBILITY

@Suppress("unused")
val enableInternalSettingsPatch = resourcePatch(
    name = "Enable Internal Settings",
    description = "Shows additional location settings that are normally hidden."
) {
    compatibleWith(WHEREISMYTRAIN_COMPATIBILITY)

    execute {
        document("res/xml/location_preferences_dev.xml").use { source ->
            document("res/xml/location_preferences.xml").use { target ->
                val targetRoot = target.documentElement
                val sourceRoot = target.importNode(source.documentElement, true)
                target.replaceChild(sourceRoot, targetRoot)
            }
        }
    }
}