/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.posts

import app.crimera.patches.instagram.utils.Constants.FEED_OVERFLOW_MENU_BUTTON_CLASS
import app.crimera.patches.instagram.utils.Constants.MEDIA_OPTIONS_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode

context(patchContext: BytecodePatchContext)
fun addOverflowMenuButtonAttributes(
    buttonEnumTag: String,
    extensionMethodName: String,
) {
    OverflowMenuButtonEnumInitialiser.apply {
        val classFields = classDef.fields
        val field =
            classFields
                .first { it.type == MEDIA_OPTIONS_CLASS }
                .toMutable()
        field.name = buttonEnumTag
        classFields.add(field)

        method.apply {
            // Created and stored just before the enum collects its values, so the option exists
            // by the time the values array (see includeButtonsInOverflowMenuArrayPatch) takes it.
            val collectValues =
                instructions.firstOrNull { instruction ->
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        instruction.getReference<MethodReference>()?.name == "\$values"
                } ?: throw PatchException("The media option enum never collects its values")
            val register = findFreeRegister(collectValues.location.index)

            addInstructions(
                collectValues.location.index,
                """
                invoke-static {}, $FEED_OVERFLOW_MENU_BUTTON_CLASS->$extensionMethodName()$MEDIA_OPTIONS_CLASS
                move-result-object v$register
                sput-object v$register, $MEDIA_OPTIONS_CLASS->$buttonEnumTag:$MEDIA_OPTIONS_CLASS
                """.trimIndent(),
            )
        }
    }
}
