package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** CCT send is inlined in this original; collection flags do not cover restored batches. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressPersistedMeasurement() {
    val target = exact("Lgcd;", "a(Lpm0;I)V")
    val method = target.method
    check(method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
        Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } == 594 &&
        method.implementation!!.registerCount == 49 && method.accessFlags == 0x11)
    val anchor = method.instructions.toList()[107]
    check(anchor.opcode == Opcode.MOVE_OBJECT && (anchor as TwoRegisterInstruction).registerA == 0 && anchor.registerB == 6)
    check(target.classDef.methods.none { it.name == "morpheMeasurementBatch" })
    val reject = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION",
        "FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS", "FIREPERF", "FIREPERF_AUTOPUSH",
        "FIREPERF_INTERNAL_LOW", "FIREPERF_INTERNAL_HIGH").joinToString("\n") { name -> """
        const-string v4, "$name"
        invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :next
    """.trimIndent() }
    target.classDef.methods.add(queueHelper("Lgcd;", "morpheMeasurementBatch",
        listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;", 5, """
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
        check-cast v2, Lbm0;
        iget-object v3, v2, Lbm0;->a:Ljava/lang/String;
        $reject
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        return-object v0
    """))
    // Replacing the original107 anchor makes all existing incoming labels run
    // the filter. Inserting before that anchor could let a metrics branch bypass it.
    method.replaceInstruction(107, "invoke-static {v14}, Lgcd;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
    method.addInstructionsWithLabels(108, """
        move-result-object v14
        invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v0
        if-eqz v0, :keep
        const/4 v0, 0x3
        const-wide/16 v7, -0x1
        goto/32 :fatal
        :keep
        move-object v0, v6
    """.trimIndent(), ExternalLabel("fatal", method.getInstruction(42)))
    // Native fatal3/-1 dispatch deletes the original persisted batch. Retained
    // events keep genuine HTTP/retry status, extras, order and object identity.
}
