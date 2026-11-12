package app.gwp.patches.shared

import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Internal: removes the split requirements from the manifest, so the patched base APK installs on its own
 * (Morphe Manager merges split APKs; Play's "required split" metadata would block the install).
 */
internal val standaloneInstallPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            listOf("requiredSplitTypes", "splitTypes").forEach { name ->
                manifest.removeAttributeNS(ANDROID_NS, name)
                manifest.removeAttribute("android:$name")
                manifest.removeAttribute(name)
            }
            val metaData = document.getElementsByTagName("meta-data")
            (0 until metaData.length).map { metaData.item(it) as Element }.filter {
                val name = it.getAttributeNS(ANDROID_NS, "name").ifEmpty { it.getAttribute("android:name") }
                name == "com.android.vending.splits.required" || name == "com.android.vending.splits"
            }.forEach { it.parentNode.removeChild(it) }
        }
    }
}
