package app.morphe.patches.piko.misc.shim.methods.broadcast.braze.push

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.kotlin.kotlinHelperPatch
import app.morphe.patches.piko.misc.shim.methods.kotlin.onReceiveParameterCheckInstruction
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.misc.version.is_11_99_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.util.cloneMutable

val brazePushPatch = bytecodePatch(
    description = "BrazePushPatch",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch,
        versionCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        if (!is_11_99_or_greater) {
            return@execute
        }

        // Fingerprint resolve to check if the obfuscation pattern has changed.
        NotificationTrampolineActivityFingerprint.method

        onReceiveFingerprint(BRAZE_PUSH_RECEIVER_CLASS).let {
            it.clearMatch()
            val originalMethod = it.method
            val newMethod = originalMethod.cloneMutable(additionalRegisters = 3)

            newMethod.apply {
                cleanup()
                addInstructions(
                    0,
                    onReceiveParameterCheckInstruction + $$"""
                        sget-object v1, Lcom/braze/push/BrazePushReceiver;->Companion:Lcom/braze/push/BrazePushReceiver$Companion;
                        move-object v2, p1
                        move-object v3, p2
                        const/4 v4, 0x0
                        const/4 v5, 0x4
                        const/4 v6, 0x0
                        invoke-static/range { v1 .. v6 }, Lcom/braze/push/BrazePushReceiver$Companion;->handleReceivedIntent$default(Lcom/braze/push/BrazePushReceiver$Companion;Landroid/content/Context;Landroid/content/Intent;ZILjava/lang/Object;)V
                        return-void
                    """
                )
            }

            it.classDef.methods.remove(originalMethod)
            it.classDef.methods.add(newMethod)
        }
    }
}
