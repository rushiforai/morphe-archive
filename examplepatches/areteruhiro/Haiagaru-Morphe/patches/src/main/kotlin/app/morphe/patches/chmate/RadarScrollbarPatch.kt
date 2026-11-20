package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Widens only the 191 native map scrollbar's touch target from 8dp to 24dp. */
internal fun BytecodePatchContext.patchRadarScrollbarTouch(version: String) {
    if (version != "0.8.10.191 dev") return
    val owner = mutableClassDefBy("Lo/qhf;")
    val method = owner.methods.single {
        it.name == "onTouchEvent" && it.parameterTypes == listOf("Landroid/view/MotionEvent;") && it.returnType == "Z"
    }
    val body = method.implementation!!.instructions.toList()
    val matches = body.indices.filter { index ->
        val instruction = body[index]
        instruction.opcode == Opcode.CONST_HIGH16 &&
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x41000000 &&
            (instruction as? OneRegisterInstruction)?.registerA == 2
    }
    check(matches.size == 1) { "191 radar scrollbar touch-width constant changed (${matches.size})" }
    method.replaceInstruction(matches.single(), "const/high16 v2, 0x41c00000")
    println("191 radar scrollbar drag target: 8dp -> 24dp")
}
