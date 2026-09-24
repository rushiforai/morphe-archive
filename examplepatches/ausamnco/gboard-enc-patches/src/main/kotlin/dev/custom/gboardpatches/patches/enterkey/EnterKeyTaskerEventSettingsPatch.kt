package dev.custom.gboardpatches.patches.enterkey

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SETTING_PREFERENCES_XML = "res/xml/setting_preferences.xml"
const val PREF_KEY_SEND_ENTER_TASKER_EVENT = "pref_key_send_enter_tasker_event"

/**
 * Resource patch that injects a dedicated toggle switch into Gboard Settings
 * under Preferences -> Key tap for enabling/disabling the Tasker Enter key event.
 */
val enterKeyTaskerEventSettingsPatch = resourcePatch(
    description = "Adds Enter key Tasker event toggle to Gboard Preferences."
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.0.3.954559732-release-arm64-v8a"),
                AppTarget(version = "18.0.3"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )

    execute {
        val document = document(SETTING_PREFERENCES_XML)
        try {
            applyEnterKeySettingsPatch(document)
        } finally {
            document.close()
        }
    }
}

internal fun applyEnterKeySettingsPatch(document: Document) {
    val root = document.documentElement ?: return

    // Avoid duplicate insertions if applied more than once
    if (findPreferenceByKey(root, PREF_KEY_SEND_ENTER_TASKER_EVENT) != null) {
        return
    }

    // Locate the "Key tap" category or last element in that category
    var keyTapCategory: Element? = null
    var lastPrefInKeyTap: Element? = null

    val allElements = getAllElements(root)
    for (el in allElements) {
        val key = el.getAndroidAttr("key")
        if (el.tagName.endsWith("PreferenceCategory")) {
            if (key.contains("0x7f140cf3") || key.contains("key_press") ||
                el.getAndroidAttr("title").contains("Key tap") ||
                el.getAndroidAttr("title").contains("0x7f140cf4")
            ) {
                keyTapCategory = el
            }
        }
        if (key.contains("0x7f140a76") || key.contains("long_press_delay")) {
            lastPrefInKeyTap = el
        }
    }

    // Create the SwitchPreferenceCompat element
    val switchPref = document.createElement("SwitchPreferenceCompat").apply {
        setAttributeNS(ANDROID_NS, "android:persistent", "true")
        setAttributeNS(ANDROID_NS, "android:title", "Send Enter key to Tasker")
        setAttributeNS(ANDROID_NS, "android:summary", "Broadcasts an Intent event to Tasker when Enter or IME action key is pressed")
        setAttributeNS(ANDROID_NS, "android:key", PREF_KEY_SEND_ENTER_TASKER_EVENT)
        setAttributeNS(ANDROID_NS, "android:defaultValue", "true")
    }

    if (lastPrefInKeyTap != null && lastPrefInKeyTap.parentNode != null) {
        val parent = lastPrefInKeyTap.parentNode
        val next = lastPrefInKeyTap.nextSibling
        if (next == null) {
            parent.appendChild(switchPref)
        } else {
            parent.insertBefore(switchPref, next)
        }
    } else if (keyTapCategory != null) {
        keyTapCategory.appendChild(switchPref)
    } else {
        root.appendChild(switchPref)
    }
}

private fun getAllElements(root: Element): List<Element> {
    val list = mutableListOf<Element>()
    fun traverse(node: Element) {
        list.add(node)
        val children = node.childNodes
        for (i in 0 until children.length) {
            val child = children.item(i)
            if (child is Element) {
                traverse(child)
            }
        }
    }
    traverse(root)
    return list
}

private fun findPreferenceByKey(root: Element, targetKey: String): Element? {
    return getAllElements(root).firstOrNull { it.getAndroidAttr("key") == targetKey }
}

private fun Element.getAndroidAttr(localName: String): String {
    val nsVal = getAttributeNS(ANDROID_NS, localName)
    if (nsVal.isNotEmpty()) return nsVal
    val direct = getAttribute("android:$localName")
    if (direct.isNotEmpty()) return direct
    for (i in 0 until attributes.length) {
        val attr = attributes.item(i)
        if (attr.localName == localName || attr.nodeName.substringAfterLast(':') == localName) {
            return attr.nodeValue ?: ""
        }
    }
    return ""
}
