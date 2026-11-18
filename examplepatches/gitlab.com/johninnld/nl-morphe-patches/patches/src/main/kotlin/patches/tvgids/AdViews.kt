package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t

/** Preserve native views/channel replies while closing every app-owned load admission. */
internal val adViews = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val activity = exact("Lnl/tvgids/MainActivity;", "c(Lrt1;)V", 17, 8, 49)
        activity.implementation!!.apply {
            replaceInstruction(14, BuilderInstruction30t(Opcode.GOTO_32, newLabelForIndex(31)))
        }

        val constructor = exact("Lwa;",
            "<init>(Landroid/content/Context;ILorg/json/JSONObject;Li20;Lnl/tvgids/MainActivity;)V", 65537, 9, 129)
        constructor.implementation!!.apply {
            replaceInstruction(102, BuilderInstruction30t(Opcode.GOTO_32, newLabelForIndex(128)))
        }

        val channel = exact("Lwa;", "onMethodCall(Lin3;Lln3;)V", 17, 7, 54)
        channel.addInstructionsWithLabels(35, "goto/16 :acknowledge", ExternalLabel("acknowledge", channel.getInstruction(48)))

        exact("Lwa;", "dispose()V", 17, 3, 12).addInstructions(0, """
            iget-object v0, p0, Lwa;->j:Landroid/os/Handler;
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
            iput-object v1, p0, Lwa;->l:Lua;
        """.trimIndent())

        val runnable = exact("Lua;", "run()V", 17, 25, 665)
        runnable.addInstructionsWithLabels(0, """
            move-object/from16 v0, p0
            iget v0, v0, Lua;->a:I
            if-nez v0, :native
            return-void
        """.trimIndent(), ExternalLabel("native", runnable.getInstruction(0)))
    }
}
