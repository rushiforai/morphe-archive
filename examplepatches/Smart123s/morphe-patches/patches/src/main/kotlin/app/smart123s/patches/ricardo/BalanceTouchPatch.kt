package app.smart123s.patches.ricardo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal fun MutableMethod.hookBalanceTouch() {
    val game = "Lricardonemlopot/nemlopot/rube/RubeLoaderTest;"
    val instructions = implementation!!.instructions
    val worldPoint = instructions.withIndex().singleOrNull {
        val field = (it.value as? ReferenceInstruction)?.reference as? FieldReference
        it.value.opcode == Opcode.SPUT_OBJECT && field?.definingClass == game && field.name == "t"
    } ?: throw PatchException("Expected the original touch unprojection")
    val insertion = worldPoint.index + 1
    val continuation = instructions.getOrNull(insertion)
        ?: throw PatchException("Expected the original touch dispatch")

    // v0 is unused here. Bind the jump to the original continuation instruction:
    // plain addInstructions does not relocate labels compiled in another method.
    addInstructionsWithLabels(insertion, """
        invoke-static {p3}, Lricardonemlopot/nemlopot/patches/BalanceEditor;->onTouchDown(I)Z
        move-result v0
        if-eqz v0, :balance_touch_continue
        const/4 v0, 0x0
        sput-boolean v0, $game->touched:Z
        const/4 v0, 0x1
        return v0
    """, ExternalLabel("balance_touch_continue", continuation))
}
