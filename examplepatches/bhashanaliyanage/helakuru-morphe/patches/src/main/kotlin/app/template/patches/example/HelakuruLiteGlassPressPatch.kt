package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_HELAKURU_LITE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val GLASS_PRESS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteGlassPressExtension;"
private const val SETTINGS_EXTENSION = "Lapp/template/extension/extension/HelakuruLiteSettingsExtension;"

private val helakuruLiteGlassPressPreferencesPatch = resourcePatch {
    execute {
        document("res/xml/ime_preferences.xml").use { preferences ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val categories = preferences.getElementsByTagName("PreferenceCategory")
            val general = (0 until categories.length)
                .map { categories.item(it) as Element }
                .first { it.getAttributeNS(namespace, "key") == "pref1" }

            val page = preferences.createElement("PreferenceScreen") as Element
            page.setAttributeNS(namespace, "android:key", "morphe_glass_press_page")
            page.setAttributeNS(namespace, "android:title", "Glass Press Effect")
            page.setAttributeNS(namespace, "android:summary", "Touch bloom and key dip animation")

            val enabled = preferences.createElement("SwitchPreference") as Element
            enabled.setAttributeNS(namespace, "android:key", "morphe_glass_press_enabled")
            enabled.setAttributeNS(namespace, "android:title", "Enable Glass Press Effect")
            enabled.setAttributeNS(namespace, "android:summary", "Show a soft light bloom when tapping a key")
            enabled.setAttributeNS(namespace, "android:defaultValue", "false")
            page.appendChild(enabled)

            val dip = preferences.createElement("SwitchPreference") as Element
            dip.setAttributeNS(namespace, "android:key", "morphe_glass_press_key_dip")
            dip.setAttributeNS(namespace, "android:title", "Key dip and spring")
            dip.setAttributeNS(namespace, "android:summary", "Animate the tapped key and nearby keys")
            dip.setAttributeNS(namespace, "android:defaultValue", "false")
            page.appendChild(dip)

            listOf(
                Triple("morphe_glass_press_glow_strength", "Glow strength", "35%"),
                Triple("morphe_glass_press_glow_size", "Glow size", "100%"),
                Triple("morphe_glass_press_glow_duration", "Glow fade duration", "450 ms")
            ).forEach { (key, title, summary) ->
                val setting = preferences.createElement("Preference") as Element
                setting.setAttributeNS(namespace, "android:key", key)
                setting.setAttributeNS(namespace, "android:title", title)
                setting.setAttributeNS(namespace, "android:summary", summary)
                page.appendChild(setting)
            }

            general.appendChild(page)
        }
    }
}

@Suppress("unused")
val helakuruLiteGlassPressPatch = patch(
    name = "Glass Press Effect (Helakuru Lite)",
    description = "Adds a tap bloom and optional key dip animation.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HELAKURU_LITE)
    dependsOn(helakuruLiteGlassPressPreferencesPatch, helakuruLiteSettingsColorsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        prepareHelakuruLiteSettingsTheme()
        HelakuruLiteSettingsCreateFingerprint.method.addInstructions(
            helakuruLiteSettingsBindingIndex(),
            "invoke-static {p0}, $GLASS_PRESS_EXTENSION->bindSettings(Ljava/lang/Object;)V"
        )

        val lifecycleInstructions = HelakuruLiteKeyboardWindowFingerprint.method.implementation!!.instructions.toList()
        val lifecycleReturn = lifecycleInstructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(lifecycleReturn >= 0) { "Could not locate Lite's keyboard lifecycle return" }
        HelakuruLiteKeyboardWindowFingerprint.method.addInstructions(
            lifecycleReturn,
            "invoke-static {p0}, $GLASS_PRESS_EXTENSION->attachTouchObserver(Ljava/lang/Object;)V"
        )

        val draw = HelakuruLiteKeyboardViewDrawFingerprint.method
        val instructions = draw.implementation!!.instructions.toList()
        val edits = instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference?.toString()
            val replacement = when (reference) {
                "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V" -> {
                    val registers = instruction as? FiveRegisterInstruction
                    if (registers != null && registers.registerCount == 2 &&
                        registers.registerC == 1 && registers.registerD == 9) {
                        // The borderless return icon uses v7; later icon branches move
                        // the key into v12 and reuse v7 for coordinates. Resolve the
                        // receiver of the nearest key field read instead of guessing.
                        val keyRead = instructions.take(index).asReversed().firstOrNull { previous ->
                            val field = (previous as? ReferenceInstruction)?.reference as? FieldReference
                            previous.opcode.name.startsWith("iget", ignoreCase = true) &&
                                field?.definingClass == "Landroid/inputmethodservice/Keyboard\$Key;"
                        } as? TwoRegisterInstruction
                        checkNotNull(keyRead) { "Could not resolve the key register for Lite icon draw at instruction $index" }
                        val keyRegister = keyRead.registerB
                        "invoke-static {v1, v9, v0, v$keyRegister}, $GLASS_PRESS_EXTENSION->drawKeyIcon(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V"
                    } else null
                }
                "Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V" ->
                    "invoke-static {v1, v9, v0, v7}, $GLASS_PRESS_EXTENSION->drawKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V"
                "Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V" ->
                    "invoke-static {v9, v1, v7, v6, v2}, $GLASS_PRESS_EXTENSION->drawKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V"
                "$SETTINGS_EXTENSION->drawKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V" ->
                    "invoke-static {v1, v9, v0, v7}, $GLASS_PRESS_EXTENSION->drawFrostedKeyBackground(Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/Canvas;Ljava/lang/Object;Landroid/inputmethodservice/Keyboard\$Key;)V"
                "$SETTINGS_EXTENSION->drawKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V" ->
                    "invoke-static {v9, v1, v7, v6, v2}, $GLASS_PRESS_EXTENSION->drawFrostedKeyLabel(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/inputmethodservice/Keyboard\$Key;FLandroid/graphics/Paint;)V"
                else -> null
            }
            replacement?.let { index to it }
        }
        val iconCount = edits.count { it.second.contains("->drawKeyIcon(") }
        check(iconCount == 5 && edits.size - iconCount == 3) {
            "Expected two key backgrounds, one label, and five keyboard icon draws; " +
                "found ${edits.size - iconCount} background/label draws and $iconCount icon draws"
        }
        edits.reversed().forEach { (index, replacement) -> draw.replaceInstruction(index, replacement) }

        val refreshedInstructions = draw.implementation!!.instructions.toList()
        val drawReturn = refreshedInstructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(drawReturn >= 0) { "Could not locate Lite's keyboard draw return" }
        draw.addInstructions(
            drawReturn,
            "invoke-static {v0, v9}, $GLASS_PRESS_EXTENSION->drawBloom(Ljava/lang/Object;Landroid/graphics/Canvas;)V"
        )
    }
}
