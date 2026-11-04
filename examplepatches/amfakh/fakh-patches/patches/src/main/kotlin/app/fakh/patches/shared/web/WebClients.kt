package app.fakh.patches.shared.web

import app.fakh.patches.shared.gms.mutableClass
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Sends the one setWebViewClient call of each class in [screens] through [filter]'s static setClient, which wraps the
 * client with the ad filter.
 */
internal fun BytecodePatchContext.wrapWebClients(screens: List<String>, filter: String) {
    var wrapped = 0
    screens.forEach { type ->
        mutableClass(type).methods.filter { it.implementation != null }.forEach { method ->
            method.instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.name == "setWebViewClient" &&
                    reference.parameterTypes == listOf("Landroid/webkit/WebViewClient;")
            }.forEach { (index, instruction) ->
                val call = instruction as FiveRegisterInstruction
                method.replaceInstruction(
                    index,
                    "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                        "$filter->setClient(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)V",
                )
                wrapped++
            }
        }
    }
    if (wrapped != screens.size) throw PatchException("Expected ${screens.size} web page clients, found $wrapped")
}
