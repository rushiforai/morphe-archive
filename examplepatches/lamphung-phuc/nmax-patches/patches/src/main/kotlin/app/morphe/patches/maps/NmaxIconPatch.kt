package app.morphe.patches.maps

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.util.logging.Logger

// The NmaxConnect launcher icon and splash logo, made from NmaxConnect's tools/icons/nmax-gmaps.svg by its
// tools/icons/svg2vector.py (convert = icon, splash with black/white ink = splash_day/splash_night).
private const val BUNDLED = "nmax/maps"
private const val SPLASH = "map_pin_2025_static"
private const val SPLASH_BG = "@android:color/black" // svg2vector's background placeholder

private val log = Logger.getLogger("app.morphe.patches.maps.NmaxIconPatch")

// Without the XML declaration and comments: ARSCLib keeps them as nodes before the root, which aapt2 refuses.
private fun bundled(name: String): String =
    object {}.javaClass.classLoader.getResourceAsStream("$BUNDLED/$name")?.use { it.readBytes().decodeToString() }
        ?.substringAfter("?>")?.replace(Regex("<!--.*?-->", RegexOption.DOT_MATCHES_ALL), "")?.trimStart()
        ?: throw PatchException("NMAX icon: bundled $name is missing")

@Suppress("unused")
val nmaxIconPatch = resourcePatch(
    name = "NMAX icon",
    description = "Uses the NmaxConnect launcher icon and splash logo.",
) {
    compatibleWith(compatibility)

    execute {
        val icons = document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            listOf("android:icon", "android:roundIcon").mapNotNull { application.getAttribute(it).ifEmpty { null } }
        }.toSet()
        if (icons.isEmpty()) throw PatchException("NMAX icon: no android:icon on <application>")

        // Only the adaptive-icon (anydpi) files: the launcher masks the 108 vector whole into its icon shape.
        val icon = bundled("icon.xml")
        icons.forEach { ref ->
            val (type, name) = ref.removePrefix("@").split('/', limit = 2)
            val files = listDecodableFiles("res/$type-anydpi*/$name.xml")
            if (files.isEmpty()) throw PatchException("NMAX icon: no adaptive icon for $ref")
            log.info("NMAX icon: $ref -> $files")
            files.forEach { get(it).writeText(icon) }
        }

        // The launch activity's splash icon: one layer-list per config, Maps' day/night color under its pin. Keep that
        // color, draw our logo instead of the pin.
        val splashes = listDecodableFiles("res/drawable*/$SPLASH.xml")
        if (splashes.isEmpty()) throw PatchException("NMAX icon: no drawable/$SPLASH")
        log.info("NMAX icon: splash $splashes")
        splashes.forEach { path ->
            val file = get(path)
            val background = Regex("""<item\s+android:drawable="([^"]+)"""").find(file.readText())?.groupValues?.get(1)
                ?: throw PatchException("NMAX icon: no background color in $path")
            val template = bundled(if ("night" in path.substringBeforeLast('/')) "splash_night.xml" else "splash_day.xml")
            file.writeText(template.replace(SPLASH_BG, background))
        }
    }
}
