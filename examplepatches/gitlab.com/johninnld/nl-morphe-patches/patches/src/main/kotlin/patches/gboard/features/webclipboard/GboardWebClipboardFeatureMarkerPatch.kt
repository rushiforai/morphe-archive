package patches.gboard.features.webclipboard

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import patches.gboard.shared.ANDROID_NS
import patches.gboard.shared.childElements
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

internal val gboardWebClipboardFeatureMarkerPatch = resourcePatch(
    description = "Mark the Web Clipboard feature as present in the target APK."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyWebClipboardFeatureMarker()
    }
}

context(context: ResourcePatchContext)
private fun applyWebClipboardFeatureMarker() = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val application = manifest.childElements("application").firstOrNull()
            ?: error("Could not find application element in AndroidManifest.xml")

        val metaData = application.childElements("meta-data").firstOrNull {
            it.androidAttribute("name") == WEB_CLIPBOARD_FEATURE_MARKER_NAME
        } ?: document.createElement("meta-data").also { createdMetaData ->
            application.appendChild(createdMetaData)
        }

        metaData.setAndroidAttribute("name", WEB_CLIPBOARD_FEATURE_MARKER_NAME)
        metaData.setAndroidAttribute("value", "true")
    }
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

private const val WEB_CLIPBOARD_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.web_clipboard"
