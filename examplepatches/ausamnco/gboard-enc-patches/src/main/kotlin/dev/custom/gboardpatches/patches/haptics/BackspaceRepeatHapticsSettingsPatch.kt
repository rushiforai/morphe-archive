package dev.custom.gboardpatches.patches.haptics

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SETTING_PREFERENCES_XML = "res/xml/setting_preferences.xml"
const val PREF_KEY_BACKSPACE_REPEAT_HAPTIC = "pref_key_backspace_repeat_haptic"

/**
 * Resource patch that injects a dedicated toggle switch into Gboard Settings
 * under Preferences -> Key tap (right after keypress vibration settings).
 */
val backspaceRepeatHapticsSettingsPatch = resourcePatch(
    description = "Adds backspace repeat haptic feedback toggle to Gboard Preferences."
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
            applySettingsPatch(document)
        } finally {
            document.close()
        }
    }
}

internal fun applySettingsPatch(document: Document) {
    val root = document.documentElement ?: return

    // Avoid duplicate insertions if applied more than once
    if (findPreferenceByKey(root, PREF_KEY_BACKSPACE_REPEAT_HAPTIC) != null) {
        return
    }

    // 1. Locate the vibration duration preference or keypress vibration switch
    var vibrationDurationPref: Element? = null
    var vibrationSwitchPref: Element? = null
    var keyTapCategory: Element? = null

    val allElements = getAllElements(root)
    for (el in allElements) {
        val key = el.getAndroidAttr("key")
        if (key.contains("0x7f140b95") || key.contains("vibration_duration")) {
            vibrationDurationPref = el
        }
        if (key.contains("0x7f140a2e") || key.contains("vibrate_on_keypress")) {
            vibrationSwitchPref = el
        }
        if (el.tagName.endsWith("PreferenceCategory")) {
            if (key.contains("0x7f140cf3") || key.contains("key_press") ||
                el.getAndroidAttr("title").contains("Key tap") ||
                el.getAndroidAttr("title").contains("0x7f140cf4")
            ) {
                keyTapCategory = el
            }
        }
    }

    // Determine reference anchor node for insertion
    val anchorNode = vibrationDurationPref ?: vibrationSwitchPref

    // Dependency key (links disable state to master keypress vibration toggle)
    val dependencyKey = vibrationDurationPref?.getAndroidAttr("dependency")
        ?.takeIf { it.isNotEmpty() }
        ?: vibrationSwitchPref?.getAndroidAttr("key")?.takeIf { it.isNotEmpty() }

    // Create the SwitchPreferenceCompat element
    val switchPref = document.createElement("SwitchPreferenceCompat").apply {
        setAttributeNS(ANDROID_NS, "android:persistent", "true")
        setAttributeNS(ANDROID_NS, "android:title", "Backspace repeat haptic feedback")
        setAttributeNS(ANDROID_NS, "android:summary", "Vibrate continuously when holding down backspace to delete text")
        setAttributeNS(ANDROID_NS, "android:key", PREF_KEY_BACKSPACE_REPEAT_HAPTIC)
        setAttributeNS(ANDROID_NS, "android:defaultValue", "true")
        if (!dependencyKey.isNullOrEmpty()) {
            setAttributeNS(ANDROID_NS, "android:dependency", dependencyKey)
        }
    }

    if (anchorNode != null && anchorNode.parentNode != null) {
        val parent = anchorNode.parentNode
        val next = anchorNode.nextSibling
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
