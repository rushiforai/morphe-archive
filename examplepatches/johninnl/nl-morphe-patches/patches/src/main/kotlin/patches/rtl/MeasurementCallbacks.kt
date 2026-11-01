package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressMeasurementRequests() {
    val target = exact("Ldsg;", "run()V")
    val method = target.method
    check(method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
        Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } == 458 &&
        method.implementation!!.registerCount == 25 && method.accessFlags == 0x11)
    check(target.classDef.methods.none { it.name == "morpheFailMeasurement" })
    target.classDef.methods.add(queueHelper("Ldsg;", "morpheFailMeasurement", listOf("Ldsg;"), "Z", 8, """
        iget v0, p0, Ldsg;->h:I
        const/4 v1, 0x1
        if-eq v0, v1, :backend
        const/4 v1, 0x2
        if-eq v0, v1, :client
        const/4 v0, 0x0
        return v0
        :backend
        new-instance v4, Ljava/io/IOException;
        const-string v3, "Measurement disabled"
        invoke-direct {v4, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
        iget-object v1, p0, Ldsg;->l:Ljava/lang/Object;
        check-cast v1, Ljava/lang/String;
        iget-object v2, p0, Ldsg;->k:Ljava/lang/Object;
        check-cast v2, Lkch;
        const/4 v3, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x0
        new-instance v0, Lp9h;
        invoke-direct/range {v0 .. v6}, Lp9h;-><init>(Ljava/lang/String;Lkch;ILjava/io/IOException;[BLjava/util/Map;)V
        iget-object v7, p0, Ldsg;->n:Ljava/lang/Object;
        check-cast v7, Lydh;
        iget-object v7, v7, Lb3;->i:Ljava/lang/Object;
        check-cast v7, Lvwh;
        iget-object v7, v7, Lvwh;->n:Lcvh;
        invoke-static {v7}, Lvwh;->h(Lj4i;)V
        invoke-virtual {v7, v0}, Lcvh;->l3(Ljava/lang/Runnable;)V
        const/4 v0, 0x1
        return v0
        :client
        new-instance v2, Ljava/io/IOException;
        const-string v1, "Measurement disabled"
        invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
        const/4 v1, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        invoke-virtual {p0, v1, v2, v3, v4}, Ldsg;->a(ILjava/io/IOException;[BLjava/util/Map;)V
        const/4 v0, 0x1
        return v0
    """))
    method.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, Ldsg;->morpheFailMeasurement(Ldsg;)Z
        move-result v0
        if-eqz v0, :original
        return-void
    """.trimIndent(), ExternalLabel("original", method.getInstruction(0)))
}
