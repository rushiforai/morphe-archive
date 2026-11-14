package app.morphe.patches.all.icon

import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val hideAppIconPatch = resourcePatch(
    name = "Hide app icon",
    description = "Hides the app from the launcher by replacing the LAUNCHER category with " +
        "DEFAULT. The app stays installed; launch it via another app or a shortcut.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nl = doc.getElementsByTagName("category")
            (0 until nl.length).map { nl.item(it) as org.w3c.dom.Element }.forEach { el ->
                if (el.getAttribute("android:name") == "android.intent.category.LAUNCHER") {
                    el.setAttribute("android:name", "android.intent.category.DEFAULT")
                }
            }
        }
    }
}
