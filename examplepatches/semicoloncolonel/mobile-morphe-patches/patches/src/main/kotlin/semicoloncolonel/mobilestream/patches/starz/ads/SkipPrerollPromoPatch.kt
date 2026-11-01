package semicoloncolonel.mobilestream.patches.starz.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.starz.shared.Constants

private const val PLAY_SESSION = "Lcom/starz/android/starzcommon/entity/PlaySession;"

// Starz 6.11.0 plays its own catalog promos (PrerollContent) before a title,
// with a skip button. PlaySession tracks them with a list and an index; an
// R8-renamed boolean (R()Z in 6.11.0) is true while the index points at a
// promo. The skip button only moves the index past the end of the list, so
// the boolean turns false and playback continues with the title.
//
// The PrerollContent getter (t() in 6.11.0) opens by calling that boolean,
// which is how the patch finds it without relying on the renamed name.
internal object CurrentPrerollFingerprint : Fingerprint(
    definingClass = PLAY_SESSION,
    returnType = "Lcom/starz/android/starzcommon/entity/PrerollContent;",
    parameters = listOf(),
)

@Suppress("unused")
val skipPrerollPromoPatch = bytecodePatch(
    name = "Skip pre-roll promo",
    description = "Starts Starz titles without the promo for other Starz shows that plays first, " +
        "so there is nothing to skip. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val isPlayingPreroll = CurrentPrerollFingerprint.method.implementation!!.instructions
            .firstOrNull { it.opcode == Opcode.INVOKE_VIRTUAL }
            ?.let { (it as ReferenceInstruction).reference as MethodReference }
            ?.takeIf { it.definingClass == PLAY_SESSION && it.returnType == "Z" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("Pre-roll state check not found")

        // Report "no promo playing" from the start: the state the app reaches
        // after the skip button or after the last promo ends.
        CurrentPrerollFingerprint.classDef.methods
            .first { it.name == isPlayingPreroll.name && it.returnType == "Z" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
