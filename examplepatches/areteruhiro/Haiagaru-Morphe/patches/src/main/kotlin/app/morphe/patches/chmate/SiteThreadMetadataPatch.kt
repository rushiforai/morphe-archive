package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Display-time epochs only. Stable native thread IDs, URLs and stored records are untouched. */
internal fun BytecodePatchContext.patchSiteThreadMetadata(version:String){
    val old=version.contains("191");val middle=version.contains("226")
    patchSitePropertyPopup(old,middle)
    patchSiteBoardListName(old,middle)
    val owner=mutableClassDefBy(if(old)"Lo/m8a;" else if(middle)"Lo/getWriteBytesTotal;" else "Lo/zzavb;")
    val subject=if(old)"Lo/MaxAdViewImplExternalSyntheticLambda1;" else if(middle)"Lo/CertificateChainCleaner;" else "Lo/setSkipText;"
    val id=if(old)"e" else if(middle)"b" else "d"
    val formatter=if(old)"Lo/ocd;->e(J)Ljava/lang/String;" else if(middle)"Lo/getMaxLine;->d(J)Ljava/lang/String;" else "Lo/singleRefIterator;->b(J)Ljava/lang/String;"
    val formatterMatch=Regex("^(L[^;]+;)->([^()]+)\\(J\\)Ljava/lang/String;$").matchEntire(formatter)
        ?: error("Native site date formatter reference changed: $version")
    val formatterClass=mutableClassDefBy(formatterMatch.groupValues[1])
    val formatterName=formatterMatch.groupValues[2]
    val formatterMethod=formatterClass.methods.single{it.name==formatterName&&it.parameterTypes==listOf("J")&&it.returnType=="Ljava/lang/String;"}
    check(formatterMethod.accessFlags and 0x8!=0){"Native site date formatter is no longer static: $version"}
    val nativeFormatterName="haiagaruNativeSiteDate"
    check(formatterClass.methods.none{it.name==nativeFormatterName&&it.parameterTypes==listOf("J")})
    val nativeFormatter=MutableMethod(ImmutableMethod(formatterClass.type,nativeFormatterName,formatterMethod.parameters,
        formatterMethod.returnType,formatterMethod.accessFlags,formatterMethod.annotations,formatterMethod.hiddenApiRestrictions,formatterMethod.implementation))
    val formatterWrapper=MutableMethod(ImmutableMethod(formatterClass.type,formatterName,
        listOf(ImmutableMethodParameter("J",emptySet(),null)),"Ljava/lang/String;",formatterMethod.accessFlags,
        formatterMethod.annotations,formatterMethod.hiddenApiRestrictions,ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList())))
    formatterWrapper.addInstructions(0,"""
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/SiteThreadMetadata;->epoch(J)J
        move-result-wide p0
        invoke-static/range {p0 .. p1}, $nativeFormatter
        move-result-object v0
        return-object v0
    """.trimIndent())
    formatterClass.methods.remove(formatterMethod)
    formatterClass.methods.add(nativeFormatter)
    formatterClass.methods.add(formatterWrapper)
    val checkCall=if(old)"Ljp/syoboi/a2chMate/data/BBSThread;->c(J)Z" else if(middle)"Ljp/syoboi/a2chMate/data/BBSThread;->d(J)Z" else "Lo/TopLayoutDislike2;->b(J)Z"
    val runtime="Lapp/morphe/extension/chmate/SiteThreadMetadata;"
    if(!old&&!middle){
        val popup=mutableClassDefBy("Lo/zzabe;").methods.single{it.name=="c"&&it.parameterTypes==listOf("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")&&it.returnType=="V"}
        val instructions=popup.implementation!!.instructions.toList()
        val unbox=instructions.withIndex().single{(_,i)->((i as? ReferenceInstruction)?.reference as? MethodReference)?.toString()=="Ljava/lang/Number;->longValue()J"}.index
        val result=instructions[unbox+1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
        check(instructions[unbox+1].opcode==Opcode.MOVE_RESULT_WIDE&&result.registerA==6)
        check(instructions.take(unbox).any{it.opcode==Opcode.IGET_OBJECT&&((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString()=="Lo/zzacr;->o:Lo/KeJ12;"&&(it as TwoRegisterInstruction).registerA==3})
        popup.addInstructionsWithLabels(unbox+2,"invoke-static {v6, v7, v3}, $runtime->popupEpoch(JLjava/lang/Object;)J\nmove-result-wide v6")
    }
    val bind=owner.methods.single{it.name==if(old||middle)"getView" else "onBindViewHolder"}
    val code=bind.implementation!!.instructions.toList()
    val formatCall=code.withIndex().single{((it.value as? ReferenceInstruction)?.reference as? MethodReference)?.toString()==formatter}.index
    val dateCheck=code.withIndex().first{((it.value as? ReferenceInstruction)?.reference as? MethodReference)?.toString()==checkCall}.index
    check(formatCall>dateCheck&&formatCall-dateCheck<15){"Native creation-date block changed: $version"}
    val epochReads=mutableSetOf(formatCall-1,dateCheck-1)
    if(old||middle)code.withIndex().filter{it.value.opcode==Opcode.IGET_WIDE&&code.getOrNull(it.index+1)?.opcode in setOf(Opcode.SUB_LONG,Opcode.SUB_LONG_2ADDR)}.forEach{epochReads.add(it.index)}
    check(epochReads.size==if(old||middle)3 else 2){"Native epoch anchors changed: $version"}
    val changes=epochReads.associateWith{"epoch"}.toMutableMap()
    if(!old&&!middle){val reads=code.withIndex().filter{it.value.opcode==Opcode.IGET_WIDE&&((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.let{f->f.definingClass=="Lo/zzauw;"&&f.name=="e"&&f.type=="J"}==true};check(reads.size==3){"Native momentum anchors changed"};reads.forEach{changes[it.index]="momentum"}}
    for((index,method) in changes.toSortedMap(reverseOrder())){
        val read=code[index] as TwoRegisterInstruction
        if(method=="epoch"){val ref=(code[index] as ReferenceInstruction).reference as FieldReference;check(ref.definingClass==subject&&ref.name==id&&ref.type=="J")}
        bind.addInstructionsWithLabels(index+1,"invoke-static/range {v${read.registerA} .. v${read.registerA+1}}, $runtime->$method(J)J\nmove-result-wide v${read.registerA}")
    }
    if(old||middle){
        val update=owner.methods.single{it.name==(if(old)"e" else "b")&&it.parameterTypes.size==7&&it.parameterTypes[5]=="Ljp/syoboi/a2chMate/client/BBSUrlInfo;"}
        val before=update.implementation!!.instructions.toList()
        val timeRead=before.withIndex().single{it.value.opcode==Opcode.IGET_WIDE&&((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.let{f->f.definingClass==subject&&f.name==id}==true}.index
        val read=before[timeRead] as TwoRegisterInstruction
        update.addInstructionsWithLabels(timeRead+1,"invoke-static/range {v${read.registerA} .. v${read.registerA+1}}, $runtime->epoch(J)J\nmove-result-wide v${read.registerA}")
        val boardField=if(old)"r" else "g"
        val assign=update.implementation!!.instructions.withIndex().single{it.value.opcode==Opcode.IPUT_OBJECT&&((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.let{f->f.definingClass==owner.type&&f.name==boardField}==true}.index
        update.addInstructionsWithLabels(assign+1,"invoke-static/range {p0 .. p0}, $runtime->begin(Ljava/lang/Object;)V")
        update.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.asReversed().forEach{update.addInstructionsWithLabels(it,"invoke-static {}, $runtime->end()V")}
    }
    println("Native site creation date/momentum: $version, fixed display/calculation anchors")
}

/** Edit display strings and the board button only; never replace the saved thread/board IDs. */
private fun BytecodePatchContext.patchSitePropertyPopup(old:Boolean,middle:Boolean){
    val runtime="Lapp/morphe/extension/chmate/SiteThreadPopup;"
    val model=mutableClassDefBy(if(old)"Lo/q8;" else if(middle)"Lo/TTInterstitialActivity;"
        else "Ljp/syoboi/a2chMate/ui/threadproperty/ThreadPropertyDialogViewModel;")
    val date=if(old)"F" else if(middle)"s" else "y"
    val board=if(old||middle)"a" else "d"
    val ctor=model.methods.single{it.name=="<init>"&&it.parameterTypes.firstOrNull()=="Landroid/app/Application;"}
    val stores=ctor.implementation!!.instructions.withIndex().mapNotNull { (index,insn)->
        val field=(insn as? ReferenceInstruction)?.reference as? FieldReference
        if(insn.opcode!=Opcode.IPUT_OBJECT||field?.definingClass!=model.type||field.type!="Ljava/lang/String;")null
        else when(field.name){date->index to "date";board->index to "boardName";else->null}
    }
    check(stores.size==2)
    for((index,hook) in stores.asReversed()){
        val store=ctor.implementation!!.instructions[index] as TwoRegisterInstruction
        val value=store.registerA
        val instance=store.registerB
        ctor.addInstructionsWithLabels(index,"""
            invoke-static {v$value, v$instance}, $runtime->$hook(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v$value
        """.trimIndent())
    }
    val callback=mutableClassDefBy(if(old)"Lo/q5;" else if(middle)"Lo/TTAppOpenAdActivity5;" else "Lo/zzbcr;")
    val action=callback.methods.single{it.name==(if(old)"c" else "invoke")&&it.implementation!=null}
    val urlType="Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
    val accessor=if(old)"i" else if(middle)"v" else "y"
    val sites=action.implementation!!.instructions.withIndex().filter { (_,insn)->
        val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass==urlType&&ref.name==accessor&&ref.parameterTypes.isEmpty()&&ref.returnType=="Ljava/lang/String;"
    }
    check(sites.size==if(old)2 else 1)
    val bridge=MutableMethod(ImmutableMethod(callback.type,"haiagaruPopupBoard",
        listOf(ImmutableMethodParameter(urlType,emptySet(),null)),"Ljava/lang/String;",0xA,
        emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList())))
    bridge.addInstructions(0,"""
        invoke-static {p0}, $runtime->boardRoute(Ljava/lang/Object;)Ljava/lang/String;
        move-result-object v0
        if-nez v0, :done
        invoke-virtual {p0}, $urlType->$accessor()Ljava/lang/String;
        move-result-object v0
        :done
        return-object v0
    """.trimIndent())
    callback.methods.add(bridge)
    for((index,insn) in sites){
        check(insn.opcode==Opcode.INVOKE_VIRTUAL)
        action.replaceInstruction(index,"invoke-static {v${(insn as FiveRegisterInstruction).registerC}}, $bridge")
    }
}

private fun BytecodePatchContext.patchSiteBoardListName(old:Boolean,middle:Boolean){
    val runtime="Lapp/morphe/extension/chmate/SiteThreadPopup;"
    val urlType="Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
    if(!old&&!middle){
        val model="Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel;"
        val type=mutableClassDefBy(model.dropLast(1)+"\$onBackPressedDispatcher_delegatelambda00;")
        val get=type.methods.single{it.name=="invokeSuspend"}
        check(get.implementation!!.registerCount==4)
        val returns=get.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}
        check(returns.size==3)
        for((index,insn) in returns.asReversed()){
            val result=(insn as OneRegisterInstruction).registerA
            check(result!=1)
            get.addInstructionsWithLabels(index,"""
                iget-object v1, p0, ${type.type}->this${'$'}0:$model
                invoke-static {v$result, v1}, $runtime->listModelName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v$result
            """.trimIndent())
        }
        return
    }
    val type=mutableClassDefBy(if(old)"Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;" else "Lo/Yhp5;")
    val method=type.methods.single{it.name==(if(old)"i" else "u")&&it.parameterTypes.isEmpty()&&it.returnType=="V"}
    val accessor=if(old)"i" else "v"
    val site=method.implementation!!.instructions.withIndex().single { (_,insn)->
        val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass==urlType&&ref.name==accessor&&ref.parameterTypes.isEmpty()&&ref.returnType=="Ljava/lang/String;"
    }
    val bridge=MutableMethod(ImmutableMethod(type.type,"haiagaruSiteListName",
        listOf(ImmutableMethodParameter(urlType,emptySet(),null)),"Ljava/lang/String;",0xA,
        emptySet(),emptySet(),ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList())))
    bridge.addInstructions(0,"""
        invoke-virtual {p0}, $urlType->$accessor()Ljava/lang/String;
        move-result-object v0
        invoke-static {v0, p0}, $runtime->listName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent())
    type.methods.add(bridge)
    method.replaceInstruction(site.index,"invoke-static {v${(site.value as FiveRegisterInstruction).registerC}}, $bridge")
}
