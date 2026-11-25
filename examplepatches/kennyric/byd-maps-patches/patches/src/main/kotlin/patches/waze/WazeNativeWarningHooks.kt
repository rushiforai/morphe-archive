package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

internal const val WAZE_WARNINGS = "Lorg/ungoogled/waze/NativeWarnings;"
internal const val WAZE_SOUND_ROOT = "Lcom/waze/alerters/AlerterNativeManagerBase;->h(Lcom/waze/jni/protos/alerters/AlerterId;)V"
internal const val WAZE_ZONE_EXIT_ROOT = "Lcom/waze/alerters/b/i;->k()V"
internal const val WAZE_CAR_CREATED_ROOT = "Lcom/waze/car_lib/WazeCarAppService;->onCreate()V"
internal const val WAZE_CAR_DESTROYED_ROOT = "Lcom/waze/car_lib/WazeCarAppService;->onDestroy()V"
internal const val WAZE_ZONE_PHASE_ROOT = "Lcom/waze/alerters/b/o;->d(Lcom/waze/alerters/b/o;Lcom/waze/alerters/b/h;)Lcom/waze/alerters/b/h;"
internal const val WAZE_ZONE_SELECTED_ROOT = "Lcom/waze/alerters/b/i;->i()V"
internal const val WAZE_NOTIFICATION_ADD_ROOT = "Lcom/waze/insights_infra/NotificationInsightsNativeManager;->a(Lcom/waze/jni/protos/insights_infra/Notification;)V"
internal const val WAZE_NOTIFICATION_REMOVE_ROOT = "Lcom/waze/insights_infra/NotificationInsightsNativeManager;->b(Lcom/waze/jni/protos/insights_infra/NotificationId;)V"

context(context: BytecodePatchContext)
internal fun bindWazeNativeWarnings() {
    validateWazeWarningClassAbi(wazeWarningClassAbi.associateWith { context.mutableClassDefBy(it) })
    val methods = wazeWarningContracts.keys.associateWith { descriptor ->
        val signature = descriptor.substringAfter("->")
        val parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
            .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
        Fingerprint(definingClass = descriptor.substringBefore("->"), name = signature.substringBefore('('),
            returnType = signature.substringAfter(')'), parameters = parameters).method
    }
    // Resolve the complete extension ABI before changing any native method.
    val extension = listOf("bound" to "Z", "sound" to "V", "zoneExit" to "V", "zoneSelected" to "V", "zonePresented" to "V",
        "notificationAdded" to "V", "notificationRemoved" to "V", "carUiStarted" to "V", "carUiStopped" to "V").associate { (name, result) ->
        val method = Fingerprint(definingClass = WAZE_WARNINGS, name = name, returnType = result,
            parameters = if (name == "bound") emptyList() else listOf("Ljava/lang/Object;")).method
        check((method.accessFlags and 9) == 9 && method.implementation != null) { "Changed Waze warning extension ABI $name" }
        name to method
    }
    val bound = extension.getValue("bound")
    check(bound.implementation!!.registerCount == 1 && bound.instructions.size == 2 &&
        bound.instructions[0].opcode == Opcode.CONST_4 &&
        (bound.instructions[0] as WideLiteralInstruction).wideLiteral == 0L &&
        bound.instructions[1].opcode == Opcode.RETURN) { "Changed or already bound Waze warning extension" }
    bindWazeNativeWarnings(methods)
    // A Java adapter alone must never claim that the native cohort was bound.
    extension.getValue("bound").addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}

