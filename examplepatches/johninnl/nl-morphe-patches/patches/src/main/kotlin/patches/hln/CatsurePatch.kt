package patches.hln

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Both detached Catsure clients discard their responses. Keep local queue
 * publication/persistence and the shared device/radio/auth providers intact. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressCatsureUploads() {
    change("Lxr2;", "a(Lro;Ljava/lang/String;)V", STOP)
    val commit = exact("Ldd1;", "a(Lb54;)V").method
    val code = commit.instructions.toList()
    val publications = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == "Lq3g;" && ref.name == "m" &&
            ref.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") && ref.returnType == "Z"
    }
    val persistence = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lb54;" &&
            ref.name == "e" && ref.type == "Ljava/util/ArrayList;"
    }
    val deviceReads = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lqs;" && ref.name == "b" && ref.type == "Lwlg;"
    }
    val currentReads = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lb54;" &&
            ref.name == "a" && ref.type == "Ljava/lang/String;"
    }
    val taskConstructors = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == "Lib1;" && ref.name == "<init>" &&
            ref.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Lzs3;", "B")
    }
    val launches = code.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC && ref?.definingClass == "Lrw8;" && ref.name == "N" &&
            ref.parameterTypes == listOf("Lfw3;", "Lsv3;", "Ljw3;", "Lh17;", "I") && ref.returnType == "Ld2g;"
    }
    check(publications.size == 1 && persistence.size == 1 && deviceReads.size == 1 && currentReads.size == 1 &&
        launches.size == 2 && taskConstructors.size == 2) {
        "HLN local queue/Catsure/persistence boundaries changed"
    }
    val publish = publications.single()
    val resume = persistence.single()
    val current = currentReads.single()
    val upload = launches.filter { it.index > publish.index && it.index < resume.index }.singleOrNull()
        ?: error("HLN expected one detached Catsure queue launch before persistence")
    check(publish.index < deviceReads.single().index && deviceReads.single().index < upload.index &&
        launches.last().index > resume.index && code[upload.index + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        "HLN queue upload result or commit order changed"
    }
    check((publish.value as FiveRegisterInstruction).registerE == (resume.value as TwoRegisterInstruction).registerB) {
        "HLN local queue publication and persistence no longer use the same value"
    }
    // These original constants are also used by local persistence after the
    // upload block: retain selector=1 and launch-default mask=3 before skipping.
    val mask = code[current.index + 1]
    val selector = code[current.index + 2]
    val gateIndex = current.index + 3
    val gate = code[gateIndex]
    val persistenceTask = taskConstructors.filter { it.index > resume.index }.singleOrNull()
        ?: error("HLN local persistence coroutine constructor changed")
    check(current.index == publish.index + 1 && mask.opcode == Opcode.CONST_4 && selector.opcode == Opcode.CONST_4 &&
        (mask as NarrowLiteralInstruction).narrowLiteral == 3 && (selector as NarrowLiteralInstruction).narrowLiteral == 1 &&
        (mask as OneRegisterInstruction).registerA == (launches.last().value as FiveRegisterInstruction).registerG &&
        (selector as OneRegisterInstruction).registerA == (persistenceTask.value as FiveRegisterInstruction).registerG &&
        gate.opcode == Opcode.IF_EQZ && (gate as OneRegisterInstruction).registerA == (current.value as TwoRegisterInstruction).registerA &&
        (current.value as TwoRegisterInstruction).registerB == (publish.value as FiveRegisterInstruction).registerE) {
        "HLN queue persistence selector/mask/current-item register setup changed"
    }
    val addresses = code.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
    check(addresses[gateIndex] + (gate as OffsetInstruction).codeOffset == addresses[resume.index]) {
        "HLN original current-item branch no longer targets local persistence"
    }
    // The original null-current-item branch already bypasses this upload.
    // Resume at that same original persistence instruction for every commit.
    commit.addInstructionsWithLabels(gateIndex, "goto/16 :morpheQueuePersistence",
        ExternalLabel("morpheQueuePersistence", commit.getInstruction(resume.index)))
}
