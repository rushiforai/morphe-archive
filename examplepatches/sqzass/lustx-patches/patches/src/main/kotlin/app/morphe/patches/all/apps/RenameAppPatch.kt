package app.morphe.patches.all.label

import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.Node

private fun children(parent: Element, tag: String): List<Element> {
    val out = mutableListOf<Element>()
    var n: Node? = parent.firstChild
    while (n != null) { if (n is Element && n.tagName == tag) out.add(n); n = n.nextSibling }
    return out
}

private fun hasLauncherCategory(activity: Element): Boolean =
    children(activity, "intent-filter").any { filter ->
        children(filter, "category").any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
    }

@Suppress("unused")
val renameAppLabelPatch = resourcePatch(
    name = "Rename app label",
    description = "Sets a literal launcher name on <application>, launcher activities and aliases. " +
        "'Current' keeps the existing label.",
    default = false,
) {
    val labelOption = stringOption(
        key = "appLabel", default = "Current",
        values = mapOf("Current" to "Current"),
        title = "App label", description = "New display name shown in the launcher, or 'Current'.",
        required = true,
    ) { it == "Current" || !it.isNullOrBlank() }

    execute {
        val label = labelOption.value ?: return@execute
        if (label == "Current") return@execute

        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as? Element ?: return@use
            app.setAttribute("android:label", label)

            children(app, "activity").filter { hasLauncherCategory(it) }.forEach { it.setAttribute("android:label", label) }
            children(app, "activity-alias").forEach { it.setAttribute("android:label", label) }
        }
    }
}