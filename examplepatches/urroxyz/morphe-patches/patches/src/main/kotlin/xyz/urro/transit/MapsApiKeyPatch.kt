package xyz.urro.transit

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private val MAPS_KEY = Regex("^AIza[0-9A-Za-z_-]{35}$")
private val MAPS_META = setOf("com.google.android.maps.v2.API_KEY", "com.google.android.geo.API_KEY")

/**
 * The Maps SDK reads its key inside Google Play services from the installed manifest, so a
 * re-signed Transit cannot use Transit's own key. This writes the user's key into the existing
 * manifest entry at patch time; Morphe Manager keeps the option for later re-patches.
 */
@Suppress("unused")
val transitMapsApiKeyPatch = resourcePatch(
    name = "Personal Maps API key",
    description = "Uses your own Maps SDK for Android key so the map renders in patched Transit. Enter the key in this patch's options.",
    default = false,
) {
    compatibleWith(transitCompatibility)

    // Blank default with required = true: Manager flags the option as missing until a key is entered.
    // A null default made the patcher throw before Manager could ask for one.
    val apiKey by stringOption(
        key = "transitMapsApiKey",
        default = "",
        title = "Maps SDK for Android key",
        description = "Required. Your Google Maps SDK for Android API key (starts with AIza, 39 characters).",
        required = true,
    ) { it.isNullOrBlank() || MAPS_KEY.matches(it.trim()) }

    execute {
        val key = apiKey?.trim().orEmpty()
        check(key.isNotEmpty()) { "Personal Maps API key is required: enter your Maps SDK for Android key in this patch's options." }
        check(MAPS_KEY.matches(key)) { "Maps key must start with AIza and be 39 characters." }
        document("AndroidManifest.xml").use { d ->
            val android = "http://schemas.android.com/apk/res/android"
            val entries = d.getElementsByTagName("meta-data")
            var replaced = 0
            for (i in 0 until entries.length) {
                val e = entries.item(i) as Element
                if (e.getAttributeNS(android, "name") in MAPS_META) {
                    e.setAttributeNS(android, "android:value", key)
                    replaced++
                }
            }
            check(replaced > 0) { "No Maps API key entry found in Transit's manifest" }
        }
    }
}
