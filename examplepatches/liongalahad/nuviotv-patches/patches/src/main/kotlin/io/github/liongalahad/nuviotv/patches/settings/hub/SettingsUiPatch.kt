package io.github.liongalahad.nuviotv.patches.settings.hub

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime;"
private const val PAGE_CONTENT =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsPageContent;"

/** Shared native Morphe pane used by every independently selectable configurable patch. */
internal val settingsUiPatch = bytecodePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsHubPatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            SettingsScreenFingerprint,
            ExperienceSettingsHeaderFingerprint,
            ExperienceSettingsCardFingerprint,
            NativeSettingsSwitchUsageFingerprint
        ).forEach { it.matchAll(1..1) }

        SettingsScreenFingerprint.method.apply {
            val ordinalCallIndex = SettingsScreenFingerprint.instructionMatches.last().index
            val resultInstruction = getInstruction<OneRegisterInstruction>(ordinalCallIndex + 1)
            val register = resultInstruction.registerA
            addInstructions(
                ordinalCallIndex + 2,
                """
                    invoke-static/range { v$register .. v$register }, $RUNTIME->mapVisibilityOrdinal(I)I
                    move-result v$register
                """
            )
        }

        fun remapResourceLiterals(method: MutableMethod, replacements: Map<Int, Int>) {
            method.implementation!!.instructions.withIndex().forEach { (index, instruction) ->
                val literal = instruction as? WideLiteralInstruction ?: return@forEach
                val replacement = replacements[literal.wideLiteral.toInt()] ?: return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const v$register, 0x${replacement.toString(16)}")
            }
        }

        remapResourceLiterals(
            ExperienceSettingsHeaderFingerprint.method,
            mapOf(0x7f11089a to 0x7f1108bf, 0x7f110552 to 0x7f1108c0)
        )

        fun MethodReference.descriptor() = buildString {
            append(definingClass).append("->").append(name).append('(')
            parameterTypes.forEach { append(it) }
            append(')').append(returnType)
        }

        // Experience already has the same native heading and weighted outer group used by
        // Layout Settings. Replace only that group's content with Morphe's native LazyColumn;
        // the extension then renders Nuvio's own CollapsibleSectionCard for every category.
        val experienceContentMethod = ExperienceSettingsCardFingerprint.method
        val references = experienceContentMethod.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference
        }
        val modifierField = references.filterIsInstance<FieldReference>()
            .distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
            .single { it.type == "Lu1/n;" }
        val methodReferences = references.filterIsInstance<MethodReference>()
            .distinctBy { it.descriptor() }
        val groupReference = methodReferences.single {
                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString).let { parameters ->
                    parameters.size == 7 && parameters.take(4) == listOf(
                        "Lu1/q;", "Ljava/lang/String;", "Ljava/lang/String;", "Lo1/t;"
                    )
                }
            }
        val composerType = groupReference.parameterTypes[4].toString()
        val lambdaReference = methodReferences.single {
            it.returnType == "Lo1/t;" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("I", "Lkotlin/Function;", composerType)
        }

        val pageMethod = ExperienceSettingsHeaderFingerprint.method
        val pageGroupIndex = pageMethod.implementation!!.instructions.withIndex().single {
            val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            reference?.descriptor() == groupReference.descriptor()
        }.index
        val pageGroupCall = pageMethod.getInstruction<RegisterRangeInstruction>(pageGroupIndex)
        check(pageGroupCall.registerCount == 7) {
            "Native Experience group call no longer uses the expected seven registers"
        }
        check(pageMethod.parameters.size == 4 &&
            pageMethod.parameters[2].type == composerType) {
            "Native Experience page no longer exposes the Layout-compatible focus/composer parameters"
        }

        val start = pageGroupCall.startRegister
        val modifierFieldDescriptor =
            "${modifierField.definingClass}->${modifierField.name}:${modifierField.type}"
        val lambdaDescriptor = lambdaReference.descriptor()
        pageMethod.addInstructions(
            pageGroupIndex,
            """
                sget-object v${start + 3}, $modifierFieldDescriptor
                invoke-static { v${start + 3} }, $PAGE_CONTENT->create(Ljava/lang/Object;)Lkotlin/jvm/functions/Function3;
                move-result-object v${start + 3}
                const v${start + 6}, 0x4d4f5250
                invoke-static { v${start + 6}, v${start + 3}, v${start + 4} }, $lambdaDescriptor
                move-result-object v${start + 3}
            """
        )
    }
}
