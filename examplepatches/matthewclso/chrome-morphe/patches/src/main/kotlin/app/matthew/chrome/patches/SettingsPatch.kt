package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val SETTINGS = "Lapp/matthew/chrome/extension/PatchSettings;"
private const val THEME_PICKER = "Lapp/matthew/chrome/extension/ThemePicker;"
private const val BLACK_THEME = "Lapp/matthew/chrome/extension/BlackTheme;"
private const val SETTINGS_ACTIVITY = "app.matthew.chrome.extension.MorpheSettingsActivity"

private val settingsResources = resourcePatch {
    execute {
        requireTarget(packageMetadata)
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0)
            val activity = doc.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Morphe settings")
            application.appendChild(activity)
        }
        document("res/xml/xml_0x7f18003d.xml").use { doc ->
            check(doc.getElementsByTagName("PreferenceScreen").length == 1)
            val preference = doc.createElement("Preference")
            preference.setAttribute("android:key", "morphe_settings")
            preference.setAttribute("android:title", "Morphe settings")
            preference.setAttribute("android:summary", "Incognito, black mode and true bottom controls")
            preference.setAttribute("android:order", "6")
            val intent = doc.createElement("intent")
            intent.setAttribute("android:action", "android.intent.action.VIEW")
            intent.setAttribute("android:targetPackage", TEST_PACKAGE)
            intent.setAttribute("android:targetClass", SETTINGS_ACTIVITY)
            preference.appendChild(intent)
            doc.documentElement.appendChild(preference)
        }
    }
}

