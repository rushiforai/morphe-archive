package app.morphe.patches.piko.misc.shim.methods.broadcast.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

val timelinePatch = bytecodePatch(
    description = "Timeline",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val localField = TimelineFingerprint
            .getReference<FieldReference>(1)!!

        onReceiveFingerprint(localField.definingClass).method.apply {
            cleanup()
            addInstructionsWithLabels(
                0,
                """
                    const-string p1, "android.intent.action.DEVICE_STORAGE_LOW"
                    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
                    move-result-object p2
                    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result p1
                    if-eqz p1, :ignore
                    const/4 p1, 0x1
                    iput-boolean p1, p0, $localField
                    :ignore
                    return-void
                """
            )
        }
    }
}
