package app.sigstick.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK

private const val BILLING = "Lcom/sigstick/myapp/Billing;"

/**
 * `Billing.isLite/isPremium/isPro()Z` each compare `productIdExpiry["sigstick.<tier>"]` with now.
 * Every gate goes through them: `isLiteOrHigher` (AdManager, AppOpenAdManager), `isPremiumOrHigher`
 * (sticker limits, PremiumPromptService) and the Flutter editor's `"isPremium"` method-channel
 * call in EditorActivity. Forcing the three leaves the wrappers and the editor consistent.
 */
private class BillingTierFingerprint(name: String) : Fingerprint(
    definingClass = BILLING,
    name = name,
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks SigStick Premium client-side: no ads, 60 stickers per pack, " +
        "unlimited pack creation and the premium editor features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    execute {
        listOf("isLite", "isPremium", "isPro").forEach {
            BillingTierFingerprint(it).method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}
