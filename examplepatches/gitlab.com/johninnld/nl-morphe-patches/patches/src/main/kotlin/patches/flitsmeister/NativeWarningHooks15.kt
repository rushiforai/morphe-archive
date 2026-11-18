package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val WARNINGS="Lnl/johninnl/flitsmeister/NativeWarnings;"
private const val REPORT="Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;"
private const val EARLY_TYPE="Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;"
private const val EARLY_REPORT="Lnl/flitsmeister/fmcore/models/data/reports/EarlyWarningReport;"
private const val EARLY_NOTIFICATION="Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;"
private const val EARLY_VIEW="Lnl/flitsmeister/fmcore/models/data/earlywarnings/EarlyWarning;"

/** Resolve only exact FM15 roots before invoking the whole-profile transformation. */
context(context: BytecodePatchContext)
internal fun bindFlitsmeisterNativeWarnings15() {
    val indicatorData=resolveFlitsmeisterIndicatorData15()
    val methods=flitsmeisterWarningContracts15.keys.associateWith { descriptor ->
        val owner=descriptor.substringBefore("->");val signature=descriptor.substringAfter("->")
        val parameters=Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map{it.value}.toList()
        exact(owner,signature.substringBefore('('),signature.substringAfter(')'),*parameters.toTypedArray()).method
    }
    bindFlitsmeisterNativeWarnings15(methods)
    bindFlitsmeisterIndicatorData15(indicatorData)
    bindFlitsmeisterSoundAndVisibility15(
        exact("Ldci;","invoke","Ljava/lang/Object;","Ljava/lang/Object;").method,
        exact("Lwd6;","z","V","Lma1;").method,
        exact("Lwd6;","A","V","Lma1;").method,
    )
}

/**
 * Observe FM15's chosen alert sound (the shared join after its per-type selection in the
 * playAlarm callback) and its on-screen warning set (DefaultReportEventService show/hide).
 * Neither hook changes a native decision, sound, BLE route or callback.
 */
