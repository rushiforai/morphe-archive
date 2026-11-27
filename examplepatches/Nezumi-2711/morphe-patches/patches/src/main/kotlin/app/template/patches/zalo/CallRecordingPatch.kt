package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val IN_CALL_ACTIVITY = "Lzm/voip/ui/incall/ZmInCallActivity;"
private const val CALL_CALLBACK_BASE = "Lcom/vng/zing/vn/zrtc/CallCallback;"

// ZmInCallActivity.j0(): builds the top-left minimise button (id call_minimizeBtn, chevron icon)
// and adds it to the root FrameLayout. The record button is attached right after that addView.
private object InCallMinimizeButtonFingerprint : Fingerprint(
    definingClass = IN_CALL_ACTIVITY,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET, name = "call_minimizeBtn"),
        fieldAccess(opcode = Opcode.SGET, name = "zds_ic_chevron_left_line_24"),
    ),
)

// ZaloVoipCallback (extends CallCallback) overrides; names are JNI callbacks so they are not obfuscated.
private object CallStateFingerprint : Fingerprint(
    name = "onCallState",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("I"),
    filters = listOf(string("onCallState: ")),
)

private object MakeCallFingerprint : Fingerprint(
    name = "onMakeCall",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(string("onMakeCall")),
)

private object IncomingCallFingerprint : Fingerprint(
    name = "onIncomingCall",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(string("onIncomingCall")),
)

private object CallServiceDestroyFingerprint : Fingerprint(
    definingClass = "Lzm/voip/service/CallService;",
    name = "onDestroy",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val callRecordingPatch = bytecodePatch(
    name = "Call recording",
    description = "Adds a record button to the Zalo 1-1 in-call screen. Recordings are saved as m4a in Music/ZaloRecordings.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.CALL_RECORDING)
        check(InCallMinimizeButtonFingerprint.matchAll(1..1).size == 1)
        check(CallStateFingerprint.matchAll(1..1).size == 1)
        check(MakeCallFingerprint.matchAll(1..1).size == 1)
        check(IncomingCallFingerprint.matchAll(1..1).size == 1)
        check(CallServiceDestroyFingerprint.matchAll(1..1).size == 1)

        // Lifecycle: all three callbacks must live in the same ZaloVoipCallback class.
        val callState = CallStateFingerprint.method
        val makeCall = MakeCallFingerprint.method
        val incoming = IncomingCallFingerprint.method
        check(callState.definingClass == makeCall.definingClass)
        check(callState.definingClass == incoming.definingClass)
        check(mutableClassDefBy(callState.definingClass).superclass == CALL_CALLBACK_BASE)
        check(callState.implementation!!.registerCount >= 2)

        // Native recorder entry point and the obfuscated peer holder the extension reads reflectively.
        val peerJni = mutableClassDefBy("Lcom/vng/zing/vn/zrtc/PeerJNI;")
        check(peerJni.methods.any {
            it.name == "zrtc_peer_start_record_audio" &&
                it.parameterTypes.map { type -> type.toString() } == listOf("J", "Z", "Ljava/lang/String;")
        })
        val holder = mutableClassDefBy("Ldx2;")
        check(holder.fields.any { it.name == "a" && it.type == "Lsyj;" })
        check(mutableClassDefBy("Lsyj;").fields.any { it.name == "e" && it.type == "J" })

        // Direction: remember whether the call being set up is outgoing or incoming.
        makeCall.addInstructions(0, "invoke-static {}, $CALL_RECORDER->onMakeCall()V")
        incoming.addInstructions(0, "invoke-static {}, $CALL_RECORDER->onIncomingCall()V")
        // Auto-stop when the call ends (6 = ended). p1 is the state int.
        callState.addInstructions(0, "invoke-static {p1}, $CALL_RECORDER->onCallState(I)V")
        // Safety net if the end callback was missed.
        CallServiceDestroyFingerprint.method.addInstructions(0, "invoke-static {}, $CALL_RECORDER->onCallEnded()V")

        // In-call button: right after `this.F.addView(this.R2)` at the end of j0().
        val minimize = InCallMinimizeButtonFingerprint.method
        val instructions = minimize.implementation!!.instructions.toList()
        val addViewIndex = instructions.indexOfLast {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.name == "addView" && ref.parameterTypes.map { type -> type.toString() } ==
                listOf("Landroid/view/View;")
        }
        check(addViewIndex >= 0)
        check(instructions[addViewIndex + 1].opcode == Opcode.RETURN_VOID)
        val addView = minimize.getInstruction<FiveRegisterInstruction>(addViewIndex)
        check(addView.registerCount == 2 && addView.registerD < 16)
        // p0 is clobbered by the R2 load in 26.11.01 (iget-object v4, v4, R2), so only the view is passed;
        // the extension unwraps the Activity from its context.
        minimize.addInstructions(addViewIndex + 1, """
            invoke-static {v${addView.registerD}}, $CALL_RECORDING_UI->attach(Landroid/view/View;)V
        """.trimIndent())

        registerHooks(PatchId.CALL_RECORDING, makeCall, incoming, callState, CallServiceDestroyFingerprint.method, minimize)
        attachNezumiSettings("attachCallRecording")
    }
}
