package app.cesbar.patches.velov

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.util.findElementByAttributeValueOrThrow

@Suppress("unused")
val customMapApiKeyPatch = resourcePatch(
    name = "Custom Maps API Key",
    description = "Replace Velo'v Google Maps key with your own to fix it",
) {
    compatibleWith(Constants.COMPATIBILITY)

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