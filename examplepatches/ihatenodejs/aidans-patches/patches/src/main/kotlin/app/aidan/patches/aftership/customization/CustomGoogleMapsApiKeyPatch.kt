package app.aidan.patches.aftership.customization

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

@Suppress("unused")
val customGoogleMapsApiKeyPatch = resourcePatch(
    name = "Custom Google Maps API Key",
    description = "Replaces the embedded Google Maps API key with a personal Google Cloud API key so native Google Maps renders on re-signed builds. Note: To use native Google Maps, disable the OpenStreetMap Drop-in Replacement patch.",
    default = false
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    val apiKeyOption = stringOption(
        key = "apiKey",
        default = "",
        title = "Google Maps API Key",
        description = "Custom Google Maps API key from Google Cloud Console (with Maps SDK for Android enabled)."
    )

    execute {
        val apiKey = apiKeyOption.value?.trim()
        if (apiKey.isNullOrEmpty()) {
            return@execute
        }

        document("AndroidManifest.xml").use { document ->
            val metaDataNodes = document.getElementsByTagName("meta-data")
            for (i in 0 until metaDataNodes.length) {
                val element = metaDataNodes.item(i) as? Element ?: continue
                val name = element.getAttribute("android:name")
                if (name == "com.google.android.geo.API_KEY" || name == "com.google.android.maps.v2.API_KEY") {
                    element.setAttribute("android:value", apiKey)
                }
            }
        }
    }
}
