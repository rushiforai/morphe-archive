package app.polishapps.patches.all

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA
import org.w3c.dom.Element

private const val MAPS_KEY_META_DATA = "com.google.android.geo.API_KEY"
private const val STRING_REFERENCE_PREFIX = "@string/"

/** Google API keys are always "AIza" followed by 35 URL-safe characters. */
private val API_KEY_FORMAT = Regex("AIza[0-9A-Za-z_-]{35}")

@Suppress("unused")
val customMapsKeyPatch = resourcePatch(
    name = "Custom Google Maps key",
    description = "Replaces the app's Google Maps API key. The original key is locked to the developer's signing " +
        "certificate, so maps stay grey in a re-signed app. Use a key you own that allows the app's package name " +
        "and the SHA-1 of the key the patched app is signed with.",
    // Needs a key of the user's own, so it can never be on by default.
    default = false,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS, COMPATIBILITY_INPOST, COMPATIBILITY_ZABKA)

    val mapsApiKey = stringOption(
        key = "mapApiKey",
        title = "Google Maps API key",
        description = "A Maps SDK for Android key, starting with AIza.",
        required = true,
        validator = { value -> value != null && API_KEY_FORMAT.matches(value.trim()) },
    )

    execute {
        val apiKey = mapsApiKey.value?.trim().orEmpty()
        if (apiKey.isEmpty()) {
            throw PatchException("Option 'mapApiKey' is required.")
        }

        var stringName: String? = null

        document("AndroidManifest.xml").use { manifest ->
            val entries = manifest.getElementsByTagName("meta-data")
            val entry = (0 until entries.length)
                .map { entries.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == MAPS_KEY_META_DATA }
                ?: throw PatchException("$MAPS_KEY_META_DATA not found in AndroidManifest.xml, this app has no Maps key to replace")

            val original = entry.getAttribute("android:value")
            if (original.startsWith(STRING_REFERENCE_PREFIX)) {
                stringName = original.removePrefix(STRING_REFERENCE_PREFIX)
            }
            entry.setAttribute("android:value", apiKey)
        }

        // Code that reads the key from the resource (for example to initialise Places) would otherwise
        // still get the old one, so keep the referenced string in step with the manifest.
        stringName?.let { name ->
            document("res/values/strings.xml").use { strings ->
                val entries = strings.getElementsByTagName("string")
                (0 until entries.length)
                    .map { entries.item(it) as Element }
                    .firstOrNull { it.getAttribute("name") == name }
                    ?.textContent = apiKey
            }
        }
    }
}
