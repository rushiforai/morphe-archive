package app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.handler

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.misc.version.is_11_99_or_greater
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

val exoPlayerHandlerPatch = bytecodePatch(
    description = "ExoPlayerHandler",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        if (is_11_99_or_greater) {
            return@execute
        }

        val exoPlayerHandlerClass = ExoPlayerHandlerFingerprint
            .getReference<FieldReference>(3)!!
            .type

        val localField = exoPlayerHandlerClass.findField {
            type == "Landroid/os/Handler;"
        }

        onReceiveFingerprint(exoPlayerHandlerClass).method.apply {
            cleanup()
            addInstructionsWithLabels(
                0,
                """
                    const-string p1, "android.media.AUDIO_BECOMING_NOISY"
                    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
                    move-result-object p2
                    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result p1
                    if-eqz p1, :ignore
                    iget-object p1, p0, $localField
                    invoke-virtual { p1, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
                    :ignore
                    return-void
                """
            )
        }
    }
}
