package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import org.w3c.dom.Element

@Suppress("unused")
val replaceMapsApiKeyPatch = resourcePatch(
    name = "Replace Google Maps API Key",
    description = "Replaces com.google.android.geo.API_KEY in AndroidManifest.xml with a user-supplied " +
            "Google Maps API key so map tiles load on non-root re-signed APKs.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)

    val apiKey by stringOption(
        key = "mapsApiKey",
        default = "",
        title = "Google Maps API Key",
        description = "Your Google Maps Android SDK API key (leave empty to keep original)."
    )

    execute {
        val key = apiKey?.trim().orEmpty()
        if (key.isEmpty()) return@execute

        document("AndroidManifest.xml").use { doc ->
            val metaData = doc.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val elem = metaData.item(i) as? Element ?: continue
                if (elem.getAttribute("android:name") == "com.google.android.geo.API_KEY") {
                    elem.setAttribute("android:value", key)
                    break
                }
            }
        }
    }
}
