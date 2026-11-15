/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.theme

import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.splitwise.patches.shared.Constants.COMPATIBILITY_SPLITWISE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/** Splitwise's dark grey (#202224): background, surface, bottom sheets and bars of its night theme. */
private const val DARK_GREY = "@color/palette_gray_10"
private const val BLACK = "@color/palette_black"

/** Theme overlay the AMOLED switch applies to every screen (see LokiSwitches.installAmoled). */
private const val OVERLAY = "LokiAmoledBlack"

private const val SWITCHES = "Lapp/loki/extension/LokiSwitches;"

/** The app's root night theme: only its items go into the overlay (side styles reuse the grey for icons). */
private const val ROOT_THEME = "Base.V24.Theme.Splitwise"

/**
 * Splitwise's dark mode is one theme, Base.V24.Theme.Splitwise (night), and its siblings: every background,
 * surface, bottom sheet and the system bars resolve to palette_gray_10. Compose screens read the same theme
 * attributes, so a theme overlay that sets those attributes to palette_black turns old and Compose screens black.
 *
 * The overlay is added beside the app's theme instead of rewriting it, so the Loki menu's switch can apply it or
 * not at runtime. It has a night copy with the black items and an empty default copy: in light mode it resolves
 * to nothing. Cards (gray_20/30) are not touched and stay a shade lighter than the black.
 */
private val amoledOverlay = resourcePatch {
    execute {
        val nightDirectories = get("res").listFiles { file -> file.isDirectory && file.name.startsWith("values-night") }
            ?: emptyArray()
        var nightStyles: String? = null
        val attributes = linkedSetOf<String>()
        for (directory in nightDirectories) {
            if (!directory.resolve("styles.xml").exists()) continue
            val path = "res/${directory.name}/styles.xml"
            document(path).use { document ->
                val styles = document.getElementsByTagName("style")
                for (s in 0 until styles.length) {
                    val style = styles.item(s) as? Element ?: continue
                    // Side styles (toolbars, expense themes) use the same grey as an icon tint; copying those
                    // into a theme-wide overlay would paint icons black on black.
                    if (style.getAttribute("name") != ROOT_THEME) continue
                    val items = style.getElementsByTagName("item")
                    for (index in 0 until items.length) {
                        val item = items.item(index) as? Element ?: continue
                        if (item.textContent.trim() == DARK_GREY) attributes += item.getAttribute("name")
                    }
                }
            }
            if (attributes.isNotEmpty() && nightStyles == null) nightStyles = path
        }
        val nightFile = nightStyles
        if (nightFile == null || attributes.isEmpty()) {
            throw PatchException("Splitwise's night theme was not found - unsupported version")
        }

        // Night copy: every attribute the night theme paints dark grey, painted black.
        document(nightFile).use { document ->
            val style = document.createElement("style").apply { setAttribute("name", OVERLAY) }
            for (attribute in attributes) {
                style.appendChild(document.createElement("item").apply {
                    setAttribute("name", attribute)
                    textContent = BLACK
                })
            }
            document.documentElement.appendChild(style)
        }
        // Default copy, empty: the overlay must exist in every configuration, and changes nothing in light mode.
        document("res/values/styles.xml").use { document ->
            document.documentElement.appendChild(document.createElement("style").apply { setAttribute("name", OVERLAY) })
        }
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.amoled") }
    }
}

@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = "AMOLED black (Splitwise)",
    description = "Real black instead of dark grey in Splitwise's dark mode: backgrounds, screens, bottom sheets, " +
        "the status and navigation bars and the group charts. Cards stay a shade lighter so they stand out. " +
        "AMOLED screens switch black pixels off, which saves battery. Light mode is unchanged. Can be switched " +
        "off in Loki Patches > Appearance.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPLITWISE)
    dependsOn(menuPatch, amoledOverlay)

    execute {
        // The group totals charts are drawn by a chart library that takes its background as a colour string,
        // so they do not follow the theme: GroupTotalsViewModel$ChartDataSelection passes "#202224" in dark mode.
        // Ask the switch instead.
        val chartModel = "Lcom/Splitwise/SplitwiseMobile/features/relationship/group/GroupTotalsViewModel"
        val chartClasses = mutableListOf<ClassDef>()
        classDefForEach { if (it.type.startsWith(chartModel)) chartClasses += it }
        var replaced = 0
        chartClasses.forEach { chartClass -> mutableClassDefBy(chartClass).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.reversed().forEach { index ->
                val instruction = code[index]
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                    return@forEach
                }
                val text = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (!text.equals("#202224", ignoreCase = true)) return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "invoke-static {}, $SWITCHES->chartBackground()Ljava/lang/String;")
                method.addInstruction(index + 1, "move-result-object v$register")
                replaced++
            }
        } }
        if (replaced == 0) throw PatchException("Splitwise's chart colours were not found - unsupported version")
    }
}
