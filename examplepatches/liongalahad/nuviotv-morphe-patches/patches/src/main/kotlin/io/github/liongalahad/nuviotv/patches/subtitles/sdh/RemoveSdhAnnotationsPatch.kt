package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import org.w3c.dom.Element

private const val CUE_TRANSFORMER =
    "Lio/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer;"
private const val CUE_GROUP = "Landroidx/media3/common/text/CueGroup;"
private const val CATEGORY_METADATA =
    "io.github.liongalahad.nuviotv.settings.category.subtitles"

private val sdhCategoryResourcePatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", CATEGORY_METADATA)
                setAttribute("android:value", "true")
            })
        }
    }
}

@Suppress("unused")
val removeSdhAnnotationsPatch = bytecodePatch(
    name = "Remove SDH Annotations",
    description = "Adds Settings → Morphe → Subtitles and removes SDH annotations from Media3 subtitles when enabled.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch, sdhCategoryResourcePatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(CueGroupOutputFingerprint, LegacyCueOutputFingerprint).forEach {
            it.matchAll(1..1)
        }

        fun MutableMethod.hook(parameter: String, returnType: String) = addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $CUE_TRANSFORMER->clean($parameter)$returnType
                move-result-object p1
            """
        )

        CueGroupOutputFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val cueListRead = instructions.withIndex().single { (_, instruction) ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@single false
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@single false
                reference.definingClass == CUE_GROUP
            }
            val listRegister = (cueListRead.value as? TwoRegisterInstruction)?.registerA
                ?: error("CueGroup cue-list read has no destination register")
            check(listRegister == 0 && implementation!!.registerCount >= 7) {
                "CueGroup callback no longer exposes the expected safe scratch registers"
            }
            val presentationTimeField = instructions.mapNotNull { instruction ->
                if (instruction.opcode != Opcode.IGET_WIDE) return@mapNotNull null
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }.single { reference ->
                reference.definingClass == CUE_GROUP && reference.type == "J"
            }
            val presentationTimeDescriptor = buildString {
                append(presentationTimeField.definingClass)
                    .append("->")
                    .append(presentationTimeField.name)
                    .append(":")
                    .append(presentationTimeField.type)
            }

            val constructorIndex = CueGroupOutputFingerprint.instructionMatches.first().index
            val constructorInstruction = getInstruction<com.android.tools.smali.dexlib2.iface.instruction.Instruction>(
                constructorIndex
            )
            val reconstructedListRegister = when (constructorInstruction) {
                is FiveRegisterInstruction -> constructorInstruction.registerD
                is RegisterRangeInstruction -> constructorInstruction.startRegister + 1
                else -> error("CueGroup constructor call uses an unsupported instruction format")
            }
            addInstructions(
                constructorIndex,
                """
                    invoke-static { v$reconstructedListRegister }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$reconstructedListRegister
                """
            )

            // Nuvio normally forwards the original CueGroup without executing its own
            // reconstruction branch. Rebuild p1 here only when cleanup changed the list,
            // while leaving Nuvio's statically typed local untouched for bytecode verification.
            // The conditional reconstruction path is cleaned separately above.
            addInstructionsWithLabels(
                cueListRead.index + 1,
                """
                    invoke-static { v$listRegister }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v1
                    if-eq v$listRegister, v1, :morphe_sdh_group_unchanged
                    iget-wide v2, p1, $presentationTimeDescriptor
                    new-instance v4, $CUE_GROUP
                    invoke-direct { v4, v1, v2, v3 }, $CUE_GROUP-><init>(Ljava/util/List;J)V
                    move-object p1, v4
                    :morphe_sdh_group_unchanged
                    nop
                """
            )
        }
        LegacyCueOutputFingerprint.method.hook("Ljava/util/List;", "Ljava/util/List;")
    }
}
