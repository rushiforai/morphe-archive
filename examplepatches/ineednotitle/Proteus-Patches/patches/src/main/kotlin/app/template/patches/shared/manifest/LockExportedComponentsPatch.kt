package app.template.patches.shared.manifest

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.forEachManifestElement
import app.template.patches.shared.logUniversal
import org.w3c.dom.Element

// Universal "Lock down exported components" patch.
// Sets android:exported="false" on <activity>/<activity-alias>/<service>/
// <receiver> that have NO <intent-filter> child (deep links, share-in and the
// MAIN/LAUNCHER activity all have filters and are never touched; providers are
// skipped). Fail-safe; default = false. Single-pass component traversal.

private val COMPONENT_TAGS = arrayOf("activity", "activity-alias", "service", "receiver")

@Suppress("unused")
val lockExportedComponentsPatch = resourcePatch(
    name = "Lock down exported components",
    description = """
        Sets android:exported="false" on activities, services and receivers that have no
        intent filter, so other apps cannot start them directly. Deep links, share-in
        targets and the launcher activity (all of them have intent filters) are never
        touched.

        Applies to any app. May break apps that rely on explicitly exported entry points.
    """.trimIndent(),
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as? Element
                ?: return@use

            var patched = 0
            doc.forEachManifestElement(*COMPONENT_TAGS) { component ->
                if (component.parentNode !== application &&
                    component.parentNode?.parentNode !== application
                ) return@forEachManifestElement

                val hasIntentFilter = (0 until component.childNodes.length).any { childIndex ->
                    (component.childNodes.item(childIndex) as? Element)?.tagName == "intent-filter"
                }
                if (hasIntentFilter) return@forEachManifestElement

                if (component.getAttribute("android:exported") == "false") return@forEachManifestElement
                component.setAttribute("android:exported", "false")
                patched++
            }
            logUniversal(
                "Lock exported components: $patched component(s) set to exported=false.",
            )
        }
    }
}
