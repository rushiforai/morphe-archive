package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressPersistedMeasurement() {
    val owner = "Lnw0;"
    val signature = "b(Ldy0;I)V"
    val method = exact(owner, signature, 1, 49, 591)
    val anchor = method.getInstruction<TwoRegisterInstruction>(113)
    check(anchor.opcode == Opcode.MOVE_OBJECT && anchor.registerA == 8 && anchor.registerB == 9) {
        "Marktplaats post-metrics upload anchor changed"
    }
    val status = "Lcom/google/android/datatransport/runtime/backends/BackendResponse\$Status;"
    check(method.getInstruction(42).opcode == Opcode.NEW_INSTANCE &&
        method.getInstruction<ReferenceInstruction>(42).reference.toString() == "Lqt0;" &&
        method.getInstruction<ReferenceInstruction>(43).reference.toString() == "$status->FATAL_ERROR:$status" &&
        method.getInstruction<ReferenceInstruction>(44).reference.toString() == "Lqt0;-><init>(${status}J)V") {
        "Marktplaats native fatal-discard path changed"
    }
    val classDef = target(owner, signature).classDef
    check(classDef.methods.none { it.name == "morpheMeasurementBatch" })
    val reject = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION", "FCM_CLIENT_EVENT_LOGGING",
        "GDT_CLIENT_METRICS", "FIREPERF", "FIREPERF_AUTOPUSH", "FIREPERF_INTERNAL_LOW", "FIREPERF_INTERNAL_HIGH")
        .joinToString("\n") { name -> """
            const-string v4, "$name"
            invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v4
            if-nez v4, :next
        """.trimIndent() }
    classDef.methods.add(MutableMethod(ImmutableMethod(owner, "morpheMeasurementBatch",
        listOf(ImmutableMethodParameter("Ljava/util/ArrayList;", emptySet(), null)),
        "Ljava/util/ArrayList;", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :next
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lvv0;
            iget-object v3, v2, Lvv0;->a:Ljava/lang/String;
            $reject
            invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :next
            :done
            return-object v0
        """.trimIndent())
    })
    // Replace the common instruction so metrics and no-metrics incoming branches
    // both run the filter. Keep original persisted rows, context and extras.
    method.replaceInstruction(113,
        "invoke-static {v0}, $owner->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
    method.addInstructionsWithLabels(114, """
        move-result-object v0
        invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v8
        if-eqz v8, :keep
        const-wide/16 v13, -0x1
        goto/32 :fatal
        :keep
        move-object v8, v9
    """.trimIndent(), ExternalLabel("fatal", method.getInstruction(42)))
    // Native FATAL_ERROR/-1 handling deletes an all-telemetry batch as an
    // intentional discard. Retained events use real HTTP results and retries.
}
