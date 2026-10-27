package io.github.sabopura.morphe.patches.youtube.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
internal const val APP_NS = "http://schemas.android.com/apk/res-auto"

internal fun Document.addStrings(values: Map<String, String>) {
    val existing = (0 until getElementsByTagName("string").length).mapNotNull { index ->
        getElementsByTagName("string").item(index).attributes?.getNamedItem("name")?.nodeValue
    }.toSet()
    values.forEach { (name, value) ->
        if (name !in existing) {
            documentElement.appendChild(createElement("string").apply {
                setAttribute("name", name)
                textContent = value
            })
        }
    }
}

internal fun Document.addStringArray(name: String, values: List<String>) {
    val exists = (0 until getElementsByTagName("string-array").length).any { index ->
        getElementsByTagName("string-array").item(index).attributes
            ?.getNamedItem("name")?.nodeValue == name
    }
    if (exists) return
    documentElement.appendChild(createElement("string-array").apply {
        setAttribute("name", name)
        values.forEach { value ->
            appendChild(createElement("item").apply { textContent = value })
        }
    })
}

/** Registers an exported-by-action settings activity that uses YouTube's settings theme. */
internal fun ResourcePatchContext.registerSettingsActivity(
    activityClass: String,
    action: String,
    labelResource: String,
) {
    document("AndroidManifest.xml").use { manifest ->
        val application = manifest.getElementsByTagName("application").item(0)
        val exists = (0 until manifest.getElementsByTagName("activity").length).any { index ->
            val attributes = manifest.getElementsByTagName("activity").item(index).attributes
            attributes?.getNamedItemNS(ANDROID_NS, "name")?.nodeValue == activityClass ||
                attributes?.getNamedItem("android:name")?.nodeValue == activityClass
        }
        if (exists) return@use
        application.appendChild(manifest.createElement("activity").apply {
            setAttributeNS(ANDROID_NS, "android:name", activityClass)
            setAttributeNS(ANDROID_NS, "android:exported", "true")
            setAttributeNS(ANDROID_NS, "android:label", "@string/$labelResource")
            setAttributeNS(ANDROID_NS, "android:theme", "@style/Theme.YouTube.Settings")
            appendChild(manifest.createElement("intent-filter").apply {
                appendChild(manifest.createElement("action").apply {
                    setAttributeNS(ANDROID_NS, "android:name", action)
                })
                appendChild(manifest.createElement("category").apply {
                    setAttributeNS(ANDROID_NS, "android:name", "android.intent.category.DEFAULT")
                })
            })
        })
    }
}

/** Newer YouTube releases removed the legacy screen but retain the Cairo screen. */
internal fun resolveSettingsScreens(exists: (String) -> Boolean): List<Pair<String, Boolean>> {
    val screens = listOf(
        "res/xml/settings_fragment.xml" to false,
        "res/xml/settings_fragment_cairo.xml" to true,
    ).filter { (path, _) -> exists(path) }
    check(screens.isNotEmpty()) { "No supported YouTube settings screen was found" }
    return screens
}

private fun Document.hasPreferenceKey(key: String): Boolean =
    (0 until getElementsByTagName("*").length).any { index ->
        getElementsByTagName("*").item(index).attributes?.let { attributes ->
            attributes.getNamedItemNS(ANDROID_NS, "key")?.nodeValue == key ||
                attributes.getNamedItem("android:key")?.nodeValue == key
        } == true
    }

private fun Document.findCairoVideoCategory(): Element? =
    (0 until getElementsByTagName("PreferenceCategory").length)
        .map { index -> getElementsByTagName("PreferenceCategory").item(index) }
        .filterIsInstance<Element>()
        .firstOrNull { category ->
            category.getAttributeNS(ANDROID_NS, "key") == "@string/video_preferences_group_key" ||
                category.getAttribute("android:key") == "@string/video_preferences_group_key"
        }

/** Adds a row to every available YouTube settings screen that opens [action]. */
internal fun ResourcePatchContext.addSettingsEntry(
    key: String,
    titleResource: String,
    summaryResource: String,
    action: String,
    cairoIcon: String,
) {
    resolveSettingsScreens { get(it).isFile }.forEach { (path, cairo) ->
        document(path).use { settings ->
            check(settings.documentElement.tagName == "PreferenceScreen") {
                "Unexpected YouTube settings root in $path"
            }
            if (settings.hasPreferenceKey(key)) return@use
            val parent = if (cairo) {
                settings.findCairoVideoCategory() ?: settings.documentElement
            } else {
                settings.documentElement
            }
            parent.appendChild(settings.createElement("Preference").apply {
                setAttributeNS(ANDROID_NS, "android:key", key)
                setAttributeNS(ANDROID_NS, "android:title", "@string/$titleResource")
                setAttributeNS(ANDROID_NS, "android:summary", "@string/$summaryResource")
                setAttributeNS(APP_NS, "app:iconSpaceReserved", cairo.toString())
                if (cairo) {
                    setAttributeNS(ANDROID_NS, "android:icon", "@drawable/$cairoIcon")
                    setAttributeNS(ANDROID_NS, "android:layout", "@layout/preference_with_icon")
                    setAttributeNS(ANDROID_NS, "android:persistent", "false")
                }
                appendChild(settings.createElement("intent").apply {
                    setAttributeNS(ANDROID_NS, "android:action", action)
                })
            })
        }
    }
}

/** Returns the first drawable name that exists in this YouTube build. */
internal fun ResourcePatchContext.firstExistingDrawable(vararg names: String): String =
    names.firstOrNull { name ->
        listOf("res/drawable", "res/drawable-anydpi", "res/drawable-anydpi-v21")
            .any { directory -> get("$directory/$name.xml").isFile }
    } ?: names.last()

private fun settingsLayoutXml(titleResource: String) = """<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:fitsSystemWindows="true"
    android:background="?attr/ytBaseBackground">
    <FrameLayout
        android:id="@id/settings_toolbar_layout"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:background="?attr/ytBaseBackground"
        android:elevation="0dp">
        <android.support.v7.widget.Toolbar
            android:id="@id/toolbar"
            android:layout_width="match_parent"
            android:layout_height="?attr/actionBarSize"
            android:background="?attr/ytBaseBackground"
            app:navigationIcon="@drawable/yt_outline_arrow_left_vd_theme_24"
            app:title="@string/$titleResource" />
    </FrameLayout>
    <FrameLayout
        android:id="@+id/sabopura_settings_content"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />
</LinearLayout>
"""

/** Writes a YouTube-styled settings layout whose toolbar shows [titleResource]. */
internal fun ResourcePatchContext.writeSettingsLayout(layoutName: String, titleResource: String) {
    get("res/layout").resolve("$layoutName.xml").writeText(settingsLayoutXml(titleResource))
}

/** Shared dialog strings for every Sabopura settings screen. */
internal val sharedSettingsResourcePatch = resourcePatch(
    name = null,
    description = "Shared YouTube-styled settings screen resources.",
    default = false,
) {
    compatibleWith(YOUTUBE)

    execute {
        document("res/values/strings.xml").use {
            it.addStrings(
                mapOf(
                    "sabopura_reset_title" to "Reset to defaults",
                    "sabopura_reset_message" to "Restore every setting on this screen to its default.",
                ),
            )
        }
        document("res/values-ja/strings.xml").use {
            it.addStrings(
                mapOf(
                    "sabopura_reset_title" to "初期設定に戻す",
                    "sabopura_reset_message" to "この画面の設定をすべて初期値に戻します。",
                ),
            )
        }
    }
}
