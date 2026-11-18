package app.morphe.patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

// Waze installs next to Google's: the package is renamed, the dash service is added, and the icon/splash are
// NmaxConnect's (tools/icons/nmax-waze.svg through svg2vector.py, kept in resources/nmax/waze).
private const val BUNDLED = "nmax/waze"
private const val SPLASH_BG = "@android:color/black" // svg2vector's background placeholder
private const val SPLASH_BG_COLOR = "@color/CarButtonColor" // Waze's day/night card color
private const val DYNAMIC_RECEIVER = "$WAZE_ORIGINAL_PACKAGE.DYNAMIC_RECEIVER_"
private const val BRAND_BLUE = "#ff4f5d8e" // NmaxConnect's Connect button blue

private val log = Logger.getLogger("app.morphe.patches.waze.WazeNmaxPatch")

// Without the XML declaration and comments: ARSCLib keeps them as nodes before the root, which aapt2 refuses.
private fun bundled(name: String): String =
    object {}.javaClass.classLoader.getResourceAsStream("$BUNDLED/$name")?.use { it.readBytes().decodeToString() }
        ?.substringAfter("?>")?.replace(Regex("<!--.*?-->", RegexOption.DOT_MATCHES_ALL), "")?.trimStart()
        ?: throw PatchException("Waze NMAX: bundled $name is missing")

private fun Element.children(tag: String) =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

private fun Node.elements(): List<Element> =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }.flatMap { listOf(it) + it.elements() }

private val wazeNmaxResourcePatch = resourcePatch {
    execute {
        // The manifest: package, `com.waze.`-prefixed provider authorities and androidx's DYNAMIC_RECEIVER permissions
        // (built from getPackageName() at runtime). Class names are absolute and stay; resources.arsc stays com.waze.
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            if (manifest.getAttribute("package") != WAZE_ORIGINAL_PACKAGE) {
                throw PatchException("Waze NMAX: manifest package is '${manifest.getAttribute("package")}', not $WAZE_ORIGINAL_PACKAGE")
            }
            manifest.setAttribute("package", WAZE_PACKAGE)

            val all = manifest.elements()
            val authorities = all.filter { it.tagName == "provider" && it.getAttribute("android:authorities").isNotEmpty() }
            if (authorities.isEmpty()) throw PatchException("Waze NMAX: no <provider android:authorities> in the manifest")
            authorities.forEach { provider ->
                provider.setAttribute(
                    "android:authorities",
                    provider.getAttribute("android:authorities").split(';').joinToString(";") {
                        if (it.startsWith("$WAZE_ORIGINAL_PACKAGE.")) WAZE_PACKAGE + it.removePrefix(WAZE_ORIGINAL_PACKAGE) else it
                    },
                )
            }
            val permissions = all.filter {
                (it.tagName == "permission" || it.tagName == "uses-permission") &&
                    it.getAttribute("android:name").startsWith(DYNAMIC_RECEIVER)
            }
            if (permissions.isEmpty()) throw PatchException("Waze NMAX: no ${DYNAMIC_RECEIVER}* permission in the manifest")
            permissions.forEach {
                it.setAttribute("android:name", WAZE_PACKAGE + it.getAttribute("android:name").removePrefix(WAZE_ORIGINAL_PACKAGE))
            }
            log.info("Waze NMAX: renamed ${authorities.size} providers, ${permissions.size} permissions")

            val application = manifest.children("application").firstOrNull()
                ?: throw PatchException("Waze NMAX: no <application> in the manifest")
            val action = document.createElement("action").apply { setAttribute("android:name", WAZE_BIND_ACTION) }
            val filter = document.createElement("intent-filter").apply { appendChild(action) }
            application.appendChild(document.createElement("service").apply {
                setAttribute("android:name", WAZE_SERVICE)
                setAttribute("android:exported", "true")
                appendChild(filter)
            })
        }

        // Waze's adaptive launcher icon and splash both draw drawable/launch_icon_foreground.
        val icons = listDecodableFiles("res/drawable*/launch_icon_foreground.xml")
        if (icons.isEmpty()) throw PatchException("Waze NMAX: no drawable/launch_icon_foreground")
        icons.forEach { get(it).writeText(bundled("launch_icon_foreground.xml")) }

        val logos = listDecodableFiles("res/drawable*/splash_logo.xml")
        if (logos.isEmpty()) throw PatchException("Waze NMAX: no drawable/splash_logo")
        logos.forEach { get(it).writeText(bundled("splash_logo.xml").replace(SPLASH_BG, SPLASH_BG_COLOR)) }
        log.info("Waze NMAX: icon $icons, splash $logos")

        // 5.24 had brand_waze as a colour; 5.27 makes it a reference (@color/Blue300, shared with Waze's UI): keep it then.
        var brand = 0
        listDecodableFiles("res/values*/colors.xml").forEach { path ->
            document(path).use { document ->
                document.documentElement.children("color").filter { it.getAttribute("name") == "brand_waze" }.forEach {
                    if (it.textContent.trim().startsWith("#")) {
                        it.textContent = BRAND_BLUE
                        brand++
                    }
                }
            }
        }
        log.info("Waze NMAX: brand_waze literal in $brand places")

        // Theme.Splash: the status/nav bar colors (brand_waze) become the splash background and animated icon.
        var themes = 0
        listDecodableFiles("res/values*/styles.xml").forEach { path ->
            document(path).use { document ->
                document.documentElement.children("style").filter { it.getAttribute("name") == "Theme.Splash" }.forEach { style ->
                    val bars = style.children("item").filter {
                        it.getAttribute("name") in setOf("android:statusBarColor", "android:navigationBarColor") &&
                            it.textContent.trim() == "@color/brand_waze"
                    }
                    if (bars.size == 2) {
                        bars[0].setAttribute("name", "android:windowSplashScreenBackground")
                        bars[0].textContent = SPLASH_BG_COLOR
                        bars[1].setAttribute("name", "android:windowSplashScreenAnimatedIcon")
                        bars[1].textContent = "@drawable/splash_logo"
                        themes++
                    }
                }
            }
        }
        if (themes == 0) throw PatchException("Waze NMAX: no Theme.Splash style with statusBarColor/navigationBarColor = @color/brand_waze")
        log.info("Waze NMAX: Theme.Splash patched in $themes files")
    }
}

@Suppress("unused")
val wazeNmaxPatch = bytecodePatch(
    name = "Waze NMAX",
    description = "Installs Waze next to Google's as com.lampp.wazenmax with NmaxConnect's icon, splash and dash service.",
    default = true,
) {
    compatibleWith(wazeCompatibility)
    dependsOn(wazeNmaxResourcePatch)
    extendWith("extensions/waze.mpe")

    execute { }
}
