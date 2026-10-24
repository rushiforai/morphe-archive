package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Binding is not an explicit image retry. Leave the retry entry point intact. */
internal fun BytecodePatchContext.patchThumbnailRebind242(version: String) {
    if (version != "0.8.10.242 dev") return
    val row = mutableClassDefBy("Lo/zzbhe;")
    val parameters = listOf("[Ljava/lang/CharSequence;", "Z", "Z")
    val bind = row.methods.single { it.name == "setImageLinks" && it.parameterTypes == parameters }
    val native = row.methods.single { it.name == "setImageLinks2" && it.parameterTypes == parameters }
    val bridge = MutableMethod(ImmutableMethod(row.type, "haiagaruBindImageLinks", native.parameters,
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    bridge.addInstructions(0, """
        const/4 v0, 0x0
        invoke-virtual {p0, p1, v0, p3}, ${row.type}->setImageLinks2([Ljava/lang/CharSequence;ZZ)V
        return-void
    """.trimIndent())
    val sites = bind.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == row.type && ref.name == native.name && ref.parameterTypes == parameters) index else null
    }
    check(sites.isNotEmpty()) { "242 thumbnail binding delegate missing" }
    for (index in sites) {
        val instruction = bind.implementation!!.instructions[index]
        check(instruction.opcode == Opcode.INVOKE_VIRTUAL)
        val call = instruction as FiveRegisterInstruction
        check(call.registerCount == 4)
        bind.replaceInstruction(index,
            "invoke-virtual {v${call.registerC}, v${call.registerD}, v${call.registerE}, v${call.registerF}}, " +
                "${row.type}->haiagaruBindImageLinks([Ljava/lang/CharSequence;ZZ)V")
    }
    row.methods.add(bridge)
}
