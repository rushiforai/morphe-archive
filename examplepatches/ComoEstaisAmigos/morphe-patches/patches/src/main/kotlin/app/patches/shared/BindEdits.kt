package app.adebisi.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * `setPackage("com.android.vending")` right after the Intent constructor, using the
 * constructor's string register, which the next instruction overwrites anyway.
 * [moveResult] inserts `move-result-object`. CKZ Origins keeps it; CK Zombies never
 * stored the result.
 */
internal fun makeBindExplicit(fingerprint: Fingerprint, moveResult: Boolean = true) {
    val constructor = fingerprint.instructionMatches[1]
    val call = constructor.getInstruction<FiveRegisterInstruction>()
    val intent = call.registerC
    val scratch = call.registerD
    val method = fingerprint.method
    val next = method.getInstruction(constructor.index + 1)
    if (next.opcode != Opcode.CONST_4 || (next as OneRegisterInstruction).registerA != scratch) {
        throw PatchException("${method.name}: v$scratch is still live after the Intent constructor")
    }
    val result = if (moveResult) "\n            move-result-object v$intent" else ""
    method.addInstructions(
        constructor.index + 1,
        """
            const-string v$scratch, "com.android.vending"
            invoke-virtual {v$intent, v$scratch}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;$result
        """,
    )
}
