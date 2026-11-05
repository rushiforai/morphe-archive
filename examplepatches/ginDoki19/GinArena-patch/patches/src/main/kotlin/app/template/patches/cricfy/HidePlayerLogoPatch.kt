package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object PlayerWatermarkConstructor : Fingerprint(
    definingClass = "Lcom/android/vending/player/CricfyPlayerView;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
    filters = listOf(string("watermark")),
)

/** Keep the watermark view and initialization; only change its runtime alpha. */
internal val hidePlayerAppLogoPatch = bytecodePatch {
    execute {
        check(packageMetadata.packageName == "com.cricfytv.sports") {
            "Player logo patch is only for CRICFy TV."
        }
        check(packageMetadata.versionName == "7.4" && packageMetadata.versionCode == "54") {
            "Player logo patch is only supported on CRICFy TV 7.4 (54)."
        }
        val ctor = PlayerWatermarkConstructor.repairedMethod
        val insns = ctor.instructions.toList()
        check(ctor.implementation?.registerCount == 10) { "Unexpected player constructor registers." }
        check(insns.any {
            val r = (it as? ReferenceInstruction)?.reference as? FieldReference
            r?.definingClass == "Lcom/cricfytv/sports/databinding/ExoPlayerViewBinding;" &&
                r.name == "l" && r.type == "Landroid/widget/TextView;"
        }) { "Player watermark binding not found." }
        val alphaCalls = insns.withIndex().filter { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            insn.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == "Landroid/view/View;" &&
                ref.name == "setAlpha" && ref.parameterTypes.map { it.toString() } == listOf("F") && ref.returnType == "V"
        }
        check(alphaCalls.size == 1) { "Expected exactly one player alpha call." }
        val index = alphaCalls.single().index
        check(index > 1 && index + 1 < insns.size) { "Invalid alpha call location." }
        val call = insns[index] as? FiveRegisterInstruction ?: error("Unexpected alpha invoke format.")
        val previous = insns[index - 1]
        val setText = (insns[index - 2] as? ReferenceInstruction)?.reference as? MethodReference
        val setVisibility = (insns[index + 1] as? ReferenceInstruction)?.reference as? MethodReference
        check(call.registerCount == 2 && call.registerC == 8 && call.registerD == 6 &&
            previous.opcode == Opcode.CONST_HIGH16 && (previous as? OneRegisterInstruction)?.registerA == 6 &&
            (previous as? NarrowLiteralInstruction)?.narrowLiteral == 0x3f000000 &&
            setText?.definingClass == "Landroid/widget/TextView;" && setText.name == "setText" &&
            setVisibility?.definingClass == "Landroid/view/View;" && setVisibility.name == "setVisibility") {
            "Unexpected watermark sequence; refusing to patch."
        }
        ctor.replaceInstruction(index - 1, "const/high16 v6, 0x0")
    }
}
