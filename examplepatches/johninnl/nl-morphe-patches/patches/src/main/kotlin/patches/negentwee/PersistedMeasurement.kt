package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Collection flags do not cover restored CCT batches in this original. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressPersistedMeasurement() {
    val owner = "Lyx0;"
    val signature = "v(Loy0;I)V"
    val method = exact(owner, signature, 1, 51, 605)
    val anchor = method.getInstruction<TwoRegisterInstruction>(114)
    check(anchor.opcode == Opcode.MOVE_OBJECT && anchor.registerA == 8 && anchor.registerB == 2)
    val classDef = target(owner, signature).classDef
    check(classDef.methods.none { it.name == "morpheMeasurementBatch" })
    val reject = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION",
        "FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS").joinToString("\n") { name -> """
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
            check-cast v2, Lpx0;
            iget-object v3, v2, Lpx0;->a:Ljava/lang/String;
            $reject
            invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :next
            :done
            return-object v0
        """.trimIndent())
    })
    // Replace the shared anchor so incoming metrics/no-metrics branches both
    // execute the filter. v0 remains the native extras/metrics-enabled value.
    method.replaceInstruction(114,
        "invoke-static {v14}, Lyx0;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
    method.addInstructionsWithLabels(115, """
        move-result-object v14
        invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v8
        if-eqz v8, :keep
        const-wide/16 v12, -0x1
        goto/32 :fatal
        :keep
        move-object v8, v2
    """.trimIndent(), ExternalLabel("fatal", method.getInstruction(41)))
    // Native FATAL_ERROR/-1 dispatch deletes the original persisted batch.
    // Retained data continues through genuine HTTP, deletion and retry paths.
}
