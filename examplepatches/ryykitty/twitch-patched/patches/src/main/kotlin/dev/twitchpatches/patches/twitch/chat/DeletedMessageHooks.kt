package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.uniqueHook

internal fun enableDeletedMessageAccess(method: MutableMethod, access: FieldReference, expectedReads: Int) {
    val reads = method.code().withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_BOOLEAN && (instruction as ReferenceInstruction).reference == access
    }.map { it.index }
    if (reads.size != expectedReads) throw PatchException("Twitch deleted messages: access read count changed in ${method.name}.")
    // Preserve Twitch's access flag so disabling the preference restores native permissions.
    reads.asReversed().forEach { index ->
        val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
        val next = method.code().getOrNull(index + 1)
            ?: throw PatchException("Twitch deleted messages: access read has no continuation.")
        method.addInstructionsWithLabels(index + 1, """
            if-nez v$register, :keep_access
            invoke-static {}, $DELETED_POLICY->enabled()Z
            move-result v$register
        """, ExternalLabel("keep_access", next))
    }
}

internal fun restoreDeletedMessageFormatter(method: MutableMethod, original: FieldReference) {
    val code = method.code()
    val span = original.definingClass
    val call = code.withIndex().filter { (_, instruction) ->
        val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL && target?.definingClass == "Landroid/text/SpannedString;" &&
            target.name == "getSpans" && target.parameterTypes.map { it.toString() } == listOf("I", "I", "Ljava/lang/Class;")
    }.filter { (index, instruction) ->
        val invoke = instruction as FiveRegisterInstruction
        val definition = code.take(index).lastOrNull { candidate -> candidate.opcode.setsRegister() &&
            (candidate as? OneRegisterInstruction)?.registerA == invoke.registerF }
        definition?.opcode == Opcode.CONST_CLASS &&
            ((definition as ReferenceInstruction).reference as TypeReference).type == span
    }.uniqueHook("deleted message span array")
    val index = call.index + 4
    val result = code.getOrNull(call.index + 1) as? OneRegisterInstruction
    val cast = code.getOrNull(call.index + 2)
    val check = (code.getOrNull(call.index + 3) as? ReferenceInstruction)?.reference as? MethodReference
    val length = code.getOrNull(index) as? TwoRegisterInstruction
    val input = requireNotNull(method.implementation).registerCount - method.parameters.size + 1
    val invoke = call.value as FiveRegisterInstruction
    if (code.getOrNull(call.index + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT || result == null ||
        cast?.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != result.registerA ||
        ((cast as ReferenceInstruction).reference as TypeReference).type != "[$span" ||
        check?.definingClass != "Ljava/lang/Object;" || check.name != "getClass" ||
        code.getOrNull(index)?.opcode != Opcode.ARRAY_LENGTH || length?.registerB != result.registerA ||
        invoke.registerCount != 4 || invoke.registerC != input || input > 15) {
        throw PatchException("Twitch deleted messages: formatter array flow changed.")
    }
    val array = result.registerA
    val scratch = method.getFreeRegisterProvider(index, 1, array, input).getFreeRegister4Bit()
    // Rebuild placeholder spans with the row's current dispatcher; their stored dispatcher can be null.
    method.addInstructionsWithLabels(index, """
        invoke-static {}, $DELETED_POLICY->enabled()Z
        move-result v$scratch
        if-eqz v$scratch, :stock_array
        array-length v$scratch, v$array
        if-eqz v$scratch, :stock_array
        const/4 v$scratch, 0x0
        aget-object v$scratch, v$array, v$scratch
        iget-object v$scratch, v$scratch, $original
        if-eqz v$scratch, :stock_array
        move-object v$input, v$scratch
        const/4 v$scratch, 0x0
        new-array v$array, v$scratch, [$span
    """, ExternalLabel("stock_array", method.getInstruction(index)))
}
