package app.revanced.patches.rif.comments

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/revanced/extension/rif/ReplyBoxFix;"

private fun isSetSoftInputMode(insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction): Boolean {
    if (insn.opcode != Opcode.INVOKE_VIRTUAL) return false
    val ref = (insn as ReferenceInstruction).reference as? MethodReference ?: return false
    return ref.definingClass == "Landroid/view/Window;" && ref.name == "setSoftInputMode"
}

// rif's dialog base class sets its window's soft input mode in a private no-argument method
// run from onStart (free t2.c.F4 / Platinum u2.c.u4). Matched by shape: the only private
// ()V method that calls Window.setSoftInputMode (the other caller is static with arguments).
internal val dialogSoftInputFingerprint = fingerprint {
    accessFlags(AccessFlags.PRIVATE)
    returns("V")
    parameters()
    custom { method, _ ->
        method.implementation?.instructions?.any(::isSetSoftInputMode) == true
    }
}

@Suppress("unused")
val keepReplyBoxAboveKeyboardPatch = bytecodePatch(
    name = "Keep reply box above keyboard",
    description = "Keeps the reply box unobscured above the keyboard.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val method = dialogSoftInputFingerprint.method
        val index = method.instructions.indexOfFirst(::isSetSoftInputMode)
        if (index < 0) throw PatchException("setSoftInputMode call not found")
        // invoke-virtual {window, mode}: the window is the first register (v0 in both builds).
        val window = (method.instructions.elementAt(index) as FiveRegisterInstruction).registerC
        method.addInstructions(
            index + 1,
            "invoke-static { v$window }, $EXTENSION->onDialogStart(Landroid/view/Window;)V",
        )
    }
}
