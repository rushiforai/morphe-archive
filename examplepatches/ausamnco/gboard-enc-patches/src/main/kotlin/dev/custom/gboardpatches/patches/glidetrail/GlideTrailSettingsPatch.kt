package dev.custom.gboardpatches.patches.glidetrail

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SETTING_GESTURE_XML = "res/xml/setting_gesture.xml"

// Master Toggle
const val PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED = "pref_key_glide_trail_custom_enabled"

// Color & Rainbow
const val PREF_KEY_GLIDE_TRAIL_RAINBOW = "pref_key_glide_trail_rainbow"
const val PREF_KEY_GLIDE_TRAIL_COLOR_WHEEL = "pref_key_glide_trail_color_wheel"
const val PREF_KEY_GLIDE_TRAIL_CUSTOM_COLOR = "pref_key_glide_trail_custom_color"

// Sliders (Continuous control)
const val PREF_KEY_GLIDE_TRAIL_SPEED_MS = "pref_key_glide_trail_speed_ms"
const val PREF_KEY_GLIDE_TRAIL_WIDTH_DP = "pref_key_glide_trail_width_dp"
const val PREF_KEY_GLIDE_TRAIL_LENGTH_PTS = "pref_key_glide_trail_length_pts"

/**
 * Resource patch that injects comprehensive glide typing trail customization options
 * into Gboard Settings under Glide typing (res/xml/setting_gesture.xml).
 */
val glideTrailSettingsPatch = resourcePatch(
    description = "Adds glide typing trail customization preferences to Gboard Settings."
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
        val document = document(SETTING_GESTURE_XML)
        try {
            applyGlideTrailSettingsPatch(document)
        } finally {
            document.close()
        }
    }
}

internal fun applyGlideTrailSettingsPatch(document: Document) {
    val root = document.documentElement ?: return

    // Avoid duplicate insertions
    if (findPreferenceByKey(root, PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED) != null) {
        return
    }

    // 1. Locate the master "Glide trail" preference (key contains 0x7f140a54 or pref_gesture_preview_trail)
    var gestureTrailPref: Element? = null
    val allElements = getAllElements(root)
    for (el in allElements) {
        val key = el.getAndroidAttr("key")
        if (key.contains("0x7f140a54") || key.contains("pref_gesture_preview_trail")) {
            gestureTrailPref = el
            break
        }
    }

    // Fallback if key not found: find 2nd child in PreferenceScreen
    val anchorNode = gestureTrailPref ?: root.childNodes.run {
        var count = 0
        var found: Element? = null
        for (i in 0 until length) {
            val item = item(i)
            if (item is Element) {
                count++
                if (count == 2) {
                    found = item
                    break
                }
            }
        }
        found
    }

    val dependencyKey = gestureTrailPref?.getAndroidAttr("key")?.takeIf { it.isNotEmpty() }
        ?: "@string/_0_resource_name_obfuscated_res_0x7f140a54"

    fun createSwitch(
        key: String,
        title: String,
        summary: String,
        defaultValue: String = "false",
        dependency: String? = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
    ): Element {
        return document.createElement("SwitchPreferenceCompat").apply {
            setAttributeNS(ANDROID_NS, "android:persistent", "true")
            setAttributeNS(ANDROID_NS, "android:title", title)
            setAttributeNS(ANDROID_NS, "android:summary", summary)
            setAttributeNS(ANDROID_NS, "android:key", key)
            setAttributeNS(ANDROID_NS, "android:defaultValue", defaultValue)
            if (!dependency.isNullOrEmpty()) {
                setAttributeNS(ANDROID_NS, "android:dependency", dependency)
            }
        }
    }

    fun createPreference(
        key: String,
        title: String,
        summary: String,
        dependency: String? = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
    ): Element {
        return document.createElement("Preference").apply {
            setAttributeNS(ANDROID_NS, "android:persistent", "false")
            setAttributeNS(ANDROID_NS, "android:title", title)
            setAttributeNS(ANDROID_NS, "android:summary", summary)
            setAttributeNS(ANDROID_NS, "android:key", key)
            if (!dependency.isNullOrEmpty()) {
                setAttributeNS(ANDROID_NS, "android:dependency", dependency)
            }
        }
    }

    fun createCategory(title: String, dependency: String? = null): Element {
        return document.createElement("androidx.preference.PreferenceCategory").apply {
            setAttributeNS(ANDROID_NS, "android:title", title)
            if (!dependency.isNullOrEmpty()) {
                setAttributeNS(ANDROID_NS, "android:dependency", dependency)
            }
        }
    }

    // Consolidated Category: Glide Trail Customizations
    val trailCategory = createCategory("Glide Trail Customizations", dependencyKey).apply {
        // 1. Master Toggle
        appendChild(createSwitch(
            key = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED,
            title = "Customize glide trail",
            summary = "Adjust glide typing trail color, speed, width, and length",
            defaultValue = "true",
            dependency = null
        ))

        // 2. Rainbow RGB Switch
        appendChild(createSwitch(
            key = PREF_KEY_GLIDE_TRAIL_RAINBOW,
            title = "Rainbow RGB effect",
            summary = "Continuously cycle vibrant rainbow colors across the spectrum while gliding",
            defaultValue = "false",
            dependency = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
        ))

        // 3. Color Wheel Dialog Preference
        appendChild(createPreference(
            key = PREF_KEY_GLIDE_TRAIL_COLOR_WHEEL,
            title = "Trail color wheel",
            summary = "Tap to choose custom color with color wheel picker",
            dependency = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
        ))

        // 4. Sliders (Duration, Width, Length) via interactive Slider Dialog Preferences
        appendChild(createPreference(
            key = PREF_KEY_GLIDE_TRAIL_SPEED_MS,
            title = "Trail fade duration",
            summary = "Fade time: 200ms (fast) to 4000ms (lingering ribbon)",
            dependency = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
        ))

        appendChild(createPreference(
            key = PREF_KEY_GLIDE_TRAIL_WIDTH_DP,
            title = "Trail width & thickness",
            summary = "Stroke thickness: 2dp (hairline) to 40dp (thick glow)",
            dependency = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
        ))

        appendChild(createPreference(
            key = PREF_KEY_GLIDE_TRAIL_LENGTH_PTS,
            title = "Trail length & tail retention",
            summary = "Tail retention: 5 (compact) to 100 (extended ribbon) points",
            dependency = PREF_KEY_GLIDE_TRAIL_CUSTOM_ENABLED
        ))
    }

    // Insert the entire consolidated category right after anchorNode
    val parent = anchorNode?.parentNode ?: root
    val insertReference = anchorNode?.nextSibling

    if (insertReference == null) {
        parent.appendChild(trailCategory)
    } else {
        parent.insertBefore(trailCategory, insertReference)
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
