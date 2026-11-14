package app.morphe.patches.all.boot

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private fun elementsByTag(doc: Document, tag: String): List<Element> {
    val nl = doc.getElementsByTagName(tag)
    return (0 until nl.length).map { nl.item(it) as Element }
}

private fun childElements(parent: Element, tag: String): List<Element> {
    val out = mutableListOf<Element>()
    var n = parent.firstChild
    while (n != null) {
        if (n is Element && n.tagName == tag) out.add(n)
        n = n.nextSibling
    }
    return out
}

@Suppress("unused")
val disableBootStartPatch = resourcePatch(
    name = "Disable boot start-up",
    description = "Prevents the app from auto-starting on device boot by removing boot " +
        "intent-filter actions and the RECEIVE_BOOT_COMPLETED permission.",
    default = false,
) {
    val blockPackageReplaced by booleanOption(
        key = "blockPackageReplaced",
        default = false,
        title = "Also block update start-up",
        description = "Also remove MY_PACKAGE_REPLACED (auto-start after the app is updated).",
    )

    execute {
        val bootActions = mutableSetOf(
            "android.intent.action.BOOT_COMPLETED",
            "android.intent.action.LOCKED_BOOT_COMPLETED",
            "android.intent.action.QUICKBOOT_POWERON",
            "com.htc.intent.action.QUICKBOOT_POWERON",
        )
        if (blockPackageReplaced == true) bootActions += "android.intent.action.MY_PACKAGE_REPLACED"

        document("AndroidManifest.xml").use { doc ->
            elementsByTag(doc, "receiver").forEach { receiver ->
                childElements(receiver, "intent-filter").forEach { filter ->
                    childElements(filter, "action").forEach { action ->
                        if (action.getAttribute("android:name") in bootActions) filter.removeChild(action)
                    }
                    if (childElements(filter, "action").isEmpty()) receiver.removeChild(filter)
                }
            }
            elementsByTag(doc, "uses-permission").forEach {
                if (it.getAttribute("android:name") == "android.permission.RECEIVE_BOOT_COMPLETED") {
                    it.parentNode.removeChild(it)
                }
            }
        }
    }
}
