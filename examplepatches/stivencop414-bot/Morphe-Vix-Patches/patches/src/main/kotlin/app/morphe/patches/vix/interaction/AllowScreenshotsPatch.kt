package app.morphe.patches.vix.interaction

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val allowScreenshotsPatch = patch(
    name = "Allow screenshots and screen recording",
    description = "Removes Window FLAG_SECURE and prevents LuraPlayer SurfaceView from forcing secure mode. " +
        "Note: hardware-backed Widevine L1 DRM video surfaces may still be blanked by Android.",
    default = true,
) {
    category("Interaction")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        val windowMatches = FlagSecureWindowFingerprint.matchAll().toList()
        if (windowMatches.isEmpty()) {
            throw PatchException("No Window.setFlags(FLAG_SECURE) call sites matched")
        }
        for (match in windowMatches) {
            val method = match.method
            val setFlagsIndex = method.instructions.indexOfLast { insn ->
                val ref = insn.getReference<MethodReference>()
                ref?.definingClass == "Landroid/view/Window;" && ref.name == "setFlags"
            }
            if (setFlagsIndex < 0) {
                throw PatchException("Window.setFlags not found in ${method.definingClass}->${method.name}")
            }
            method.removeInstruction(setFlagsIndex)
        }

        LuraVideoViewSetSecureFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
        LuraPlayerViewSetSecureFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
    }
}
