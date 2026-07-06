package app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.audio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val exoPlayerAudioPatch = bytecodePatch(
    description = "ExoPlayerAudio",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val exoPlayerAudioClass = ExoPlayerAudioFingerprint
            .getReference<TypeReference>(3)!!
            .type

        val localField = exoPlayerAudioClass.findField {
            type.startsWith(EXOPLAYER2_AUDIO_CLASS_PREFIX)
        }

        val defaultAudioSinkMethod = DefaultAudioSinkFingerprint
            .getReference<MethodReference>(1)!!

        val audioDeviceListenerMethod = AudioDeviceListenerFingerprint
            .getReference<MethodReference>()!!

        onReceiveFingerprint(exoPlayerAudioClass).method.apply {
            cleanup()
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p0 }, Landroid/content/BroadcastReceiver;->isInitialStickyBroadcast()Z
                    move-result v0
                    if-nez v0, :ignore
                    iget-object v0, p0, $localField
                    invoke-static { p1, p2 }, $defaultAudioSinkMethod
                    move-result-object p1
                    invoke-static { v0, p1 }, $audioDeviceListenerMethod
                    :ignore
                    return-void
                """
            )
        }
    }
}
