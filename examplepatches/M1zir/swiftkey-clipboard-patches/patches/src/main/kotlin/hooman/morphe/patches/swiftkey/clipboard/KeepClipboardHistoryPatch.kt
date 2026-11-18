package hooman.morphe.patches.swiftkey.clipboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import hooman.morphe.patches.swiftkey.swiftKeyCompatibility

private val clipboardItemClass = Fingerprint(
    definingClass = "Lu90/v;",
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("LocalClipboardItem(text=", ", isAutoAdded=", ", isPinned="),
)
private val clipboardExpiry = Fingerprint(
    classFingerprint = clipboardItemClass,
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("J"),
)
private val clipboardOrdering = Fingerprint(
    classFingerprint = clipboardItemClass,
    name = "compareTo",
    returnType = "I",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("other"),
)

/**
 * Original Microsoft 9.13.19.3 ARM64 APK inspected 2026-11-10.
 * LocalClipboardItem.b(now) is the age predicate used by save-time cleanup.
 * Keep the surrounding cleanup: it also implements explicit user deletion.
 * The local ArrayList and sk_clipboard.json reader/writer have no count cap.
 */
@Suppress("unused")
val keepClipboardHistoryPatch = bytecodePatch(
    name = "Keep clipboard history forever",
    description = "Keeps local clipboard entries beyond one hour until you delete them. " +
        "Preserves pinning and manual deletion, and fixes sorting of entries weeks apart. " +
        "No artificial local history count limit is added; storage and memory remain finite. " +
        "Does not extend cloud clipboard history or recover already expired entries.",
) {
    compatibleWith(swiftKeyCompatibility)
    execute {
        // Validate BOTH methods before changing either.
        val expiry = clipboardExpiry.method
        val ordering = clipboardOrdering.method
        val age = expiry.instructions.toList()
        val order = ordering.instructions.toList()
        fun referenceAt(index: Int) = (age.getOrNull(index) as? ReferenceInstruction)?.reference?.toString()
        if (age.map { it.opcode } != listOf(
                Opcode.SGET_OBJECT, Opcode.SGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT_WIDE, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_WIDE,
                Opcode.SUB_LONG_2ADDR, Opcode.IGET_WIDE, Opcode.CMP_LONG, Opcode.CONST_4,
                Opcode.IF_GEZ, Opcode.MOVE, Opcode.GOTO, Opcode.MOVE, Opcode.IGET_BOOLEAN,
                Opcode.IF_NEZ, Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.IF_EQZ,
                Opcode.RETURN, Opcode.RETURN,
            ) || referenceAt(1) != "Ltm0/c;->f:Ltm0/c;" ||
            referenceAt(3) != "Ltm0/f;->o(ILtm0/c;)J" ||
            referenceAt(5) != "Ltm0/a;->d(J)J" ||
            referenceAt(8) != "Lu90/v;->g:J" || referenceAt(15) != "Lu90/v;->h:Z" ||
            referenceAt(17) != "Lu90/v;->d:Z" || expiry.implementation!!.registerCount < 4
        ) throw PatchException("SwiftKey clipboard expiry code differs from verified 9.13.19.3; refusing to patch.")

        if (order.map { it.opcode } != listOf(
                Opcode.CHECK_CAST, Opcode.CONST_STRING, Opcode.INVOKE_STATIC,
                Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.IGET_BOOLEAN, Opcode.IF_NEZ,
                Opcode.CONST_4, Opcode.RETURN, Opcode.IF_NEZ, Opcode.IGET_BOOLEAN,
                Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN, Opcode.IGET_WIDE,
                Opcode.IGET_WIDE, Opcode.SUB_LONG_2ADDR, Opcode.LONG_TO_INT, Opcode.RETURN,
            ) || (order[14] as? ReferenceInstruction)?.reference?.toString() != "Lu90/v;->g:J" ||
            (order[15] as? ReferenceInstruction)?.reference?.toString() != "Lu90/v;->g:J"
        ) throw PatchException("SwiftKey clipboard ordering code differs from verified 9.13.19.3; refusing to patch.")

        val subtract = order[16] as TwoRegisterInstruction
        val narrow = order[17] as TwoRegisterInstruction
        if (narrow.registerB != subtract.registerA) {
            throw PatchException("SwiftKey clipboard timestamp register flow changed; refusing to patch.")
        }
        // No huge timeout: false avoids timestamp arithmetic overflow.
        // v0 is a verified local, so parameters/register allocation stay unchanged.
        expiry.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Stock (int)(other.time - this.time) misorders clips ~25 days apart.
        // Compare without overflow; keep existing pinned-first branches.
        ordering.replaceInstruction(16,
            "cmp-long v${narrow.registerA}, v${subtract.registerA}, v${subtract.registerB}")
        ordering.replaceInstruction(17, "nop")
    }
}
