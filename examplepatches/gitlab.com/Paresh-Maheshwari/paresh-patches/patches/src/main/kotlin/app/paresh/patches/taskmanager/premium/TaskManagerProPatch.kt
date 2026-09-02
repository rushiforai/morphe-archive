package app.paresh.patches.taskmanager.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.taskmanager.shared.Constants.COMPATIBILITY_TASKMANAGER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val taskManagerProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features — auto refresh, advanced process management, and all settings."
) {
    compatibleWith(COMPATIBILITY_TASKMANAGER)

    execute {
        // Bypass pairip license check
        PairipProcessResponseFingerprint.method.addInstructions(0, """
            return-void
        """)

        PairipValidateResponseFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Skip handlePurchases entirely. On startup the billing client fires an empty
        // purchase-list update, which normally calls `proUnlocked.setValue(false)` and
        // persists "is_pro=false" to prefs — clobbering the pro state set by the
        // constructor patch. Skipping this method keeps proUnlocked at TRUE for the
        // life of the process. External callers (e.g. the notification icon's onClick
        // in t9/k) read `isPro().getValue().booleanValue()` and get true → no toast.
        HandlePurchasesFingerprint.method.addInstructions(0, """
            return-void
        """)

        // Force proUnlocked = true from constructor
        val constructor = ProBridgeConstructorFingerprint.method
        val ctorInstructions = constructor.implementation!!.instructions.toList()
        val falseIdx = ctorInstructions.indexOfFirst { inst ->
            inst.opcode == Opcode.SGET_OBJECT &&
                (inst as? ReferenceInstruction)?.reference?.toString()?.contains("FALSE") == true
        }
        if (falseIdx >= 0) {
            constructor.replaceInstruction(falseIdx, "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")
        }

        // Force initApp getBoolean result to true
        val initMethod = ProBridgeInitFingerprint.method
        val initInstructions = initMethod.implementation!!.instructions.toList()
        val getBooleanIdx = initInstructions.indexOfFirst { inst ->
            inst.opcode == Opcode.INVOKE_INTERFACE &&
                (inst as? ReferenceInstruction)?.reference?.toString()?.contains("getBoolean") == true
        }
        if (getBooleanIdx >= 0) {
            initMethod.replaceInstruction(getBooleanIdx + 1, "const/4 p3, 0x1")
        }

        // Force proUnlocked check to true in each Screen method
        // Pattern: invoke-virtual {v0}, Boolean;->booleanValue()Z / move-result v0
        // We replace move-result v0 with const/4 v0, 0x1
        listOf(
            BatteryScreenFingerprint,
            NetScreenFingerprint,
            LaunchNotificationServiceFingerprint  // NEW: 1.5.2+ notification service
        ).forEach { fingerprint ->
            val method = fingerprint.methodOrNull ?: return@forEach  // Safe for older versions
            val instructions = method.implementation!!.instructions.toList()
            val booleanValueIdx = instructions.indexOfFirst { inst ->
                inst.opcode == Opcode.INVOKE_VIRTUAL &&
                    (inst as? ReferenceInstruction)?.reference?.toString()?.contains("booleanValue") == true
            }
            if (booleanValueIdx >= 0) {
                // move-result v0 is right after booleanValue() — replace with const/4 v0, 0x1
                method.replaceInstruction(booleanValueIdx + 1, "const/4 v0, 0x1")
            }
        }
    }
}
