package app.morphe.patches.google.haptics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RUNTIME = "Lapp/geminipatch/extension/GeminiHaptics;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val GOOGLE_APPLICATION = "Lcom/google/android/apps/gsa/binaries/velvet/app/VelvetMultiprocessRoot_Application;"
private const val WAVEFORM_ARGS = "(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V"

val geminiHapticsPatch = bytecodePatch(
    name = "Gemini haptic feedback setting",
    description = "Adds separate vibration switches for Gemini and the Google app, including Search and Lens.",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox", hook = HookId.GEMINI_HAPTICS))
    extendWith(java.util.function.Supplier {
        checkNotNull(VersionHookRegistry::class.java.classLoader.getResourceAsStream("extensions/gemini-haptics.bin"))
    })
    execute {
        val spec = VersionHookRegistry.target(HookId.GEMINI_HAPTICS, packageMetadata)
        val preference = classDefBy(PREFERENCE)
        val setIcon = preference.methods.single {
            it.parameterTypes == listOf("Landroid/graphics/drawable/Drawable;") && it.returnType == "V"
        }.name
        val group = classDefBy("Landroidx/preference/PreferenceGroup;")
        val switch = classDefBy("Landroidx/preference/SwitchPreferenceCompat;")
        val methods = listOf(
            group to (spec.value("findPreference") + "(Ljava/lang/String;)$PREFERENCE"),
            preference to (spec.value("setKey") + "(Ljava/lang/String;)V"),
            preference to (spec.value("setTitle") + "(Ljava/lang/CharSequence;)V"),
            group to (spec.value("addPreference") + "($PREFERENCE)Z"),
            switch to "<init>(Landroid/content/Context;Landroid/util/AttributeSet;)V"
        )
        for ((owner, signature) in methods) {
            check(owner.methods.count { it.shortDescriptor() == signature } == 1) {
                "Gemini preference method changed: ${owner.type}->$signature"
            }
        }
        check(preference.fields.any { it.name == "j" && it.type == "Landroid/content/Context;" })

        val hooks = VersionHookRegistry.requireProfile(packageMetadata).hooks
        val listSpec = hooks[HookId.GEMINI_HAPTICS_SETTINGS_LIST]
        if (listSpec == null) {
            val settingsClass = mutableClassDefBy(classDefBy(requireNotNull(spec.className)))
            val settings = settingsClass.methods.single { spec.matches(it) }
            val listener = preference.fields.single { it.name == spec.value("listenerField") }
            check(classDefBy(listener.type).methods.any {
                it.parameterTypes == listOf(PREFERENCE, "Ljava/lang/Object;") && it.returnType == "Z"
            }) { "Gemini preference change listener changed" }
            check(preference.fields.any { it.name == spec.value("persistentField") && it.type == "Z" })
            val state = classDefBy("Landroidx/preference/TwoStatePreference;")
            check(state.methods.any { it.shortDescriptor() == "${spec.value("setChecked")}(Z)V" })
            val names = listOf("findPreference", "setKey", "setTitle", "addPreference", "listenerField", "persistentField", "setChecked")
                .map(spec::value).plus(setIcon).joinToString(",")
            check(settings.implementation?.registerCount == spec.int("settingsRegisters"))
            val screenParameter = spec.int("screenParameter")
            check(settings.parameterTypes[screenParameter - 1] == "Landroidx/preference/PreferenceScreen;")
            settings.addInstructions(0, """
                const-string v0, "$names"
                move-object/from16 v1, p$screenParameter
                invoke-static {v1, v0}, $RUNTIME->addPreference(Ljava/lang/Object;Ljava/lang/String;)V
            """.trimIndent())

        }

        hooks[HookId.GEMINI_HAPTICS_COMPOSE]?.let { compose ->
            val composeOwner = mutableClassDefBy(classDefBy(requireNotNull(compose.className)))
            val createView = composeOwner.methods.single { compose.matches(it) }
            val viewRegister = compose.int("viewRegister")
            val titleRegister = compose.int("titleRegister")
            val instructions = createView.instructions.toList()
            check(createView.implementation?.registerCount == compose.int("registers"))
            val rootTitles = listOf(compose.int("geminiSettingsTitle"), compose.int("settingsTitle"))
            check(rootTitles.all { title -> instructions.any {
                it.opcode == Opcode.CONST && (it as OneRegisterInstruction).registerA == titleRegister &&
                    (it as WideLiteralInstruction).wideLiteral == title.toLong()
            } }) { "Gemini Compose settings titles changed" }
            val exit = instructions.indices.single { instructions[it].opcode == Opcode.RETURN_OBJECT }
            check((instructions[exit] as OneRegisterInstruction).registerA == viewRegister)
            check(instructions[exit - 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (instructions[exit - 2] as OneRegisterInstruction).registerA == viewRegister)
            check((instructions[exit - 3] as ReferenceInstruction).reference.toString()
                .endsWith(")Landroidx/compose/ui/platform/ComposeView;"))
            createView.replaceInstruction(exit,
                "invoke-static {v$viewRegister, v$titleRegister}, $RUNTIME->addComposePreference(Landroid/view/View;I)Landroid/view/View;")
            createView.addInstructions(exit + 1, """
                move-result-object v$viewRegister
                return-object v$viewRegister
            """.trimIndent())
        }

        if (listSpec != null) {
            val composeGroup = classDefBy("L${listSpec.value("composeGroup")};")
            check(composeGroup.superclass == group.type)
            check(composeGroup.fields.any { it.name == listSpec.value("rowsField") && it.type == "Ljava/util/List;" })
            check(preference.fields.any { it.name == listSpec.value("keyField") && it.type == "Ljava/lang/String;" })
            check(preference.fields.any { it.name == listSpec.value("persistentField") && it.type == "Z" })
            check(preference.fields.any {
                it.name == listSpec.value("listenerField") && it.type == listSpec.value("listenerDescriptor")
            })
            val state = classDefBy("Landroidx/preference/TwoStatePreference;")
            check(state.methods.any { it.shortDescriptor() == "${listSpec.value("setChecked")}(Z)V" })
            val names = (listOf("findPreference", "setKey", "setTitle").map(spec::value) +
                listOf("composeGroup", "rowsField", "keyField", "persistentField", "listenerField", "setChecked").map(listSpec::value) +
                listOf(spec.value("addPreference"), setIcon)).joinToString(",")
            check(listSpec.methodSignatures.size == listSpec.expectedMatches)
            for (descriptor in listSpec.methodSignatures) {
                val owner = mutableClassDefBy(classDefBy(descriptor.substringBefore("->")))
                val builder = owner.methods.single { it.shortDescriptor() == descriptor.substringAfter("->") }
                check(builder.parameterTypes.first() == group.type)
                check(checkNotNull(builder.implementation).registerCount in 4..16)
                check(builder.instructions.any { (it as? ReferenceInstruction)?.reference.toString() == listSpec.anchorStrings.single() })
                builder.addInstructions(0, """
                    const-string v0, "$names"
                    invoke-static {p1, v0}, $RUNTIME->addListPreference(Ljava/lang/Object;Ljava/lang/String;)V
                """.trimIndent())
            }
        }

        var wrapped = 0
        for (descriptor in spec.methodSignatures) {
            val owner = mutableClassDefBy(classDefBy(descriptor.substringBefore("->")))
            val method = owner.methods.single { it.shortDescriptor() == descriptor.substringAfter("->") }
            val calls = method.instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.shortDescriptor() == "performHapticFeedback(I)Z" &&
                    (reference.definingClass == "Landroid/view/View;" ||
                        reference.definingClass.startsWith("Lcom/google/android/apps/search/assistant/surfaces/voice/robin/"))
            }
            check(calls.isNotEmpty()) { "Gemini reply haptics changed: $descriptor" }
            for ((index, instruction) in calls) {
                val registers = instruction as FiveRegisterInstruction
                check(registers.registerCount == 2)
                method.replaceInstruction(index,
                    "invoke-static {v${registers.registerC}, v${registers.registerD}}, $RUNTIME->performFeedback(Landroid/view/View;I)Z")
                wrapped++
            }
        }
        check(wrapped == spec.expectedMatches) { "Expected ${spec.expectedMatches} Gemini haptic calls, wrapped $wrapped" }

        val application = mutableClassDefBy(classDefBy(GOOGLE_APPLICATION))
        val constructor = application.methods.single { it.shortDescriptor() == "<init>()V" }
        val superConstructor = constructor.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == "${application.superclass}-><init>()V"
        }
        constructor.addInstructions(superConstructor.index + 1,
            "invoke-static/range {p0 .. p0}, $RUNTIME->setApplicationContext(Landroid/content/Context;)V")

        val waveform = VersionHookRegistry.target(HookId.GEMINI_HAPTICS_VIBRATOR, packageMetadata)
        check(waveform.methodSignatures.size == waveform.expectedMatches)
        for ((position, descriptor) in waveform.methodSignatures.withIndex()) {
            val owner = mutableClassDefBy(classDefBy(descriptor.substringBefore("->")))
            val method = owner.methods.single { it.shortDescriptor() == descriptor.substringAfter("->") }
            if (position == 0) {
                val references = method.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }.toSet()
                check(waveform.anchorStrings.all { it in references }) { "Gemini waveform player changed: $descriptor" }
            }
            val (index, instruction) = method.instructions.withIndex().single { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == waveform.value("vibrateReference")
            }
            val registers = instruction as FiveRegisterInstruction
            check(registers.registerCount == 2)
            method.replaceInstruction(index,
                "invoke-static {v${registers.registerC}, v${registers.registerD}}, $RUNTIME->performVibration$WAVEFORM_ARGS")
        }

        // Gemini calls have already been redirected above. The remaining Google APK
        // call sites include Search and Lens, even when the concrete class name is obfuscated.
        var googleCalls = 0
        classDefForEach { owner ->
            if (owner.type.startsWith("Lapp/geminipatch/extension/")) return@classDefForEach
            if (owner.methods.none { method ->
                method.implementation?.instructions?.any { it.googleHapticTarget() != null } == true
            }) return@classDefForEach
            for (method in mutableClassDefBy(owner).methods) {
                for ((index, instruction) in method.implementation?.instructions.orEmpty().withIndex().toList()) {
                    val target = instruction.googleHapticTarget() ?: continue
                    val invocation = when (instruction) {
                        is FiveRegisterInstruction -> {
                            check(instruction.registerCount in 2..3)
                            val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE)
                                .take(instruction.registerCount).joinToString(", ") { "v$it" }
                            "invoke-static {$registers}"
                        }
                        is RegisterRangeInstruction -> {
                            val end = instruction.startRegister + instruction.registerCount - 1
                            "invoke-static/range {v${instruction.startRegister} .. v$end}"
                        }
                        else -> error("Unexpected haptic invocation: $instruction")
                    }
                    method.replaceInstruction(index, "$invocation, $RUNTIME->$target")
                    googleCalls++
                }
            }
        }
        check(googleCalls > 0) { "No Google app haptic call sites found" }
    }
}

private fun MethodReference.shortDescriptor() = "$name(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.googleHapticTarget(): String? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as MethodReference
    if (reference.name != "performHapticFeedback" && reference.name != "vibrate") return null
    return when (reference.shortDescriptor()) {
        "performHapticFeedback(I)Z" -> "performGoogleFeedback(Landroid/view/View;I)Z"
        "performHapticFeedback(II)Z" -> "performGoogleFeedback(Landroid/view/View;II)Z"
        "vibrate(J)V" -> if (reference.definingClass == "Landroid/os/Vibrator;")
            "performGoogleVibration(Landroid/os/Vibrator;J)V" else null
        "vibrate(Landroid/os/VibrationEffect;)V" -> if (reference.definingClass == "Landroid/os/Vibrator;")
            "performGoogleVibration$WAVEFORM_ARGS" else null
        else -> null
    }
}
