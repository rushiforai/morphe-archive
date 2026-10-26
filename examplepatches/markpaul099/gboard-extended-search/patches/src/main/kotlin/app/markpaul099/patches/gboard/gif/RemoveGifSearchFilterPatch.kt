package app.markpaul099.patches.gboard.gif

import app.markpaul099.patches.gboard.misc.signature.spoofAndroidCertPatch
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

@Suppress("unused")
val removeGifSearchFilterPatch = bytecodePatch(
    name = "Remove GIF search filter",
    description = "Turns off the Tenor content filter for GIF and sticker search, so results are not limited by safe search.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(spoofAndroidCertPatch)

    execute {
        TenorContentFilterParamFingerprint.matchAll().forEach { match ->
            val putCall = match.instructionMatches[1]
            // invoke-virtual {builder, key, value}: overwrite the value register.
            val valueRegister = putCall.getInstruction<FiveRegisterInstruction>().registerE

            match.method.addInstruction(
                putCall.index,
                "const-string v$valueRegister, \"off\""
            )
        }
    }
}
