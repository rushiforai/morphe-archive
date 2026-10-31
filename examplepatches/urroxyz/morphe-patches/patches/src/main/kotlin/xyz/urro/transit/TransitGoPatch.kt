package xyz.urro.transit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOOK = "Lxyz/urro/transit/TransitHooks;"
private const val SMART = "Lcom/thetransitapp/droid/shared/model/cpp/SmartString;"
private val app = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/TransitApp;",name="onCreate",returnType="V",parameters=emptyList())
private val live = Fingerprint(definingClass="Ldjinni/java/src/GOLiveActivityInstruction;",name="getMainInstruction",returnType=SMART,parameters=emptyList())
private val card = Fingerprint(definingClass="Ldjinni/java/src/TripDetailsBigInstructionCard;",name="getMainInstruction",returnType=SMART,parameters=emptyList())
private val goCardRenderer = Fingerprint(definingClass="Lcom/thetransitapp/droid/trip_details/ui/b;",name="e",returnType="V")
private val plain = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/util/e;",name="e",returnType="Ljava/lang/String;",parameters=listOf(SMART,"Z","Z","Landroid/content/Context;"))
private val styled = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/util/e;",name="d",returnType="Landroid/text/SpannableString;",parameters=listOf(SMART,"Landroid/widget/TextView;","L"))
private val settings = Fingerprint(definingClass="Ldjinni/java/src/ProfileBottomSheet;",name="getComponents",returnType="Ljava/util/ArrayList;",parameters=emptyList())
private val modelCallback = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/service/ViperModuleProtocolService\$getModelFlow\$1\$callback\$1;",name="onResponse",returnType="V",parameters=listOf("Ljava/lang/Object;"))
private val goNotification = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/service/GoService;",name="a",returnType="Landroid/app/Notification;",parameters=listOf("Ldjinni/java/src/GOLiveActivityPlatformData;"))
private val serviceDestroy = Fingerprint(definingClass="Ltr5;",name="onDestroy",returnType="V",parameters=emptyList())
private val goCommand = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/service/GoService;",name="onStartCommand",returnType="I",parameters=listOf("Landroid/content/Intent;","I","I"))
private val dispatch = Fingerprint(definingClass="Lcom/thetransitapp/droid/shared/view_model/d;",name="f",returnType="V",parameters=listOf("Lcom/thetransitapp/droid/shared/model/cpp/UserAction;","Z"))

internal val transitCompatibility = Compatibility(name="Transit",packageName="com.thetransitapp.droid",apkFileType=ApkFileType.APKM,appIconColor=0x00aa77,
 targets=listOf(AppTarget(version="6.3.5",versionCodes=mapOf(SupportedAbi.ARM64_V8A to 5127740))))

/** Shared, unlisted: startup, settings sheet, action dispatcher, GO live updates and opt-in diagnostics. */
internal val transitBasePatch = bytecodePatch {
 compatibleWith(transitCompatibility)
 extendWith("extensions/extension.mpe")
 execute {
  app.method.addInstructions(0,"invoke-static {p0}, $HOOK->init(Landroid/app/Application;)V")
  modelCallback.method.addInstructions(0,"invoke-static/range {p1 .. p1}, Lxyz/urro/transit/GoModelDiagnostics;->onModel(Ljava/lang/Object;)V")
  goNotification.method.addInstructions(0,"invoke-static/range {p0 .. p1}, Lxyz/urro/transit/LiveReminders;->notification(Ljava/lang/Object;Ljava/lang/Object;)V")
  goCommand.method.addInstructions(0,"invoke-static/range {p1 .. p1}, Lxyz/urro/transit/GoActivityTransmitter;->serviceCommand(Landroid/content/Intent;)V")
  serviceDestroy.method.addInstructions(0,"invoke-static/range {p0 .. p0}, Lxyz/urro/transit/GoActivityTransmitter;->serviceDestroyed(Ljava/lang/Object;)V")
  for ((index, instruction) in goNotification.method.implementation!!.instructions.withIndex()
      .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()) {
   val register = (instruction as OneRegisterInstruction).registerA
   goNotification.method.addInstructions(index,"""
     invoke-static/range {v$register .. v$register}, Lxyz/urro/transit/LiveReminders;->notificationOutput(Landroid/app/Notification;)Landroid/app/Notification;
     move-result-object v$register
   """)
  }
  // getComponents has one register: p0 is v0 and the original iget overwrites it with the list.
  // Call the hook first, while p0 is still the model, and return its result. Exact shape only.
  val m=settings.method
  val body=m.implementation!!.instructions.toList()
  check(body.none{it.opcode==Opcode.INVOKE_STATIC}){"This Transit APK is already patched. Select the stock Transit 6.3.5 APK instead of the installed patched app."}
  check(m.implementation!!.registerCount==1&&body.size==2&&body[0].opcode==Opcode.IGET_OBJECT&&body[1].opcode==Opcode.RETURN_OBJECT){"Unexpected getComponents shape"}
  m.addInstructions(0,"""
    invoke-static {p0}, $HOOK->decorate(Ljava/lang/Object;)Ljava/util/ArrayList;
    move-result-object v0
    return-object v0
  """)
  m.removeInstructions(3,2)
  // Exact inspected method has existing locals. Fail instead of corrupting a parameter register.
  val action=dispatch.method
  check(action.implementation!!.registerCount>=4){"No scratch local in action dispatcher"}
  action.addInstructions(0,"""
    invoke-static {p1}, $HOOK->action(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :morphe_original
    return-void
    :morphe_original
    nop
  """)
 }
}

