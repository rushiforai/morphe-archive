package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val OPEN_TABS="Lapp/morphe/extension/chmate/OpenTabsRefresh;"

/** Independent one-shot work; no mutation of registered refresh targets or favorites. */
internal fun BytecodePatchContext.patchOpenTabsRefresh(version:String){
    val old=version.contains("191");val middle=version.contains("226")
    val scheduler=mutableClassDefBy(if(old)"Lo/mdExternalSyntheticLambda0;" else if(middle)"Lo/settings;" else "Lo/TTRewardVideoActivity8;")
    // RefreshTargets has already copied the native entry before adding its enqueue hook.
    val source=scheduler.methods.single{it.name=="haiagaruRefreshTargets"}
    for((name,work) in listOf("haiagaruRefreshOpenThreads" to "haiagaru-open-threads","haiagaruRefreshOpenBoards" to "haiagaru-open-boards")){
        val copy=MutableMethod(ImmutableMethod(scheduler.type,name,source.parameters,source.returnType,
            source.accessFlags,source.annotations,source.hiddenApiRestrictions,source.implementation))
        val code=copy.implementation!!.instructions.toList()
        var marker=0;var unique=0
        for((index,instruction)in code.withIndex()){
            val text=((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            if(text=="haiagaruRefreshTargets"||text=="haiagaru-refresh-targets"){
                val reg=(instruction as OneRegisterInstruction).registerA
                copy.replaceInstruction(index,"const-string v$reg, \"${if(text=="haiagaruRefreshTargets")"haiagaruOpenTabs" else work}\"")
                if(text=="haiagaruRefreshTargets")marker++ else unique++
            }
        }
        check(marker==1&&unique==1)
        val put=code.withIndex().single{(_,i)-> val ref=(i as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass=="Ljava/util/Map;"&&ref.name=="put"}
        val map=(put.value as FiveRegisterInstruction).registerC
        copy.addInstructions(put.index,"invoke-static/range {v$map .. v$map}, $OPEN_TABS->writeScope(Ljava/util/Map;)V")
        scheduler.methods.add(copy)
    }
    val dataType=if(old)"Lo/a6;" else if(middle)"Lo/InMobiMediationAdapterNativeAdViewListener11;" else "Lo/isAndroid;"
    val mapField=if(old)"e" else if(middle)"c" else "a"
    check(mutableClassDefBy(dataType).fields.single{it.name==mapField}.type=="Ljava/util/Map;")
    val bridge=mutableClassDefBy(OPEN_TABS);val input=bridge.methods.single{it.name=="input"}
    val refresh=bridge.methods.single{it.name=="nativeRefresh"}
    val thread=mutableClassDefBy(if(old)"Lo/pa;" else "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val board=mutableClassDefBy(if(old)"Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;" else if(middle)"Lo/Yhp5;" else "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListFragment;")
    fun command(owner:com.android.tools.smali.dexlib2.iface.ClassDef)=owner.methods.single{
        it.parameterTypes==listOf("I","Ljava/lang/Object;")&&it.returnType=="Z"&&it.implementation!=null
    }
    val threadCommand=command(thread);val boardCommand=command(board)
    bridge.methods.remove(refresh)
    bridge.methods.add(MutableMethod(ImmutableMethod(bridge.type,refresh.name,refresh.parameters,refresh.returnType,
        refresh.accessFlags,refresh.annotations,refresh.hiddenApiRestrictions,ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            const/4 v0, 0x5
            const/4 v2, 0x0
            instance-of v1, p0, ${thread.type}
            if-eqz v1, :board
            check-cast p0, ${thread.type}
            invoke-virtual {p0, v0, v2}, $threadCommand
            move-result v0
            return v0
            :board
            instance-of v1, p0, ${board.type}
            if-eqz v1, :unsupported
            check-cast p0, ${board.type}
            invoke-virtual {p0, v0, v2}, $boardCommand
            move-result v0
            return v0
            :unsupported
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    })
    bridge.methods.remove(input)
    bridge.methods.add(MutableMethod(ImmutableMethod(bridge.type,input.name,input.parameters,input.returnType,
        input.accessFlags,input.annotations,input.hiddenApiRestrictions,ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            check-cast p0, $dataType
            iget-object p0, p0, $dataType->$mapField:Ljava/util/Map;
            return-object p0
        """.trimIndent())
    })
    val worker=mutableClassDefBy("Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;")
    val group=worker.methods.single{it.parameterTypes.size==3&&it.parameterTypes.last()=="Z"&&
        it.parameterTypes[1] in listOf("Ljava/util/List;","Ljava/util/ArrayList;")}
    val code=group.implementation!!.instructions.toList()
    check(code[0].opcode==Opcode.INVOKE_STATIC_RANGE&&
        ((code[0] as ReferenceInstruction).reference as MethodReference).definingClass=="Lapp/morphe/extension/chmate/PatrolImages;")
    val boolRegister=group.implementation!!.registerCount-1
    val gate=code.withIndex().single{(_,i)->i.opcode==Opcode.IF_EQZ&&(i as OneRegisterInstruction).registerA==boolRegister}
    val rows=if(old)15 else if(middle)7 else 10
    // The native group builds this ArrayList after subject acquisition, before DAT processing.
    // v1 is the native copy of p0 and remains the worker throughout this method.
    check(code.any{it.opcode==Opcode.MOVE_OBJECT_FROM16&&(it as TwoRegisterInstruction).registerA==1&&it.registerB==boolRegister-3})
    group.addInstructions(gate.index+1,"""
        invoke-static {v1, v$rows}, $OPEN_TABS->downloadRows(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
        move-result-object v$rows
        check-cast v$rows, Ljava/util/ArrayList;
    """.trimIndent())
    // Override needsDat for board-only work after the existing image patrol hook.
    group.addInstructions(2,"""
        invoke-static/range {p0 .. p3}, $OPEN_TABS->downloadGroup(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;Z)Z
        move-result p3
    """.trimIndent())
}
