package app.template.patches.shared

import app.morphe.patcher.patch.resourceXml

/**
 * Declares a permission in AndroidManifest.xml, before `<application>` as usual, unless the app
 * already declares it. Call from a patch's `execute` block.
 */
internal fun addManifestPermission(permission: String) {
    resourceXml("AndroidManifest.xml").use { manifest ->
        val root = manifest.root
        val declared = root.children("uses-permission").any { it.attribute("android:name") == permission }
        if (declared) return@use

        val application = root.children("application").first()
        root.insertChild(application.index, "uses-permission") {
            setAttribute("android:name", permission)
        }
    }
}
