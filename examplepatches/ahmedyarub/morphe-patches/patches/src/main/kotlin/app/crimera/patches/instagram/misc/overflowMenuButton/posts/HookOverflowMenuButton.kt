/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.posts

import app.crimera.patches.instagram.misc.download.MediaOptionsOverflowMenuCreatorConstructorFingerprint
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.FEED_OVERFLOW_MENU_BUTTON_CLASS
import app.crimera.utils.changeFirstString
import app.crimera.utils.classNameToExtension
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.library.instagram.patches.instagramExtensionPatch

@Suppress("unused")
val hookOverflowMenuButton =
    bytecodePatch(
        description = "This patch hooks array values initialisation in overflow menu button constructor.",
    ) {
        dependsOn(instagramExtensionPatch)
        dependsOn(includeButtonsInOverflowMenuArrayPatch, hookOverflowMenuButtonOnClickPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            val enumBtnClass = classNameToExtension(EnumButtonClassFingerprint.classDef.type)
            GetEnumButtonClassExtensionFingerprint.changeFirstString(enumBtnClass)

            MediaOptionsOverflowMenuCreatorConstructorFingerprint.classDef.apply {
                val addingFeedButtonMethodName = methods.first { it.parameters.size > 1 }.name
                AddFeedButtonExtensionFingerprint.changeFirstString(addingFeedButtonMethodName)
            }

            // The menu builder creates the option list, then reads and casts the menu's owner;
            // the hook goes right after the cast, handing the extension both.
            AddFeedButtonFingerprint.method.apply {
                val listCreation =
                    instructions.firstOrNull { instruction ->
                        val index = instruction.location.index
                        instruction.opcode == Opcode.NEW_INSTANCE &&
                            instruction.getReference<TypeReference>()?.type == "Ljava/util/ArrayList;" &&
                            getInstruction(index + 2).opcode == Opcode.IGET_OBJECT &&
                            getInstruction(index + 3).opcode == Opcode.CHECK_CAST
                    } ?: throw PatchException("The feed menu builder creates no option list")

                val arrayListRegister = getInstruction(listCreation.location.index + 1).registersUsed[0]
                val checkCastIndex = indexOfFirstInstruction(listCreation.location.index, Opcode.CHECK_CAST)
                val checkCastRegister = getInstruction(checkCastIndex).registersUsed[0]
                // Two unrelated registers cannot form a range, so the call is four-bit.
                if (maxOf(arrayListRegister, checkCastRegister) > 15) {
                    throw PatchException("The feed menu builder keeps its list above v15")
                }

                addInstructions(
                    checkCastIndex + 1,
                    """
                    invoke-static {v$checkCastRegister, v$arrayListRegister}, $FEED_OVERFLOW_MENU_BUTTON_CLASS->addFeedOverflowButton(Ljava/lang/Object;Ljava/util/ArrayList;)V
                    """.trimIndent(),
                )
            }
        }
    }
