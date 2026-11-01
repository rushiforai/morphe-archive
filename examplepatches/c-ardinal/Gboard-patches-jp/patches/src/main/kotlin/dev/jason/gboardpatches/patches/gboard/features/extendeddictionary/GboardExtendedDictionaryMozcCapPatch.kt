package dev.jason.gboardpatches.patches.gboard.features.extendeddictionary

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val MOZC_SHORTCUTS_UTIL = "Liis;"

internal const val MOZC_SHORTCUT_STOCK_CAP = 200_000
internal const val MOZC_SHORTCUT_PATCHED_CAP = 1_000_000
private const val MOZC_SHORTCUT_GUARD_WINDOW = 8

/** MozcShortcutsUtil: b() logs "Too many records" and c() truncates the import list. */
internal val EXTENDED_DICTIONARY_MOZC_CAP_TARGETS = listOf(
    GboardMethodTarget(
        MOZC_SHORTCUTS_UTIL,
        "b",
        listOf("Ljava/util/List;", "Lmjs;"),
        "Lwns;",
    ),
    GboardMethodTarget(MOZC_SHORTCUTS_UTIL, "c", listOf("Ljava/util/List;"), "V"),
)

internal val gboardExtendedDictionaryMozcCapPatch = bytecodePatch(
    description = "將 Gboard 匯入 Mozc 的個人字典上限由 200000 筆提高為 1000000 筆。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    execute {
        EXTENDED_DICTIONARY_MOZC_CAP_TARGETS.forEach { target ->
            findMutableMethodOrThrow(target).raiseMozcShortcutCap()
        }
    }
}

/**
 * Stock shape in both methods: one `const vN, 200000` whose register is compared by the first
 * branch within [MOZC_SHORTCUT_GUARD_WINDOW] instructions (`if-le vSize, vN` in 18.5.4; iis.b has
 * three `const-string` in between), with no write to vN before it. Anything else fails the patch.
 * In iis.c the same register is also the start index of subList(start, size).clear(), so the
 * truncation point moves to the patched cap together with the guard.
 */
internal fun MutableMethod.raiseMozcShortcutCap() {
    val instructions = implementation?.instructions?.toList()
        ?: error("$definingClass->$name has no implementation")
    val indices = instructions.indices.filter { index ->
        (instructions[index] as? NarrowLiteralInstruction)?.narrowLiteral == MOZC_SHORTCUT_STOCK_CAP
    }
    check(indices.size == 1) {
        "Expected exactly one $MOZC_SHORTCUT_STOCK_CAP literal in $definingClass->$name, " +
            "found ${indices.size}"
    }
    val index = indices.single()
    val constant = instructions[index]
    check(constant.opcode == Opcode.CONST) {
        "Unexpected ${constant.opcode} for the Mozc cap in $definingClass->$name"
    }
    val register = (constant as OneRegisterInstruction).registerA
    val windowEnd = minOf(instructions.size, index + 1 + MOZC_SHORTCUT_GUARD_WINDOW)
    val window = instructions.subList(index + 1, windowEnd)
    val guardAt = window.indexOfFirst { it is OffsetInstruction }
    val guard = window.getOrNull(guardAt)
    check(
        guard?.opcode == Opcode.IF_LE && (guard as TwoRegisterInstruction).registerB == register &&
            window.take(guardAt).none { it.writesRegister(register) },
    ) {
        "Mozc cap in $definingClass->$name is not followed by its if-le guard"
    }
    replaceInstruction(index, "const v$register, $MOZC_SHORTCUT_PATCHED_CAP")
}

private fun Instruction.writesRegister(register: Int): Boolean {
    val destination = (this as? OneRegisterInstruction)?.registerA
    return when {
        opcode.setsWideRegister() -> destination == null || destination == register || destination + 1 == register
        opcode.setsRegister() -> destination == null || destination == register
        else -> false
    }
}
