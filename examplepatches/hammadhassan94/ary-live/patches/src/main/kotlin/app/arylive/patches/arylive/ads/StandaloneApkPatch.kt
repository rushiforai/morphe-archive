package app.arylive.patches.arylive.ads

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Play distribution APKs declare split metadata. Sideload / Morphe installs
 * fail with INSTALL_FAILED_MISSING_SPLIT unless that is stripped.
 */
internal val standaloneApkResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.removeAttribute("android:requiredSplitTypes")
            manifest.removeAttribute("android:splitTypes")
            manifest.removeAttribute("requiredSplitTypes")
            manifest.removeAttribute("splitTypes")

            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: return@use
            val toRemove = mutableListOf<org.w3c.dom.Node>()
            val children = application.childNodes
            for (i in 0 until children.length) {
                val node = children.item(i)
                if (node !is Element || node.tagName != "meta-data") continue
                val name = node.getAttribute("android:name").ifEmpty { node.getAttribute("name") }
                if (name == "com.android.vending.splits" ||
                    name == "com.android.vending.derived.apk.id" ||
                    name == "com.android.stamp.type" ||
                    name == "com.android.stamp.source"
                ) {
                    toRemove += node
                }
            }
            toRemove.forEach { application.removeChild(it) }
        }
    }
}
