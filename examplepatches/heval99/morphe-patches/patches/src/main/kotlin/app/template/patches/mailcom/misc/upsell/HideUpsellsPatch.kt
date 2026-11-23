package app.template.patches.mailcom.misc.upsell

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM

// Swipe2UpsellFeature.isEnabledByConfig (9.18.3): the SWIPE_2_UPSELL feature toggle. Its only
// reader is SwipeToUpsellHelper, the upgrade bottom sheet shown once the user has swiped away
// enough ads (mail list and shopping list). Every Feature has an isEnabledByConfig, so this one
// is told apart by the preference key it reads (9.21.2: the old Swipe2UpsellDebugPreferences
// helper it called is gone). Its isEnabledByOverride is a constant false.
//
// IapUpsellingFeature (IAP_UPSELLING) is deliberately not touched: it is the master switch for
// every in-app purchase entry point, including the Settings "Upgrade" row
// (AccountSettingsFragment.onUpgradeClicked returns early without it) and the drawer's Premium
// item, so turning it off would break the user's own way to buy. 9.19.0 replaced that toggle with
// the per-account suspend check UpsellFeatureImpl.isIapUpsellEnabled(Account, Continuation), which
// stays untouched as well.
internal object Swipe2UpsellEnabledByConfigFingerprint : Fingerprint(
    name = "isEnabledByConfig",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("feature.swipe2upsell.enabled")),
    custom = { method, _ -> method.implementation != null },
)

@Suppress("unused")
val hideUpsellsPatch = bytecodePatch(
    name = "Hide upsells",
    description = "Hides the upgrade offer.",
) {
    compatibleWith(COMPATIBILITY_MAILCOM)

    execute {
        Swipe2UpsellEnabledByConfigFingerprint.method.returnEarly(false)
    }
}
