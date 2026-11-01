package semicoloncolonel.mobilestream.patches.appletv.ads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants

// After "adsId-" the builder wraps the id in an AdsConfiguration
// (new-instance + <init>) and stores it on MediaItem.Builder with an
// iput-object. That store becomes a nop, so the item has no
// AdsConfiguration and plays as plain HLS. Live (Event) items never get
// one, and downloads already request streams without interstitials, so
// both paths already run without the field. The stream URL, DRM, and
// sign-in are unchanged.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops the Apple TV phone app from playing ad interstitials in on-demand " +
        "videos. Promos and bumpers delivered the same way are skipped too. Experimental; " +
        "test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        HlsMediaItemsFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val adsIdIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "adsId-"
            }
            // The AdsConfiguration is the last object created before the store.
            var configRegister = -1
            val storeIndex = (adsIdIndex + 1 until instructions.size).firstOrNull { index ->
                val instruction = instructions[index]
                if (instruction.opcode == Opcode.NEW_INSTANCE) {
                    configRegister = (instruction as OneRegisterInstruction).registerA
                }
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    configRegister != -1 &&
                    (instruction as TwoRegisterInstruction).registerA == configRegister &&
                    instructions.subList(adsIdIndex, index).count { it.opcode == Opcode.NEW_INSTANCE } >= 2
            } ?: throw PatchException("AdsConfiguration store not found")

            replaceInstruction(storeIndex, "nop")
        }
    }
}
