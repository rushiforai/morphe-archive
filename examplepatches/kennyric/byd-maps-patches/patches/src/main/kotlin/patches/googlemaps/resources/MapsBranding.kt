package org.ungoogled.patches.maps.resources

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element
import java.util.Collections
import java.util.WeakHashMap

private const val LAUNCHER = "morphe_maps_launcher"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val artwork = linkedMapOf(
    "classic_pin" to "Classic pin",
    "outlined_pin" to "Outlined pin",
    "classic_map_tile" to "Classic map tile",
    "raised_map_pin" to "Raised map pin",
    "gradient_pin" to "Gradient pin",
    "folded_map" to "Folded map",
)

internal val mapsIconChoices = linkedMapOf(
    "Automatic (follow Legacy icon)" to "automatic",
    "Original Google Maps" to "original",
).apply {
    artwork.forEach { (key, label) ->
        put("$label - Light", "${key}_light")
        put("$label - Dark", "${key}_dark")
    }
}

// Match MicrogSelection's per-context model; contexts are unique to a patching run.
// Weak keys avoid retaining completed runs in Manager, which reuses the bundle.
private val explicitChoices = Collections.synchronizedMap(WeakHashMap<ResourcePatchContext, Boolean>())

/** Explicit branding owns the launcher; the Legacy icon patch must leave it alone. */
internal fun ResourcePatchContext.hasMapsBranding(): Boolean = explicitChoices[this] == true

internal fun ResourcePatchContext.applyMapsBranding(style: String) {
    if (style == "automatic") {
        explicitChoices.remove(this)
        return
    }
    if (style !in mapsIconChoices.values) throw PatchException("Unknown Google Maps icon: $style")

    fun write(path: String, content: String) {
        val file = get("res/$path")
        file.parentFile.mkdirs()
        file.writeText(content.trimIndent() + "\n")
    }
    if (style == "original") {
        explicitChoices[this] = true
        return
    }
    val key = style.substringBeforeLast('_')
    val background = if (style.endsWith("_dark")) "#171A21" else "#FAFAFA"
    val destination = get("res/drawable-nodpi/morphe_maps_artwork.png")
    destination.parentFile.mkdirs()
    val input = object {}.javaClass.getResourceAsStream("/googlemaps/branding/$key.png")
        ?: throw PatchException("Missing Google Maps artwork: $key")
    input.use { source -> destination.outputStream().use(source::copyTo) }
    write("drawable/morphe_maps_background.xml", """
        <shape xmlns:android="$ANDROID" android:shape="rectangle">
            <solid android:color="$background" />
        </shape>
    """)
    // 28/108 of the adaptive canvas, proportional at every host icon size.
    // A fixed 28dp inset collapses the foreground in small Android Auto slots.
    write("drawable/morphe_maps_foreground.xml", """
        <inset xmlns:android="$ANDROID" android:inset="25.9259%">
            <bitmap android:src="@drawable/morphe_maps_artwork" android:gravity="fill" android:filter="true" />
        </inset>
    """)
    write("mipmap-anydpi/$LAUNCHER.xml", """
        <adaptive-icon xmlns:android="$ANDROID">
            <background android:drawable="@drawable/morphe_maps_background" />
            <foreground android:drawable="@drawable/morphe_maps_foreground" />
        </adaptive-icon>
    """)
    document("AndroidManifest.xml").use { manifest ->
        val elements = manifest.getElementsByTagName("*")
        var regular = 0
        var round = 0
        for (i in 0 until elements.length) {
            val element = elements.item(i) as Element
            if (element.getAttributeNS(ANDROID, "icon") in setOf("@mipmap/maps_2025", "@mipmap/ungoogled_legacy_icon")) {
                element.setAttributeNS(ANDROID, "android:icon", "@mipmap/$LAUNCHER")
                regular++
            }
            if (element.getAttributeNS(ANDROID, "roundIcon") in setOf("@mipmap/maps_2025_round", "@mipmap/ungoogled_legacy_icon")) {
                element.setAttributeNS(ANDROID, "android:roundIcon", "@mipmap/$LAUNCHER")
                round++
            }
        }
        if (regular == 0 || round == 0) throw PatchException("Google Maps launcher icons not found ($regular regular, $round round)")
    }
    explicitChoices[this] = true
}
