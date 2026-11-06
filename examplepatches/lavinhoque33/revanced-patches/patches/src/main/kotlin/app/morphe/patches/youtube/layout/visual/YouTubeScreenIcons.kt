/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-30
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

package app.morphe.patches.youtube.layout.visual

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.layout.branding.installYouTubeRvxSettingsIconLayout
import app.morphe.patches.youtube.player.icons.originalAppPlayerIconName
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.*
import app.morphe.util.Utils.printInfo
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val RVX_PREFERENCES = "res/xml/revanced_prefs.xml"
private const val ICON_ROW = "@layout/revanced_preference_stock_icon"
private const val RESERVED_ROW = "@layout/revanced_preference_reserved_icon"
private const val PLAIN_ROW = "@layout/revanced_preference_no_icon"

internal lateinit var applyYouTubeRuntimeIconPolicy: () -> Unit

/** Capture the extension context without changing any bytecode for the existing styles. */
internal val youtubeScreenIconsBytecodePatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        applyYouTubeRuntimeIconPolicy = {
            val searchController = mutableClassDefBy {
                it.type == "Lapp/morphe/extension/shared/settings/search/BaseSearchViewController;"
            }
            searchController.methods.first { it.name == "addNoResultsItem" }.apply {
                removeInstruction(indexOfFirstInstructionOrThrow {
                    getReference<MethodReference>()?.name == "setIcon"
                })
            }

            // The YouTube style owns the native RVX entry; runtime branding must not replace the wand.
            mutableClassDefBy {
                it.type == "Lapp/morphe/extension/youtube/patches/general/FixPreferenceIconPatch;"
            }.methods.first { it.name == "getRvxSettingsIconResourceIdentifier" }.returnEarly(0)
        }
    }
}

private fun Element.preferenceKey() = getAttribute("android:key").removePrefix("@string/")

/** Categories belong to their enclosing screen; nested screens are rows, not inline groups. */
private fun screenRows(screen: Element): List<Element> = buildList {
    fun collect(group: Element) {
        group.childNodes.asSequence().filterIsInstance<Element>().forEach { child ->
            if (child.tagName.endsWith("PreferenceCategory") ||
                child.tagName.endsWith("PreferenceCategoryCompat")
            ) {
                collect(child)
            } else {
                add(child)
            }
        }
    }

    collect(screen)
}

/** Apply after all feature patches have populated the preference tree. */
internal fun ResourcePatchContext.applyYouTubeScreenIcons(resourceMap: Map<String, String>) {
    val iconKeys = linkedSetOf<String>()
    document(RVX_PREFERENCES).use { document ->
        document.doRecursively { node ->
            if (node is Element && node.tagName.endsWith("PreferenceScreen") &&
                node.preferenceKey().isNotEmpty()
            ) {
                iconKeys.add(node.preferenceKey())
            }
        }
    }

    // Native main Settings entries retain their existing icons, including the legacy-menu runtime fix.
    iconKeys.addAll(youtubeStockIcons.keys.filter { it.endsWith("_key") })
    copyPreferenceIconsWithStockGlyphs("youtube/visual/icons", resourceMap, youtubeStockIcons, iconKeys) {
        originalAppPlayerIconName(it)
    }

    installScreenRowLayouts()
    setRvxScreenIcons()
    setNativeScreenIcons(iconKeys)
}

private fun ResourcePatchContext.installScreenRowLayouts() {
    val iconLayout = get("res/layout/revanced_preference_stock_icon.xml")
    iconLayout.copyTo(get("res/layout/revanced_preference_reserved_icon.xml"), overwrite = true)
    document("res/layout/revanced_preference_reserved_icon.xml").use { document ->
        document.doRecursively { node ->
            if (node is Element && node.getAttribute("android:id") == "@android:id/icon_frame") {
                // Framework Preference hides icon_frame for iconless rows. Keep this empty frame visible instead.
                node.removeAttribute("android:id")
            }
        }
    }

    get("res/layout/preference_material.xml").copyTo(
        get("res/layout/revanced_preference_no_icon.xml"), overwrite = true,
    )
    document("res/layout/revanced_preference_no_icon.xml").use { document ->
        document.getElementsByTagName("include").asSequence().filterIsInstance<Element>()
            .filter { it.getAttribute("layout") == "@layout/image_frame" }.toList().forEach {
                it.parentNode.removeChild(it)
            }
    }
}

private fun ResourcePatchContext.setRvxScreenIcons() {
    document(RVX_PREFERENCES).use { document ->
        document.doRecursively { node ->
            if (node !is Element || !node.tagName.endsWith("PreferenceScreen")) return@doRecursively

            val rows = screenRows(node)
            val iconCount = rows.count { it.tagName.endsWith("PreferenceScreen") }
            val hasIcons = iconCount != 0
            printInfo("YouTube icon rows: ${node.preferenceKey().ifEmpty { "RVX root" }} = $iconCount")

            rows.forEach { row ->
                row.removeAttribute("android:icon")
                if (row.tagName.endsWith("PreferenceScreen")) {
                    val key = row.preferenceKey()
                    check(get("res/drawable/${key}_icon.xml").exists()) { "Missing screen icon for $key" }
                    row.setAttribute("android:icon", "@drawable/${key}_icon")
                    row.setAttribute("android:layout", ICON_ROW)
                } else {
                    row.setAttribute("android:layout", if (hasIcons) RESERVED_ROW else PLAIN_ROW)
                }
            }
        }
    }
    // No sb_enabled_icon is generated: SponsorBlock's existing runtime decorator returns before adding leaf icons.
}

private fun ResourcePatchContext.setNativeScreenIcons(iconKeys: Set<String>) {
    val hasMagicWand = copyStockPreferenceIcon("magic_wand", "res/drawable/revanced_settings_key_icon.xml") {
        originalAppPlayerIconName(it)
    }
    installYouTubeRvxSettingsIconLayout(STOCK_PREFERENCE_ICON_SIZE_DP)

    // The shared installer shrinks branding groups; these glyphs already have their final stock geometry.
    get("res/drawable/revanced_settings_key_icon.xml").copyTo(
        get("res/drawable/revanced_settings_cairo_key_icon.xml"), overwrite = true,
    )

    printInfo("YouTube RVX entry icon: ${if (hasMagicWand) "magic wand" else "selected RVX fallback"}.")

    arrayOf("settings_fragment.xml", "settings_fragment_cairo.xml", "settings_fragment_legacy.xml").forEach { file ->
        val path = "res/xml/$file"
        if (!get(path).exists()) return@forEach

        document(path).use { document ->
            document.doRecursively { node ->
                if (node !is Element || node.tagName.endsWith("PreferenceCategory")) return@doRecursively

                val key = node.preferenceKey()
                if (key == "revanced_settings_key") {
                    if (file == "settings_fragment_cairo.xml") {
                        node.removeAttribute("android:icon")
                        node.removeAttribute("android:iconTint")
                        node.removeAttribute("app:iconTint")
                        node.setAttribute("android:layout", "@layout/revanced_preference_with_icon")
                        node.setAttribute("app:iconSpaceReserved", "true")
                    } else {
                        node.setAttribute("android:icon", "@drawable/revanced_settings_key_icon")
                    }
                } else if (key in iconKeys && file != "settings_fragment_cairo.xml") {
                    check(get("res/drawable/${key}_icon.xml").exists()) { "Missing native screen icon for $key" }
                    node.setAttribute("android:icon", "@drawable/${key}_icon")
                }
            }
        }
    }
}
