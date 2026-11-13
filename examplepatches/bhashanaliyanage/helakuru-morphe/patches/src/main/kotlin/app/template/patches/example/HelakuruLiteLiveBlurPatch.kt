package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import org.w3c.dom.Element

private const val LITE_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteLiveBlurExtension;"
private const val LITE_SETTINGS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteSettingsExtension;"
private const val LITE_GLASS_PRESS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteGlassPressExtension;"
private const val LITE_SETTINGS_KEY = "morphe_live_keyboard_blur_lite"
private const val PAUSE_WHILE_TYPING_KEY = "morphe_frosted_pause_blur_while_typing"

private val helakuruLiteFrostedGlassPreferencesPatch = resourcePatch {
    execute {
        document("res/xml/ime_preferences.xml").use { preferences ->
            val androidNamespace = "http://schemas.android.com/apk/res/android"
            val categories = preferences.getElementsByTagName("PreferenceCategory")
            val generalSettings = (0 until categories.length)
                .map { categories.item(it) as Element }
                .first { it.getAttributeNS(androidNamespace, "key") == "pref1" }

            val page = preferences.createElement("PreferenceScreen") as Element
            page.setAttributeNS(androidNamespace, "android:key", "morphe_frosted_glass_page")
            page.setAttributeNS(androidNamespace, "android:title", "Frosted Glass")
            page.setAttributeNS(
                androidNamespace,
                "android:summary",
                "Blur, transparency, and keyboard color"
            )

            val enabled = preferences.createElement("SwitchPreference") as Element
            enabled.setAttributeNS(androidNamespace, "android:key", LITE_SETTINGS_KEY)
            enabled.setAttributeNS(androidNamespace, "android:title", "Enable Frosted Glass")
            enabled.setAttributeNS(
                androidNamespace,
                "android:summary",
                "Blur and tint the keyboard background"
            )
            enabled.setAttributeNS(androidNamespace, "android:defaultValue", "false")
            page.appendChild(enabled)

            val pauseWhileTyping = preferences.createElement("SwitchPreference") as Element
            pauseWhileTyping.setAttributeNS(androidNamespace, "android:key", PAUSE_WHILE_TYPING_KEY)
            pauseWhileTyping.setAttributeNS(androidNamespace, "android:title", "Pause blur while typing")
            pauseWhileTyping.setAttributeNS(
                androidNamespace,
                "android:summary",
                "Make the keyboard opaque while typing; restore blur after the selected delay"
            )
            pauseWhileTyping.setAttributeNS(androidNamespace, "android:defaultValue", "false")
            page.appendChild(pauseWhileTyping)

            addPreference(
                preferences,
                page,
                androidNamespace,
                "morphe_frosted_resume_blur_delay",
                "Resume blur delay",
                "200 ms"
            )

            addPreference(preferences, page, androidNamespace, "morphe_frosted_blur_strength", "Blur strength", "32 dp")
            addPreference(preferences, page, androidNamespace, "morphe_frosted_blur_mode", "Blur method", "Background blur")
            addPreference(preferences, page, androidNamespace, "morphe_frosted_transparency_mode", "Background transparency", "Follow Helakuru theme")
            addPreference(preferences, page, androidNamespace, "morphe_frosted_transparency_amount", "Custom transparency", "50%")
            addPreference(preferences, page, androidNamespace, "morphe_frosted_color_theme", "Color theme", "Monet")

            addPreference(preferences, page, androidNamespace, "morphe_frosted_accent", "Accent color", "Accent 1 / 900")

            generalSettings.appendChild(page)
        }
    }
}

