package app.threadripper.patches.youtube.settings

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Adds a "Thread Ripper" screen to the Morphe settings menu of the official Morphe Patches.
 *
 * Morphe's settings patch copies its preference XML files in execute and adds its preferences in
 * finalize. Every execute runs before any finalize, so the files exist when this finalize runs,
 * whatever the order of the two finalize blocks; both only append to the root screen. Morphe's
 * settings screen ignores preferences without a Morphe Setting, and Android stores their values in
 * the same shared preferences ("morphe_prefs"), where the extension's Config reads them.
 * Without the official settings patch the files do not exist and nothing is added; the debug.tr.*
 * properties and defaults still apply.
 *
 * The entry follows the official top-level screens: title only, and in the icon styles an icon
 * (Material "speed", same format as Morphe's icons) with Morphe's icon layout. The root screen is
 * sorted by key, so "tr_settings" comes after every "morphe_settings_screen_*" entry. The texts are
 * Traditional Chinese for the maintainer, not string resources.
 */
internal val settingsResourcePatch = resourcePatch {
    execute {
        // Morphe's style has a regular and a bold icon; this icon has no separate bold form.
        listOf("tr_settings", "tr_settings_bold").forEach { name ->
            get("res/drawable/$name.xml").writeText(SPEED_ICON)
        }
    }

    finalize {
        mapOf(
            "morphe_prefs" to null,
            "morphe_prefs_icons" to "tr_settings",
            "morphe_prefs_icons_bold" to "tr_settings_bold",
        ).forEach { (name, icon) ->
            val path = "res/xml/$name.xml"
            if (!get(path, copy = false).exists()) return@forEach
            document(path).use { document ->
                val root = document.getElementsByTagName("PreferenceScreen").item(0) as Element
                root.appendChild(document.threadRipperScreen(icon))
            }
        }
    }
}

private const val SPEED_ICON = """<?xml version="1.0" encoding="utf-8"?>
<!-- Material Icons "speed", Copyright 2022 Google, Apache License 2.0 -->
<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="?android:attr/textColorPrimary" android:pathData="M20.38,8.57l-1.23,1.85a8,8 0,0 1,-0.22 7.58H5.07A8,8 0,0 1,15.58 6.85l1.85,-1.23A10,10 0,0 0,3.35 19a2,2 0,0 0,1.72 1h13.85a2,2 0,0 0,1.74 -1,10 10,0 0,0 -0.27,-10.44zM10.59,15.41a2,2 0,0 0,2.83 0l5.66,-8.49 -8.49,5.66a2,2 0,0 0,0 2.83z"/>
</vector>
"""

private fun Document.threadRipperScreen(icon: String?) = element(
    "PreferenceScreen",
    "key" to "tr_settings",
    "title" to "Thread Ripper",
).apply {
    if (icon != null) {
        setAttribute("android:icon", "@drawable/$icon")
        setAttribute("android:layout", "@layout/preference_with_icon")
        setAttribute("app:iconSpaceReserved", "true")
    }
    appendChild(
        element("PreferenceCategory", "key" to "tr_preload_category", "title" to "預載緩衝").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_preload_enabled",
                    "defaultValue" to "true",
                    "title" to "預載緩衝",
                    "summaryOn" to "播放器會持續下載，直到緩衝達到下方的目標",
                    "summaryOff" to "使用 App 原本的緩衝上限",
                ),
            )
            appendChild(
                number(
                    "tr_preload_seconds", "900", "tr_preload_enabled",
                    "預載目標（影片秒數）",
                    "預設 900。持續下載到緩衝這麼多秒的影片，或碰到記憶體上限為止。",
                ),
            )
            appendChild(
                number(
                    "tr_preload_mib", "250", "tr_preload_enabled",
                    "預載記憶體上限（MiB）",
                    "預設 250，範圍 16–300。App 共有 512 MiB 記憶體，本身會用掉 100–170 MiB。",
                ),
            )
        },
    )
    appendChild(
        element("PreferenceCategory", "key" to "tr_download_category", "title" to "多線下載").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_download_enabled",
                    "defaultValue" to "true",
                    "title" to "多線下載",
                    "summaryOn" to "1 MiB 以上的影片片段用多條連線同時下載",
                    "summaryOff" to "每個片段由 App 用單一連線下載",
                ),
            )
            appendChild(
                number(
                    "tr_download_threads", "8", "tr_download_enabled",
                    "每個片段的連線數", "預設 8，範圍 1–32。",
                ),
            )
        },
    )
    appendChild(
        element("PreferenceCategory", "key" to "tr_rebuffer_category", "title" to "卡住後恢復").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_rebuffer_enabled",
                    "defaultValue" to "false",
                    "title" to "卡住後提早恢復播放",
                    "summaryOn" to "緩衝到下方的量就恢復播放，但可能比較快又卡住",
                    "summaryOff" to "卡住後 App 會等緩衝到 5 秒影片才恢復",
                ),
            )
            appendChild(
                number(
                    "tr_rebuffer_ms", "1600", "tr_rebuffer_enabled",
                    "恢復門檻（影片毫秒數）",
                    "預設 1600，也就是 App 首次開播的門檻。範圍 0–5000。",
                ),
            )
        },
    )
    appendChild(
        element("PreferenceCategory", "key" to "tr_warp_category", "title" to "Cloudflare WARP").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_warp_enabled",
                    "defaultValue" to "false",
                    "title" to "開 YouTube 時走 WARP",
                    "summaryOn" to "YouTube 在前景時只有 YouTube 走 WARP，退到背景時改回原本的網路。第一次會詢問 VPN 權限",
                    "summaryOff" to "YouTube 一律走原本的網路",
                ),
            )
        },
    )
}

private fun Document.number(key: String, default: String, dependency: String, title: String, summary: String) = element(
    "EditTextPreference",
    "key" to key,
    "defaultValue" to default,
    "dependency" to dependency,
    "inputType" to "number",
    "title" to title,
    "summary" to summary,
)

private fun Document.element(tag: String, vararg attributes: Pair<String, String>): Element =
    createElement(tag).apply { attributes.forEach { (name, value) -> setAttribute("android:$name", value) } }
