package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val trackingControlPatch = bytecodePatch(
    name = "Live Tracking Controls",
    description = "Adds Pause/Resume and Force Submit buttons plus pushed location count to the live tracking notification.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)
    extendWith("extensions/extension.mpe")
    execute {
        // 1. Decorate RNBackgroundActionsTask.p(Context, b) -> Notification
        // Note: R8 reuses parameter register p0 for NotificationCompat.Builder and Notification before return.
        // Capture p0 (Context) at method entry, then pass only the returned Notification register before return-object.
        RnBackgroundActionsNotificationFingerprint.method.let { method ->
            val instructions = method.instructions
            for (index in instructions.indices.reversed()) {
                val instr = instructions[index]
                if (instr.opcode == Opcode.RETURN_OBJECT && instr is OneRegisterInstruction) {
                    val reg = instr.registerA
                    method.addInstructions(
                        index,
                        """
                        invoke-static {v$reg}, Lapp/plyrs1/extension/TrackingControlHelper;->decorateNotification(Landroid/app/Notification;)Landroid/app/Notification;
                        move-result-object v$reg
                        """.trimIndent()
                    )
                }
            }
            method.addInstructions(
                0,
                """
                invoke-static {p0}, Lapp/plyrs1/extension/TrackingControlHelper;->setContext(Landroid/content/Context;)V
                """.trimIndent()
            )
        }
        // 2. Intercept NetworkingModule.sendRequestInternalReal (v2.0.14) or sendRequestInternal (v2.0.4)
        val sendRequestMethod = NetworkingModuleSendRequestRealFingerprint.methodOrNull
            ?: NetworkingModuleSendRequestFingerprint.method
        sendRequestMethod.addInstructionsWithLabels(
            0,
            """
            move-object/from16 v0, p0
            invoke-virtual {v0}, Lcom/facebook/react/bridge/BaseJavaModule;->getReactApplicationContextIfActiveOrWarn()Lcom/facebook/react/bridge/ReactApplicationContext;
            move-result-object v0
            move-object/from16 v1, p1
            move-object/from16 v2, p2
            move/from16 v3, p3
            move-object/from16 v4, p4
            invoke-static {v0, v1, v2, v3, v4}, Lapp/plyrs1/extension/TrackingControlHelper;->onSendRequest(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_allow
            return-void
            :cond_allow
            nop
            """.trimIndent()
        )
    }
}
