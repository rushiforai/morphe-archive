package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

internal val gboardPatchesSettingsPatch = resourcePatch(
    description = "在 Gboard 設定底部加入 Patches 入口。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardPatchesPreviewAssetsPatch
    )

    finalize {
        applyPatchesSettingsPatch()
    }
}

context(context: ResourcePatchContext)
private fun applyPatchesSettingsPatch() = with(context) {
    val targetPackageName = document("AndroidManifest.xml").use { document ->
        val manifest = document.documentElement
        val application = manifest.childElements("application").firstOrNull()
            ?: error("Could not find application element in AndroidManifest.xml")
        val packageName = manifest.getAttribute("package")

        val activity = application.childElements("activity").firstOrNull {
            it.getAttributeNS(ANDROID_NS, "name") == PATCHES_SETTINGS_ACTIVITY_CLASS ||
                it.getAttribute("android:name") == PATCHES_SETTINGS_ACTIVITY_CLASS
        } ?: document.createElement("activity").also { createdActivity ->
            application.appendChild(createdActivity)
        }

        activity.setAndroidAttribute("name", PATCHES_SETTINGS_ACTIVITY_CLASS)
        if (activity.androidAttribute("exported").isNullOrBlank()) {
            activity.setAndroidAttribute("exported", "false")
        }

        val provider = application.childElements("provider").firstOrNull {
            it.getAttributeNS(ANDROID_NS, "name") == PATCHES_SETTINGS_PROVIDER_CLASS ||
                it.getAttribute("android:name") == PATCHES_SETTINGS_PROVIDER_CLASS
        } ?: document.createElement("provider").also { createdProvider ->
            application.appendChild(createdProvider)
        }

        provider.setAndroidAttribute("name", PATCHES_SETTINGS_PROVIDER_CLASS)
        provider.setAndroidAttribute("authorities", packageName + PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX)
        provider.setAndroidAttribute("exported", "false")
        packageName
    }

    SETTINGS_XML_PATHS.forEach { xmlPath ->
        document(xmlPath).use { document ->
            val root = document.documentElement
            val candidateEntries = root.childElements().flatMap { parent ->
                if (parent.tagName == "androidx.preference.PreferenceCategory") {
                    parent.childElements()
                } else {
                    sequenceOf(parent)
                }
            }.toList()
            val footerPreference = root.childElements().firstOrNull {
                it.tagName == "com.android.settingslib.widget.FooterPreference"
            }
            val targetCategory = root.childElements("androidx.preference.PreferenceCategory").lastOrNull()
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
                    } else if (targetCategory != null) {
                        targetCategory.appendChild(createdPreference)
                    } else if (footerPreference != null) {
                        root.insertBefore(createdPreference, footerPreference)
                    } else {
                        root.appendChild(createdPreference)
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
            intent.setAndroidAttribute("targetPackage", targetPackageName)
            intent.setAndroidAttribute("targetClass", PATCHES_SETTINGS_ACTIVITY_CLASS)

            if (targetCategory != null && patchesEntry.parentNode != targetCategory) {
                patchesEntry.parentNode?.removeChild(patchesEntry)
                targetCategory.appendChild(patchesEntry)
            } else if (targetCategory == null && footerPreference != null &&
                patchesEntry.parentNode != root
            ) {
                patchesEntry.parentNode?.removeChild(patchesEntry)
                root.insertBefore(patchesEntry, footerPreference)
            }
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

private const val PATCHES_SETTINGS_ACTIVITY_CLASS =
    "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity"
private const val PATCHES_SETTINGS_PROVIDER_CLASS =
    "dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsProvider"
private const val PATCHES_SETTINGS_PROVIDER_AUTHORITY_SUFFIX = ".gboard_patches"
private const val PATCHES_SETTINGS_ENTRY_KEY = "gboard_patches_entry"
private const val PATCHES_SETTINGS_ENTRY_TITLE = "Patches"
private const val HEADER_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference"
private const val RATE_US_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.rateus.RateUsPreference"
private val SETTINGS_XML_PATHS = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml"
)

