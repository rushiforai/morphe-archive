/*
 * Ported from ajstrick81's ESPN Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/espn
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.espn.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.espn.shared.Constants

// Live ESPN breaks are passthrough SSAI: the ad is part of the broadcast
// stream, so isAdDisabled does not remove them. ajstrick81's TV project masks
// those breaks with a separate slate patch, which is not ported here.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops scheduled ad breaks and on-demand mid-rolls in ESPN videos. " +
        "Commercials in live broadcasts are part of the stream and still play. " +
        "Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        InterstitialManagerInitFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val iputIndex = instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN &&
                    ((insn as ReferenceInstruction).reference as FieldReference).name == AD_DISABLED_FIELD
            }
            if (iputIndex < 0) throw PatchException("isAdDisabled write not found")

            // Overwrite the value the constructor is about to store with true.
            // const/16 takes an 8-bit register, so it also works when the source
            // is a high parameter register.
            val register = (instructions[iputIndex] as TwoRegisterInstruction).registerA
            addInstructions(iputIndex, "const/16 v$register, 0x1")
        }
    }
}
