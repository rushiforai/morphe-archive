package app.bin0culars.patches.reddit.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object ScreenCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/screen/BaseScreen;",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;"),
    filters = listOf(
        methodCall(smali = "Lcom/reddit/screen/dialog/ModalBackdropView;->setOnClickedOutside(Lkotlin/jvm/functions/Function0;)V"),
    ),
)

internal data class ScreenViewRegisters(val returnIndex: Int, val screenRegister: Int, val viewRegister: Int)

internal fun screenCreateViewRegisters(): ScreenViewRegisters {
    val createViewMethod = ScreenCreateViewFingerprint.method
    val instructions = createViewMethod.instructions.toList()

    val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    val viewRegister = (instructions.getOrNull(returnIndex) as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("Could not find RETURN_OBJECT instruction in ${createViewMethod.name}")

    val screenRegister = instructions
        .subList(0, returnIndex)
        .findLast { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Lcom/reddit/screen/BaseScreen;" && it.parameterTypes.isEmpty()
                } == true
        }?.let { (it as? FiveRegisterInstruction)?.registerC }
        ?: throw PatchException("Could not find BaseScreen invoke-virtual before RETURN_OBJECT in ${createViewMethod.name}")

    return ScreenViewRegisters(returnIndex, screenRegister, viewRegister)
}
