package io.github.forsigh.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Launch screen - the colour behind the Waze logo while the app starts.
 *
 * Two layers have to agree, because Android uses a different one depending on the OS version:
 *
 *  - Android 11 and older draw `res/drawable/splash_logo.xml`, a `layer-list` whose first item is
 *    `@color/brand_waze` (stock #33CCFF). That item is repainted.
 *  - Android 12 and newer draw their own splash before any app code runs and read
 *    `android:windowSplashScreenBackground` from the theme. Waze never sets it, so the platform
 *    falls back to a stock colour and the drawable edit alone changes nothing on a modern phone.
 *    A `Theme.Splash.V29` override is written into `res/values-v31/` with the chosen colour.
 *
 * The logo itself is not this row's business - hide it on the Change Waze icon row.
 */
@Suppress("unused")
val launchScreenPatch = resourcePatch(
    name = "Launch screen background colour",
    description = "Colour behind the Waze logo while the app starts. #00000000 makes it transparent.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")

    val splashPreset by stringOption(
        key = "splashPreset",
        default = "AMOLED black",
        values = mapOf(
            "AMOLED black" to "AMOLED black",
            "Waze blue" to "Waze blue",
            "Green" to "Green",
            "Transparent" to "Transparent",
            "Custom colour" to "Custom colour",
        ),
        title = "Background colour",
        description = "Pick a colour, or choose Custom colour and type your own hex.",
    )
    val splashColor by colorOption(
        key = "splashColor",
        default = "#FF000000",
        title = "Custom colour",
        description = "Only used when Launch screen is set to Custom colour.",
    )

    execute {
        val preset = splashPreset?.trim().orEmpty()
        val named = when {
            preset.startsWith("amoled", true) || preset == "black" -> "#FF000000"
            preset.startsWith("waze", true) || preset == "blue" -> "#FF33CCFF"
            preset.startsWith("green", true) -> "#FF1FA55A"
            preset.startsWith("transparent", true) -> "#00000000"
            preset.startsWith("custom", true) || preset.isEmpty() -> splashColor
            else -> throw PatchException("launchScreen: unknown launch colour '$preset'")
        }
        val want = named
        if (want == null || !want.matches(Regex("#[0-9a-fA-F]{6,8}"))) {
            throw PatchException("launchScreen: launch colour must be hex like #FF000000 (got '$want')")
        }
        val argb = if (want.length == 7) "#ff" + want.substring(1) else want

        try {
            val splash = document("res/drawable/splash_logo.xml")
            splash.use {
                val root = splash.documentElement
                if (root.nodeName != "layer-list") {
                    throw PatchException("launchScreen: splash_logo is not a layer-list (${root.nodeName})")
                }
                val backdrop = root.getElementsByTagName("item").item(0) as? Element
                    ?: throw PatchException("launchScreen: splash_logo has no backdrop item")
                val attr = backdrop.getAttributeNode("android:drawable")
                    ?: throw PatchException("launchScreen: splash backdrop carries no drawable")
                val before = attr.nodeValue
                attr.nodeValue = argb
                if (backdrop.getAttribute("android:drawable") != argb) {
                    throw PatchException("launchScreen: could not repaint the splash backdrop")
                }
                println("launchScreen: launch drawable $before -> $argb")
            }
        } catch (e: PatchException) {
            throw e
        } catch (e: Exception) {
            println("launchScreen: res/drawable/splash_logo.xml not present - skipping the drawable")
        }

        try {
            putSplashThemeItem("android:windowSplashScreenBackground", argb)
            putSplashThemeItem("android:forceDarkAllowed", "false")
            println("launchScreen: system splash background -> $argb (Android 12+)")
        } catch (e: Exception) {
            println("launchScreen: res/values-v31/styles.xml not present - system splash left stock")
        }
    }
}
