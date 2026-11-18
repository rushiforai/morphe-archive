package santodan.patches

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val TFD_VISIBILITY_NAME = "TFD Companion - Remove illegal apps detection"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private val broadActions = setOf("android.intent.action.MAIN", "android.intent.action.VIEW")

/** Restrict package enumeration inputs without changing the native security engine. */
@Suppress("unused")
val firstDescendantVisibilityPatch = resourcePatch(
    name = TFD_VISIBILITY_NAME,
    description = "Removes broad MAIN/VIEW package queries while preserving specific app integrations. " +
        "For Android 11+. Select only one TFD visibility patch. Leaves NGSM and authentication unchanged; other detections may still occur.",
    default = true,
) {
    compatibleWith(FirstDescendantCompatibility.createVisibility())
    finalize {
        document("AndroidManifest.xml").use { restrictFirstDescendantVisibility(it) }
    }
}

internal const val TFD_VISIBILITY_EXPERIMENTAL_NAME =
    "TFD Companion - Remove illegal apps detection (Experimental)"

/** Unrestricted alternative; the same manifest contract must still be present. */
@Suppress("unused")
val firstDescendantVisibilityExperimentalPatch = resourcePatch(
    name = TFD_VISIBILITY_EXPERIMENTAL_NAME,
    description = "Experimental alternative without a version restriction. Select instead of the regular patch. " +
        "Requires the original MAIN/VIEW query layout and Android 11+. Future compatibility is not guaranteed.",
    default = false,
) {
    compatibleWith(FirstDescendantCompatibility.createExperimentalVisibility())
    finalize {
        document("AndroidManifest.xml").use { restrictFirstDescendantVisibility(it, experimental = true) }
    }
}

internal fun restrictFirstDescendantVisibility(document: Document, experimental: Boolean = false) {
    val manifest = document.documentElement
    check(manifest.tagName == "manifest" && manifest.getAttribute("package") == FirstDescendantCompatibility.PACKAGE) {
        "Expected original TFD Companion package identity"
    }
    check(experimental || androidAttribute(manifest, "versionName") in setOf(FirstDescendantCompatibility.VERSION, "1.1.6")) {
        "Expected TFD Companion 1.1.5 or 1.1.6"
    }
    val allPackages = document.getElementsByTagName("uses-permission")
    check((0 until allPackages.length).none {
        androidAttribute(allPackages.item(it) as Element, "name") == "android.permission.QUERY_ALL_PACKAGES"
    }) { "Unexpected QUERY_ALL_PACKAGES permission defeats visibility filtering" }
    val queries = children(manifest).filter { it.tagName == "queries" }.singleOrNull()
        ?: error("Missing/ambiguous TFD package queries")
    val candidates = mutableMapOf<String, Element>()
    for (intent in children(queries).filter { it.tagName == "intent" }) {
        val actions = children(intent).filter { it.tagName == "action" }
        if (actions.size != 1) continue
        val name = androidAttribute(actions.single(), "name")
        if (name !in broadActions || children(intent).size != 1) continue
        check(intent.attributes.length == 0 && actions.single().attributes.length == 1) {
            "Changed TFD broad query layout"
        }
        check(candidates.put(name, intent) == null) { "Ambiguous TFD broad query: $name" }
    }
    check(candidates.keys == broadActions) { "Missing, changed or already-restricted TFD broad queries" }
    // Validate every match before changing the document. No activity intent filters,
    // explicit package queries or narrowed browser/billing/share queries are touched.
    candidates.values.forEach { queries.removeChild(it) }
}

private fun children(parent: Element): List<Element> =
    (0 until parent.childNodes.length).mapNotNull { parent.childNodes.item(it) as? Element }

// Morphe's resource document editor is not namespace-aware; independent XML
// verification is. Accept both representations of the same Android attributes.
private fun androidAttribute(element: Element, name: String): String =
    element.getAttributeNS(ANDROID_NS, name).ifEmpty { element.getAttribute("android:$name") }
