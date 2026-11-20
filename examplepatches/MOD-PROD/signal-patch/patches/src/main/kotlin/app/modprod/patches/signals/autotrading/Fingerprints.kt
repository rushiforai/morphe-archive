package app.modprod.patches.signals.autotrading

import app.morphe.patcher.Fingerprint

/**
 * MainActivity of Signals v14.3.1.
 * The ViewPager fragment list is filled in a private no-arg method (`F0` in the
 * decompile) that references LaunchPad type `Lak/c`.
 */
private const val MAIN_ACTIVITY = "Lcom/zyncas/signals/ui/main/MainActivity;"

/**
 * Method that builds the ViewPager adapter list (adds Home, Trackers, Spot,
 * Futures, then LaunchPad). Identified as private, void, no parameters, and
 * must contain a reference to Lak/c (resolved at execute-time).
 */
object MainActivitySetupPagerFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "V",
    parameters = emptyList(),
)
