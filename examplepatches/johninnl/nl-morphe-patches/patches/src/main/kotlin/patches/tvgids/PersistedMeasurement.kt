package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Filter after the uploader has appended its own client metrics. */
internal val persistedMeasurement = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val owner = "La83;"
        val signature = "m(Lny;I)V"
        val method = exact(owner, signature, 1, 48, 570)
        val anchor = method.getInstruction<TwoRegisterInstruction>(113)
        check(anchor.opcode == Opcode.MOVE_OBJECT && anchor.registerA == 0 && anchor.registerB == 9) {
            "TVgids post-metrics upload anchor changed"
        }
        check(method.getInstruction(41).opcode == Opcode.NEW_INSTANCE &&
            method.getInstruction<ReferenceInstruction>(41).reference.toString() == "Lpx;" &&
            method.getInstruction<ReferenceInstruction>(42).reference.toString() == "Lpx;-><init>(IJ)V") {
            "TVgids native fatal-discard path changed"
        }
        val classDef = target(owner, signature).classDef
        check(classDef.methods.none { it.name == "morpheMeasurementBatch" })
        val reject = listOf("FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS").joinToString("\n") { name -> """
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
                check-cast v2, Lux;
                iget-object v3, v2, Lux;->a:Ljava/lang/String;
                $reject
                invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                goto :next
                :done
                return-object v0
            """.trimIndent())
        })
        // Replacing this common instruction covers extras and no-extras paths.
        // Preserve persisted objects and unknown event identities/order. Empty
        // means intentional native FATAL3/-1 discard, never a send success.
        method.replaceInstruction(113,
            "invoke-static {v8}, $owner->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
        method.addInstructionsWithLabels(114, """
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
}
