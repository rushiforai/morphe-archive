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
private val ABOUT_VERSION_TITLE_REFS = mapOf(
    "@string/APKTOOL_RENAMED_0x7f140b30" to "@string/APKTOOL_RENAMED_0x7f140b3a",
    "@string/string_0x7f140b30" to "@string/string_0x7f140b3a",
)
private const val ABOUT_PREFERENCE_CLASS =
    "com.google.android.libraries.inputmethod.settings.widget.ExtendedPreference"
private const val ABOUT_APP_UPDATES_KEY = "gboard_about_app_updates"
private const val ABOUT_APP_UPDATES_ACTION = "dev.abotmaker.ramblerenhancements.OPEN_SETTINGS"
private const val ABOUT_APP_UPDATES_TARGET_CLASS =
    "dev.abotmaker.ramblerenhancements.RamblerEnhancementsActivity"
private const val ABOUT_APP_UPDATES_SECTION_EXTRA = "section"
private const val ABOUT_APP_UPDATES_SECTION_VALUE = "updates"

internal val gboardAboutPageResourcePatch = resourcePatch(
    description = "在關於頁加入 patch 資訊。"
) {
    finalize {
        applyAboutPagePatch()
    }
}
context(context: ResourcePatchContext)
private fun applyAboutPagePatch() {
    val targetPackage = context.document("AndroidManifest.xml").use { manifestDocument ->
        manifestDocument.documentElement.getAttribute("package").takeIf { it.isNotBlank() }
    }
    val aboutDocument = context.document(ABOUT_XML)
    try {
        applyGboardAboutPagePatch(aboutDocument, targetPackage)
    } finally {
        aboutDocument.close()
    }
}

internal fun applyGboardAboutPagePatch(
    aboutDocument: Document,
    targetPackage: String? = null,
) {
    val screen = aboutDocument.documentElement
    val childElements = screen.childElements()
    val versionCandidates = childElements.filter { child ->
        child.androidAttribute("key") in ABOUT_VERSION_TITLE_REFS
    }.toList()
    check(versionCandidates.size == 1) {
        val observed = childElements.joinToString { child ->
            "${child.tagName}[key=${child.androidAttribute("key")}," +
                "title=${child.androidAttribute("title")}]"
        }
        "Expected exactly one 18.5.4 version preference in $ABOUT_XML, " +
            "found ${versionCandidates.size}; observed=$observed"
    }
    val versionPreference = versionCandidates.single()
    check(
        versionPreference.tagName == ABOUT_PREFERENCE_CLASS &&
            versionPreference.androidAttribute("title") ==
            ABOUT_VERSION_TITLE_REFS.getValue(versionPreference.androidAttribute("key")) &&
            versionPreference.androidAttribute("persistent") == "false" &&
            versionPreference.androidAttribute("focusable") == "false" &&
            versionPreference.androidAttribute("selectable") == "false" &&
            versionPreference.androidAttribute("maxLines") == "100",
    ) {
        "Unexpected 18.5.4 version preference identity or metadata in $ABOUT_XML"
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

    val appUpdatesPreference = ensureAboutSectionPreference(
        document = aboutDocument,
        key = ABOUT_APP_UPDATES_KEY,
        title = "App auto-updates",
        summary = "Auto-check GitHub Releases & install verified updates in-app",
        action = ABOUT_APP_UPDATES_ACTION,
        targetPackage = targetPackage,
        targetClass = ABOUT_APP_UPDATES_TARGET_CLASS,
        extraName = ABOUT_APP_UPDATES_SECTION_EXTRA,
        extraValue = ABOUT_APP_UPDATES_SECTION_VALUE,
    )
    screen.insertAfter(appUpdatesPreference, patchVersionPreference)
}

private fun ensureAboutSectionPreference(
    document: Document,
    key: String,
    title: String,
    summary: String,
    action: String,
    targetPackage: String?,
    targetClass: String,
    extraName: String,
    extraValue: String,
): Element {
    val preference = ensureAboutPreference(
        document = document,
        key = key,
        title = title,
        summary = summary,
        intentUrl = null,
    )
    preference.setAndroidAttribute("selectable", "true")
    preference.setAndroidAttribute("focusable", "true")
    val intent = preference.ensureIntent()
    intent.setAndroidAttribute("action", action)
    if (!targetPackage.isNullOrBlank()) {
        intent.setAndroidAttribute("targetPackage", targetPackage)
    }
    intent.setAndroidAttribute("targetClass", targetClass)
    intent.removeAttributeNS(ANDROID_NS, "data")
    intent.removeAttribute("android:data")
    val existingExtra = intent.childElements("extra").firstOrNull {
        it.androidAttribute("name") == extraName
    }
    val extra = existingExtra ?: document.createElement("extra").also(intent::appendChild)
    extra.setAndroidAttribute("name", extraName)
    extra.setAndroidAttribute("value", extraValue)
    return preference
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
            child.androidAttribute("key") == key
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

private fun Element.androidAttribute(localName: String): String {
    getAttributeNS(ANDROID_NS, localName).takeIf(String::isNotEmpty)?.let { return it }
    getAttribute("android:$localName").takeIf(String::isNotEmpty)?.let { return it }
    for (index in 0 until attributes.length) {
        val attribute = attributes.item(index)
        if (attribute.localName == localName ||
            attribute.nodeName.substringAfterLast(':') == localName
        ) {
            return attribute.nodeValue.orEmpty()
        }
    }
    return ""
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
