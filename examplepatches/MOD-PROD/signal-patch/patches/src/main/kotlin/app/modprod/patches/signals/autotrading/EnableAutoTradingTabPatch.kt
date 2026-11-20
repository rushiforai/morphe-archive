package app.modprod.patches.signals.autotrading

import app.modprod.patches.signals.shared.Constants.COMPATIBILITY_SIGNALS
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.asSequence
import org.w3c.dom.Element

private const val HTML_ASSET = "assets/modprod/autotrading/index.html"
private const val BUNDLED_HTML = "/signals/autotrading/index.html"

private object HtmlResources

/**
 * Shows the 5th bottom-nav item and ships the local Auto Trading HTML.
 * Does not change the ViewPager fragment — see [wireAutoTradingFragmentPatch].
 */
@Suppress("unused")
val enableAutoTradingTabPatch = resourcePatch(
    name = "Enable Auto Trading tab",
    description = "Shows the 5th bottom navigation item as Auto Trading and adds " +
        "assets/modprod/autotrading/index.html.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGNALS)

    execute {
        listOf(
            "res/menu/bottom_nav_menu.xml",
            "res/layout/bottom_nav_menu.xml",
        ).forEach { path ->
            runCatching {
                document(path).use { document ->
                    document.getElementsByTagName("item").asSequence()
                        .map { it as Element }
                        .filter { it.getAttribute("android:id").contains("navigation_launchpads") }
                        .forEach { it.setAttribute("android:visible", "true") }
                }
            }
        }

        runCatching {
            document("res/values/strings.xml").use { document ->
                document.getElementsByTagName("string").asSequence()
                    .map { it as Element }
                    .filter { it.getAttribute("name") == "launchpad" }
                    .forEach { it.textContent = "Auto Trading" }
            }
        }

        runCatching {
            document("res/navigation/mobile_navigation.xml").use { document ->
                document.getElementsByTagName("fragment").asSequence()
                    .map { it as Element }
                    .filter { it.getAttribute("android:id").contains("navigation_launchpads") }
                    .forEach { frag ->
                        frag.setAttribute(
                            "android:name",
                            "app.modprod.extension.autotrading.AutoTradingFragment",
                        )
                    }
            }
        }

        val script = HtmlResources::class.java.getResourceAsStream(BUNDLED_HTML)?.use { it.readBytes() }
            ?: throw app.morphe.patcher.patch.PatchException("Bundled HTML missing: $BUNDLED_HTML")

        get(HTML_ASSET, copy = false).apply {
            parentFile.mkdirs()
            writeBytes(script)
        }
    }
}
