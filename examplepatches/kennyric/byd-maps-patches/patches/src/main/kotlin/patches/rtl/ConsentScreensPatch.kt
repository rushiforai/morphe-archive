package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Includes ad and tracking controls; skips automatic privacy and notification setup while preserving readiness, real choices and manual settings. Notifications remain off until manually enabled.") {
    dependsOn(originalInput, disableTracking)
    compatibleWith(rtl)
    execute {
        val method = exact("Lkc2;", "d(Landroidx/fragment/app/s;Z)V").method
        check(method.instructions.size == 12 && method.implementation!!.registerCount == 9 && method.accessFlags == 0x11)
        method.addInstructionsWithLabels(0, """
            if-nez p2, :manual
            iget-object v0, p0, Lkc2;->i:Ldyb;
            const/4 v1, 0x0
            sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-virtual {v0, v1, v2}, Ldyb;->m(Ljava/lang/Object;Ljava/lang/Object;)Z
            iget-object v0, p0, Lkc2;->j:Ldyb;
            sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-virtual {v0, v1, v2}, Ldyb;->m(Ljava/lang/Object;Ljava/lang/Object;)Z
            return-void
        """.trimIndent(), ExternalLabel("manual", method.getInstruction(0)))

        // Startup uses a separate merged coroutine rather than kc2.d(). Only
        // its initial privacy branch skips to the native ready/not-busy closure.
        // Retain result checks, resumed/error paths and all other switch cases.
        val privacy = exact("Lqq1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;").method
        check(privacy.accessFlags == 0x11 && privacy.implementation!!.registerCount == 21 &&
            privacy.instructions.count { it.opcode != Opcode.PACKED_SWITCH_PAYLOAD } == 948)
        check(privacy.getInstruction(779).opcode == Opcode.IGET_OBJECT &&
            privacy.getInstruction<ReferenceInstruction>(779).reference.toString() == "Lkc2;->j:Ldyb;")
        check(privacy.getInstruction<ReferenceInstruction>(815).reference.toString() == "Lkc2;->i:Ldyb;")
        val ready = privacy.implementation!!.newLabelForIndex(815)
        privacy.replaceInstruction(779, BuilderInstruction30t(Opcode.GOTO_32, ready))

        // This effect navigates only to startup notification setup/reminders.
        // Complete after the real result check, leaving stored user choices and
        // the settings destination/permission callbacks untouched.
        val notifications = exact("Lfm7;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;").method
        check(notifications.accessFlags == 0x11 && notifications.implementation!!.registerCount == 6 &&
            notifications.instructions.size == 41)
        check(notifications.getInstruction(3).opcode == Opcode.IGET_OBJECT &&
            notifications.getInstruction<ReferenceInstruction>(3).reference.toString() == "Lfm7;->v:Lzh8;")
        check(notifications.getInstruction<ReferenceInstruction>(39).reference.toString() == "Lk9d;->a:Lk9d;")
        val complete = notifications.implementation!!.newLabelForIndex(39)
        notifications.replaceInstruction(3, BuilderInstruction30t(Opcode.GOTO_32, complete))
    }
}
