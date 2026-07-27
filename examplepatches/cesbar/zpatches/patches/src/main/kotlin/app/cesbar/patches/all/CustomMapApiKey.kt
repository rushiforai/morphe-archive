package app.cesbar.patches.all

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.findElementByAttributeValueOrThrow
import app.cesbar.patches.citymapper.Constants as CitymapperConstants
import app.cesbar.patches.velov.Constants as VelovConstants

@Suppress("unused")
val customMapApiKeyPatch = resourcePatch(
    name = "Google Maps API key",
    description = "Use a different Google Maps API key to fix modified apps",
) {
    compatibleWith(CitymapperConstants.COMPATIBILITY, VelovConstants.COMPATIBILITY)

    val mapsApiKeyOption = stringOption(
        key = "mapApiKey",
        default = "",
        title = "Google Maps API key",
        description = "Google Maps API key",
        required = true,
    )

    execute {
        val apiKey = mapsApiKeyOption.value?.trim().orEmpty()
        if (apiKey.isBlank()) {
            throw PatchException("Option 'mapApiKey' is required.")
        }

        document("AndroidManifest.xml").use { document ->
            
            val apiKeyElement = document.childNodes.findElementByAttributeValueOrThrow(
                "android:name",
                "com.google.android.geo.API_KEY",
            )

            apiKeyElement.setAttribute("android:value", apiKey)
        }
    }
}