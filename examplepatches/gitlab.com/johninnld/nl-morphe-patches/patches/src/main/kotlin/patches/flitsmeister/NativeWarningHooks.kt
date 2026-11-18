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

/** Resolve every native authority before edits; parameters and native completion stay untouched. */
context(context: BytecodePatchContext)
internal fun bindFlitsmeisterNativeWarnings() {
    if (isFlitsmeister15()) { bindFlitsmeisterNativeWarnings15();return }
    val methods=flitsmeisterWarningContracts.keys.associateWith { descriptor ->
        val owner=descriptor.substringBefore("->");val signature=descriptor.substringAfter("->")
        val parameters=Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map{it.value}.toList()
        exact(owner,signature.substringBefore('('),signature.substringAfter(')'),*parameters.toTypedArray()).method
    }
    bindFlitsmeisterNativeWarnings(methods)
}

/** Testable complete transformation; validate every root before changing any method. */
internal fun bindFlitsmeisterNativeWarnings(methods:Map<String,MutableMethod>) {
    if(methods.keys==flitsmeisterWarningContracts15.keys){bindFlitsmeisterNativeWarnings15(methods);return}
    validateFlitsmeisterWarningMethods(methods)
    fun pick(owner:String,name:String,result:String="V",vararg parameters:String)=methods.getValue("$owner->$name(${parameters.joinToString("")})$result")
    fun shape(method:MutableMethod,registers:Int,count:Int):MutableMethod {
        check(method.implementation?.registerCount==registers&&method.instructions.size==count) { "Changed native warning authority: ${method.definingClass}->${method.name}" }
        return method
    }
    val regular=shape(pick("Ls6i;","l","V",REPORT,"Z","Z","Ljava/lang/String;","Lz39;"),16,136)
    val early=shape(pick("Ls6i;","b","V",EARLY_TYPE,EARLY_REPORT,EARLY_NOTIFICATION,"Ljava/lang/String;","Z","Lz39;"),18,40)
    val voiceOnly=shape(pick("Lxl\$c;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;"),14,119)
    val cits=shape(pick("Lfc0;","x","V",REPORT),27,610)
    val presentation=shape(pick("Lxl;","k","V","Landroid/content/Context;",EARLY_VIEW,"Z"),11,69)
    val converted=shape(pick("Lvz2;","J","Z","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),31,279)
    val updated=shape(pick("Lvz2;","L","Z","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),20,102)
    val deleted=shape(pick("Lvz2\$c;","invokeSuspend","Ljava/lang/Object;","Ljava/lang/Object;"),10,53)
    val notifications=methods.getValue(FLITSMEISTER_EARLY_NOTIFICATION_ROOT)
    // Whole-body validation above permits only the original or exact FeatureUi insertion.
    val notificationShift=if(flitsmeisterWarningFingerprint(notifications)==FLITSMEISTER_EARLY_FEATURE_UI_HASH)1 else 0
    shape(notifications,15,248+notificationShift)
    val impact=shape(pick("Lcz2;","a","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),12,192)
    val impactUpdate=shape(pick("Lcz2;","e","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),10,127)
    val impactRemove=shape(pick("Lcz2;","b","V","Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;"),13,188)
    fun anchor(method:MutableMethod,reference:String,opcode:Opcode?=null):Int {
        val positions=method.instructions.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString()==reference && (opcode==null||it.value.opcode==opcode) }
        check(positions.size==1) { "Changed warning anchor $reference in ${method.definingClass}->${method.name}" }
        return positions.single().index
    }
    // This getter exists only after the resumed suppression and VOICE_ONLY tests.
    val voiceReference="Lnl/flitsmeister/fmcore/data/model/reports/Incident;->getVoiceOnlyText()Ljava/lang/String;"
    val voiceAt=anchor(voiceOnly,voiceReference,Opcode.INVOKE_VIRTUAL)
    val voiceRegister=(voiceOnly.instructions[voiceAt] as FiveRegisterInstruction).registerC
    val citsType="Lnl/flitsmeister/fmcore/models/data/cits/CitsBaseReport;"
    val citsAt=anchor(cits,citsType,Opcode.CHECK_CAST)
    val citsRegister=(cits.instructions[citsAt] as OneRegisterInstruction).registerA
    val busAt=anchor(converted,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->getBusAlert()Lfs7;")
    val publishes=converted.instructions.withIndex().filter { it.index in busAt+1..busAt+5 && (it.value as? ReferenceInstruction)?.reference?.toString()=="Lfs7;->a(Ljava/lang/Object;)V" }
    check(publishes.size==1) { "Changed CITS early-warning projection publication" }
    val publishAt=publishes.single().index
    val publish=publishes.single().value as FiveRegisterInstruction
    check(publish.registerCount==2) { "Changed CITS projection registers" }
    val projectionRegister=publish.registerD
    // Guard additional accepted state/removal publications before any mutation.
    val updateBusAt=anchor(updated,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->getBusAlert()Lfs7;")
    val updatePublish=updated.instructions[updateBusAt+2] as FiveRegisterInstruction
    check((updated.instructions[updateBusAt+2] as ReferenceInstruction).reference.toString()=="Lfs7;->a(Ljava/lang/Object;)V"&&updatePublish.registerC==1&&updatePublish.registerD==5)
    check((updated.instructions[45] as ReferenceInstruction).reference.toString()==EARLY_REPORT)
    val notificationBus="Lnl/flitsmeister/fmcore/models/eventbuses/AppNotificationBus;->getBusEarlyWarningNotification()Lfs7;"
    val notificationPublishes=notifications.instructions.withIndex().filter{(it.value as? ReferenceInstruction)?.reference?.toString()==notificationBus}.map{it.index+2}
    check(notificationPublishes==listOf(212+notificationShift,244+notificationShift))
    notificationPublishes.forEach{check((notifications.instructions[it] as ReferenceInstruction).reference.toString()=="Lfs7;->a(Ljava/lang/Object;)V")}
    val deleteAt=anchor(deleted,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;",Opcode.SGET_OBJECT)
    check(deleted.instructions[31].opcode==Opcode.INSTANCE_OF&&(deleted.instructions[31] as ReferenceInstruction).reference.toString()==EARLY_REPORT)
    check((deleted.instructions[31] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB==5)
    val impactAt=anchor(impact,"Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;",Opcode.SGET_OBJECT)
    check(impactAt==143&&(impact.instructions[140] as ReferenceInstruction).reference.toString()=="Lzz2;->b(Lbemobile/cits/sdk/core/model/response/ImpactAttenuator;Landroid/content/Context;)$EARLY_VIEW")
    val impactUpdateAt=anchor(impactUpdate,"Lxl;->a:Lxl;",Opcode.SGET_OBJECT)
    check(impactUpdateAt==83&&(impactUpdate.instructions[79] as ReferenceInstruction).reference.toString()=="Lzz2;->b(Lbemobile/cits/sdk/core/model/response/ImpactAttenuator;Landroid/content/Context;)$EARLY_VIEW")
    val converterReference="Ll71;->c(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;Landroid/content/Context;Lwie;)$REPORT"
    val converterPlans=listOf(converted,updated).map{method->
        val at=anchor(method,converterReference,Opcode.INVOKE_STATIC)
        val invoke=method.instructions[at] as FiveRegisterInstruction
        check(invoke.registerCount==3&&method.instructions[at+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        Triple(method,at,invoke to (method.instructions[at+1] as OneRegisterInstruction).registerA)
    }
    val vriPlans=listOf(impact,impactRemove,impactUpdate).map{method->
        val getter=anchor(method,"Lnl/flitsmeister/fmcore/models/eventbuses/cits/VRISpeedAdviceBusKt;->getBusVRISpeedAdvice()Lfs7;",Opcode.INVOKE_STATIC)
        check(method.instructions[getter+1].opcode==Opcode.MOVE_RESULT_OBJECT)
        val bus=(method.instructions[getter+1] as OneRegisterInstruction).registerA
        val constructor=anchor(method,"Lnl/flitsmeister/fmcore/models/eventbuses/cits/CitsSpeedAdviceWrapper;-><init>(Lnl/flitsmeister/fmcore/models/data/cits/CitsSpeedAdvice;Z)V",Opcode.INVOKE_DIRECT)
        check(constructor in getter+2..getter+7)
        val wrapper=(method.instructions[constructor] as FiveRegisterInstruction).registerC
        val candidates=method.instructions.withIndex().filter{(at,instruction)->
            at in constructor+1..constructor+3 && instruction.opcode==Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString()=="Lfs7;->a(Ljava/lang/Object;)V" &&
                instruction is FiveRegisterInstruction && instruction.registerCount==2 && instruction.registerC==bus && instruction.registerD==wrapper
        }
        check(candidates.size==1){"Changed native VRI wrapper publication in ${method.definingClass}->${method.name}"}
        Triple(method,candidates.single().index,candidates.single().value as FiveRegisterInstruction)
    }
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
    converted.addInstruction(publishAt+1,"invoke-virtual {v${publish.registerC}, v$projectionRegister}, Lfs7;->a(Ljava/lang/Object;)V")
    updated.replaceInstruction(updateBusAt+2,"invoke-static {v5, v3}, $WARNINGS->bindProjection(Ljava/lang/Object;Ljava/lang/Object;)V")
    updated.addInstruction(updateBusAt+3,"invoke-virtual {v1, v5}, Lfs7;->a(Ljava/lang/Object;)V")
    notificationPublishes.reversed().forEach{at->
        val original=notifications.instructions[at] as FiveRegisterInstruction
        notifications.replaceInstruction(at,"invoke-static/range {v${original.registerD} .. v${original.registerD}}, $WARNINGS->notificationState(Ljava/lang/Object;)V")
        notifications.addInstruction(at+1,"invoke-virtual {v${original.registerC}, v${original.registerD}}, Lfs7;->a(Ljava/lang/Object;)V")
    }
    deleted.replaceInstruction(deleteAt,"invoke-static/range {v5 .. v5}, $WARNINGS->earlyRemoved(Ljava/lang/Object;)V")
    deleted.addInstruction(deleteAt+1,"sget-object v8, Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;")
    impact.replaceInstruction(impactAt,"invoke-static {v11, v10, v6}, $WARNINGS->impact(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V")
    impact.addInstruction(impactAt+1,"sget-object v11, Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/EarlyWarningsBus;")
    impactUpdate.replaceInstruction(impactUpdateAt,"invoke-static {v9, v8, v2}, $WARNINGS->impactUpdate(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/Context;)V")
    impactUpdate.addInstruction(impactUpdateAt+1,"sget-object v9, Lxl;->a:Lxl;")
    vriPlans.forEach{(method,at,invoke)->
        method.replaceInstruction(at,"invoke-static/range {v${invoke.registerD} .. v${invoke.registerD}}, $WARNINGS->vriState(Ljava/lang/Object;)V")
        method.addInstruction(at+1,"invoke-virtual {v${invoke.registerC}, v${invoke.registerD}}, Lfs7;->a(Ljava/lang/Object;)V")
    }
    impactRemove.addInstruction(0,"invoke-static/range {p1 .. p1}, $WARNINGS->impactRemoved(Ljava/lang/Object;)V")
    converterPlans.forEach{(method,at,registers)->
        val (invoke,result)=registers
        method.replaceInstruction(at,"invoke-static/range {v${invoke.registerC} .. v${invoke.registerC}}, $WARNINGS->citsSource(Ljava/lang/Object;)V")
        method.addInstruction(at+1,"invoke-static {v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}}, $converterReference")
        method.addInstruction(at+3,"invoke-static/range {v$result .. v$result}, $WARNINGS->citsModel(Ljava/lang/Object;)V")
    }
}
