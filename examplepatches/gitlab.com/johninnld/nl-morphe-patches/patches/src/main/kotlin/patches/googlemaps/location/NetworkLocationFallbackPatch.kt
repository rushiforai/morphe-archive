package org.ungoogled.patches.maps.location

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

internal val networkLocationFallbackPatch = bytecodePatch(
    description = "Keeps the network (Wi-Fi/cell) location provider registered when no fused " +
        "location provider answers, instead of GPS-only, so a fix does not go stale indoors.",
) {
    compatibleWith(COMPATIBILITY_MAPS)

    execute {
        // Swap the network provider's STOP call for a START call, reusing the
        // looper already loaded for the GPS start two instructions earlier is
        // avoided in favour of a fresh load, matching the equivalent shell
        // patch's own choice not to rely on that value still being live.
        val fp = if (packageMetadata.versionName == "26.44.06.1006895251") GpsOnlyModeFingerprint2644 else GpsOnlyModeFingerprint
        val stopCall = fp.instructionMatches.last()
        val stop = fp.method.implementation!!.instructions[stopCall.index] as ReferenceInstruction
        val listener = (stop.reference as MethodReference).definingClass
        val owner = fp.method.definingClass
        fp.method.apply {
            removeInstructions(stopCall.index, 1)
            addInstructions(
                stopCall.index,
                """
                    iget-object v1, p0, $owner->z:Landroid/os/Looper;
                    invoke-virtual {v0, v1}, $listener->b(Landroid/os/Looper;)V
                """,
            )
        }
    }
}