internal fun bindFlitsmeisterSoundAndVisibility15(sound:MutableMethod,shown:MutableMethod,hidden:MutableMethod) {
    fun reference(method:MutableMethod,index:Int)=(method.instructions[index] as? ReferenceInstruction)?.reference?.toString()
    check(sound.implementation?.registerCount==14) { "Changed FM15 alert sound callback" }
    val selected=sound.instructions.withIndex().filter{reference(sound,it.index)=="Ldci;->q:Ls39;"&&it.value.opcode==Opcode.IGET_OBJECT}
    check(selected.size==1) { "Changed FM15 alert sound join" }
    val joinAt=selected.single().index
    val join=sound.instructions[joinAt] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
    // v2=report and v3=entering are loaded once at entry; every selection branch rejoins via v6=v4.
    check(sound.instructions[5].opcode==Opcode.IGET_OBJECT&&(sound.instructions[5] as OneRegisterInstruction).registerA==2&&reference(sound,5)=="Ldci;->c:$REPORT")
    check(sound.instructions[6].opcode==Opcode.IGET_BOOLEAN&&(sound.instructions[6] as OneRegisterInstruction).registerA==3&&reference(sound,6)=="Ldci;->d:Z")
    val chosen=sound.instructions[10]
    check(chosen.opcode==Opcode.MOVE_OBJECT&&(chosen as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA==6&&chosen.registerB==4&&sound.instructions[11].opcode==Opcode.GOTO_16)
    fun showHide(method:MutableMethod,registers:Int,marker:(MutableMethod)->Boolean) {
        check(method.implementation?.registerCount==registers&&method.instructions[0].opcode==Opcode.IGET_OBJECT&&reference(method,0)=="Lma1;->a:$REPORT"&&marker(method)) {
            "Changed FM15 warning presentation ${method.definingClass}->${method.name}"
        }
    }
    showHide(shown,6){m->m.instructions.indices.any{reference(m,it)=="Lnl/flitsmeister/fmcore/data/model/reports/SignallingSpamFilterImpl;->canSignalAgain($REPORT)Z"}}
    showHide(hidden,9){m->m.instructions.any{it.opcode==Opcode.CONST_STRING&&(it as ReferenceInstruction).reference.toString()=="[onRemoveWarning] "}}
    sound.replaceInstruction(joinAt,"invoke-static {v2, v3, v6}, $WARNINGS->sound(Ljava/lang/Object;ZLjava/lang/String;)V")
    sound.addInstruction(joinAt+1,"iget-object v${join.registerA}, v${join.registerB}, Ldci;->q:Ls39;")
    shown.addInstruction(0,"invoke-static/range {p1 .. p1}, $WARNINGS->visible(Ljava/lang/Object;)V")
    hidden.addInstruction(0,"invoke-static/range {p1 .. p1}, $WARNINGS->hidden(Ljava/lang/Object;)V")
}

/** Testable complete transformation; validate every root before changing any method. */
internal fun bindFlitsmeisterNativeWarnings15(methods:Map<String,MutableMethod>) {
    validateFlitsmeisterWarningMethods15(methods)
    fun pick(owner:String,name:String,result:String="V",vararg parameters:String)=methods.getValue("$owner->$name(${parameters.joinToString("")})$result")
    fun shape(method:MutableMethod,registers:Int,count:Int):MutableMethod {
        check(method.implementation?.registerCount==registers&&method.instructions.size==count) { "Changed native warning authority: ${method.definingClass}->${method.name}" }
        return method
    }
    val regular=shape(pick("Lfci;","l","V",REPORT,"Z","Z","Ljava/lang/String;","Ls39;"),16,136)
    val alert=shape(pick("Lfc0;","J","V",REPORT,"Z"),25,1505)
    val early=shape(pick("Lfci;","b","V",EARLY_TYPE,EARLY_REPORT,EARLY_NOTIFICATION,"Ljava/lang/String;","Z","Ls39;"),18,40)
    val voiceOnly=shape(pick("Lxl\$c;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;"),14,119)
    val cits=shape(pick("Lfc0;","x","V",REPORT),27,615)
    val presentation=shape(pick("Lxl;","i","V","Landroid/content/Context;",EARLY_VIEW,"Z"),11,69)
    val converted=shape(pick("Lpz2;","J","Z","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),31,279)
    val updated=shape(pick("Lpz2;","L","Z","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),20,102)
    val deleted=shape(pick("Lpz2\$c;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;"),10,53)
    val notifications=methods.getValue(FLITSMEISTER15_EARLY_NOTIFICATION_ROOT)
    // Whole-body validation above permits only the original or exact FeatureUi insertion.
    val notificationShift=if(flitsmeisterWarningFingerprint(notifications)==FLITSMEISTER15_EARLY_FEATURE_UI_HASH)1 else 0
    shape(notifications,15,248+notificationShift)
    val impact=shape(pick("Lyy2;","a","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),12,192)
    val impactUpdate=shape(pick("Lyy2;","e","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),10,127)
    val impactRemove=shape(pick("Lyy2;","b","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),13,187)
    fun anchor(method:MutableMethod,reference:String,opcode:Opcode?=null):Int {
        val positions=method.instructions.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString()==reference && (opcode==null||it.value.opcode==opcode) }
        check(positions.size==1) { "Changed warning anchor $reference in ${method.definingClass}->${method.name}" }
        return positions.single().index
    }
    // FM re-signals one fixed camera only after its repeat window (3 minutes); the owner wants at most one.
    // Other report types and other cameras are unaffected: the window is keyed per report.
    val repeatAt=anchor(alert,"Lye7;->g(ILaf7;)J",Opcode.INVOKE_STATIC)
    val repeat=alert.instructions[repeatAt] as FiveRegisterInstruction
    check(repeat.registerCount==2&&alert.instructions[repeatAt-1].opcode==Opcode.SGET_OBJECT
        &&(alert.instructions[repeatAt-1] as ReferenceInstruction).reference.toString()=="Laf7;->q:Laf7;"
        &&(alert.instructions[repeatAt-1] as OneRegisterInstruction).registerA==repeat.registerD) { "Changed FM15 camera repeat window" }
    check(alert.instructions.subList(repeatAt-10,repeatAt).any{it.opcode==Opcode.INSTANCE_OF&&(it as ReferenceInstruction).reference.toString()=="Lnl/flitsmeister/fmcore/data/model/reports/SpeedCam;"}) { "Changed FM15 camera repeat owner" }
    check(alert.instructions[repeatAt+1].opcode==Opcode.MOVE_RESULT_WIDE) { "Changed FM15 camera repeat result" }
    val scratch=(alert.instructions[repeatAt+1] as OneRegisterInstruction).registerA
    check(scratch<15&&scratch!=repeat.registerD) { "Changed FM15 camera repeat registers" }
    // FM decided no sound for this warning: the deferred announcement need not wait for one.
    val packAt=anchor(regular,"Lkdi;->d(Ljava/lang/String;${REPORT}ZLs39;)Z",Opcode.INVOKE_VIRTUAL)
    val quietAt=packAt-5
    check(regular.instructions[quietAt].opcode==Opcode.IF_EQZ&&regular.instructions[quietAt-1].opcode==Opcode.IF_NEZ
        &&(regular.instructions[quietAt+1] as? ReferenceInstruction)?.reference?.toString()=="Lfci;->f()Lkdi;") { "Changed FM15 silent signal branch" }
    // This getter exists only after the resumed suppression and VOICE_ONLY tests.
    val voiceReference="Lnl/flitsmeister/fmcore/data/model/reports/Incident;->getVoiceOnlyText()Ljava/lang/String;"
    val voiceAt=anchor(voiceOnly,voiceReference,Opcode.INVOKE_VIRTUAL)
    val voiceRegister=(voiceOnly.instructions[voiceAt] as FiveRegisterInstruction).registerC
    val citsType="Lnl/flitsmeister/fmcore/models/data/cits/CitsBaseReport;"
    val citsAt=anchor(cits,citsType,Opcode.CHECK_CAST)
    val citsRegister=(cits.instructions[citsAt] as OneRegisterInstruction).registerA
    val busAt=anchor(converted,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->getBusAlert()Las7;")
    val publishes=converted.instructions.withIndex().filter { it.index in busAt+1..busAt+5 && (it.value as? ReferenceInstruction)?.reference?.toString()=="Las7;->a(Ljava/lang/Object;)V" }
    check(publishes.size==1) { "Changed CITS early-warning projection publication" }
    val publishAt=publishes.single().index
    val publish=publishes.single().value as FiveRegisterInstruction
    check(publish.registerCount==2) { "Changed CITS projection registers" }
    val projectionRegister=publish.registerD
    // Guard additional accepted state/removal publications before any mutation.
    val updateBusAt=anchor(updated,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->getBusAlert()Las7;")
    val updatePublish=updated.instructions[updateBusAt+2] as FiveRegisterInstruction
    check((updated.instructions[updateBusAt+2] as ReferenceInstruction).reference.toString()=="Las7;->a(Ljava/lang/Object;)V"&&updatePublish.registerC==1&&updatePublish.registerD==5)
    check((updated.instructions[45] as ReferenceInstruction).reference.toString()==EARLY_REPORT)
    val notificationBus="Lnl/flitsmeister/fmcore/models/eventbuses/AppNotificationBus;->getBusEarlyWarningNotification()Las7;"
    val notificationPublishes=notifications.instructions.withIndex().filter{(it.value as? ReferenceInstruction)?.reference?.toString()==notificationBus}.map{it.index+2}
    check(notificationPublishes==listOf(212+notificationShift,244+notificationShift))
    notificationPublishes.forEach{check((notifications.instructions[it] as ReferenceInstruction).reference.toString()=="Las7;->a(Ljava/lang/Object;)V")}
    val deleteAt=anchor(deleted,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;",Opcode.SGET_OBJECT)
    check(deleted.instructions[31].opcode==Opcode.INSTANCE_OF&&(deleted.instructions[31] as ReferenceInstruction).reference.toString()==EARLY_REPORT)
    check((deleted.instructions[31] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB==5)
    val impactAt=anchor(impact,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;",Opcode.SGET_OBJECT)
    check(impactAt==143&&(impact.instructions[140] as ReferenceInstruction).reference.toString()=="Lsz2;->b(Lbemobile/cits/sdk/core/model/response/ImpactAttenuator;Landroid/content/Context;)$EARLY_VIEW")
    val impactUpdateAt=anchor(impactUpdate,"Lxl;->a:Lxl;",Opcode.SGET_OBJECT)
    check(impactUpdateAt==83&&(impactUpdate.instructions[79] as ReferenceInstruction).reference.toString()=="Lsz2;->b(Lbemobile/cits/sdk/core/model/response/ImpactAttenuator;Landroid/content/Context;)$EARLY_VIEW")
    val converterReference="Lq71;->c(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;Landroid/content/Context;Lhle;)$REPORT"
    val converterPlans=listOf(converted,updated).map{method->
        val at=anchor(method,converterReference,Opcode.INVOKE_STATIC)
        val invoke=method.instructions[at] as FiveRegisterInstruction
        check(invoke.registerCount==3&&method.instructions[at+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        Triple(method,at,invoke to (method.instructions[at+1] as OneRegisterInstruction).registerA)
    }
    val vriPlans=listOf(impact,impactRemove,impactUpdate).map{method->
        val getter=anchor(method,"Lnl/flitsmeister/fmcore/models/eventbuses/cits/VRISpeedAdviceBusKt;->getBusVRISpeedAdvice()Las7;",Opcode.INVOKE_STATIC)
        check(method.instructions[getter+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        val bus=(method.instructions[getter+1] as OneRegisterInstruction).registerA
        val constructor=anchor(method,"Lnl/flitsmeister/fmcore/models/eventbuses/cits/CitsSpeedAdviceWrapper;-><init>(Lnl/flitsmeister/fmcore/models/data/cits/CitsSpeedAdvice;Z)V",Opcode.INVOKE_DIRECT)
        check(constructor in getter+2..getter+7)
        val wrapper=(method.instructions[constructor] as FiveRegisterInstruction).registerC
        val candidates=method.instructions.withIndex().filter{(at,instruction)->
            at in constructor+1..constructor+3 && instruction.opcode==Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString()=="Las7;->a(Ljava/lang/Object;)V" &&
                instruction is FiveRegisterInstruction && instruction.registerCount==2 && instruction.registerC==bus && instruction.registerD==wrapper
        }
        check(candidates.size==1){"Changed native VRI wrapper publication in ${method.definingClass}->${method.name}"}
        Triple(method,candidates.single().index,candidates.single().value as FiveRegisterInstruction)
    }
    alert.replaceInstruction(repeatAt,"const/4 v$scratch, 0x1")
    alert.addInstruction(repeatAt+1,"invoke-static {v$scratch, v${repeat.registerD}}, Lye7;->g(ILaf7;)J")
    regular.addInstruction(quietAt,"invoke-static {p1, p2}, $WARNINGS->noSound(Ljava/lang/Object;Z)V")
    // Entry capture precedes g(), BLE routing and every local audio preference.
    regular.addInstruction(0,"invoke-static/range {p0 .. p5}, $WARNINGS->regular(Ljava/lang/Object;Ljava/lang/Object;ZZLjava/lang/String;Ljava/lang/Object;)V")
    early.addInstruction(0,"invoke-static/range {p0 .. p6}, $WARNINGS->early(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;ZLjava/lang/Object;)V")
    presentation.addInstruction(0,"invoke-static/range {p1 .. p3}, $WARNINGS->presentation(Landroid/content/Context;Ljava/lang/Object;Z)V")
    // Replace anchors so native incoming labels also execute the observer.
    voiceOnly.replaceInstruction(voiceAt,"invoke-static/range {v$voiceRegister .. v$voiceRegister}, $WARNINGS->voiceOnly(Ljava/lang/Object;)V")
    voiceOnly.addInstruction(voiceAt+1,"invoke-virtual {v$voiceRegister}, $voiceReference")
    cits.replaceInstruction(citsAt,"invoke-static/range {v$citsRegister .. v$citsRegister}, $WARNINGS->cits(Ljava/lang/Object;)V")
    cits.addInstruction(citsAt+1,"check-cast v$citsRegister, $citsType")
    converted.replaceInstruction(publishAt,"invoke-static {v$projectionRegister, v0}, $WARNINGS->bindProjection(Ljava/lang/Object;Ljava/lang/Object;)V")
    converted.addInstruction(publishAt+1,"invoke-virtual {v${publish.registerC}, v$projectionRegister}, Las7;->a(Ljava/lang/Object;)V")
    updated.replaceInstruction(updateBusAt+2,"invoke-static {v5, v3}, $WARNINGS->bindProjection(Ljava/lang/Object;Ljava/lang/Object;)V")
    updated.addInstruction(updateBusAt+3,"invoke-virtual {v1, v5}, Las7;->a(Ljava/lang/Object;)V")
    notificationPublishes.reversed().forEach{at->
        val original=notifications.instructions[at] as FiveRegisterInstruction
        notifications.replaceInstruction(at,"invoke-static/range {v${original.registerD} .. v${original.registerD}}, $WARNINGS->notificationState(Ljava/lang/Object;)V")
        notifications.addInstruction(at+1,"invoke-virtual {v${original.registerC}, v${original.registerD}}, Las7;->a(Ljava/lang/Object;)V")
    }
    deleted.replaceInstruction(deleteAt,"invoke-static/range {v5 .. v5}, $WARNINGS->earlyRemoved(Ljava/lang/Object;)V")
    deleted.addInstruction(deleteAt+1,"sget-object v8, Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;")
    impact.replaceInstruction(impactAt,"invoke-static {v11, v10, v6}, $WARNINGS->impact(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V")
    impact.addInstruction(impactAt+1,"sget-object v11, Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;")
    impactUpdate.replaceInstruction(impactUpdateAt,"invoke-static {v9, v8, v2}, $WARNINGS->impactUpdate(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V")
    impactUpdate.addInstruction(impactUpdateAt+1,"sget-object v9, Lxl;->a:Lxl;")
    vriPlans.forEach{(method,at,invoke)->
        method.replaceInstruction(at,"invoke-static/range {v${invoke.registerD} .. v${invoke.registerD}}, $WARNINGS->vriState(Ljava/lang/Object;)V")
        method.addInstruction(at+1,"invoke-virtual {v${invoke.registerC}, v${invoke.registerD}}, Las7;->a(Ljava/lang/Object;)V")
    }
    impactRemove.addInstruction(0,"invoke-static/range {p1 .. p1}, $WARNINGS->impactRemoved(Ljava/lang/Object;)V")
    converterPlans.forEach{(method,at,registers)->
        val (invoke,result)=registers
        method.replaceInstruction(at,"invoke-static/range {v${invoke.registerC} .. v${invoke.registerC}}, $WARNINGS->citsSource(Ljava/lang/Object;)V")
        method.addInstruction(at+1,"invoke-static {v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}}, $converterReference")
        method.addInstruction(at+3,"invoke-static/range {v$result .. v$result}, $WARNINGS->citsModel(Ljava/lang/Object;)V")
    }
}
