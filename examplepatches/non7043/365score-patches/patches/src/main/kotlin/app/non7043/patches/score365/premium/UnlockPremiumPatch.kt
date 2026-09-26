package app.non7043.patches.score365.premium

import app.non7043.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "isPremium",
    returnType = "Z",
)

private object GetAdsFreeFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "getAdsFree",
    returnType = "Z",
)

private object GetTipsterFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "getTipster",
    returnType = "Z",
)

private object GetPlusFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "getPlus",
    returnType = "Z",
)

private object GetNotificationSoundsFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "getNotificationSounds",
    returnType = "Z",
)

private object HasFeatureFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/billingClient/entitlement/EntitlementState;",
    name = "hasFeature",
    returnType = "Z",
)

/**
 * Unlocks 365Score premium features by patching the core EntitlementState methods
 * (isPremium, getAdsFree, getTipster, getPlus, getNotificationSounds, hasFeature)
 * to always return true.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks 365Score premium/pro features (ad-free, tipster, plus, notification sounds).",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        val targets = listOf(
            IsPremiumFingerprint,
            GetAdsFreeFingerprint,
            GetTipsterFingerprint,
            GetPlusFingerprint,
            GetNotificationSoundsFingerprint,
            HasFeatureFingerprint,
        )

        for (target in targets) {
            val method = target.methodOrNull ?: continue
            if (method.implementation != null) {
                method.addInstructions(
                    0,
                    """
                    const/4 v0, 0x1
                    return v0
                    """.trimIndent(),
                )
            }
        }
    }
}
