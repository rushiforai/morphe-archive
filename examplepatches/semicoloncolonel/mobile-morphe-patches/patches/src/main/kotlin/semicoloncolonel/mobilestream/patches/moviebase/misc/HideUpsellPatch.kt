package semicoloncolonel.mobilestream.patches.moviebase.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants

// Moviebase 7.7.0 shows its Premium screen on its own in two ways:
//
// - Onboarding, which runs after you sign in, ends on a Paywall step. The
//   app already skips that step when you have Premium or the device cannot
//   pay ("no_payments"). The payments check now always takes that skip.
// - The Premium screen openers (Paywall, SimplePaywall, and DiscountPaywall)
//   get a purchase source. UpsellFilter turns away the ones the app opens on
//   its own at launch and during onboarding.
//
// Premium screens the user opens, from Settings, a banner, or a list limit,
// still open. Premium and its purchase flow are not changed.

private const val PURCHASE_SOURCE = "Lapp/moviebase/core/billing/PurchaseSource;"
private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/moviebase/UpsellFilter;"

// The onboarding step that decides whether the Paywall step is skipped.
internal object OnboardingPaywallSkipFingerprint : Fingerprint(
    strings = listOf("paywall_skipped", "no_payments", "premium"),
)

private fun Method.opensPaywallScreen() = parameterTypes.getOrNull(1)?.toString() == PURCHASE_SOURCE &&
    returnType == "V" &&
    implementation?.instructions?.any {
        it.opcode == Opcode.NEW_INSTANCE &&
            (it as ReferenceInstruction).reference.toString().let { type ->
                type.startsWith("Lapp/moviebase/ui/AppScreen$") && type.endsWith("Paywall;")
            }
    } == true

@Suppress("unused")
val hideUpsellPatch = bytecodePatch(
    name = "Hide Premium upsell",
    description = "Stops the Premium screen that opens on its own at launch and after sign-in.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Onboarding: "no_payments" is set only when the payments check fails.
        // Its branch around that is removed, so the step is always skipped.
        OnboardingPaywallSkipFingerprint.method.apply {
            val noPayments = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "no_payments"
            }
            if (noPayments < 1 || instructions[noPayments - 1].opcode != Opcode.IF_NEZ) {
                throw PatchException("Payments check before \"no_payments\" not found")
            }
            removeInstruction(noPayments - 1)
        }

        // Premium screen openers.
        val openers = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.opensPaywallScreen() }) openers += classDef.type
        }
        var hooked = 0
        openers.forEach { type ->
            mutableClassDefBy(type).methods.filter { it.opensPaywallScreen() }.forEach { method ->
                // /range: the source register can be above v15.
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p1 .. p1 }, $FILTER->isAutomatic(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :open
                        return-void
                        :open
                        nop
                    """,
                )
                hooked++
            }
        }
        if (hooked == 0) throw PatchException("No Premium screen opener found")
    }
}
