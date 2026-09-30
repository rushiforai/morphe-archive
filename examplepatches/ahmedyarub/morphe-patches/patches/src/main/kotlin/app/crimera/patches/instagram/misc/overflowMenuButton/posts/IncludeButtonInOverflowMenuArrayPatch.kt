/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.posts

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.FEED_OVERFLOW_MENU_BUTTON_CLASS
import app.crimera.patches.instagram.utils.Constants.MEDIA_OPTIONS_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.library.instagram.patches.instagramExtensionPatch

@Suppress("unused")
val includeButtonsInOverflowMenuArrayPatch =
    bytecodePatch(
        description = "This patch hooks array values initialisation in overflow menu button constructor.",
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            OverflowMenuButtonEnumInitialiser.method.apply {
                // The store of the enum's values array: the patch's buttons are appended to the
                // array just before it is stored, and so before the entries are built from it.
                val valuesStore =
                    instructions.firstOrNull { instruction ->
                        instruction.opcode == Opcode.SPUT_OBJECT &&
                            instruction.getReference<FieldReference>()?.name == "\$VALUES"
                    } ?: throw PatchException("The media option enum never stores its values")
                val arrayRegister = valuesStore.registersUsed[0]

                addInstructions(
                    valuesStore.location.index,
                    """
                    invoke-static {}, $FEED_OVERFLOW_MENU_BUTTON_CLASS->addToMenuOptionArray()[$MEDIA_OPTIONS_CLASS
                    move-result-object v$arrayRegister
                    """.trimIndent(),
                )
            }
        }
    }
