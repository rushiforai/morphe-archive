package semicoloncolonel.mobilestream.patches.msnow.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants

private const val ALLOW_ALL = "Banner - Allow All"
private const val REJECT_ALL = "Banner - Reject All"

// MS NOW 14.6.0 uses OneTrust. When onboarding finishes and OneTrust would
// show its banner, the app saves "Banner - Allow All" without asking, which
// opts the user in to data sale, sharing and targeted ads. This saves
// "Banner - Reject All" instead, the same call OneTrust's own Reject All
// button makes. OneTrust then writes the opted-out US Privacy and GPP strings
// that the SDKs read. Later choices under "Your Privacy Choices" still apply.
internal object OnboardingConsentFingerprint : Fingerprint(
    strings = listOf("onboarding_completed", ALLOW_ALL),
)

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the MS NOW app opted out of the sale and sharing of your data and of " +
        "targeted ads, instead of the app accepting all on your behalf. You can still change " +
        "the choice under Your Privacy Choices.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        OnboardingConsentFingerprint.method.apply {
            implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                val string = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (string != ALLOW_ALL) return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                replaceInstruction(index, "const-string v$register, \"$REJECT_ALL\"")
            }
        }
    }
}
