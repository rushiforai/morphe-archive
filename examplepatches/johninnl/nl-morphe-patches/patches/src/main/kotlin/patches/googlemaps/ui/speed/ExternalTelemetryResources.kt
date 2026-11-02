package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Provider identity checks need visibility even in Maps builds that only query Waze. */
internal val externalTelemetryVisibilityPatch = resourcePatch(
    description = "Makes both external navigation providers visible for sender identity checks.",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
                ?: manifest.createElement("queries").also(root::appendChild)
            val existing = queries.getElementsByTagName("package").let { elements ->
                (0 until elements.length).map { (elements.item(it) as Element).getAttribute("android:name") }.toSet()
            }
            for (name in listOf("com.waze", "nl.flitsmeister")) {
                if (name !in existing) queries.appendChild(manifest.createElement("package").apply {
                    setAttribute("android:name", name)
                })
            }
        }
    }
}
