package app.template.patches.prolauncher.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PRO_LAUNCHER

/**
 * Pro Launcher keeps its Pro state in two places, and the gates are split between them:
 *
 * 1. The prefs getter `getBoolean("IS_PRO", false) || isTrialActive()` (obfuscated, ~70 call
 *    sites). The RevenueCat refresh writes the IS_PRO pref; the Interrupt switch, the long-press
 *    and settings Pro items and most feature toggles read this getter, directly or through a
 *    getCustomerInfo callback that just forwards its value.
 * 2. The kept data class SubscriberInfo, collected from a StateFlow by the Compose screens
 *    (isPro() and the data-class component1()).
 *
 * Forcing only (2) leaves every gate in (1) locked, so both are forced to true. RevenueCat and the
 * isPro computation are left alone: the subscription screen still reads the real plan, expiry and
 * member-since values, and the stored IS_PRO pref keeps its real value.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Pro features."
) {
    compatibleWith(COMPATIBILITY_PRO_LAUNCHER)

    execute {
        // (1) The prefs getter. Fails loudly if the pref key or the getter shape changes.
        IsProPrefFingerprint.method.returnEarly(true)

        // (2) SubscriberInfo. Fails loudly if the kept class or its isPro reader ever changes.
        val subscriberInfo = SubscriberInfoIsProFingerprint.classDef

        val readers = subscriberInfo.methods.filter { it.readsIsPro() }
        if (readers.isEmpty()) throw PatchException("no isPro reader found in $SUBSCRIBER_INFO")
        readers.forEach { it.returnEarly(true) }
    }
}
