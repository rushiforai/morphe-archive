package dev.utaa.linimal.patches.util

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload

/** [index] の命令が始まる code address。先頭からの codeUnits の総和です。 */
fun instructionAddress(instructions: List<Instruction>, index: Int): Int =
    instructions.take(index).sumOf { it.codeUnits }

/**
 * [index] の命令が単独で持つ分岐先の code address。`if-*` / `goto` のほか、`packed-switch` /
 * `sparse-switch` では payload そのものの address を返します。case の飛び先は payload 側にあるため、
 * ここではなく [branchTargetAddresses] で解決します。
 */
fun branchTargetAddress(instructions: List<Instruction>, index: Int): Int? {
    val branch = instructions.getOrNull(index) as? OffsetInstruction ?: return null
    return instructionAddress(instructions, index) + branch.codeOffset
}

/**
 * この method 内で分岐先になっている全ての code address。
 *
 * <p>`packed-switch` / `sparse-switch` の case 先は命令自身ではなく payload が持ちます。payload の
 * `SwitchElement.offset` は payload ではなく **switch 命令の address** を基準にするため、switch 命令の
 * address へ加えて解決します。case 先を数え落とすと、その case だけが注入コードを飛び越します。</p>
 */
fun branchTargetAddresses(instructions: List<Instruction>): Set<Int> {
    var address = 0
    val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }
    val indexByAddress = addresses.withIndex().associate { (index, value) -> value to index }

    val targets = mutableSetOf<Int>()
    instructions.forEachIndexed { index, instruction ->
        val branch = instruction as? OffsetInstruction ?: return@forEachIndexed
        val branchAddress = addresses[index]
        val target = branchAddress + branch.codeOffset
        targets += target

        val payload = indexByAddress[target]
            ?.let { payloadIndex -> instructions[payloadIndex] } as? SwitchPayload
            ?: return@forEachIndexed
        payload.switchElements.forEach { element -> targets += branchAddress + element.offset }
    }
    return targets
}

/**
 * dexlib2 の `addInstructions(index, ...)` は新しい MethodLocation を挿入し、既存 location は Label を
 * 保持したまま後ろへずれます。そのため注入位置が既存の分岐先や例外 handler の先頭と一致すると、
 * その経路だけが注入コードを飛び越します。全経路が通る必要のある注入では、この位置を拒否します。
 */
fun isDivertedInjectionIndex(
    instructions: List<Instruction>,
    index: Int,
    handlerAddresses: Set<Int> = emptySet(),
): Boolean {
    if (index !in instructions.indices) {
        return true
    }
    val address = instructionAddress(instructions, index)
    return address in handlerAddresses || address in branchTargetAddresses(instructions)
}

/**
 * [implementation] の [index] へ注入しても、分岐や例外経路が注入コードを飛び越さないかどうか。
 * その method への最初の注入より前に、注入前の命令列で判定します。
 */
fun isSafeInjectionIndex(implementation: MethodImplementation?, index: Int): Boolean =
    implementation != null &&
        !isDivertedInjectionIndex(implementation.instructions.toList(), index, exceptionHandlerAddresses(implementation))

/** 例外 handler の先頭 code address。注入位置がここと一致すると例外経路だけが注入を飛び越します。 */
fun exceptionHandlerAddresses(implementation: MethodImplementation): Set<Int> =
    implementation.tryBlocks
        .flatMap { block -> block.exceptionHandlers }
        .map { handler -> handler.handlerCodeAddress }
        .toSet()

/** 直後の命令へ制御が落ちる命令かどうか。落ちない命令の直後は注入しても実行されません。 */
fun fallsThrough(instruction: Instruction): Boolean = when (instruction.opcode) {
    Opcode.GOTO,
    Opcode.GOTO_16,
    Opcode.GOTO_32,
    Opcode.RETURN,
    Opcode.RETURN_VOID,
    Opcode.RETURN_VOID_BARRIER,
    Opcode.RETURN_VOID_NO_BARRIER,
    Opcode.RETURN_WIDE,
    Opcode.RETURN_OBJECT,
    Opcode.THROW,
    -> false
    else -> true
}