private val helakuruLiteKeyBackgroundSizeResourcePatch = resourcePatch {
    execute {
        document("res/layout/fragment_customize_theme.xml").use { layout ->
            val androidNamespace = "http://schemas.android.com/apk/res/android"
            val root = layout.documentElement
            val settingsRow = (0 until root.childNodes.length)
                .mapNotNull { root.childNodes.item(it) as? Element }
                .first { it.tagName == "LinearLayout" }

            settingsRow.setAttributeNS(androidNamespace, "android:id", "@+id/morphe_key_controls_row")
            settingsRow.setAttributeNS(androidNamespace, "android:layout_width", "match_parent")
            settingsRow.setAttributeNS(androidNamespace, "android:layout_height", "wrap_content")
            settingsRow.setAttributeNS(androidNamespace, "android:minHeight", "56dp")
            settingsRow.setAttributeNS(androidNamespace, "android:layout_margin", "0dp")
            settingsRow.setAttributeNS(androidNamespace, "android:paddingStart", "16dp")
            settingsRow.setAttributeNS(androidNamespace, "android:paddingEnd", "16dp")
            settingsRow.setAttributeNS(androidNamespace, "android:background", "?android:attr/selectableItemBackground")
            settingsRow.removeAttributeNS(androidNamespace, "layout_below")
            settingsRow.removeAttributeNS(androidNamespace, "layout_centerHorizontal")
            settingsRow.setAttributeNS(androidNamespace, "android:layout_alignParentTop", "true")
            val stockControls = (0 until settingsRow.childNodes.length)
                .mapNotNull { settingsRow.childNodes.item(it) as? Element }
            check(stockControls.size == 4) { "Unexpected Lite key border controls" }
            // Lite's fragment still references the first two preview labels.
            stockControls.take(2).forEach {
                it.setAttributeNS(androidNamespace, "android:visibility", "gone")
            }
            stockControls[2].apply {
                setAttributeNS(androidNamespace, "android:layout_width", "0dp")
                setAttributeNS(androidNamespace, "android:layout_weight", "1")
                setAttributeNS(androidNamespace, "android:layout_marginLeft", "0dp")
                setAttributeNS(androidNamespace, "android:layout_marginStart", "0dp")
                setAttributeNS(androidNamespace, "android:textSize", "16sp")
            }
            stockControls[3].setAttributeNS(androidNamespace, "android:minHeight", "48dp")
            // Retain stock views for Lite's fragment fields, but remove their rendering and space.
            for (child in (0 until root.childNodes.length).mapNotNull { root.childNodes.item(it) as? Element }) {
                val id = child.getAttributeNS(androidNamespace, "id").substringAfterLast("/")
                if (id in setOf("preview", "preview_border", "preview_keys", "candidate_container")) {
                    child.setAttributeNS(androidNamespace, "android:visibility", "gone")
                    child.setAttributeNS(androidNamespace, "android:layout_height", "0dp")
                }
            }

            fun settingRow(rowId: String, valueId: String, below: String, title: String, value: String) {
                val row = layout.createElement("LinearLayout") as Element
                row.setAttributeNS(androidNamespace, "android:id", "@+id/$rowId")
                row.setAttributeNS(androidNamespace, "android:layout_width", "match_parent")
                row.setAttributeNS(androidNamespace, "android:layout_height", "wrap_content")
                row.setAttributeNS(androidNamespace, "android:minHeight", "56dp")
                row.setAttributeNS(androidNamespace, "android:layout_below", "@id/$below")
                row.setAttributeNS(androidNamespace, "android:orientation", "horizontal")
                row.setAttributeNS(androidNamespace, "android:gravity", "center_vertical")
                row.setAttributeNS(androidNamespace, "android:paddingStart", "16dp")
                row.setAttributeNS(androidNamespace, "android:paddingEnd", "16dp")
                row.setAttributeNS(androidNamespace, "android:background", "?android:attr/selectableItemBackground")
                row.setAttributeNS(androidNamespace, "android:clickable", "true")
                row.setAttributeNS(androidNamespace, "android:focusable", "true")

                val label = layout.createElement("TextView") as Element
                label.setAttributeNS(androidNamespace, "android:layout_width", "0dp")
                label.setAttributeNS(androidNamespace, "android:layout_height", "wrap_content")
                label.setAttributeNS(androidNamespace, "android:layout_weight", "1")
                label.setAttributeNS(androidNamespace, "android:text", title)
                label.setAttributeNS(androidNamespace, "android:textColor", "@color/white")
                label.setAttributeNS(androidNamespace, "android:textSize", "16sp")
                label.setAttributeNS(androidNamespace, "android:importantForAccessibility", "no")
                row.appendChild(label)

                val currentValue = layout.createElement("TextView") as Element
                currentValue.setAttributeNS(androidNamespace, "android:id", "@+id/$valueId")
                currentValue.setAttributeNS(androidNamespace, "android:layout_width", "wrap_content")
                currentValue.setAttributeNS(androidNamespace, "android:layout_height", "wrap_content")
                currentValue.setAttributeNS(androidNamespace, "android:maxWidth", "180dp")
                currentValue.setAttributeNS(androidNamespace, "android:maxLines", "2")
                currentValue.setAttributeNS(androidNamespace, "android:ellipsize", "end")
                currentValue.setAttributeNS(androidNamespace, "android:gravity", "end")
                currentValue.setAttributeNS(androidNamespace, "android:paddingStart", "12dp")
                currentValue.setAttributeNS(androidNamespace, "android:text", "$value  ›")
                currentValue.setAttributeNS(androidNamespace, "android:textColor", "#b8c1c7")
                currentValue.setAttributeNS(androidNamespace, "android:textSize", "14sp")
                currentValue.setAttributeNS(androidNamespace, "android:importantForAccessibility", "no")
                row.appendChild(currentValue)
                root.appendChild(row)
            }

            settingRow("morphe_key_size_row", "morphe_key_background_size", "morphe_key_controls_row", "Key background size", "90%")
            settingRow("morphe_key_color_row", "morphe_key_tile_color", "morphe_key_size_row", "Key tile color", "Follow theme")
            settingRow("morphe_key_transparency_row", "morphe_key_tile_transparency", "morphe_key_color_row", "Key tile transparency", "82%")
        }
    }
}

