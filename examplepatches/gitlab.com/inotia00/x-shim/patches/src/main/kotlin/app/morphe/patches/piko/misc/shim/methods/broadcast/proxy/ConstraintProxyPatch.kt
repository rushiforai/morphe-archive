package app.morphe.patches.piko.misc.shim.methods.broadcast.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.misc.version.is_11_97_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val constraintProxyPatch = bytecodePatch(
    description = "ConstraintProxy",
) {
    dependsOn(
        patchModeCheckPatch,
        versionCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        if (is_11_97_or_greater) {
            return@execute
        }

        val localField = CONSTRINT_PROXY_CLASS.findField {
            type == "Ljava/lang/String;"
        }

        val (helperMethod1, helperMethod2, helperField) = with(WorkSpecFingerprint) {
            Triple(
                getReference<MethodReference>(0)!!,
                getReference<MethodReference>(2)!!,
                getReference<FieldReference>(3)!!
            )
        }

        onReceiveFingerprint(CONSTRINT_PROXY_CLASS).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    invoke-static { }, $helperMethod1
                    move-result-object v0
                    new-instance v1, Ljava/lang/StringBuilder;
                    const-string v2, "onReceive : "
                    invoke-direct { v1, v2 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
                    invoke-virtual { v1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
                    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                    move-result-object p2
                    sget-object v1, $localField
                    invoke-virtual { v0, v1, p2 }, $helperMethod2
                    sget-object p2, $helperField
                    new-instance p2, Landroid/content/Intent;
                    const-class v0, Landroidx/work/impl/background/systemalarm/SystemAlarmService;
                    invoke-direct { p2, p1, v0 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                    const-string v0, "ACTION_CONSTRAINTS_CHANGED"
                    invoke-virtual { p2, v0 }, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
                    invoke-virtual { p1, p2 }, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
                    return-void
                """
            )
        }
    }
}
