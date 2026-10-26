package io.github.pengusto.patches.kvaesitso

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import io.github.pengusto.patches.codeDigest

private const val scaffold = "Lde/mm20/launcher2/ui/launcher/scaffold/"
private const val components = "${scaffold}components/"
private const val state = "${scaffold}LauncherScaffoldState;"
private const val widgets = "${components}WidgetsComponent;"
private const val settings = "Lde/mm20/launcher2/preferences/ui/UiSettings;"
private const val menu = "Lde/mm20/launcher2/ui/launcher/searchbar/SearchBarMenuKt;"
private const val bridge = "Lio/github/pengusto/patches/extension/kvaesitso/WidgetEditing;"
private const val mutableState = "Landroidx/compose/runtime/MutableState;"
private const val composer = "Landroidx/compose/runtime/Composer;"
private const val scope = "Lkotlinx/coroutines/CoroutineScope;"

private fun getter(owner: String, name: String, type: String, body: String): MutableMethod =
    MutableMethod(ImmutableMethod(owner, name, emptyList(), type, AccessFlags.PUBLIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        .apply { addInstructions(0, body) }

@Suppress("unused")
val widgetEditingPatch = bytecodePatch(
    name = "Restore widget editing from the search menu",
    description = "Open the existing widget editor from the search bar menu when the Edit button is hidden, without changing the preference or stored widgets.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Kvaesitso", packageName = "de.mm20.launcher2.release",
        targets = listOf(AppTarget(version = "1.41.0"))))
    extendWith("extensions/kvaesitso.mpe")
    execute {
        val bindClass = "${scaffold}LauncherScaffoldKt\$\$ExternalSyntheticLambda10;"
        val hashes = mapOf(
            settings to "76dbd0e6dc633112d8749ac961294a5e2823eb77dd33dff62d63b423e8050574",
            bindClass to "27f3b21e64768e749f28d09557c74c53ebac8d249b5a97d175faca684015b100",
            "${scaffold}LauncherScaffoldKt;" to "68670afc2fc1ae873c0c20da3ccedff64d451a746092431111e4125e441daf25",
            state to "caa5e78ec23a448a2730160673b2955fdec168d3a48d05987c575f532e29536e",
            "${components}ClockAndWidgetsHomeComponent;" to "c6c6cbdf0553fadfb484f58949f4a35ec968f9058a21bdbf479c0dc22701ac34",
            widgets to "42b63d8ec0ce74008db6370efc1b575dbd6bae0f24e4288d5935093bcfff4f79",
            menu to "c68b53982746c4ec5431c9c14640eb8cb9f21ea92abf662becacf878f8abca80",
        )
        hashes.forEach { (type, expected) ->
            check(classDefBy(type).codeDigest() == expected) {
                "Unsupported or already patched Kvaesitso bytecode: $type. Use the original official 1.41.0 APK."
            }
        }

        // R8 moved this retained stdlib function to the facade's implementation
        // class and removed it from the facade hierarchy. Bind only this exact API.
        classDefForEach { cls ->
            if (cls.type.startsWith("Lio/github/pengusto/patches/extension/kvaesitso/")) {
                mutableClassDefBy(cls).methods.forEach { method ->
                    method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.definingClass == "Lkotlin/coroutines/intrinsics/IntrinsicsKt;" &&
                            ref.name == "getCOROUTINE_SUSPENDED" && ref.parameterTypes.isEmpty()) {
                            val target = ImmutableMethodReference("Lkotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsKt;",
                                ref.name, emptyList(), ref.returnType)
                            when (instruction) {
                                is FiveRegisterInstruction -> method.replaceInstruction(index, BuilderInstruction35c(
                                    instruction.opcode, instruction.registerCount, instruction.registerC, instruction.registerD,
                                    instruction.registerE, instruction.registerF, instruction.registerG, target))
                                is RegisterRangeInstruction -> method.replaceInstruction(index, BuilderInstruction3rc(
                                    instruction.opcode, instruction.startRegister, instruction.registerCount, target))
                                else -> error("Unsupported coroutine intrinsic invocation")
                            }
                        }
                    }
                }
            }
        }

        val stateClass = mutableClassDefBy(state)
        stateClass.methods.add(getter(state, "getPenguinConfig", "${scaffold}ScaffoldConfiguration;", """
            iget-object v0, p0, $state->config:${scaffold}ScaffoldConfiguration;
            return-object v0
        """.trimIndent()))
        stateClass.methods.single { it.name == "performTapGesture" }.apply {
            accessFlags = (accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value
        }
        mutableClassDefBy("${components}ClockAndWidgetsHomeComponent;").methods.single {
            it.name == "setEditMode"
        }.apply {
            accessFlags = (accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value
        }

        val widgetClass = mutableClassDefBy(widgets)
        widgetClass.fields.add(MutableField(ImmutableField(widgets, "penguinEditRequest", mutableState,
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, emptySet(), emptySet())))
        widgetClass.methods.add(getter(widgets, "getPenguinEditRequest", mutableState, """
            iget-object v0, p0, $widgets->penguinEditRequest:$mutableState
            return-object v0
        """.trimIndent()))
        val constructor = widgetClass.methods.single { it.name == "<init>" }
        constructor.addInstructions(constructor.implementation!!.instructions.lastIndex, """
            invoke-static {}, $bridge->newEditRequest()$mutableState
            move-result-object v0
            iput-object v0, p0, $widgets->penguinEditRequest:$mutableState
        """.trimIndent())

        val widgetUi = widgetClass.methods.single { it.name == "Component" }
        // Immediately after the existing rememberSaveable edit-mode state.
        widgetUi.addInstructions(96, """
            const/4 v10, 0x0
            invoke-static {v1, v0, v12, v10}, $bridge->ObserveEditRequest($widgets$mutableState${composer}I)V
        """.trimIndent())

        val bind = mutableClassDefBy(bindClass).methods.single { it.name == "<init>" }
        bind.addInstructions(bind.implementation!!.instructions.lastIndex,
            "invoke-static {p2, p1}, $bridge->bind($state$scope)V")
        val settingsConstructor = mutableClassDefBy(settings).methods.single { it.name == "<init>" }
        settingsConstructor.addInstructions(settingsConstructor.implementation!!.instructions.lastIndex,
            "invoke-static {p0}, $bridge->observeSettings($settings)V")

        val menuContent = Fingerprint(definingClass = menu, name = "SearchBarMenu\$lambda\$3\$3\$0",
            returnType = "Lkotlin/Unit;", parameters = listOf("Landroid/content/Context;", mutableState,
                "Landroidx/compose/foundation/layout/ColumnScope;", composer, "I")).method
        // Render within the existing menu group, before Wallpaper. Reuse its
        // localized resources and preserve Wallpaper, Settings and Help.
        menuContent.replaceInstruction(24,
            "invoke-static {v14, v3}, $bridge->WallpaperShape(${composer}I)Landroidx/compose/ui/graphics/Shape;")
        // Insert after the original branch target, otherwise the normal
        // non-tracing execution jumps over the new menu item.
        menuContent.addInstructions(23, """
            move-object/from16 v0, p1
            const/4 v3, 0x0
            invoke-static {v0, v14, v3}, $bridge->MenuItem($mutableState${composer}I)V
            move-object/from16 v0, p0
        """.trimIndent())

        // The upstream secondary-page set omits the Home button destination.
        // Include it so a widget page assigned only to that gesture can render.
        val secondary = mutableClassDefBy("${scaffold}LauncherScaffoldKt;").methods.single { it.name == "SecondaryPage" }
        secondary.replaceInstruction(150, "const/16 v15, 0x8")
        secondary.addInstructionsWithLabels(161, """
            invoke-virtual {v6}, ${scaffold}ScaffoldConfiguration;->getHomeButton()${scaffold}ScaffoldGesture;
            move-result-object v3
            if-eqz v3, :store_home_button
            invoke-virtual {v3}, ${scaffold}ScaffoldGesture;->getComponent()${components}ScaffoldComponent;
            move-result-object v3
            :store_home_button
            const/4 v8, 0x7
            aput-object v3, v15, v8
        """.trimIndent())
    }
}
