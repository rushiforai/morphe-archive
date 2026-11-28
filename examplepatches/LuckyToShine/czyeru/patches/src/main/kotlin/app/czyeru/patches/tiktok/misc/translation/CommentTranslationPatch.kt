package app.czyeru.patches.tiktok.misc.translation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.czyeru.util.getFreeRegisterProvider
import app.czyeru.util.getReference
import app.czyeru.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/czyeru/extension/tiktok/translation/CommentBatchTranslator;"

@Suppress("unused")
val commentTranslationPatch = bytecodePatch(
    name = "Translate comments",
    description = "Adds comment translation controls using TikTok's translation system, with selectable language exclusions.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/czyeru/extension/tiktok/settings/SettingsStatus;->enableCommentTranslation()V",
        )

        BaseCommentCellBindFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val managerMatch = instructions.withIndex().mapNotNull { (index, instruction) ->
                val field = instruction.getReference<FieldReference>()
                    ?: return@mapNotNull null
                if (instruction.opcode != Opcode.IPUT_OBJECT ||
                    field.type != "Lcom/ss/android/ugc/aweme/comment/model/Comment;" ||
                    instruction !is TwoRegisterInstruction
                ) {
                    return@mapNotNull null
                }

                val managerRegister = instruction.registerB
                var matchingWrites = 0
                var lastWriteIndex = index
                val searchEnd = (index + 6).coerceAtMost(instructions.lastIndex)
                for (candidateIndex in (index + 1)..searchEnd) {
                    val candidate = instructions[candidateIndex]
                    val candidateField = candidate.getReference<FieldReference>()
                    if (candidate.opcode == Opcode.IPUT_OBJECT &&
                        candidate is TwoRegisterInstruction &&
                        candidate.registerB == managerRegister &&
                        candidateField?.definingClass == field.definingClass
                    ) {
                        matchingWrites++
                        lastWriteIndex = candidateIndex
                    }
                }

                if (matchingWrites >= 2) lastWriteIndex to managerRegister else null
            }.lastOrNull() ?: throw PatchException(
                "Translate comments: could not locate initialized native comment translation manager.",
            )
            val (managerReadyIndex, managerRegister) = managerMatch
            val neededRegisters = if (managerRegister <= 15) 1 else 2
            val registers = getFreeRegisterProvider(
                managerReadyIndex + 1,
                neededRegisters,
                listOf(managerRegister),
            )
            val cellRegister = registers.getFreeRegister4Bit()
            val managerArgRegister = if (managerRegister <= 15) managerRegister else registers.getFreeRegister4Bit()
            val stageManager = if (managerRegister <= 15) "" else "move-object/from16 v$managerArgRegister, v$managerRegister\n"

            addInstructions(
                managerReadyIndex + 1,
                """
                    move-object/from16 v$cellRegister, p0
                    iget-object v$cellRegister, v$cellRegister, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
                    ${stageManager}invoke-static {v$cellRegister, v$managerArgRegister}, $EXTENSION_CLASS_DESCRIPTOR->registerCommentCell(Landroid/view/View;Ljava/lang/Object;)V
                """,
            )
        }

        CommentListLoadedFingerprint.method.apply {
            val responseReadyIndex = implementation!!.instructions.withIndex()
                .firstOrNull { (_, instruction) ->
                    instruction.getReference<FieldReference>()?.let { reference ->
                        reference.definingClass == "Lcom/ss/android/ugc/aweme/comment/model/CommentItemList;" &&
                            reference.name == "lazySplitItemsParseTask"
                    } == true
                }?.index ?: throw PatchException(
                "Translate comments: could not locate loaded comment list response.",
            )

            addInstruction(
                responseReadyIndex,
                "invoke-static {v0}, $EXTENSION_CLASS_DESCRIPTOR->onCommentListLoaded(Ljava/lang/Object;)V",
            )
        }

        MultiCommentTranslationStartFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS_DESCRIPTOR->onNativeBatchStart(Ljava/lang/Object;Ljava/lang/Object;Z)V
            """,
        )

        MultiCommentTranslationCompleteFingerprint.matchAll().forEach { match ->
            match.method.addInstructions(
                0,
                """
                    invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onNativeBatchComplete(Ljava/lang/Object;)V
                """,
            )
        }
    }
}
