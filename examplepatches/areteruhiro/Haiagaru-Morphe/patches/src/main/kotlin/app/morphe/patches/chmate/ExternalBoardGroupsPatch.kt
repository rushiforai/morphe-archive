package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val GROUPS="Lapp/morphe/extension/chmate/ExternalBoardGroups;"
private const val HTML="Lapp/morphe/extension/chmate/BbsMenuHtml;"

/** Exact supported native menu readers and grouping factories, no class enumeration. */
internal fun BytecodePatchContext.patchExternalBoardGroups(version:String){
    val old=version.contains("191");val middle=version.contains("226")
    if(!old&&!middle&&!version.contains("242"))return
    if(old||middle)patchBoardAdapterNotification(old)
    patchSiteNativeBoards(version)
    val worker=mutableClassDefBy("Ljp/syoboi/a2chMate/bbs/BBSMenuUpdateWork;")
    val parse=worker.methods.single{it.parameterTypes.size==3&&it.parameterTypes.take(2)==listOf("Ljava/lang/String;","Ljava/lang/String;")&&it.implementation!=null}
    val code=parse.implementation!!.instructions.toList()
    val size=code.withIndex().last{(_,i)->val ref=(i as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name=="size"&&ref.returnType=="I"&&ref.definingClass in setOf("Ljava/util/AbstractMap;","Ljava/util/HashMap;","Ljava/util/LinkedHashMap;")}
    check(code[size.index+1].opcode==Opcode.MOVE_RESULT)
    val count=(code[size.index+1] as OneRegisterInstruction).registerA
    val url=parse.implementation!!.registerCount-3
    check(count<16)
    val checkedUrl=if(url<16)url else {
        // 242 preserves p1 in v0 for the error summary; p1 itself is above v15.
        val first=code.first() as? TwoRegisterInstruction
        check(code.first().opcode==Opcode.MOVE_OBJECT_FROM16&&first?.registerA==0&&first.registerB==url)
        0
    }
    parse.addInstructionsWithLabels(size.index+2,"""
        invoke-static {v$count, v$checkedUrl}, $HTML->countForValidation(ILjava/lang/String;)I
        move-result v$count
    """.trimIndent())
    parse.addInstructionsWithLabels(0,"""
        invoke-static/range {p1 .. p2}, $HTML->prepare(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p2
    """.trimIndent())
    if(old||middle){
        val factory=mutableClassDefBy(if(old)"Lo/MediationServiceImpla;" else "Lo/ConscryptSocketAdapterCompanion;")
        val ctor=factory.methods.single{it.name=="<init>"}
        ctor.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.asReversed().forEach{(index,_)->
            ctor.addInstructionsWithLabels(index,"invoke-static/range {p0 .. p0}, $GROUPS->regroupLegacy(Ljava/util/List;)V")
        }
    }else{
        val factory=mutableClassDefBy("Lo/GoogleApiActivity;")
        val method=factory.methods.single{it.parameterTypes==listOf("Ljava/util/List;","Ljava/util/Collection;","Ljava/lang/String;","Ljava/lang/String;")&&it.returnType=="Ljava/util/List;"}
        method.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}.asReversed().forEach{(index,i)->
            val r=(i as OneRegisterInstruction).registerA
            method.addInstructionsWithLabels(index,"""
                invoke-static/range {v$r .. v$r}, $GROUPS->regroup(Ljava/util/List;)Ljava/util/List;
                move-result-object v$r
            """.trimIndent())
        }
    }
    // Fail patching if the exact constructor/field model used by the extension changes.
    val group=mutableClassDefBy(if(old)"Lo/MediationServiceImplExternalSyntheticLambda3;" else if(middle)"Lo/ConscryptSocketAdapterCompanionfactory1;" else "Lo/setUserHandle;")
    val fields=if(old)mapOf("a" to "Ljava/lang/String;","c" to "Ljava/lang/String;","d" to "Ljava/util/ArrayList;")
        else if(middle)mapOf("c" to "Ljava/lang/String;","d" to "Ljava/lang/String;","a" to "Ljava/util/ArrayList;")
        else mapOf("c" to "Ljava/lang/String;","d" to "Ljava/lang/String;","e" to "Ljava/util/List;","a" to "Lo/hasApi;")
    fields.forEach{(name,type)->check(group.fields.single{it.name==name}.type==type)}
    check(group.methods.any{it.name=="<init>"&&it.parameterTypes==if(old||middle)List(3){"Ljava/lang/String;"} else listOf("Ljava/lang/String;","Ljava/lang/String;","Lo/hasApi;","Ljava/util/List;")})
}

/** ListView reads getCount synchronously while notifying observers. Mark the flattened
 * board rows dirty first, so observers receive the same count as the following layout.
 * Keep the original instructions/registers; only their order changes. */
private fun BytecodePatchContext.patchBoardAdapterNotification(old:Boolean){
    val owner=if(old)"Lo/m6dExternalSyntheticLambda0;" else "Lo/getNextStreamIdokhttp;"
    val dirty=if(old)"j" else "g"
    val adapter=mutableClassDefBy(owner)
    check(adapter.superclass=="Landroid/widget/BaseAdapter;")
    check(adapter.fields.single{it.name==dirty}.type=="Z")
    val method=adapter.methods.single{it.name=="notifyDataSetChanged"&&it.parameterTypes.isEmpty()&&it.returnType=="V"}
    val code=method.implementation!!.instructions.toList()
    check(method.implementation!!.registerCount==2&&code.size==4)
    val call=code[0] as? FiveRegisterInstruction
    val ref=(code[0] as? ReferenceInstruction)?.reference as? MethodReference
    check(code[0].opcode==Opcode.INVOKE_SUPER&&call?.registerCount==1&&call.registerC==1)
    check(ref?.definingClass=="Landroid/widget/BaseAdapter;"&&ref.name=="notifyDataSetChanged"&&ref.parameterTypes.isEmpty()&&ref.returnType=="V")
    check(code[1].opcode==Opcode.CONST_4&&(code[1] as OneRegisterInstruction).registerA==0&&(code[1] as NarrowLiteralInstruction).narrowLiteral==1)
    val store=code[2] as? TwoRegisterInstruction
    val field=(code[2] as? ReferenceInstruction)?.reference as? FieldReference
    check(code[2].opcode==Opcode.IPUT_BOOLEAN&&store?.registerA==0&&store.registerB==1)
    check(field?.definingClass==owner&&field.name==dirty&&field.type=="Z"&&code[3].opcode==Opcode.RETURN_VOID)
    method.replaceInstruction(0,"const/4 v0, 0x1")
    method.replaceInstruction(1,"iput-boolean v0, p0, $owner->$dirty:Z")
    method.replaceInstruction(2,"invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V")
}