private fun addPreference(
    document: org.w3c.dom.Document,
    page: Element,
    androidNamespace: String,
    key: String,
    title: String,
    summary: String
) {
    val preference = document.createElement("Preference") as Element
    preference.setAttributeNS(androidNamespace, "android:key", key)
    preference.setAttributeNS(androidNamespace, "android:title", title)
    preference.setAttributeNS(androidNamespace, "android:summary", summary)
    page.appendChild(preference)
}

@Suppress("unused")
val helakuruLiteLiveKeyboardBlurPatch = patch(
    name = "Frosted Glass (Helakuru Lite)",
    description = "Adds adjustable keyboard blur, transparency, Monet tint, and Gboard-style key backgrounds.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLiteFrostedGlassPreferencesPatch, helakuruLiteKeyBackgroundSizeResourcePatch, helakuruLiteSettingsColorsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        prepareHelakuruLiteSettingsTheme()
        val lifecycleInstructions = HelakuruLiteKeyboardWindowFingerprint.method.implementation!!.instructions.toList()
        val lifecycleReturn = lifecycleInstructions.indexOfLast {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID
        }
        check(lifecycleReturn >= 0) { "Could not locate the Lite keyboard lifecycle return" }
        HelakuruLiteKeyboardWindowFingerprint.method.addInstructions(
            lifecycleReturn,
            "invoke-static {p0}, $LITE_EXTENSION->applyKeyboardBlur(Ljava/lang/Object;)V"
        )

        val keypressInstructions = HelakuruLiteKeypressFingerprint.method.implementation!!.instructions.toList()
        val keypressReturn = keypressInstructions.indexOfLast {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID
        }
        check(keypressReturn >= 0) { "Could not locate the Lite keypress return" }
        HelakuruLiteKeypressFingerprint.method.addInstructions(
            keypressReturn,
            "invoke-static {p0, p1}, $LITE_EXTENSION->onKeyPress(Ljava/lang/Object;I)V"
        )

        listOf(
            HelakuruLiteRefreshLayoutFingerprint,
            HelakuruLiteSwitchLayoutFingerprint,
            HelakuruLiteSwitchMainFingerprint,
            HelakuruLiteSwitchNumbersFingerprint,
            HelakuruLiteSwitchSymbolsFingerprint,
            HelakuruLiteUpdateKeyboardLayoutFingerprint,
            HelakuruLiteEnglishClickFingerprint,
            HelakuruLiteSinhalaClickFingerprint
        ).forEach { fingerprint ->
            val method = fingerprint.method
            val instructions = method.implementation!!.instructions.toList()
            val returns = instructions.mapIndexedNotNull { index, instruction ->
                index.takeIf { instruction.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID }
            }
            check(returns.isNotEmpty()) { "Could not locate return in a Lite keyboard state callback" }
            returns.asReversed().forEach { returnIndex ->
                method.addInstructions(
                    returnIndex,
                    // refreshLayout has 18 registers: p0 is v16, outside invoke-static's
                    // four-bit register limit. The range form also supports smaller methods.
                    "invoke-static/range {p0 .. p0}, $LITE_EXTENSION->onKeyboardStateChanged(Ljava/lang/Object;)V"
                )
            }
        }

        HelakuruLiteSettingsCreateFingerprint.method.addInstructions(
            helakuruLiteSettingsBindingIndex(),
            "invoke-static {p0}, $LITE_SETTINGS_EXTENSION->bindSettings(Ljava/lang/Object;)V"
        )

        val themeEditor = HelakuruLiteThemeEditorViewFingerprint.instructionMatches.single()
        HelakuruLiteThemeEditorViewFingerprint.method.addInstructions(
            themeEditor.index + 1,
            "invoke-static {p0, p1}, $LITE_SETTINGS_EXTENSION->bindThemeEditor(Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        val drawInstructions = HelakuruLiteKeyboardViewDrawFingerprint.method.implementation!!.instructions.toList()
        // Apply edits from the end so inserting calls cannot invalidate earlier indices.
        val edits = drawInstructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference?.toString()
            when (reference) {
                "Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V" ->
                    index to "invoke-static {v1, v9, v0, v7}, $LITE_SETTINGS_EXTENSION->drawKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V"
                "Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V" ->
                    index to "invoke-static {v9, v1, v7, v6, v2}, $LITE_SETTINGS_EXTENSION->drawKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V"
                "$LITE_GLASS_PRESS_EXTENSION->drawKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V" ->
                    index to "invoke-static {v1, v9, v0, v7}, $LITE_GLASS_PRESS_EXTENSION->drawFrostedKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V"
                "$LITE_GLASS_PRESS_EXTENSION->drawKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V" ->
                    index to "invoke-static {v9, v1, v7, v6, v2}, $LITE_GLASS_PRESS_EXTENSION->drawFrostedKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V"
                else -> null
            }
        }
        check(edits.size == 3) { "Expected two key backgrounds and one key label draw call" }
        edits.reversed().forEach { (index, replacement) ->
            HelakuruLiteKeyboardViewDrawFingerprint.method.replaceInstruction(index, replacement)
        }
        val keyCastIndex = drawInstructions.indexOfFirst { instruction ->
            instruction.opcode == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST &&
                (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference?.toString() == "Landroid/inputmethodservice/Keyboard\$Key;"
        }
        check(keyCastIndex >= 0) { "Could not locate the Lite keyboard key drawing loop" }
        HelakuruLiteKeyboardViewDrawFingerprint.method.addInstructions(
            keyCastIndex + 1,
            "invoke-static {v0, v7}, $LITE_SETTINGS_EXTENSION->applyActionKeyStyle(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
        HelakuruLiteKeyboardViewDrawFingerprint.method.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $LITE_SETTINGS_EXTENSION->bindKeyboardCanvas(Ljava/lang/Object;Landroid/graphics/Canvas;)V"
        )
    }
}
