package dev.srwi.gintype.patches.gboard.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Document
import org.w3c.dom.Element

internal val gboardPatchesSettingsPatch = resourcePatch(
    description = "Adds the GinType settings entry to Gboard settings."
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
    )

    finalize {
        applyPatchesSettingsPatch()
    }
}

context(context: ResourcePatchContext)
private fun applyPatchesSettingsPatch() = with(context) {
    document("AndroidManifest.xml").use { manifestDocument ->
        document(GBOARD_SETTINGS_XML_PATHS[0]).use { settingsDocument ->
            document(GBOARD_SETTINGS_XML_PATHS[1]).use { legacySettingsDocument ->
                applyGboardPatchesSettings(
                    manifestDocument = manifestDocument,
                    settingsDocuments = listOf(settingsDocument, legacySettingsDocument),
                )
            }
        }
    }
}

internal fun applyGboardPatchesSettings(
    manifestDocument: Document,
    settingsDocuments: List<Document>,
) {
    require(settingsDocuments.size == GBOARD_SETTINGS_XML_PATHS.size) {
        "Expected both Gboard settings documents"
    }

    val manifest = manifestDocument.documentElement
    val application = manifest.childElements("application").firstOrNull()
        ?: error("Could not find application element in AndroidManifest.xml")
    val packageName = manifest.getAttribute("package")

    val activity = application.childElements("activity").firstOrNull {
        it.getAttributeNS(ANDROID_NS, "name") == GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS ||
            it.getAttribute("android:name") == GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS
    } ?: manifestDocument.createElement("activity").also { createdActivity ->
        application.appendChild(createdActivity)
    }

    activity.setAndroidAttribute("name", GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS)
    if (activity.androidAttribute("exported").isNullOrBlank()) {
        activity.setAndroidAttribute("exported", "false")
    }

    val provider = application.childElements("provider").firstOrNull {
        it.getAttributeNS(ANDROID_NS, "name") == GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS ||
            it.getAttribute("android:name") == GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS
    } ?: manifestDocument.createElement("provider").also { createdProvider ->
        application.appendChild(createdProvider)
    }

    provider.setAndroidAttribute("name", GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS)
    provider.setAndroidAttribute(
        "authorities",
        packageName + GBOARD_PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX,
    )
    provider.setAndroidAttribute("exported", "false")

    settingsDocuments.forEach { document ->
        val root = document.documentElement
        val candidateEntries = root.childElements().flatMap { parent ->
            if (parent.tagName == PREFERENCE_CATEGORY_TAG) {
                parent.childElements()
            } else {
                sequenceOf(parent)
            }
        }.toList()
        val targetCategory = root.childElements(PREFERENCE_CATEGORY_TAG).firstOrNull {
            it.androidAttribute("key") == PATCHES_SETTINGS_CATEGORY_KEY
        } ?: document.createElement(PREFERENCE_CATEGORY_TAG).also { createdCategory ->
            createdCategory.setAndroidAttribute("key", PATCHES_SETTINGS_CATEGORY_KEY)
            root.insertBefore(createdCategory, root.firstChild)
        }
        if (root.childElements().firstOrNull() != targetCategory) {
            root.removeChild(targetCategory)
            root.insertBefore(targetCategory, root.firstChild)
        }
        val rateUsPreference = candidateEntries.firstOrNull {
            it.tagName == RATE_US_PREFERENCE_TAG
        }
        val iconValue = rateUsPreference?.androidAttribute("icon")
        val existingEntry = candidateEntries.firstOrNull {
            it.androidAttribute("key") == PATCHES_SETTINGS_ENTRY_KEY
        }
        val patchesEntry = existingEntry?.takeIf { it.tagName == HEADER_PREFERENCE_TAG }
            ?: document.createElement(HEADER_PREFERENCE_TAG).also { createdPreference ->
                if (existingEntry != null) {
                    existingEntry.parentNode.replaceChild(createdPreference, existingEntry)
                } else {
                    targetCategory.appendChild(createdPreference)
                }
            }

        patchesEntry.setAndroidAttribute("persistent", "false")
        patchesEntry.setAndroidAttribute("title", PATCHES_SETTINGS_ENTRY_TITLE)
        patchesEntry.setAndroidAttribute("selectable", "true")
        patchesEntry.setAndroidAttribute("key", PATCHES_SETTINGS_ENTRY_KEY)
        patchesEntry.removeAndroidAttribute("summary")
        if (!iconValue.isNullOrBlank()) {
            patchesEntry.setAndroidAttribute("icon", iconValue)
        }

        val intent = patchesEntry.childElements("intent").firstOrNull()
            ?: document.createElement("intent").also { createdIntent ->
                patchesEntry.appendChild(createdIntent)
            }
        intent.setAndroidAttribute("action", "android.intent.action.MAIN")
        intent.setAndroidAttribute("targetPackage", packageName)
        intent.setAndroidAttribute("targetClass", GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS)

        if (patchesEntry.parentNode != targetCategory) {
            patchesEntry.parentNode?.removeChild(patchesEntry)
            targetCategory.appendChild(patchesEntry)
        }
    }
}

private fun Element.androidAttribute(localName: String): String? {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotBlank()) {
        return namespaced
    }
    return getAttribute("android:$localName").takeIf { it.isNotBlank() }
}

private fun Element.removeAndroidAttribute(localName: String) {
    removeAttributeNS(ANDROID_NS, localName)
    removeAttribute("android:$localName")
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

internal const val GBOARD_PATCHES_SETTINGS_ACTIVITY_CLASS =
    "dev.srwi.gintype.extension.settings.GboardPatchesSettingsActivity"
internal const val GBOARD_PATCHES_SETTINGS_PROVIDER_CLASS =
    "dev.srwi.gintype.extension.settings.GboardPatchesSettingsProvider"
internal const val GBOARD_PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX = ".gintype"
private const val PATCHES_SETTINGS_CATEGORY_KEY = "gintype_category"
private const val PATCHES_SETTINGS_ENTRY_KEY = "gintype_entry"
private const val PATCHES_SETTINGS_ENTRY_TITLE = "GinType"
private const val PREFERENCE_CATEGORY_TAG = "androidx.preference.PreferenceCategory"
private const val HEADER_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference"
private const val RATE_US_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.rateus.RateUsPreference"
internal val GBOARD_SETTINGS_XML_PATHS = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml",
)
