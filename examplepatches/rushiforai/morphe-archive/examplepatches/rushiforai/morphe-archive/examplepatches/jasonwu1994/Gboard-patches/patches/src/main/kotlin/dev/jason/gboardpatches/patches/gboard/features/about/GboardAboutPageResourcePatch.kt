package dev.jason.gboardpatches.patches.gboard.features.about

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.insertAfter
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_AUTHOR
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_AUTHOR_URL
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_REPOSITORY_URL
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCH_VERSION
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ABOUT_XML = "res/xml/setting_about.xml"
private const val ABOUT_VERSION_KEY_REF = "@string/string_0x7f140b7d"
private const val ABOUT_PREFERENCE_CLASS =
    "com.google.android.libraries.inputmethod.settings.widget.ExtendedPreference"

internal val gboardAboutPageResourcePatch = resourcePatch(
    description = "在關於頁加入 patch 資訊。"
) {
    execute {
        applyAboutPagePatch()
    }
}
context(context: ResourcePatchContext)
private fun applyAboutPagePatch() {
    val aboutDocument = context.document(ABOUT_XML)
    try {
        val screen = aboutDocument.documentElement
        val childElements = screen.childElements()
        var versionPreference: Element? = null
        for (child in childElements) {
            if (child.getAttributeNS(ANDROID_NS, "key") == ABOUT_VERSION_KEY_REF ||
                child.getAttribute("android:key") == ABOUT_VERSION_KEY_REF
            ) {
                versionPreference = child
                break
            }
        }
        if (versionPreference == null) {
            versionPreference = childElements.lastOrNull()
        }
        if (versionPreference == null) {
            error("Could not find any preference node in $ABOUT_XML")
        }

        val authorPreference = ensureAboutPreference(
            document = aboutDocument,
            key = "gboard_about_author",
            title = "Author",
            summary = GBOARD_PATCH_AUTHOR,
            intentUrl = GBOARD_PATCH_AUTHOR_URL
        )
        screen.insertAfter(authorPreference, versionPreference)

        val patchVersionPreference = ensureAboutPreference(
            document = aboutDocument,
            key = "gboard_about_patch_version",
            title = "Patch Version",
            summary = GBOARD_PATCH_VERSION,
            intentUrl = GBOARD_PATCH_REPOSITORY_URL
        )
        screen.insertAfter(patchVersionPreference, authorPreference)
    } finally {
        aboutDocument.close()
    }
}

private fun ensureAboutPreference(
    document: Document,
    key: String,
    title: String,
    summary: String,
    intentUrl: String? = null
): Element {
    val screen = document.documentElement
    var preference: Element? = null
    for (child in screen.childElements()) {
        if (child.tagName == ABOUT_PREFERENCE_CLASS &&
            (
                child.getAttributeNS(ANDROID_NS, "key") == key ||
                    child.getAttribute("android:key") == key
            )
        ) {
            preference = child
            break
        }
    }
    if (preference == null) {
        preference = document.createElement(ABOUT_PREFERENCE_CLASS)
    }

    preference.setAndroidAttribute("persistent", "false")
    preference.setAndroidAttribute("focusable", "false")
    preference.setAndroidAttribute("maxLines", "100")
    preference.setAndroidAttribute("title", title)
    preference.setAndroidAttribute("selectable", if (intentUrl != null) "true" else "false")
    preference.setAndroidAttribute("key", key)
    preference.setAndroidAttribute("summary", summary)
    if (intentUrl != null) {
        val intent = preference.ensureIntent()
        intent.setAndroidAttribute("action", "android.intent.action.VIEW")
        intent.setAndroidAttribute("data", intentUrl)
    }
    return preference
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}

private fun Element.ensureIntent(): Element {
    val existingIntent = childElements("intent").firstOrNull()
    if (existingIntent != null) {
        return existingIntent
    }

    val intent = ownerDocument.createElement("intent")
    appendChild(intent)
    return intent
}
