package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.resourcePatch
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS
import org.w3c.dom.Element

/**
 * Resource patch that edits AndroidManifest.xml to declare the Android Auto CarAppService,
 * required meta-data, and permissions.
 *
 * Idempotent: will not duplicate entries if already present.
 */
@Suppress("unused")
val androidAutoManifestPatch = resourcePatch(
    name = "Android Auto Manifest",
    description = "Adds the Android Auto CarAppService declaration, meta-data, " +
            "and permissions to AndroidManifest.xml.",
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applicationNode = doc
                .getElementsByTagName("application")
                .item(0) as Element

            // --- Meta-data ---

            fun addMetaDataIfMissing(name: String, value: String, attribute: String = "android:value") {
                val existing = applicationNode.getElementsByTagName("meta-data")
                for (i in 0 until existing.length) {
                    val node = existing.item(i) as? Element ?: continue
                    if (node.getAttribute("android:name") == name) return // already present
                }
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute(attribute, value)
                applicationNode.appendChild(meta)
            }

            // android:resource (0x01010025), not android:value: the meta-data must be
            // a resource reference resolving into resources.arsc, as in Google Maps.
            addMetaDataIfMissing(
                "com.google.android.gms.car.application",
                "@xml/automotive_app_desc",
                attribute = "android:resource",
            )
            addMetaDataIfMissing(
                "androidx.car.app.minCarApiLevel",
                "1"
            )

            // --- Service declaration ---

            val manifestRoot = doc.documentElement
            val existingServices = manifestRoot.getElementsByTagName("service")
            var serviceExists = false
            for (i in 0 until existingServices.length) {
                val svc = existingServices.item(i) as? Element ?: continue
                if (svc.getAttribute("android:name") == "dev.petalaa.extension.PetalCarAppService") {
                    serviceExists = true
                    break
                }
            }

            if (!serviceExists) {
                val serviceNode = doc.createElement("service")
                serviceNode.setAttribute("android:name", "dev.petalaa.extension.PetalCarAppService")
                serviceNode.setAttribute("android:exported", "true")

                val intentFilter = doc.createElement("intent-filter")
                val action = doc.createElement("action")
                action.setAttribute("android:name", "androidx.car.app.CarAppService")
                intentFilter.appendChild(action)

                val category = doc.createElement("category")
                category.setAttribute("android:name", "androidx.car.app.category.NAVIGATION")
                intentFilter.appendChild(category)

                serviceNode.appendChild(intentFilter)
                applicationNode.appendChild(serviceNode)
            }

            // --- Permission ---

            fun addPermissionIfMissing(name: String) {
                val existing = manifestRoot.getElementsByTagName("uses-permission")
                for (i in 0 until existing.length) {
                    val perm = existing.item(i) as? Element ?: continue
                    if (perm.getAttribute("android:name") == name) return
                }
                val permNode = doc.createElement("uses-permission")
                permNode.setAttribute("android:name", name)
                // Insert before <application> node for cleanliness
                manifestRoot.insertBefore(permNode, applicationNode)
            }

            addPermissionIfMissing("androidx.car.app.ACCESS_SURFACE")
            addPermissionIfMissing("androidx.car.app.NAVIGATION_TEMPLATES")
        }
    }
}
