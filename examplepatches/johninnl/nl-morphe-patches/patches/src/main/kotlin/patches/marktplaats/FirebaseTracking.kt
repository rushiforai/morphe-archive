package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val crash = "Lcom/horizon/android/core/tracking/crash/a;"
private const val remoteSettings = "Lcom/google/firebase/sessions/settings/a;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressFirebaseMeasurement() {
    val constructor = exact(crash, "<init>()V", 65537, 5, 34)
    check(constructor.getInstruction(3).opcode == Opcode.IPUT_BOOLEAN &&
        constructor.getInstruction<ReferenceInstruction>(3).reference.toString() == "$crash->a:Z")
    // v0 also selects a genuine lazy dependency later in this constructor.
    // Preserve it while setting only the app's collection override to false.
    constructor.replaceInstruction(3, "const/4 v1, 0x0")
    constructor.addInstructions(4, "iput-boolean v1, p0, $crash->a:Z")
    for ((signature, registers, count) in listOf(
        Triple("b()V", 9, 100), Triple("c(Ljava/lang/String;)V", 6, 20),
        Triple("d(Ljava/lang/String;Ljava/lang/Throwable;)V", 3, 5), Triple("e(Ljava/lang/Throwable;)V", 4, 25),
    )) exact(crash, signature, 17, registers, count).addInstructions(0, "return-void")

    // Permanent SDK predicates take precedence over old preferences and later
    // app/runtime setters, without disabling functional Firebase components.
    exact("Lh04;", "f()Z", 131073, 2, 20).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    exact("Lpfj;", "z0()Z", 17, 2, 14).addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    exact("Lfd3;", "g()Ljava/lang/Boolean;", 17, 4, 61)
        .addInstructions(0, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")
    exact("Lsw8;", "a()Ljava/lang/Boolean;", 17, 3, 12)
        .addInstructions(0, "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")
    exact("Lad2;", "c()Z", 9, 6, 40).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    // HorizonApplication explicitly asks to enable export. Retain the native
    // preference write, but store false for that and all later setter calls.
    exact("Lad2;", "h(Z)V", 9, 4, 15).addInstructions(0, "const/4 p0, 0x0")
    for ((signature, registers, count) in listOf(
        Triple("d(Lzf6;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 5, 6),
        Triple("e(Lajg;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 5, 6),
        Triple("f(Llqb;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 16, 702),
        Triple("onUpdateAppState(Lcom/google/firebase/perf/v1/ApplicationProcessState;)V", 4, 16),
    )) exact("Lupg;", signature, 17, registers, count).addInstructions(0, "return-void")

    // This Callable is merged with asset, WorkManager and other operations.
    // Only the settings branch returns its existing unavailable/null outcome,
    // after the native worker check and SettingsRequest query validation.
    val settings = exact("Llc3;", "call()Ljava/lang/Object;", 17, 12, 197)
    val settingsStart = 160
    check(settings.getInstruction(settingsStart).opcode == Opcode.NEW_INSTANCE &&
        settings.getInstruction<ReferenceInstruction>(settingsStart).reference.toString() == boundCode("Lgvg;"))
    check(settings.getInstruction<ReferenceInstruction>(settingsStart - 2).reference.toString() == boundCode("Lhla;->R(Lzie;)Ljava/util/HashMap;"))
    settings.addInstructions(settingsStart, "return-object v4")

    // Complete a fresh Sessions settings update after ResultKt validation and
    // before mutex acquisition/HTTP job creation. Keep resume/error branches.
    val update = exact(remoteSettings, "d(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 17, 22, 165)
    check(update.getInstruction(53).opcode == Opcode.IGET_OBJECT &&
        update.getInstruction<ReferenceInstruction>(53).reference.toString() == "$remoteSettings->f:Lkotlinx/coroutines/sync/a;")
    check(update.getInstruction<ReferenceInstruction>(52).reference.toString() == "Lkotlin/ResultKt;->b(Ljava/lang/Object;)V")
    update.addInstructions(53, "return-object v11")
}
