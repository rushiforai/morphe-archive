package io.github.forsigh.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Rename Waze - changes the label under the launcher icon, nothing else.
 *
 * Default is the stock name, so the row does nothing until someone types their own. When they do,
 * `android:label` on <application> (normally `@string/app_name_regular`) is replaced with a literal,
 * which applies to every locale while the in-app strings stay untouched. The package id (com.waze)
 * is never touched, so accounts, Android Auto pairing and existing data are unaffected.
 */
val renameAppPatch = resourcePatch(
    name = "Rename app",
    description = "Stock name by default. Type your own to replace what the launcher shows. " +
        "The package stays com.waze.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")

    val label by stringOption(
        key = "name",
        default = "Waze",
        title = "App name",
        description = "Leave Waze for the stock name, or type your own (40 characters max).",
    )

    execute {
        val value = label?.trim().orEmpty()
        if (value.isEmpty() || value.equals("Waze", ignoreCase = true)) {
            println("Rename app: stock name kept, nothing changed")
            return@execute
        }
        if (value.contains('\n') || value.contains('\r')) {
            throw PatchException("Rename app: the name must be a single line")
        }
        if (value.length > 40) {
            throw PatchException("Rename app: '$value' is too long for a launcher label")
        }

        val doc = document("AndroidManifest.xml")
        doc.use {
            val application = doc.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Rename app: no <application> in the manifest")

            val attr = application.getAttributeNode("android:label")
                ?: throw PatchException("Rename app: <application> declares no android:label")
            val before = attr.nodeValue
            attr.nodeValue = value
            if (application.getAttribute("android:label") != value) {
                throw PatchException("Rename app: could not set the label (was '$before')")
            }
            println("Rename app: label '$before' -> '$value'")
        }
    }
}