val settingsPatch = bytecodePatch(
    name = "Chrome customization",
    description = "Morphe settings, Incognito toolbar switch, remembered browsing mode, black theme and true bottom controls.",
    default = true,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(testPackagePatch, modeTogglePatch, rememberModePatch, emptyIncognitoPatch, bottomToolbarPatch, tabPickerPatch, settingsResources)
    execute {
        requireTarget(packageMetadata)
        val application = mutableClassDefBy("Lorg/chromium/chrome/browser/base/SplitChromeApplication;")
        application.methods.single { it.name == "onCreate" }.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $SETTINGS->initialize(Landroid/app/Application;)V")

        val bridge = mutableClassDefBy(BRIDGE)
        val coordinatorParams = classDefBy("Lxf6;")
        check(coordinatorParams.superclass == "Landroid/view/ViewGroup\$MarginLayoutParams;")
        check(coordinatorParams.fields.any { it.name == "f" && it.type == "I" })
        val clearAnchor = coordinatorParams.methods.single { it.name == "b" && it.parameterTypes == listOf("I") }
        bridge.methods.single { it.name == "unanchorSearchResults" }.addInstructions(0, """
            invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
            move-result-object v0
            check-cast v0, Lxf6;
            const/4 p0, -0x1
            invoke-virtual {v0, p0}, $clearAnchor
            return-void
        """.trimIndent())
        bridge.methods.single { it.name == "writeChromeInt" }.addInstructions(0, """
            invoke-static {p0, p1}, Lorg/chromium/base/shared_preferences/SharedPreferencesManager;->l(ILjava/lang/String;)V
            return-void
        """.trimIndent())
        val theme = classDefByStrings("Unknown `theme`: ").single()
        check(theme.type == "Ldqh;")
        check(theme.methods.any { it.name == "a" && it.hasString("ui_theme_setting") })
        bridge.methods.single { it.name == "themeSetting" }.addInstructions(0, """
            invoke-static {}, Ldqh;->a()I
            move-result v0
            return v0
        """.trimIndent())
        val address = classDefBy("Lorg/chromium/chrome/browser/toolbar/settings/AddressBarPreference;")
        val position = address.methods.single { it.name == "f0" && it.parameterTypes == listOf("I") }
        check(position.hasString("Chrome.Toolbar.TopAnchored"))
        mutableClassDefBy(address).methods.single { it.name == "f0" && it.parameterTypes == listOf("I") }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $SETTINGS->nativePosition(I)V")
        bridge.methods.single { it.name == "setBottomPosition" }.addInstructions(0, """
            const/4 v0, 0x3
            invoke-static {v0}, $position
            return-void
        """.trimIndent())
        val radioClass = "Lorg/chromium/chrome/browser/night_mode/settings/RadioButtonGroupThemePreference;"
        bridge.methods.single { it.name == "themeChoices" }.addInstructions(0, """
            check-cast p0, $radioClass
            iget-object p0, p0, $radioClass->K0:Ljava/util/ArrayList;
            return-object p0
        """.trimIndent())
        val radio = mutableClassDefBy(radioClass)
        val bind = radio.methods.single { it.name == "C" && it.parameterTypes == listOf("Lvwk;") }
        // This exact method keeps p0 as the preference and has one fall-through return.
        check(bind.implementation!!.instructions.count { it.opcode == Opcode.RETURN_VOID } == 1)
        bind.addInstructions(bind.implementation!!.instructions.size - 1,
            "invoke-static/range {p0 .. p0}, $THEME_PICKER->finishBinding(Ljava/lang/Object;)V")
        bind.addInstructions(0, "invoke-static {}, $THEME_PICKER->beginBinding()V")
        radio.methods.single { it.name == "onCheckedChanged" }.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $THEME_PICKER->nativeChoice(Ljava/lang/Object;)V")
        val hub = mutableClassDefBy("Lorg/chromium/chrome/browser/hub/HubToolbarView;")
        val inflate = hub.methods.single { it.name == "onFinishInflate" }
        val superCall = inflate.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
        check(superCall >= 0)
        inflate.addInstructions(superCall + 1,
            "invoke-static/range {p0 .. p0}, Lapp/matthew/chrome/extension/HubLayout;->install(Landroid/view/View;)V")

        // Chromium FeedItemDecoration paints card backgrounds behind the mounted article content.
        val feedDecoration = classDefBy("Lay9;")
        check(feedDecoration.fields.count { it.type == "Landroid/graphics/drawable/Drawable;" } == 8)
        check(feedDecoration.fields.any { it.name == "S" && it.type == "Lm0a;" })

        // ToolbarPhone also draws private ColorDrawables instead of View backgrounds.
        val phone = mutableClassDefBy("Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;")
        for (name in listOf("A0", "C0", "E0")) {
            val color = phone.methods.single { it.name == name && it.returnType == "I" && it.parameterTypes.size == 1 }
            val returns = color.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.toList()
            check(returns.isNotEmpty())
            for ((index, instruction) in returns.reversed()) {
                val register = (instruction as OneRegisterInstruction).registerA
                // Replace the return itself so existing branch targets cannot skip the mapping.
                color.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $BLACK_THEME->background(I)I")
                color.addInstructions(index + 1, "move-result v$register\nreturn v$register")
            }
        }

        var backgrounds = 0
        var feedDraws = 0
        classDefForEach { cls ->
            if (!cls.type.startsWith("Lapp/matthew/chrome/extension/")) {
                for (method in cls.methods) {
                    val code = method.implementation?.instructions?.toList() ?: continue
                    for ((index, instruction) in code.withIndex()) {
                        // A super call must keep non-virtual dispatch or an override can recurse.
                        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) continue
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                        val target = when {
                            cls.type == feedDecoration.type && ref.toString() == "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V" ->
                                "drawFeedBackground(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;)V"
                            ref.toString() == "Landroid/widget/ListPopupWindow;->show()V" -> "showListPopup(Landroid/widget/ListPopupWindow;)V"
                            ref.toString() == "Landroid/app/Dialog;->show()V" -> "showDialog(Landroid/app/Dialog;)V"
                            ref.definingClass == "Landroid/widget/PopupWindow;" && ref.name == "showAtLocation" &&
                                ref.parameterTypes == listOf("Landroid/view/View;", "I", "I", "I") ->
                                "showAtLocation(Landroid/widget/PopupWindow;Landroid/view/View;III)V"
                            ref.definingClass == "Landroid/widget/PopupWindow;" && ref.name == "showAsDropDown" &&
                                ref.parameterTypes == listOf("Landroid/view/View;", "I", "I") ->
                                "showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;II)V"
                            ref.definingClass == "Landroid/widget/PopupWindow;" && ref.name == "showAsDropDown" &&
                                ref.parameterTypes == listOf("Landroid/view/View;", "I", "I", "I") ->
                                "showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V"
                            ref.name == "setBackgroundColor" && ref.parameterTypes == listOf("I") &&
                                (ref.definingClass == "Landroid/view/View;" || ref.definingClass.startsWith("Landroid/widget/")) ->
                                "setBackgroundColor(Landroid/view/View;I)V"
                            ref.definingClass == "Landroid/graphics/drawable/GradientDrawable;" && ref.name == "setColor" && ref.parameterTypes == listOf("I") ->
                                "setGradientColor(Landroid/graphics/drawable/GradientDrawable;I)V"
                            ref.definingClass == "Landroid/graphics/drawable/ColorDrawable;" && ref.name == "setColor" && ref.parameterTypes == listOf("I") ->
                                "setDrawableColor(Landroid/graphics/drawable/ColorDrawable;I)V"
                            ref.definingClass == "Landroid/graphics/drawable/GradientDrawable;" && ref.name == "setColor" && ref.parameterTypes == listOf("Landroid/content/res/ColorStateList;") ->
                                "setGradientTint(Landroid/graphics/drawable/GradientDrawable;Landroid/content/res/ColorStateList;)V"
                            ref.name == "setBackgroundTintList" && ref.parameterTypes == listOf("Landroid/content/res/ColorStateList;") &&
                                (ref.definingClass == "Landroid/view/View;" || ref.definingClass.startsWith("Landroid/widget/")) ->
                                "setBackgroundTint(Landroid/view/View;Landroid/content/res/ColorStateList;)V"
                            ref.definingClass.startsWith("Landroid/graphics/drawable/") && ref.name == "setTint" && ref.parameterTypes == listOf("I") ->
                                "setDrawableTint(Landroid/graphics/drawable/Drawable;I)V"
                            ref.definingClass.startsWith("Landroid/graphics/drawable/") && ref.name == "setTintList" && ref.parameterTypes == listOf("Landroid/content/res/ColorStateList;") ->
                                "setDrawableTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V"
                            cls.type == "Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;" && ref.definingClass == "Landroid/graphics/Paint;" && ref.name == "setColor" ->
                                "setPaintColor(Landroid/graphics/Paint;I)V"
                            else -> null
                        } ?: continue
                        val call = when (instruction) {
                            is FiveRegisterInstruction -> {
                                check(instruction.registerCount == ref.parameterTypes.size + 1)
                                val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                                    instruction.registerF, instruction.registerG).take(instruction.registerCount).joinToString { "v$it" }
                                "invoke-static {$registers}, $BLACK_THEME->$target"
                            }
                            is RegisterRangeInstruction -> {
                                check(instruction.registerCount == ref.parameterTypes.size + 1)
                                "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}}, $BLACK_THEME->$target"
                            }
                            else -> error("Unexpected background call: $ref")
                        }
                        mutableClassDefBy(cls).methods.single {
                            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                        }.replaceInstruction(index, call)
                        backgrounds++
                        if (target.startsWith("drawFeedBackground(")) feedDraws++
                    }
                }
            }
        }
        check(backgrounds > 100)
        check(feedDraws == 2) { "Expected both standard and staggered feed backgrounds" }
        println("Settings, native theme observer and Hub hooks applied; $backgrounds background color calls gated.")
    }
}
