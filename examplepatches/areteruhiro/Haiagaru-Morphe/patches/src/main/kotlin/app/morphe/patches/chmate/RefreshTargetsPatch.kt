package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val TARGETS="Lapp/morphe/extension/chmate/RefreshTargets;"
private const val MARKER="haiagaruRefreshTargets"

/** A separate native patrol request, scoped before native board grouping and DAT/cache writes. */
internal fun BytecodePatchContext.patchRefreshTargets(version:String){
    val old=version.contains("191")
    val scheduler=mutableClassDefBy(when{old->"Lo/mdExternalSyntheticLambda0;";version.contains("226")->"Lo/settings;";else->"Lo/TTRewardVideoActivity8;"})
    val native=scheduler.methods.single{it.parameterTypes==listOf("Landroid/content/Context;","Z")&&it.returnType=="Ljava/util/UUID;"}
    val marker=MARKER
    val copy=MutableMethod(ImmutableMethod(scheduler.type,marker,native.parameters,native.returnType,native.accessFlags,native.annotations,native.hiddenApiRestrictions,native.implementation))
    var keys=0;var names=0
    copy.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
        val text=((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        if(text=="reloadRatedOnly"||text=="autocheck"){
            val reg=(instruction as OneRegisterInstruction).registerA
            copy.replaceInstruction(index,"const-string v$reg, \"${if(text=="autocheck")"haiagaru-refresh-targets" else marker}\"")
            if(text=="autocheck")names++ else keys++
        }
    }
    check(keys==1&&names==1)
    scheduler.methods.add(copy)
    // Only the original one-shot patrol entry gets this hook. The selected-work
    // copy above must not enqueue itself; periodic native work is untouched.
    native.addInstructions(0,"invoke-static/range {p0 .. p0}, $TARGETS->enqueue(Landroid/content/Context;)V")
    if(old){
        // 191 handles pull/re-fetch in the concrete fragment before its base
        // toolbar dispatcher (where the existing extension hook lives).
        val dispatch=mutableClassDefBy("Lo/pa;").methods.single{
            it.parameterTypes==listOf("I","Ljava/lang/Object;")&&it.returnType=="Z"
        }
        dispatch.addInstructions(0,"invoke-static/range {p0 .. p1}, $TARGETS->refresh(Ljava/lang/Object;I)V")
    }
    val worker=mutableClassDefBy("Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;")
    val ctor=worker.methods.single{it.name=="<init>"}
    val instructions=ctor.implementation!!.instructions.toList()
    val dataIndex=instructions.indexOfFirst{((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass=="Landroidx/work/WorkerParameters;"}
    check(dataIndex>=0)
    val data=(instructions[dataIndex] as TwoRegisterInstruction).registerA
    val dataType=((instructions[dataIndex] as ReferenceInstruction).reference as FieldReference).type
    ctor.addInstructions(dataIndex+1,"invoke-static {p0, v$data}, $TARGETS->mark(Ljava/lang/Object;Ljava/lang/Object;)V")
    val extension=mutableClassDefBy(TARGETS)
    val stub=extension.methods.single{it.name=="marker"}
    extension.methods.remove(stub)
    extension.methods.add(MutableMethod(ImmutableMethod(extension.type,stub.name,stub.parameters,stub.returnType,stub.accessFlags,stub.annotations,stub.hiddenApiRestrictions,
        ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,if(old)"""
            check-cast p0, $dataType
            iget-object v0, p0, $dataType->e:Ljava/util/Map;
            const-string v1, "$marker"
            invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
            move-result v0
            return v0
        """.trimIndent() else """
            check-cast p0, $dataType
            const-string v0, "$marker"
            invoke-virtual {p0, v0}, $dataType->${if(version.contains("226"))"a" else "c"}(Ljava/lang/String;)Z
            move-result v0
            return v0
        """.trimIndent())
    })
    val run=worker.methods.single{it.name=="doWork"}
    val body=run.implementation!!.instructions.toList()
    // The first native check method takes exactly (database, rows, download).
    val callIndex=body.indexOfFirst{insn->
        val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass==worker.type&&ref.parameterTypes.size==3&&ref.parameterTypes.last()=="Z"
    }
    check(callIndex>=0)
    val call=body[callIndex] as FiveRegisterInstruction
    val listType=if(version.contains("242"))"Ljava/util/List;" else "Ljava/util/ArrayList;"
    val receiver=call.registerC;val rows=call.registerE;val flag=call.registerF
    // No extra registers: each output replaces only its input; all other native values survive.
    val filterIndex=if(version.contains("242")){
        val query=body.indexOfFirst{insn->
            val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass=="${worker.type.dropLast(1)}\$ComponentActivity;"&&ref.returnType=="Ljava/util/List;"&&ref.parameterTypes.lastOrNull()=="Z"
        }
        check(query>=0&&body[query+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        check((body[query+1] as OneRegisterInstruction).registerA==rows)
        query+2
    }else callIndex
    run.addInstructionsWithLabels(callIndex,"""
        invoke-static {v$receiver, v$flag}, $TARGETS->download(Ljava/lang/Object;Z)Z
        move-result v$flag
    """.trimIndent())
    run.addInstructionsWithLabels(filterIndex,"""
        invoke-static {v$receiver, v$rows}, $TARGETS->filter(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
        move-result-object v$rows
        check-cast v$rows, $listType
    """.trimIndent())
    val current=run.implementation!!.instructions.toList()
    val keywordIndex=current.indexOfFirst{insn->
        val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
        ref!=null&&ref.definingClass.contains("/Prefs;")&&ref.returnType=="Ljava/lang/String;"
    }
    check(keywordIndex>=0&&current[keywordIndex+1].opcode==Opcode.MOVE_RESULT_OBJECT)
    val keyword=(current[keywordIndex+1] as OneRegisterInstruction).registerA
    run.addInstructions(keywordIndex+2,"""
        invoke-static {v$receiver, v$keyword}, $TARGETS->keywords(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$keyword
    """.trimIndent())
    val postStore=mutableClassDefBy(when{old->"Lo/n9;";version.contains("226")->"Lo/getTileModeX;";else->"Lo/PackageSignatureVerifier;"})
    val postType=when{old->"Lo/n7a;";version.contains("226")->"Lo/setBorderWidth;";else->"Ljp/syoboi/a2chMate/postdata/PostData;"}
    val confirm=postStore.methods.single{it.parameterTypes==listOf(postType,"Ljava/lang/String;")&&it.returnType=="V"}
    val saved=MutableMethod(ImmutableMethod(postStore.type,"haiagaruNativeConfirmPost",confirm.parameters,confirm.returnType,
        confirm.accessFlags,confirm.annotations,confirm.hiddenApiRestrictions,confirm.implementation))
    val wrapper=MutableMethod(ImmutableMethod(postStore.type,confirm.name,confirm.parameters,confirm.returnType,
        confirm.accessFlags,confirm.annotations,confirm.hiddenApiRestrictions,ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList())))
    wrapper.addInstructions(0,"""
        invoke-virtual/range {p0 .. p2}, $saved
        invoke-static/range {p2 .. p2}, Lapp/morphe/extension/chmate/ThreadWatch;->confirmed(Ljava/lang/String;)V
        return-void
    """.trimIndent())
    postStore.methods.remove(confirm);postStore.methods.add(saved);postStore.methods.add(wrapper)
    patchThreadNotificationDedup(version)
    println("Registered refresh targets: $version, scoped native patrol and DAT transaction")
}
