package patches.brabant

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
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
    val player = exact("Lyh0;", "g(Ljava/lang/String;Ljava/util/Map;)V").classDef
    check(player.methods.none { it.name.startsWith("morphe") })
    player.methods.add(helper("Lyh0;", "morpheNoStats", listOf("Ljava/util/Map;"), "V", 2, """
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        const-string v1, "noStats_content"
        invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        const-string v1, "noStats_commercial"
        invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        return-void
    """))

    val target = exact("Lif0;", "h(Lag0;I)V")
    val method = target.method
    check(method.accessFlags == 0x1 && method.implementation!!.registerCount == 49 &&
        method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
            Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } == 599)
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
    target.classDef.methods.add(helper("Lif0;", "morpheMeasurementBatch", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;", 5, """
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
        check-cast v2, Lye0;
        iget-object v3, v2, Lye0;->a:Ljava/lang/String;
        $reject
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        return-object v0
    """))
    // Incoming metrics/no-extras routes must both run this anchor. Empty means
    // native fatal3/-1 + local deletion, never delivered/success acknowledgement.
    method.replaceInstruction(112, "invoke-static {v8}, Lif0;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
    method.addInstructionsWithLabels(113, """
        move-result-object v8
        invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v0
        if-eqz v0, :keep
        const/4 v0, 0x3
        const-wide/16 v14, -0x1
        goto/32 :fatal
        :keep
        move-object v0, v9
    """.trimIndent(), ExternalLabel("fatal", method.getInstruction(41)))
}
