/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 * Modified by lavinhoque33, 2026-11-10
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.morphe.patches.youtube.general.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.Utils.printWarn
import app.morphe.util.isConditionalBranchInstruction
import app.morphe.util.isReturnInstruction
import app.morphe.util.isSwitchInstruction
import app.morphe.util.isUnconditionalBranchInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Port of Morphe's control-flow-aware literal override, restricted to navigation feature flags.
 * A flag literal can be reused by several calls and across branches. The first linear move-result
 * need not even belong to a flag call, so overriding only that result leaves layout readers unchanged.
 */
internal fun MutableMethod.overrideNavigationFeatureFlag(flag: Long, extensionMethod: String): Int {
    val instructions = implementation?.instructions?.toList() ?: return 0
    val offsets = IntArray(instructions.size)
    var offset = 0
    instructions.forEachIndexed { index, instruction ->
        offsets[index] = offset
        offset += instruction.codeUnits
    }

    fun targetIndex(branchIndex: Int): Int {
        val branch = instructions[branchIndex] as OffsetInstruction
        return offsets.indexOf(offsets[branchIndex] + branch.codeOffset)
    }

    val results = sortedSetOf<Int>(reverseOrder())
    var foundLiteral = false
    instructions.forEachIndexed { literalIndex, literal ->
        if ((literal as? WideLiteralInstruction)?.wideLiteral != flag) return@forEachIndexed
        foundLiteral = true
        val register = (literal as OneRegisterInstruction).registerA
        val registerEnd = register + if (literal.opcode.setsWideRegister()) 1 else 0
        val visited = BooleanArray(instructions.size)
        val queue = ArrayDeque<Int>()
        queue.add(literalIndex + 1)

        while (queue.isNotEmpty()) {
            val index = queue.removeFirst()
            if (index !in instructions.indices || visited[index]) continue
            visited[index] = true
            val instruction = instructions[index]

            // Stop when either half of the literal is overwritten, including an overlapping wide write.
            if (instruction.opcode.setsRegister()) {
                val written = (instruction as OneRegisterInstruction).registerA
                val writtenEnd = written + if (instruction.opcode.setsWideRegister()) 1 else 0
                if (written <= registerEnd && register <= writtenEnd) continue
            }

            val reference = instruction.getReference<MethodReference>()
            if (reference?.returnType == "Z" && reference.parameterTypes.any { it.toString() == "J" }
                && register in instruction.registersUsed
                && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
            ) {
                results.add(index + 1)
            }

            when {
                instruction.isUnconditionalBranchInstruction -> queue.add(targetIndex(index))
                instruction.isConditionalBranchInstruction -> {
                    queue.add(index + 1)
                    queue.add(targetIndex(index))
                }
                instruction.isSwitchInstruction -> {
                    queue.add(index + 1)
                    val payload = instructions.getOrNull(targetIndex(index)) as? SwitchPayload
                    payload?.switchElements?.forEach { element ->
                        queue.add(offsets.indexOf(offsets[index] + element.offset))
                    }
                }
                !instruction.isReturnInstruction -> queue.add(index + 1)
            }
        }
    }

    if (foundLiteral && results.isEmpty()) {
        printWarn("Navigation flag $flag has no supported boolean read in $this; keeping the app value.")
    }

    var inserted = 0
    results.forEach { index ->
        if (instructions.getOrNull(index + 1)?.getReference<MethodReference>()?.toString() == extensionMethod) {
            return@forEach
        }
        val register = (instructions[index] as OneRegisterInstruction).registerA
        val invoke = if (register < 16) "invoke-static { v$register }"
            else "invoke-static/range { v$register .. v$register }"
        addInstructions(index + 1, "$invoke, $extensionMethod\nmove-result v$register")
        inserted++
    }
    return inserted
}
