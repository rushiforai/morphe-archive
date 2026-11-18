// Adapted from Hooman's patches (GPL-3.0); see NOTICE.
package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.freeLocalAt
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.registerDeadAt
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge

private const val BUILDER = "Landroid/text/SpannableStringBuilder;"

@Suppress("unused")
val showDeletedMessagesPatch = bytecodePatch(
    name = "Show deleted messages",
    description = "Keeps deleted or moderated chat messages readable instead of replacing them with " +
        "\"<message deleted>\". The message turns into a tappable spoiler: tap it to reveal the original " +
        "text. Only text already received by this client can be revealed.",
) {
    compatibleWith(io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED)
    dependsOn(io.github.sabopura.morphe.patches.twitch.ui.nativeTheatrePatch)
    extendWith(TWITCH_EXTENSION)

    execute {
        replaceBridge(LINE_HOOKS, "deletedMessagesPatched", """
            const/4 v0, 0x1
            return v0
        """)
        val spanClass = mutableClassDefBy(DeletedMessageSpanCtorFingerprint.classDef)
        val spanType = spanClass.type
        val accessField = spanClass.fields.singleOrNull { field -> field.type == "Z" }
            ?: throw PatchException("Twitch deleted messages: access flag field was not found uniquely.")
        val originalMessageField = spanClass.fields.singleOrNull { field ->
            field.type == "Landroid/text/SpannedString;"
        } ?: throw PatchException(
            "Twitch deleted messages: original-message field was not found uniquely.",
        )

        // A newly created span must always be active. The constructor has no locals, so reuse its
        // boolean parameter after the stock field write and overwrite that field before return.
        val constructor = DeletedMessageSpanCtorFingerprint.method
        constructor.addInstructions(
            constructor.instructions.lastIndex,
            """
                const/4 p3, 0x1
                iput-boolean p3, p0, $accessField
            """,
        )

        // Twitch builds the first placeholder span with a null dispatcher. The formatter sees that span,
        // takes a fast path and returns it unchanged, even though it received the live dispatcher.
        // Recover the original message from the dead span and jump into its normal rebuild path.
        val formatter = DeletedMessageFormatterFingerprint.method
        val formatterInstructions = formatter.instructions
        val getSpansIndex = formatterInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/text/SpannedString;" &&
                reference.name == "getSpans" &&
                reference.returnType == "[Ljava/lang/Object;"
        }
        if (getSpansIndex < 0) throw PatchException("Twitch deleted messages: span lookup was not found.")
        val arrayLengthIndex = formatterInstructions.indices.firstOrNull { index ->
            index > getSpansIndex && formatterInstructions[index].opcode == Opcode.ARRAY_LENGTH
        } ?: throw PatchException(
            "Twitch deleted messages: existing-span array check was not found.",
        )
        val spanClassRegister = formatterInstructions.take(arrayLengthIndex)
            .lastOrNull { instruction ->
                instruction.opcode == Opcode.CONST_CLASS &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == spanType
            } as? OneRegisterInstruction
            ?: throw PatchException(
                "Twitch deleted messages: span class register was not found.",
            )
        val arrayLength = formatter.getInstruction<TwoRegisterInstruction>(arrayLengthIndex)
        val arrayRegister = arrayLength.registerB
        val scratchRegister = spanClassRegister.registerA
        if (arrayRegister == scratchRegister || !registerDeadAt(formatter, arrayLengthIndex, scratchRegister)) {
            throw PatchException("Twitch deleted messages: formatter has no free scratch register.")
        }
        formatter.addInstructionsWithLabels(
            arrayLengthIndex,
            """
                array-length v$scratchRegister, v$arrayRegister
                if-eqz v$scratchRegister, :use_stock_array
                const/4 v$scratchRegister, 0x0
                aget-object v$scratchRegister, v$arrayRegister, v$scratchRegister
                iget-object p1, v$scratchRegister, $originalMessageField
                const/4 p4, 0x1
                const/4 v$scratchRegister, 0x0
                new-array v$arrayRegister, v$scratchRegister, [$spanType
            """,
            ExternalLabel("use_stock_array", formatter.getInstruction(arrayLengthIndex)),
        )

        // The row state can later write false back to the span. Force the span's reads of the access field
        // so onClick keeps dispatching and updateDrawState keeps the placeholder visibly clickable.
        val accessReads = spanClass.methods.flatMap { method ->
            method.instructions.withIndex().mapNotNull { (index, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (instruction.opcode == Opcode.IGET_BOOLEAN && reference == accessField) {
                    method to index
                } else {
                    null
                }
            }
        }
        if (accessReads.isEmpty()) {
            throw PatchException("Twitch deleted messages: access flag is no longer read by the span.")
        }
        accessReads.groupBy({ it.first }, { it.second }).forEach { (method, indexes) ->
            indexes.sortedDescending().forEach { index ->
                val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
                if (register > 0xf) {
                    throw PatchException(
                        "Twitch deleted messages: access-flag register no longer fits const/4.",
                    )
                }
                method.addInstructions(index + 1, "const/4 v$register, 0x1")
            }
        }

        strikethroughDisplay(formatter)
        ignoreChatClears()
    }
}

