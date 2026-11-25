package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Branch around Waze's original implementation, preserving parameter registers and labels. */
internal fun MutableMethod.whenWazeFeature(feature: String, body: String, index: Int = 0, scratch: Int = 1) {
    val parameters = parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val code = implementation ?: throw PatchException("$this has no implementation")
    if (code.registerCount - parameters < scratch) throw PatchException("$this needs $scratch scratch registers")
    addInstructionsWithLabels(
        index,
        """
            const-string v0, "$feature"
            invoke-static { v0 }, $WAZE_CUSTOMIZATION->on(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :waze_feature_original
            $body
        """,
        ExternalLabel("waze_feature_original", code.instructions.elementAt(index)),
    )
}

/** Filter a return value in-place, even for a getter with zero local registers. */
internal fun MutableMethod.filterWazeObjectReturns(filter: String) {
    if (!filter.endsWith(")$returnType")) throw PatchException("Return filter type mismatch: $this")
    val code = implementation!!.instructions.toList()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("Object return not found: $this")
    for (at in returns.reversed()) {
        val register = (code[at] as OneRegisterInstruction).registerA
        replaceInstruction(at, "invoke-static/range { v$register .. v$register }, $filter")
        addInstructions(at + 1, "move-result-object v$register\nreturn-object v$register")
    }
}
