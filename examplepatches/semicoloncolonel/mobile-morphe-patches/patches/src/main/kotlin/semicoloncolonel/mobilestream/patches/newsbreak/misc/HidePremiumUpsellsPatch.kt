package semicoloncolonel.mobilestream.patches.newsbreak.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// NewsBreak 26.44.1. The server's "show_nb_premium" flag, saved with the
// channel list, turns on the Premium upsells: the "Ad-free Reading" banner and
// Upgrade button on the Me tab, the Premium button on profiles, the promo on
// Home, the bottom-bar badge, and the upgrade offers in the "hide this ad" and
// ad-feedback dialogs. The flag is now saved as off. The pop-up offers that
// appear after viewing ads or heavy use, and the inbox item, ask whether
// Premium can be promoted; that check now says no.
//
// With the flag off, the app also stops refreshing a Premium subscription's
// status from that response, so a paying subscriber should leave this off.

internal object ProcessPremiumContentFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/api/channel/UserChannelListApi;",
    returnType = "V",
    strings = listOf("show_nb_premium"),
)

internal object CanPromotePremiumFingerprint : Fingerprint(
    definingClass = "Lcom/particlemedia/feature/premium/ui/PremiumHelper;",
    name = "canPromotePremium",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hidePremiumUpsellsPatch = bytecodePatch(
    name = "Hide Premium upsells",
    description = "Removes the \"Ad-free Reading\" banners, Upgrade buttons, and Premium offers. Leave it off if you pay for Premium.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ProcessPremiumContentFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val read = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.name == "readBooleanFromJson" && ref.returnType == "Z"
                    }
            }
            if (read == -1 || instructions[read + 1].opcode != Opcode.MOVE_RESULT) {
                throw PatchException("show_nb_premium read not found")
            }
            val register = (instructions[read + 1] as OneRegisterInstruction).registerA
            addInstruction(read + 2, "const/4 v$register, 0x0")
        }

        CanPromotePremiumFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
