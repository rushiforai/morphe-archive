package io.github.bakwudo.uyu.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

private const val SUPPORT = "Lapp/morphe/extension/twitch/chat/DeletedMessagesSupport;"
private const val SPANNED_STRING = "Landroid/text/SpannedString;"

internal val showDeletedMessagesPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        val spanClass = mutableClassDefBy(DeletedMessageSpanCtorFingerprint.classDef)

        val accessField = spanClass.fields.singleOrNull { field -> field.type == "Z" }
            ?: throw PatchException("Twitch deleted messages: access flag field was not found uniquely.")

        spanClass.fields.singleOrNull { field ->
            field.type == SPANNED_STRING
        } ?: throw PatchException("Twitch deleted messages: original-message field was not found uniquely.")

        val constructor = DeletedMessageSpanCtorFingerprint.method
        constructor.addInstructions(
            constructor.instructions.lastIndex,
            """
                invoke-static {p3}, $SUPPORT->resolveAccess(Z)Z
                move-result p3
                iput-boolean p3, p0, $accessField
            """,
        )

        val formatter = DeletedMessageFormatterFingerprint.method
        val formatterInstructions = formatter.instructions

        val getSpansIndex = formatterInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == SPANNED_STRING &&
                reference.name == "getSpans" &&
                reference.returnType == "[Ljava/lang/Object;"
        }

        if (getSpansIndex < 0) {
            throw PatchException("Twitch deleted messages: formatter getSpans call was not found.")
        }

        val getSpans = formatterInstructions[getSpansIndex] as? FiveRegisterInstruction
            ?: throw PatchException("Twitch deleted messages: formatter getSpans invocation is not five-register form.")

        if (getSpans.registerCount != 4) {
            throw PatchException(
                "Twitch deleted messages: formatter getSpans expected 4 arguments, found ${getSpans.registerCount}.",
            )
        }

        val moveResultIndex = formatterInstructions.indices.firstOrNull { index ->
            index > getSpansIndex && formatterInstructions[index].opcode == Opcode.MOVE_RESULT_OBJECT
        } ?: throw PatchException(
            "Twitch deleted messages: formatter getSpans move-result-object was not found.",
        )

        val spanArrayRegister =
            formatter.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

        val injectionIndex = formatterInstructions.indices.firstOrNull { index ->
            index > moveResultIndex && formatterInstructions[index].opcode == Opcode.CHECK_CAST
        }?.let { checkCastIndex ->
            formatterInstructions.indices.firstOrNull { index ->
                index > checkCastIndex && formatterInstructions[index].opcode == Opcode.ARRAY_LENGTH
            }
        } ?: throw PatchException(
            "Twitch deleted messages: formatter span-array length check was not found.",
        )

        val getSpansRegisterC = getSpans.registerC
        val getSpansRegisterF = getSpans.registerF

        if (spanArrayRegister == getSpansRegisterF) {
            throw PatchException(
                "Twitch deleted messages: getSpans result register aliases its Class argument register.",
            )
        }

        val classRegisterRestore = formatterInstructions
            .subList(0, getSpansIndex)
            .indexOfLast { instruction ->
                instruction.opcode == Opcode.CONST_CLASS &&
                    (instruction as? OneRegisterInstruction)?.registerA == getSpansRegisterF
            }

        if (classRegisterRestore < 0) {
            throw PatchException(
                "Twitch deleted messages: could not locate the getSpans Class-register initializer.",
            )
        }

        val classInit = formatterInstructions[classRegisterRestore] as ReferenceInstruction
        val classType = (classInit.reference as? TypeReference)?.type
            ?: throw PatchException(
                "Twitch deleted messages: getSpans Class-register initializer is not a type reference.",
            )

        // Keep Twitch's original span array intact. Use only its Class-argument register as
        // scratch space, and restore that register on every path that continues into Twitch.
        // This avoids the old implementation's second getSpans invocation and avoids clobbering
        // the formatter's message/array registers.
        formatter.addInstructionsWithLabels(
            injectionIndex,
            """
                array-length v$getSpansRegisterF, v$spanArrayRegister
                if-eqz v$getSpansRegisterF, :kizu_deleted_messages_restore
                const-class v$getSpansRegisterF, ${DeletedMessageSpanCtorFingerprint.classDef.type}
                invoke-static {v$getSpansRegisterC, v$spanArrayRegister, v$getSpansRegisterF}, $SUPPORT->recoverDeletedMessage(Landroid/text/SpannedString;[Ljava/lang/Object;Ljava/lang/Class;)Landroid/text/SpannedString;
                move-result-object v$getSpansRegisterF
                if-nez v$getSpansRegisterF, :kizu_deleted_messages_return
                :kizu_deleted_messages_restore
                const-class v$getSpansRegisterF, $classType
                goto :kizu_deleted_messages_continue
                :kizu_deleted_messages_return
                return-object v$getSpansRegisterF
                :kizu_deleted_messages_continue
                nop
            """,
        )
    }
}
