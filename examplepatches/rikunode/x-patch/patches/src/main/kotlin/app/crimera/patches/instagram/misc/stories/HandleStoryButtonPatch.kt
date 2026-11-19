/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.stories

import app.crimera.patches.instagram.entity.decoder.MEDIA_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.util.getReference
import app.morphe.patcher.patch.bytecodePatch
import app.crimera.patches.shared.declaredParameterRegister
import app.crimera.patches.shared.parameterRegisterStart
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.library.instagram.patches.instagramExtensionPatch

// The method is obfuscated but this is where it adds buttons.
object AddStoryButtonFingerprint : Fingerprint(
    returnType = "[Ljava/lang/CharSequence;",
    strings = listOf("[INTERNAL] Pause Playback"),
    custom = { methodDef, _ ->
        methodDef.parameters.size == 1
    },
)

object SelfStoryAddStoryButtonFingerprint : Fingerprint(
    returnType = "[Ljava/lang/CharSequence;",
    strings = listOf("ReelOptionsOverflowHelper"),
)

// The method is obfuscated but this is where the onclick call executes.
internal object OnCLickStoryButtonFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore_viewer", "friendships/mute_friend_reel/%s/", "[INTERNAL] Pause Playback"),
)

internal object SelfStoryOnCLickStoryButtonFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("story_interactions/bulk_story_like/", "[INTERNAL] Pause Playback"),
)

val handleStoryButtonPatch =
    bytecodePatch(
        description = "This patch is used for handing button interaction on stories",
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(decoderEntity)
        execute {

            val STORY_BUTTON_EXTENSION_CLASS = "${PATCHES_DESCRIPTOR}/story/StoryButton;"
            // Add button on self story bottom sheet.
            //
            // piko looks for an if-eqz followed by an iget-object and takes whatever register the
            // instruction before it wrote. In 446 that is an iget-boolean, so the buttons were
            // appended to a boolean and the whole method failed to verify — the app crashed on
            // opening a story's options. The options list is instead taken from the toArray call
            // that builds the returned array, which is the list these buttons belong to by
            // definition.
            SelfStoryAddStoryButtonFingerprint.method.apply {
                val toArrayIndex =
                    instructions.indexOfFirst { instruction ->
                        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                            instruction.getReference<MethodReference>()?.name == "toArray"
                    }
                if (toArrayIndex < 0) throw PatchException("Could not find the story options list")

                val arrayListRegister = getInstruction(toArrayIndex).registersUsed[0]
                addInstructions(
                    toArrayIndex,
                    """
                    invoke-static/range { v$arrayListRegister .. v$arrayListRegister }, $STORY_BUTTON_EXTENSION_CLASS->addButtons(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$arrayListRegister
                    """.trimIndent(),
                )
            }

            // Add button on story bottom sheet: to the options list, the first ArrayList the method creates.
            AddStoryButtonFingerprint.method.apply {
                val listCreation =
                    instructions.firstOrNull { instruction ->
                        instruction.opcode == Opcode.INVOKE_STATIC &&
                            instruction.getReference<MethodReference>()?.returnType == "Ljava/util/ArrayList;"
                    } ?: throw PatchException("The story options builder creates no list")
                val moveResultIndex = listCreation.location.index + 1
                if (getInstruction(moveResultIndex).opcode != Opcode.MOVE_RESULT_OBJECT) {
                    throw PatchException("The story options list is not kept")
                }
                val arrayListRegister = getInstruction(moveResultIndex).registersUsed[0]

                addInstructions(
                    moveResultIndex + 1,
                    """
                    invoke-static/range { v$arrayListRegister .. v$arrayListRegister }, $STORY_BUTTON_EXTENSION_CLASS->addButtons(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$arrayListRegister
                    """.trimIndent(),
                )
            }

            val onClickFingerprints = listOf(SelfStoryOnCLickStoryButtonFingerprint, OnCLickStoryButtonFingerprint)
            onClickFingerprints.forEach { fingerprint ->
                fingerprint.method.apply {
                    val classDef = fingerprint.classDef
                    val reelItemClassName = "Lcom/instagram/model/reels/ReelItem;"
                    val appActivity = "Landroid/app/Activity;"
                    val charSequence = "Ljava/lang/CharSequence;"

                    val classFields = classDef.fields
                    val reelItemField = classFields.first { it.type == reelItemClassName }
                    val appActivityField = classFields.first { it.type == appActivity }
                    val reelItemMediaField =
                        classDefBy(reelItemClassName).fields.last { it.type == MEDIA_CLASS_NAME }

                    // Absolute registers, which account for a receiver if the method ever has one.
                    val characterSequenceRegister =
                        declaredParameterRegister(this, parameters.indexOfLast { it.type == charSequence })
                    val selfRegister = declaredParameterRegister(this, parameters.indexOfLast { it.type == classDef.type })

                    // v0 to v3 are free at the first instruction, provided the method has four locals.
                    if (parameterRegisterStart(this) < 4) {
                        throw PatchException("${fingerprint.javaClass.simpleName} has fewer than four locals")
                    }
                    addInstructionsWithLabels(
                        0,
                        """
                        move-object/from16 v0, v$characterSequenceRegister
                        move-object/from16 v1, v$selfRegister
                        
                        iget-object v2, v1, $appActivityField
                        iget-object v3, v1, $reelItemField
                        iget-object v3, v3, $reelItemMediaField
                        invoke-static {v0,v2,v3}, $STORY_BUTTON_EXTENSION_CLASS->storyButtonAction($charSequence Landroid/content/Context;Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :piko
                        return-void
                        """.trimIndent(),
                        ExternalLabel("piko", getInstruction(0)),
                    )
                }
            }
        }
    }
