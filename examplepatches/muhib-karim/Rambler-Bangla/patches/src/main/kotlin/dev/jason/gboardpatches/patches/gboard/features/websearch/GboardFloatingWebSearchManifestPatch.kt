package dev.jason.gboardpatches.patches.gboard.features.websearch

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element

internal val gboardFloatingWebSearchManifestPatch = resourcePatch(
    description = "宣告 Floating Web Search 的瀏覽器與 Custom Tabs package visibility。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val queries = manifest.childElements("queries").firstOrNull()
                ?: document.createElement("queries").also { created ->
                    val application = manifest.childElements("application").firstOrNull()
                    if (application == null) {
                        manifest.appendChild(created)
                    } else {
                        manifest.insertBefore(created, application)
                    }
                }
            ensureServiceQuery(document, queries)
            ensureHttpsViewQuery(document, queries)
        }
    }
}

private fun ensureServiceQuery(document: Document, queries: Element) {
    val intent = queries.childElements("intent").firstOrNull { candidate ->
        candidate.hasAction(CUSTOM_TABS_SERVICE_ACTION)
    } ?: document.createElement("intent").also(queries::appendChild)
    intent.ensureAction(document, CUSTOM_TABS_SERVICE_ACTION)
}

private fun ensureHttpsViewQuery(document: Document, queries: Element) {
    val intent = queries.childElements("intent").firstOrNull { candidate ->
        candidate.hasAction(ACTION_VIEW) &&
            candidate.hasCategory(CATEGORY_BROWSABLE) &&
            candidate.childElements("data").any { data ->
                data.androidAttribute("scheme") == HTTPS_SCHEME
            }
    } ?: document.createElement("intent").also(queries::appendChild)
    intent.ensureAction(document, ACTION_VIEW)
    intent.ensureCategory(document, CATEGORY_BROWSABLE)
    val data = intent.childElements("data").firstOrNull {
        it.androidAttribute("scheme") == HTTPS_SCHEME
    } ?: document.createElement("data").also(intent::appendChild)
    data.setAndroidAttribute("scheme", HTTPS_SCHEME)
}

private fun Element.hasAction(name: String): Boolean =
    childElements("action").any { it.androidAttribute("name") == name }

private fun Element.hasCategory(name: String): Boolean =
    childElements("category").any { it.androidAttribute("name") == name }

private fun Element.ensureAction(document: Document, name: String) {
    val action = childElements("action").firstOrNull {
        it.androidAttribute("name") == name
    } ?: document.createElement("action").also(::appendChild)
    action.setAndroidAttribute("name", name)
}

private fun Element.ensureCategory(document: Document, name: String) {
    val category = childElements("category").firstOrNull {
        it.androidAttribute("name") == name
    } ?: document.createElement("category").also(::appendChild)
    category.setAndroidAttribute("name", name)
}

private fun Element.androidAttribute(localName: String): String? =
    getAttributeNS(ANDROID_NS, localName).takeIf(String::isNotBlank)
        ?: getAttribute("android:$localName").takeIf(String::isNotBlank)

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

private const val CUSTOM_TABS_SERVICE_ACTION =
    "android.support.customtabs.action.CustomTabsService"
private const val ACTION_VIEW = "android.intent.action.VIEW"
private const val CATEGORY_BROWSABLE = "android.intent.category.BROWSABLE"
private const val HTTPS_SCHEME = "https"