/** All original bodies and branch/register anchors must pass before the first edit. */
internal fun bindWazeNativeWarnings(methods: Map<String, MutableMethod>) {
    validateWazeWarningMethods(methods)
    val sound = methods.getValue(WAZE_SOUND_ROOT)
    val zoneExit = methods.getValue(WAZE_ZONE_EXIT_ROOT)
    val zoneSelected = methods.getValue(WAZE_ZONE_SELECTED_ROOT)
    val zonePhases = methods.getValue(WAZE_ZONE_PHASE_ROOT)
    val phasePublications = zonePhases.instructions.withIndex().filter {
        (it.value as? ReferenceInstruction)?.reference?.toString() == "Lcom/waze/alerters/a/i;->c(Lcom/waze/alerters/a/c;)Z"
    }
    check(phasePublications.map { it.index } == listOf(38, 79))
    check(phasePublications.map { (it.value as FiveRegisterInstruction).registerD } == listOf(6, 2))
    check(phasePublications.all { it.value.opcode == Opcode.INVOKE_INTERFACE && (it.value as FiveRegisterInstruction).registerCount == 2 })
    val add = methods.getValue(WAZE_NOTIFICATION_ADD_ROOT)
    val remove = methods.getValue(WAZE_NOTIFICATION_REMOVE_ROOT)
    val anchor = zoneExit.instructions[7]
    check(anchor.opcode == Opcode.IGET_OBJECT &&
        (anchor as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/b/i;->a:Lcom/waze/alerters/b/o;" &&
        (anchor as TwoRegisterInstruction).registerA == 2 && anchor.registerB == 2)
    check(zoneExit.instructions[6].opcode == Opcode.IF_NE &&
        (zoneExit.instructions[10] as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/a/l;->g()V")
    val enterAnchor = zoneExit.instructions[12]
    check(enterAnchor.opcode == Opcode.IGET_OBJECT &&
        (enterAnchor as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/b/i;->a:Lcom/waze/alerters/b/o;" &&
        (enterAnchor as TwoRegisterInstruction).registerA == 0 && enterAnchor.registerB == 2)
    val identityRead = zoneExit.instructions[13]
    check(identityRead.opcode == Opcode.IGET_OBJECT &&
        (identityRead as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/b/i;->c:Lcom/waze/j;" &&
        (identityRead as TwoRegisterInstruction).registerA == 2 && identityRead.registerB == 2)
    check((zoneExit.instructions[16] as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/a/l;->d(Lcom/waze/j;)V" &&
        (zoneExit.instructions[19] as ReferenceInstruction).reference.toString() == "Lcom/waze/alerters/a/l;->f(Lcom/waze/j;)V")

    // Native zone state has already selected and validated this phase. Observe after
    // publication without requiring a UI card acknowledgement. The service's boolean
    // only reports insertion of its UI queue ID; a previous phase can retain that ID.
    for (site in phasePublications.reversed()) {
        val register = (site.value as FiveRegisterInstruction).registerD
        zonePhases.addInstruction(site.index + 1, "invoke-static/range {v$register .. v$register}, $WAZE_WARNINGS->zoneSelected(Ljava/lang/Object;)V")
    }

    methods.getValue(WAZE_CAR_CREATED_ROOT).addInstruction(0, "invoke-static/range {p0 .. p0}, $WAZE_WARNINGS->carUiStarted(Ljava/lang/Object;)V")
    methods.getValue(WAZE_CAR_DESTROYED_ROOT).addInstruction(0, "invoke-static/range {p0 .. p0}, $WAZE_WARNINGS->carUiStopped(Ljava/lang/Object;)V")

    // This native request precedes JNI playback and every managed local audio mute.
    // Managed speech intentionally uses Maps/Vela choices, upstream of Waze's own
    // per-camera sound and below-limit playback preferences.
    sound.addInstruction(0, "invoke-static/range {p1 .. p1}, $WAZE_WARNINGS->sound(Ljava/lang/Object;)V")
    // The native selector invokes this callback independently of UI presentation.
    // Observe its selected controller without calling k() or any native acknowledgement.
    zoneSelected.addInstruction(0, "invoke-static/range {p0 .. p0}, $WAZE_WARNINGS->zoneSelected(Ljava/lang/Object;)V")
    // Capture the InZone controller before the next native instruction replaces
    // p0/v2 with its ID. The marker correlates the following synchronous f(id)
    // sound request to this controller; it does not call native presentation.
    zoneExit.replaceInstruction(12, "invoke-static/range {p0 .. p0}, $WAZE_WARNINGS->zonePresented(Ljava/lang/Object;)V")
    zoneExit.addInstruction(13, "iget-object v0, v2, Lcom/waze/alerters/b/i;->a:Lcom/waze/alerters/b/o;")
    // p0 aliases v2 and is overwritten by the original instruction. Capture it only in
    // the LeftZone branch, while its exact public a() identity is still available.
    // Replacing the anchor ensures native labels also execute capture.
    zoneExit.replaceInstruction(7, "invoke-static/range {p0 .. p0}, $WAZE_WARNINGS->zoneExit(Ljava/lang/Object;)V")
    zoneExit.addInstruction(8, "iget-object v2, v2, Lcom/waze/alerters/b/i;->a:Lcom/waze/alerters/b/o;")
    // Notification repository callbacks carry state, never native sound intent.
    add.addInstruction(0, "invoke-static/range {p1 .. p1}, $WAZE_WARNINGS->notificationAdded(Ljava/lang/Object;)V")
    remove.addInstruction(0, "invoke-static/range {p1 .. p1}, $WAZE_WARNINGS->notificationRemoved(Ljava/lang/Object;)V")
}
