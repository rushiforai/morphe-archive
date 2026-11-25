package app.plyrs1.patches.com_gajihub_app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_GAJIHUB
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val trackingPersistencePatch = bytecodePatch(
    name = "Persistent Live Tracking",
    description = "Auto-reposts the live tracking notification if dismissed on Android 14+ and " +
            "automatically recovers live tracking when GajiHub is reopened after strict battery " +
            "optimization or the OS stops the background service.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GAJIHUB)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Attach deleteIntent to RNBackgroundActionsTask notification builder so swipe-away reposts it.
        RnBackgroundActionsNotificationFingerprint.method.let { method ->
            val instructions = method.instructions
            for (index in instructions.indices.reversed()) {
                val instr = instructions[index]
                if (instr.opcode == Opcode.RETURN_OBJECT && instr is OneRegisterInstruction) {
                    val reg = instr.registerA
                    method.addInstructions(
                        index,
                        """
                        invoke-static {v$reg}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->attachDeleteIntent(Landroid/app/Notification;)Landroid/app/Notification;
                        move-result-object v$reg
                        """.trimIndent()
                    )
                }
            }
            method.addInstructions(
                0,
                """
                invoke-static {p0}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->setContext(Landroid/content/Context;)V
                """.trimIndent()
            )
        }

        // 2. Capture ReactContext + taskName when JS starts background tracking.
        BackgroundActionsModuleStartFingerprint.method.addInstructions(
            0,
            """
            invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
            move-result-object v0
            invoke-static {v0, p1}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->onModuleStart(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent()
        )
        // 3. Mark intentional stops (clock-out, break) so we cancel notification and never auto-restart.
        BackgroundActionsModuleStopFingerprint.method.addInstructions(
            0,
            """
            invoke-virtual {p0}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;->getReactApplicationContext()Lcom/facebook/react/bridge/ReactApplicationContext;
            move-result-object v0
            invoke-static {v0}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->onExplicitStop(Landroid/content/Context;)V
            """.trimIndent()
        )

        // 4. Track when RNBackgroundActionsTask actually starts.
        RnBackgroundActionsOnStartCommandFingerprint.method.addInstructions(
            0,
            """
            invoke-static {p0, p1}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->onServiceStart(Landroid/app/Service;Landroid/content/Intent;)V
            """.trimIndent()
        )

        // 5. Hook HeadlessJsTaskService.onDestroy() (superclass of RNBackgroundActionsTask) to detect unexpected OS/battery stops.
        val superClassName = RnBackgroundActionsOnStartCommandFingerprint.classDef.superclass
            ?: error("RNBackgroundActionsTask has no superclass")
        val headlessServiceClass = mutableClassDefBy(superClassName)
        val onDestroyMethod = headlessServiceClass.methods.first {
            it.name == "onDestroy" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        onDestroyMethod.addInstructions(
            0,
            """
            invoke-static {p0}, Lapp/plyrs1/extension/TrackingPersistenceHelper;->onServiceDestroy(Landroid/app/Service;)V
            """.trimIndent()
        )
    }
}
