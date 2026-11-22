/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.h19e8p.patches.settings

import app.h19e8p.patches.shared.setBundleVersion
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal const val SETTINGS_ACTIVITY = "app.morphe.extension.h19e8p.SettingsActivity"
internal const val FLAG_RESULTS_ACTIVITY = "app.morphe.extension.h19e8p.flags.FlagResultsActivity"

/**
 * 設定画面 (自前の Activity) をマニフェストに登録し、X の「設定とプライバシー」の一覧の最後に
 * 開くための項目を足す。X のコードは書き換えないので、piko の設定の項目とは取り合わない。
 *
 * 項目には開く先を明示した intent を付ける。Android 14 以降は、行き先を明示しない intent では
 * 書き出していない (exported でない) 画面を開けないため。
 */
private val settingsResourcePatch =
    resourcePatch {
        execute {
            val packageName = packageMetadata.packageName

            document("AndroidManifest.xml").use { document ->
                val application =
                    document.getElementsByTagName("application").item(0) as? Element
                        ?: throw PatchException("AndroidManifest.xml has no application element")
                // 設定画面と、フラグの道具の結果の画面。
                listOf(SETTINGS_ACTIVITY, FLAG_RESULTS_ACTIVITY).forEach { name ->
                    val activity = document.createElement("activity")
                    activity.setAttribute("android:name", name)
                    activity.setAttribute("android:exported", "false")
                    activity.setAttribute("android:label", "h19e8p Patches")
                    // 設定画面はダークモードの切り替えで作り直して色を合わせる。結果の画面は、作り直すと
                    // 記録の一覧が読み直されて変わり、選択も消えるので、作り直さない。
                    activity.setAttribute(
                        "android:configChanges",
                        if (name == FLAG_RESULTS_ACTIVITY) "orientation|screenSize|uiMode" else "orientation|screenSize",
                    )
                    application.appendChild(activity)
                }
            }

            document("res/xml/settings_root.xml").use { document ->
                val screen =
                    document.getElementsByTagName("PreferenceScreen").item(0) as? Element
                        ?: throw PatchException("settings_root.xml has no PreferenceScreen")
                val preference = document.createElement("Preference")
                preference.setAttribute("android:key", "pref_h19e8p_patches")
                preference.setAttribute("android:title", "h19e8p Patches")
                preference.setAttribute("android:icon", "@drawable/ic_vector_settings_stroke")
                // piko の項目 (110) の後ろに並べる。
                preference.setAttribute("android:order", "111")
                val intent = document.createElement("intent")
                intent.setAttribute("android:targetPackage", packageName)
                intent.setAttribute("android:targetClass", SETTINGS_ACTIVITY)
                preference.appendChild(intent)
                screen.appendChild(preference)
            }
        }
    }

/** 設定画面と共通の部品。設定のある各パッチがこれに依存する。 */
val settingsPatch =
    bytecodePatch {
        dependsOn(settingsResourcePatch)
        extendWith("extensions/h19e8p.mpe")

        execute {
            // 設定画面の「情報」に出す、h19e8p Patches の版。
            setBundleVersion()
        }
    }
