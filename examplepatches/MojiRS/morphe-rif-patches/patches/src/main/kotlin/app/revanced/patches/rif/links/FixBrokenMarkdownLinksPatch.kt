package app.revanced.patches.rif.links

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.shared.RIF_BUILDS
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION = "Lapp/revanced/extension/rif/BrokenLinks;"

// The body render task's static link step (free n2.i0.J / Platinum o2.i0.J):
// J(ArrayList hrefs, ArrayList texts, Spannable body) turns the body's URL spans into rif's link
// spans and fills the lists the links sheet reads.
private const val LINK_STEP_PARAMS = "(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/text/Spannable;)V"

private fun linkStepIndex(instructions: Iterable<Instruction>, taskClass: String) =
    instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC &&
            (insn as? ReferenceInstruction)?.reference?.toString()?.let {
                it.startsWith("$taskClass->") && it.endsWith(LINK_STEP_PARAMS)
            } == true
    }

// BodyRenderTask.I(action): renders one body (HTML to Spanned, then the link step above, then
// the callback). Every comment, post body and message goes through it. Matched in the task class
// (named per build) by the call to its own link step.
internal val bodyRenderFingerprint = fingerprint {
    custom { method, classDef ->
        RIF_BUILDS.any { it.bodyRenderClass == classDef.type } &&
            method.parameterTypes.size == 1 &&
            method.returnType == "V" &&
            method.implementation?.instructions?.let { linkStepIndex(it, classDef.type) != -1 } == true
    }
}

@Suppress("unused")
val fixBrokenMarkdownLinksPatch = bytecodePatch(
    name = "Fix broken markdown links",
    description = "Shows links like [name](u/name) as links instead of raw text.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val render = bodyRenderFingerprint.method
        val index = linkStepIndex(render.instructions, render.definingClass)
        // Before the link step, so it builds rif's link spans and the links sheet's lists from the
        // repaired text. The call only reads the body register, so no scratch register is needed.
        val call = render.instructions.elementAt(index) as FiveRegisterInstruction
        if (call.registerCount != 3 || call.registerE > 15) {
            throw PatchException("unexpected link step call in ${render.definingClass}->${render.name}")
        }
        render.addInstructions(
            index,
            "invoke-static { v${call.registerE} }, $EXTENSION->repair(Landroid/text/Spannable;)V",
        )
    }
}
