package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Adjust only the integer rendered by ChMate's "新着 %d" update message. */
internal fun BytecodePatchContext.patchHiddenNgNewArrivalCount(version:String){
    val resourceId=when(version){
        "0.8.10.191 dev"->0x7f1202c9
        "0.8.10.226 dev"->0x7f1002bf
        "0.8.10.242 dev"->0x7f1002be
        else->return
    }
    var patched=0
    var formattedCalls=0
    var resourceCalls=0
    var arrayWrites=0
    var boxedIntegers=0
    var matchingSubtractions=0

    fun invocationRegisters(instruction:Instruction):List<Int> = when(instruction){
        is FiveRegisterInstruction->(0 until instruction.registerCount).map { index->when(index){
            0->instruction.registerC;1->instruction.registerD;2->instruction.registerE;3->instruction.registerF;else->instruction.registerG
        }}
        is RegisterRangeInstruction->(instruction.startRegister until instruction.startRegister+instruction.registerCount).toList()
        else->emptyList()
    }
    fun referencedMethod(instruction:Instruction):MethodReference?=
        (instruction as? ReferenceInstruction)?.reference as? MethodReference
    fun isCollectionSize(instruction:Instruction):Boolean{
        val ref=referencedMethod(instruction)?:return false
        return ref.name=="size"&&ref.returnType=="I"&&ref.parameterTypes.isEmpty()&&
            ref.definingClass in setOf("Ljava/util/AbstractCollection;","Ljava/util/Collection;","Ljava/util/List;")
    }
    fun isFormatGetString(instruction:Instruction):Boolean{
        val ref=referencedMethod(instruction)?:return false
        return ref.name=="getString"&&ref.parameterTypes.map(CharSequence::toString)==listOf("I","[Ljava/lang/Object;")
    }
    fun captureBefore(method:app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,index:Int){
        val collection=invocationRegisters(method.implementation!!.instructions[index]).single()
        method.addInstructions(index,"invoke-static/range {v$collection .. v$collection}, Lapp/morphe/extension/chmate/NewArrivalCountFallback;->begin(Ljava/util/Collection;)V")
    }
    fun captureAfter(method:app.morphe.patcher.util.proxy.mutableTypes.MutableMethod,index:Int){
        val collection=invocationRegisters(method.implementation!!.instructions[index]).single()
        method.addInstructions(index,"invoke-static/range {v$collection .. v$collection}, Lapp/morphe/extension/chmate/NewArrivalCountFallback;->after(Ljava/util/Collection;)V")
    }
    fun hasResourceValue(instructions:List<Instruction>,before:Int,register:Int):Boolean=
        (0 until before).any { index->
            val literal=instructions[index] as? NarrowLiteralInstruction
            val destination=(instructions[index] as? OneRegisterInstruction)?.registerA
            destination==register&&literal?.narrowLiteral==resourceId&&
                instructions[index].opcode in setOf(Opcode.CONST,Opcode.CONST_16,Opcode.CONST_HIGH16)
        }

    boundClassForEach("HiddenNgNewArrivalCountPatch:1") { klass ->
        val originals=klass.methods.filter { it.implementation!=null }
        for(original in originals){
            val ins=original.implementation!!.instructions.toList()
            val targetIndices=linkedSetOf<Int>()

            for(callIndex in ins.indices){
                if(!isFormatGetString(ins[callIndex]))continue
                formattedCalls++
                val callRegisters=invocationRegisters(ins[callIndex])
                if(callRegisters.size!=3)continue
                if(!hasResourceValue(ins,callIndex,callRegisters[1]))continue
                resourceCalls++
                val arrayRegister=callRegisters[2]

                // Find the boxed integer actually placed in the Object[] passed to
                // the formatted string. This distinguishes "新着 %d" from other
                // list-size calculations in the same (occasionally large) callback.
                for(putIndex in 0 until callIndex){
                    if(ins[putIndex].opcode!=Opcode.APUT_OBJECT)continue
                    val put=ins[putIndex] as? ThreeRegisterInstruction?:continue
                    if(put.registerB!=arrayRegister)continue
                    val replacedArraySlot=(putIndex+1 until callIndex).any { laterIndex->
                        if(ins[laterIndex].opcode!=Opcode.APUT_OBJECT)return@any false
                        val later=ins[laterIndex] as? ThreeRegisterInstruction?:return@any false
                        later.registerB==arrayRegister&&later.registerC==put.registerC
                    }
                    if(replacedArraySlot)continue
                    arrayWrites++
                    val boxedRegister=put.registerA
                    val boxCalls=(maxOf(1,putIndex-8) until putIndex).filter { index->
                        val result=ins[index] as? OneRegisterInstruction
                        val box=referencedMethod(ins.getOrNull(index-1)?:return@filter false)
                        ins[index].opcode==Opcode.MOVE_RESULT_OBJECT&&result?.registerA==boxedRegister&&
                            box?.definingClass=="Ljava/lang/Integer;"&&box.name=="valueOf"&&box.parameterTypes==listOf("I")
                    }
                    for(resultIndex in boxCalls){
                        boxedIntegers++
                        val boxedInt=invocationRegisters(ins[resultIndex-1]).singleOrNull()?:continue
                        for(subIndex in 2 until resultIndex){
                            if(ins[subIndex].opcode!=Opcode.SUB_INT_2ADDR)continue
                            val sub=ins[subIndex] as? TwoRegisterInstruction?:continue
                            if(sub.registerA!=boxedInt)continue
                            val sizeResultIndex=(subIndex-1 downTo 1).firstOrNull { resultIndex->
                                val result=ins[resultIndex] as? OneRegisterInstruction
                                ins[resultIndex].opcode==Opcode.MOVE_RESULT&&result?.registerA==boxedInt&&
                                    isCollectionSize(ins[resultIndex-1])
                            }?:continue
                            val overwritten=(sizeResultIndex+1 until subIndex).any { intermediate->
                                (ins[intermediate] as? OneRegisterInstruction)?.registerA==boxedInt
                            }
                            if(overwritten)continue
                            matchingSubtractions++
                            targetIndices.add(subIndex)
                        }
                    }
                }
            }

            if(targetIndices.isEmpty())continue
            val method=mutableClassDefBy(klass.type).methods.single {
                it.name==original.name&&it.parameterTypes==original.parameterTypes&&it.returnType==original.returnType
            }
            val afterIndices=linkedSetOf<Int>()
            for(index in targetIndices.toList().asReversed()){
                val sub=method.implementation!!.instructions[index] as TwoRegisterInstruction
                val current=sub.registerA
                val previous=sub.registerB
                check(current<16&&previous<16){"New-arrival count arguments need range invocation in $version ${method.name}"}
                check(method.accessFlags and 0x8 == 0) { "New-arrival owner must be an instance: $version" }
                val sizeResultIndex=(index-1 downTo 1).first { resultIndex->
                    val result=ins[resultIndex] as? OneRegisterInstruction
                    ins[resultIndex].opcode==Opcode.MOVE_RESULT&&result?.registerA==current&&isCollectionSize(ins[resultIndex-1])
                }
                afterIndices.add(sizeResultIndex-1)
                method.replaceInstruction(index,"invoke-static {v$previous, v$current}, Lapp/morphe/extension/chmate/NewArrivalCountFallback;->count(II)I")
                method.addInstructions(index+1,"move-result v$current")
                patched++
            }
            for(index in afterIndices.toList().asReversed())captureAfter(method,index)
            if(version!="0.8.10.242 dev")captureBefore(method,ins.indexOfFirst{isCollectionSize(it)})
        }
    }
    if(version=="0.8.10.242 dev"){
        val owner=mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;")
        val update=owner.methods.single{it.name=="b"&&it.parameterTypes.map(CharSequence::toString)==listOf("Lo/KeJ12;","Ljp/syoboi/a2chMate/client/BBSUrlInfo;","Z")}
        captureBefore(update,update.implementation!!.instructions.indexOfFirst{isCollectionSize(it)})
    }
    check(patched>0){"No exact '新着 %d' update count formatter found for $version (format=$formattedCalls resource=$resourceCalls array=$arrayWrites boxed=$boxedIntegers sub=$matchingSubtractions)"}
    println("Hidden NG per-update count: $version $patched formatted new-arrival value(s)")
}