@Suppress("unused")
val transitBikeModePatch = bytecodePatch(
 name="Bike mode",
 description="Bicycle-specific GO reminders (Get bike in N stops / SOON / NOW) with editable templates. Exact stock Transit 6.3.5 build.",
 default=false
){
 compatibleWith(transitCompatibility)
 dependsOn(transitBasePatch)
 execute {
  app.method.addInstructions(0,"invoke-static {}, $HOOK->enableBike()V")
  for(f in listOf(live,card)){
   val m=f.method
   val returns=m.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}
   check(returns.isNotEmpty()){"Missing instruction return"}
   for((i,insn) in returns.asReversed()){
    val r=(insn as OneRegisterInstruction).registerA
    m.addInstructions(i,"invoke-static/range {v$r .. v$r}, $HOOK->mark(Ljava/lang/Object;)V")
   }
  }
  // The visible Compose text bypasses the plain resolver. Replace only this GO call's argument.
  val renderer = goCardRenderer.method
  val renderInstructions = renderer.implementation!!.instructions.toList()
  val mainCalls = renderInstructions.withIndex().filter { (_, instruction) ->
   val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
   ref?.definingClass == "Ldjinni/java/src/TripDetailsBigInstructionCard;" && ref.name == "getMainInstruction"
  }
  check(mainCalls.size == 1) { "Unexpected GO main-instruction render boundary" }
  val resultIndex = mainCalls.single().index + 1
  val result = renderInstructions[resultIndex]
  check(result.opcode == Opcode.MOVE_RESULT_OBJECT) { "Missing GO main-instruction result" }
  val smartRegister = (result as OneRegisterInstruction).registerA
  renderer.addInstructions(resultIndex + 1, """
   invoke-static/range {v$smartRegister .. v$smartRegister}, Lxyz/urro/transit/GoComposeReminders;->instruction(Ljava/lang/Object;)Ljava/lang/Object;
   move-result-object v$smartRegister
   check-cast v$smartRegister, $SMART
  """)
  plain.method.addInstructions(0,"invoke-static/range {p0 .. p0}, $HOOK->resolverEnter(Ljava/lang/Object;)V")
  for((f,method,type) in listOf(Triple(plain,"text","Ljava/lang/String;"),Triple(styled,"styled","Landroid/text/SpannableString;"))){
   val m=f.method
   val returns=m.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}
   check(returns.isNotEmpty()){"Missing formatter return"}
   for((i,insn) in returns.asReversed()){
    val r=(insn as OneRegisterInstruction).registerA
    val extra=if(method=="styled") "move-object/from16 v3, p1" else ""
    val last=if(method=="styled") "v3" else "v2"
    val signature=if(method=="styled") "Ljava/lang/Object;${type}Landroid/widget/TextView;" else "Ljava/lang/Object;$type"
    // Keep branch labels on this location: inserting before a return lets jumps skip the hook.
    m.replaceInstruction(i,"nop")
    m.addInstructions(i+1,"""
      move-object/from16 v2, v$r
      move-object/from16 v1, p0
      $extra
      invoke-static/range {v1 .. $last}, $HOOK->$method($signature)$type
      move-result-object v$r
      return-object v$r
    """)
   }
  }
 }
}

@Suppress("unused")
val transitMotionCuesPatch = bytecodePatch(
 name="Physical Activity spoof [TRANSMITTER]",
 description="Publishes IN_VEHICLE immediately while GO confirms you are aboard a vehicle. Requires a same-signer app patched with Physical Activity spoof [RECEIVER].",
 default=false
){
 compatibleWith(transitCompatibility)
 dependsOn(transitBasePatch,xyz.urro.activityspoof.transmitterResources)
 extendWith("extensions/activity-spoof.mpe")
 execute {
  app.method.addInstructions(0,"invoke-static {}, $HOOK->enableActivity()V")
 }
}