/**
 * Right where Twitch starts the placeholder line, the original line and the end of its name are at hand.
 * The strikethrough display returns the line itself from there; the spoiler goes on as before.
 */
private fun strikethroughDisplay(formatter: MutableMethod) {
    val code = formatter.instructions.toList()
    val build = code.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT && reference?.definingClass == BUILDER && reference.name == "<init>" &&
            reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;", "I", "I")
    }
    if (build < 1 || code[build - 1].opcode != Opcode.NEW_INSTANCE ||
        (code[build - 1] as ReferenceInstruction).reference.toString() != BUILDER)
        throw PatchException("Twitch deleted messages: the placeholder line prefix moved.")
    val prefix = code[build] as FiveRegisterInstruction
    val line = prefix.registerD
    val bodyStart = prefix.registerF
    val scratch = (code[build - 1] as OneRegisterInstruction).registerA
    if (scratch == line || scratch == bodyStart) throw PatchException("Twitch deleted messages: no free register for the strikethrough display.")
    formatter.insertBeforeKeepingLabels(build - 1, """
        invoke-static {v$line, v$bodyStart}, $LINE_HOOKS->deletedLine(Landroid/text/SpannedString;I)Landroid/text/Spanned;
        move-result-object v$scratch
        if-eqz v$scratch, :spoiler
        return-object v$scratch
        :spoiler
        nop
    """)
}

/**
 * CLEARCHAT without a target user is a moderator clearing the whole chat. Returns the parser's own "nothing
 * to do" result for it; timeouts and bans, which carry a target user, go on as usual.
 */
private fun BytecodePatchContext.ignoreChatClears() {
    val method = IrcEventParserFingerprint.method
    val code = method.instructions.toList()
    val nothing = code.firstNotNullOfOrNull { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        field?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass && classDefBy(it.type).superclass == method.returnType }
    } ?: throw PatchException("Twitch deleted messages: the IRC parser has no unhandled result.")
    val targetUser = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "target-user-id" }
    if (targetUser < 0) throw PatchException("Twitch deleted messages: unexpected chat clear flow.")
    val clear = (targetUser until code.size).firstOrNull { index ->
        val field = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
        code[index].opcode == Opcode.SGET_OBJECT && field != null && field.type == field.definingClass
    } ?: throw PatchException("Twitch deleted messages: no chat clear event.")
    // Up to 31.9.0 a goto follows the clear target; 32.0.0 falls through into the event constructor, whose
    // label the timeout and ban targets jump to. Code put right after the clear runs for the clear alone.
    val next = clear + 1
    val scratch = freeLocalAt(method, next) ?: throw PatchException("Twitch deleted messages: no free register after the chat clear.")
    method.addInstructionsWithLabels(next, """
        invoke-static {}, $LINE_HOOKS->ignoreChatClears()Z
        move-result v$scratch
        if-eqz v$scratch, :keep
        sget-object v$scratch, $nothing
        return-object v$scratch
    """, ExternalLabel("keep", code[next]))
}
