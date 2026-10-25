package app.template.patches.mailcom.misc.upsell

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM

// Swipe2UpsellFeature.isEnabledByConfig (9.18.3): the SWIPE_2_UPSELL feature toggle. Its only
// reader is SwipeToUpsellHelper, the upgrade bottom sheet shown once the user has swiped away
// enough ads (mail list and shopping list). Every Feature has an isEnabledByConfig, so this one
// is told apart by the config read it returns. Its isEnabledByOverride is a constant false.
//
// IapUpsellingFeature (IAP_UPSELLING) is deliberately not touched: it is the master switch for
// every in-app purchase entry point, including the Settings "Upgrade" row
// (AccountSettingsFragment.onUpgradeClicked returns early without it) and the drawer's Premium
// item, so turning it off would break the user's own way to buy.
internal object Swipe2UpsellEnabledByConfigFingerprint : Fingerprint(
    name = "isEnabledByConfig",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(methodCall(name = "isSwipe2UpsellEnabled", parameters = listOf(), returnType = "Z")),
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
