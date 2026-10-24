package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Replace only total immediately consumed as total-read; no register allocation or read-position mutation. */
internal fun BytecodePatchContext.patchHiddenNgUnread(version:String){
    val fields=when(version){
        "0.8.10.191 dev" -> setOf("Lo/onAdDisplayed\$setIcon;->k:I")
        "0.8.10.226 dev" -> setOf("Lo/Yy2\$open;->m:I")
        "0.8.10.242 dev" -> setOf("Lo/zzauw;->a:I", "Lo/getAvailabilityStatus\$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ;->o:I")
        else -> return
    }
    var count=0
    classDefForEach { klass ->
        val targets=klass.methods.filter { method -> method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference?.toString() in fields
        }==true }
        if(targets.isEmpty())return@classDefForEach
        val mutable=mutableClassDefBy(klass.type)
        targets.forEach { original ->
            val method=mutable.methods.single { it.name==original.name&&it.parameterTypes==original.parameterTypes&&it.returnType==original.returnType }
            val code=method.implementation!!.instructions.toList()
            for(i in code.size-2 downTo 0){
                val load=code[i] as? TwoRegisterInstruction?:continue
                if(code[i].opcode!=Opcode.IGET||(code[i] as? ReferenceInstruction)?.reference?.toString() !in fields)continue
                val next=code[i+1] as? TwoRegisterInstruction?:continue
                val nextField=(code[i+1] as? ReferenceInstruction)?.reference as? FieldReference
                val totalField=(code[i] as ReferenceInstruction).reference as FieldReference
                val readField=when(version){"0.8.10.191 dev"->"l";"0.8.10.226 dev"->"i";else->"g"}
                val later=code.getOrNull(i+2) as? TwoRegisterInstruction
                if(code[i+1].opcode==Opcode.IGET && next.registerB==load.registerB &&
                    nextField?.definingClass==totalField.definingClass && nextField?.name==readField &&
                    next.registerA!=load.registerA && code.getOrNull(i+2)?.opcode==Opcode.SUB_INT_2ADDR &&
                    later?.registerA==load.registerA && later.registerB==next.registerA){
                    check(load.registerB<16){"Unread stored-read hook needs non-range argument"}
                    method.replaceInstruction(i,"invoke-static {v${load.registerB}}, Lapp/morphe/extension/chmate/HiddenNgUnread;->totalFromStoredRead(Ljava/lang/Object;)I")
                    method.addInstructionsWithLabels(i+1,"move-result v${load.registerA}")
                    count++
                    continue
                }
                val sub=next
                if(code[i+1].opcode!=Opcode.SUB_INT_2ADDR||sub.registerA!=load.registerA)continue
                check(load.registerB<16&&sub.registerB<16){"Unread hook needs non-range arguments: $version ${method.name}"}
                method.replaceInstruction(i,"invoke-static {v${load.registerB}, v${sub.registerB}}, Lapp/morphe/extension/chmate/HiddenNgUnread;->total(Ljava/lang/Object;I)I")
                method.addInstructionsWithLabels(i+1,"move-result v${load.registerA}")
                count++
            }
        }
    }
    check(count>0){"No exact unread calculation for $version"}
    println("Hidden NG unread display: $version $count total-read boundaries")
}
