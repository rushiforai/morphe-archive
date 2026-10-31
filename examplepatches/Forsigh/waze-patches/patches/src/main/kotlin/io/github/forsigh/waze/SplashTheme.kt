package io.github.forsigh.waze

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element

/**
 * Writes one item into `Theme.Splash.V29` for Android 12+, creating the style when the build has no
 * override yet.
 *
 * Android 12+ draws its own launch screen before any app code runs and reads these attributes from
 * the theme; Waze sets none of them, so whatever the drawables say is ignored on a modern phone.
 * Two rows need this (Launch screen for the background, Change Waze icon for the logo), hence one
 * helper instead of two copies.
 */
internal fun ResourcePatchContext.putSplashThemeItem(name: String, value: String) {
    val themed = document("res/values-v31/styles.xml")
    themed.use {
        val root = themed.documentElement
        var style: Element? = null
        val styles = root.getElementsByTagName("style")
        for (i in 0 until styles.length) {
            val el = styles.item(i) as Element
            if (el.getAttribute("name") == "Theme.Splash.V29") {
                style = el
                break
            }
        }
        if (style == null) {
            val created = themed.createElement("style")
            created.setAttribute("name", "Theme.Splash.V29")
            created.setAttribute("parent", "@style/Theme.Splash.V27")
            root.appendChild(created)
            style = created
        }

        var item: Element? = null
        val items = style!!.getElementsByTagName("item")
        for (i in 0 until items.length) {
            val el = items.item(i) as Element
            if (el.getAttribute("name") == name) {
                item = el
                break
            }
        }
        if (item == null) {
            item = themed.createElement("item")
            item.setAttribute("name", name)
            style!!.appendChild(item)
        }
        item.textContent = value
        check(item.textContent == value) { "splash theme: $name did not stick" }
    }
}
