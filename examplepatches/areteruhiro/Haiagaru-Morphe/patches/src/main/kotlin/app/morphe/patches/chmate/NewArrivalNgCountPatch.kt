package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Adjust the formatted per-thread-update count only; never touches HOME unread totals. */
internal fun BytecodePatchContext.patchHiddenNgNewArrivalCount(version:String){
    // This formatter exists only in the 242 UI. Older builds use a different
    // message path and are intentionally left untouched until separately bound.
    if(version!="0.8.10.242 dev")return
    var patched=0
    boundClassForEach("HiddenNgNewArrivalCountPatch:1") { klass ->
        val candidates=klass.methods.filter { method ->
            val ins=method.implementation?.instructions?.toList()?:return@filter false
            val hasCollectionSize=ins.any { instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass=="Ljava/util/AbstractCollection;"&&ref.name=="size"&&ref.returnType=="I"
            }
            val hasFormattedString=ins.any { instruction ->
                val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass=="Landroid/content/Context;"&&ref.name=="getString"&&ref.parameterTypes.size==2
            }
            hasCollectionSize&&hasFormattedString&&ins.any { it.opcode==Opcode.SUB_INT_2ADDR }
        }
        for(original in candidates){
            val method=mutableClassDefBy(klass.type).methods.single {
                it.name==original.name&&it.parameterTypes==original.parameterTypes&&it.returnType==original.returnType
            }
            val ins=method.implementation!!.instructions.toList()
            val sizeRegisters=ins.indices.filter { i ->
                val call=(ins[i] as? ReferenceInstruction)?.reference as? MethodReference
                call?.definingClass=="Ljava/util/AbstractCollection;"&&call.name=="size"&&ins.getOrNull(i+1)?.opcode==Opcode.MOVE_RESULT
            }.mapNotNull { i -> (ins.getOrNull(i+1) as? OneRegisterInstruction)?.registerA }.toSet()
            for(i in ins.indices){
                val sub=ins[i] as? TwoRegisterInstruction?:continue
                if(ins[i].opcode!=Opcode.SUB_INT_2ADDR||sub.registerA !in sizeRegisters)continue
                val result=sub.registerA;val previous=sub.registerB
                if(result>=16||previous>=16)continue
                method.replaceInstruction(i,"invoke-static {v$previous, v$result}, Lapp/morphe/extension/chmate/HiddenNgUnread;->newArrivalCount(II)I\nmove-result v$result")
                patched++
            }
        }
    }
    check(patched>0){"No formatted update-arrival count found for $version"}
    println("Hidden NG per-update count: $version $patched formatter(s)")
}
