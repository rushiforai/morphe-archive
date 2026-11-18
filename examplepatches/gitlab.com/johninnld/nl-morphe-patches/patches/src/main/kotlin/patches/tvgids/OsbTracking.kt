package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t

/** Native OSB privacy policy; genuine consent/lifecycle/channel handling stays. */
internal val osbTracking = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val osb = "Ljz3;"
        exact(osb, "<init>()V", 65537, 4, 31).apply {
            // Session randomness is only for measurement. Keep initialized maps,
            // lists/config objects and the original field store/constructor exit.
            addInstructionsWithLabels(16, """
                const-string v0, ""
                goto/32 :store
            """.trimIndent(), ExternalLabel("store", getInstruction(23)))
        }
        for ((signature, registers, count) in listOf(
            Triple("g(ILjava/util/Map;)V", 15, 102),
            Triple("h(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", 5, 16),
            Triple("i(ILjava/util/Map;)V", 4, 8),
            Triple("k()V", 12, 95),
            Triple("onResume(Lwb3;)V", 4, 16),
        )) exact(osb, signature, 17, registers, count).addInstructions(0, "return-void")
        exact(osb, "d()Ljava/lang/String;", 17, 4, 22)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // The event dispatcher is merged with unrelated functionality. Only the
        // OSB discriminator may return early; do not disable the whole Runnable.
        exact("Lqc0;", "run()V", 17, 23, 716).apply {
            addInstructionsWithLabels(0, """
                move-object/from16 v0, p0
                iget v0, v0, Lqc0;->a:I
                const/4 v1, 0x1
                if-ne v0, v1, :native
                return-void
            """.trimIndent(), ExternalLabel("native", getInstruction(0)))
        }
        exact("Lxs8;", "i()V", 1, 4, 59).addInstructions(0, """
            const/4 v0, 0x0
            iput-boolean v0, p0, Lxs8;->b:Z
            iget-object v0, p0, Lxs8;->c:Ljava/lang/Object;
            instance-of v1, v0, Ljava/util/LinkedList;
            if-eqz v1, :done
            check-cast v0, Ljava/util/LinkedList;
            invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V
            :done
            return-void
        """.trimIndent())
        // This void sink has no network-success callback. Old in-memory queue
        // records are discarded above; none is acknowledged as transmitted.
        exact("Lxs8;", "k(Ljava/lang/String;Ljava/lang/String;)V", 1, 14, 86)
            .addInstructions(0, "return-void")

        val channel = exact("Lda;", "onMethodCall(Lin3;Lln3;)V", 1, 27, 821)
        channel.implementation!!.apply {
            // Keep the original setIds acknowledgement without storing IDs.
            replaceInstruction(409, BuilderInstruction30t(Opcode.GOTO_32, newLabelForIndex(418)))
            // The shipped CMP branch replies and then calls notImplemented.
            // Close that branch once, after either its genuine success/error.
            replaceInstruction(755, BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        // Manual consent remains functional, with an empty cduid. Never consult
        // a stored cduid, GAID or Settings.Secure fallback for this URL.
        channel.addInstructionsWithLabels(705, """
            const-string v4, ""
            goto/32 :append
        """.trimIndent(), ExternalLabel("append", channel.getInstruction(744)))
    }
}
