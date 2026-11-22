package app.nullroute3.patches.abrp.updates

import app.nullroute3.patches.abrp.shared.Constants.COMPATIBILITY_ABRP
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

/**
 * ABRP ships its JS app logic in one Hermes bundle (`assets/index.android.bundle`),
 * and expo-updates re-downloads it on launch from update.abetterrouteplanner.com.
 * Any bundle-level change is therefore overwritten unless OTA is off.
 */
@Suppress("unused")
val disableExpoOtaPatch = patch(
    name = "Disable expo-updates",
    description = "Stops the app from downloading OTA JS bundles over the embedded one. " +
        "Required for patches that change the JS bundle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ABRP)

    finalize {
        resourceXml("AndroidManifest.xml").use { manifest ->
            for (metaData in manifest.root.elements("meta-data")) {
                if (metaData.attribute("android:name") == "expo.modules.updates.ENABLED") {
                    metaData.setAttribute("android:value", "false")
                }
            }
        }
    }
}
