package dev.jason.gboardpatches.patches.gboard.features.settingshomepage

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

internal val gboardSettingsHomepageFeatureMarkerPatch = resourcePatch(
    description = "標記 settings homepage feature 已被打入 target APK，共用 settings UI 過濾"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applySettingsHomepageFeatureMarker()
    }
}

context(context: ResourcePatchContext)
private fun applySettingsHomepageFeatureMarker() = with(context) {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val application = manifest.childElements("application").firstOrNull()
            ?: error("Could not find application element in AndroidManifest.xml")

        val metaData = application.childElements("meta-data").firstOrNull {
            it.androidAttribute("name") == SETTINGS_HOMEPAGE_FEATURE_MARKER_NAME
        } ?: document.createElement("meta-data").also { createdMetaData ->
            application.appendChild(createdMetaData)
        }

        metaData.setAndroidAttribute("name", SETTINGS_HOMEPAGE_FEATURE_MARKER_NAME)
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

private const val SETTINGS_HOMEPAGE_FEATURE_MARKER_NAME =
    "dev.jason.gboardpatches.feature.settings_homepage"
