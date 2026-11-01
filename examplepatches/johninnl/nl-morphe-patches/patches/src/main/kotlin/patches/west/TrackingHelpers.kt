package patches.west

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

private fun helper(owner: String, name: String, params: List<String>, result: String, locals: Int, code: String) =
    MutableMethod(ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, emptySet(), null) },
        result, 0x9, emptySet(), emptySet(), ImmutableMethodImplementation(locals + params.size,
            emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyTrackingHelpers() {
    val player = exact("Lv70;", "l(Ljava/lang/String;Ljava/util/Map;)V").classDef
    check(player.methods.none { it.name.startsWith("morphe") })
    player.methods.add(helper("Lv70;", "morpheNoStats", listOf("Ljava/util/Map;"), "V", 2, """
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        const-string v1, "noStats_content"
        invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        const-string v1, "noStats_commercial"
        invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        return-void
    """))

    val http = exact("Lim9;", "run()V").classDef
    check(http.methods.none { it.name.startsWith("morphe") })
    // Both R8-merged workers retain their original completion Runnable and scheduler.
    http.methods.add(helper("Lim9;", "morpheFailMeasurement", listOf("Lim9;"), "V", 13, """
        iget v0, p0, Lim9;->a:I
        if-eqz v0, :legacy
        const/4 v0, 0x0
        new-instance v1, Ljava/io/IOException;
        const-string v2, "Measurement disabled"
        invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
        const/4 v2, 0x0
        const/4 v3, 0x0
        invoke-virtual {p0, v0, v1, v2, v3}, Lim9;->a(ILjava/io/IOException;[BLjava/util/Map;)V
        return-void
        :legacy
        iget-object v0, p0, Lim9;->g:Lw69;
        check-cast v0, Llm9;
        iget-object v0, v0, Lw69;->a:Ljava/lang/Object;
        check-cast v0, Lqo9;
        iget-object v0, v0, Lqo9;->g:Leo9;
        invoke-static {v0}, Lqo9;->m(Leq9;)V
        new-instance v1, Lwl9;
        iget-object v2, p0, Lim9;->d:Ljava/lang/String;
        iget-object v3, p0, Lim9;->f:Ljava/lang/Object;
        check-cast v3, Lfm9;
        const/4 v4, 0x0
        new-instance v5, Ljava/io/IOException;
        const-string v6, "Measurement disabled"
        invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
        const/4 v6, 0x0
        const/4 v7, 0x0
        invoke-direct/range {v1 .. v7}, Lwl9;-><init>(Ljava/lang/String;Lfm9;ILjava/io/IOException;[BLjava/util/Map;)V
        invoke-virtual {v0, v1}, Leo9;->T(Ljava/lang/Runnable;)V
        return-void
    """))

    val target = exact("Lo50;", "f(Lg60;I)V")
    val method = target.method
    val anchor = method.getInstruction(112)
    check(anchor.opcode == Opcode.MOVE_OBJECT && (anchor as TwoRegisterInstruction).registerA == 0 && anchor.registerB == 9)
    check(target.classDef.methods.none { it.name.startsWith("morphe") })
    val reject = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION",
        "FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS").joinToString("\n") { name -> """
        const-string v4, "$name"
        invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :next
    """.trimIndent() }
    target.classDef.methods.add(helper("Lo50;", "morpheMeasurementBatch", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;", 5, """
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
        check-cast v2, Le50;
        iget-object v3, v2, Le50;->a:Ljava/lang/String;
        $reject
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        return-object v0
    """))
    // Include both the extras/client-metrics path and no-extras incoming route.
    // Empty uses fatal3/wait=-1 + native local deletion, never a delivered ack.
    method.replaceInstruction(112, "invoke-static {v14}, Lo50;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
    method.addInstructionsWithLabels(113, """
        move-result-object v14
        invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v0
        if-eqz v0, :morphe_keep
        const/4 v0, 0x3
        const-wide/16 v7, -0x1
        goto/32 :morphe_fatal
        :morphe_keep
        move-object v0, v9
    """.trimIndent(), ExternalLabel("morphe_fatal", method.getInstruction(41)))
}
