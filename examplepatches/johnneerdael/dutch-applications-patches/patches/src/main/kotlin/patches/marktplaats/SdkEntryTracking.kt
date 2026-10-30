package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val adjust = "Lcom/adjust/sdk/AdjustInstance;"
private const val analytics = "Lcom/adyen/checkout/components/core/internal/analytics/a;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressRemainingSdkEntries() {
    // A disabled app wrapper/provider alone does not close the exported legacy
    // install-referrer receiver or direct SDK calls with an existing handler.
    for ((signature, registers, count) in listOf(
        Triple("initSdk(Lcom/adjust/sdk/AdjustConfig;)V", 4, 68),
        Triple("onResume()V", 2, 8), Triple("trackEvent(Lcom/adjust/sdk/AdjustEvent;)V", 3, 8),
        Triple("sendReferrer(Ljava/lang/String;Landroid/content/Context;)V", 6, 27),
    )) exact(adjust, signature, 1, registers, count).addInstructions(0, "return-void")
    exact("Lcom/adjust/sdk/AdjustReferrerReceiver;", "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 1, 3, 9)
        .addInstructions(0, "return-void")

    // Only e(Z) of this R8-merged class is the instrumentation feature callback:
    // instrumentation/AppEvents, crash, error and ANR branches all have native
    // false paths. Other interfaces/methods and Facebook authentication remain.
    exact("Lxj5;", "e(Z)V", 1, 12, 275).addInstructions(0, "const/4 p1, 0x0")
    exact("Ltz8;", "i()V", 9, 6, 79).addInstructions(0, "return-void")
    exact("La0;", "a()V", 25, 7, 87).addInstructions(0, "return-void")
    exact("Ldp7;", "b()V", 17, 2, 9).addInstructions(0, "return-void")
    exact("Lsok;", "k(Ljava/lang/String;Lorg/json/JSONArray;Lfp6;)V", 25, 6, 40).addInstructions(0, "return-void")
    // Shared only by the two instrument/error-report file writers in this APK.
    // Stop admission as well as upload; preserve CrashShield's bad-object set.
    exact("Lsok;", "q(Ljava/lang/String;Ljava/lang/String;)V", 25, 4, 17).addInstructions(0, "return-void")

    // The SDK's INITIAL priority is 1. Its sole priority consumer is optional
    // event admission. Keep initial setup and genuine payment attempt IDs.
    exact("Lcom/adyen/checkout/components/core/internal/ui/model/AnalyticsParamsLevel;", "getPriority()I", 17, 1, 2)
        .addInstructions(0, "const/4 p0, 0x1\nreturn p0")
    val timer = exact(analytics, "e()V", 17, 6, 44)
    check(timer.getInstruction(4).opcode == Opcode.IGET_OBJECT &&
        timer.getInstruction<ReferenceInstruction>(4).reference.toString() == "$analytics->f:Lxz2;")
    // Replace the common anchor: both the existing-timer and no-timer incoming
    // branches must clear the job after native cancellation, before returning.
    timer.replaceInstruction(4, "iput-object v1, p0, $analytics->g:Ls8f;")
    timer.addInstructions(5, "return-void\niget-object v0, p0, $analytics->f:Lxz2;")
    val send = exact(analytics, "d(Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;", 17, 12, 115)
    check(send.getInstruction(35).opcode == Opcode.IGET_OBJECT &&
        send.getInstruction<ReferenceInstruction>(35).reference.toString() == "$analytics->d:Lxnk;" &&
        send.getInstruction<ReferenceInstruction>(34).reference.toString() == "Lkotlin/ResultKt;->b(Ljava/lang/Object;)V")
    // Native Unit completes optional telemetry before repository/HTTP admission.
    // Retain coroutine validation, resume/error paths and setup-ID retrieval.
    send.addInstructions(35, "return-object v0")
}
