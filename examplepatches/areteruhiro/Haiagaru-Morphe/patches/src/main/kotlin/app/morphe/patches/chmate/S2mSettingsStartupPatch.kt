package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

/** Keep the callback's constant zero argument without dividing by a generated seed. */
internal fun BytecodePatchContext.patchS2mSettingsStartup242() {
    val method=mutableClassDefBy("Ljp/syoboi/chmate2/ui/s2msetting/S2MSettingActivity;").methods.single {
        it.name=="onCreate"&&it.parameterTypes==listOf("Landroid/os/Bundle;")&&it.returnType=="V"
    }
    val code=method.implementation!!.instructions.toList()
    val callback=code.indices.single { index ->
        code[index].opcode==Opcode.NEW_INSTANCE&&
            (code[index] as? ReferenceInstruction)?.reference.toString()=="Lo/zzbow;"
    }
    val divide=callback-1
    check(code[divide].opcode==Opcode.DIV_INT_2ADDR)
    val registers=code[divide] as TwoRegisterInstruction
    check(registers.registerA==7&&registers.registerB==2)
    // v7 is initialized to zero and never assigned again before this division.
    check(code.take(divide).filterIsInstance<OneRegisterInstruction>().filter {
        it.registerA==7&&it.opcode.setsRegister()
    }.single().let { it.opcode==Opcode.CONST_4&&(it as NarrowLiteralInstruction).narrowLiteral==0 })
    method.replaceInstruction(divide,"const/4 v7, 0x0")
}
