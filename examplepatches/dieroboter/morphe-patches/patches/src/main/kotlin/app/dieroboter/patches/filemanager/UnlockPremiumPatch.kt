package app.dieroboter.patches.filemanager

import app.morphe.patcher.patch.bytecodePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_FILE_MANAGER

private const val LICENSE_MANAGER = "Lax/l7/e;"
private const val LICENSE_FACADE = "Lax/z7/h;"

private const val STRING = "Ljava/lang/String;"

/**
 * Unlock premium (File Manager 3.8.5).
 *
 * Premium is the developer's own license system: Play Billing purchases are
 * stored as license tokens, and the license manager (ax/l7/e, a singleton)
 * answers every entitlement question through five boolean verdict methods,
 * each taking a product category string: H (a valid license exists), J
 * (the license is the premium product - its log line reads "has premium:"),
 * K, L and p (license-kind and license-state checks). Every consumer in
 * the app reaches these through the static facade ax/z7/h: its g/i/k/b
 * delegate to H/K/L/p, while j (the premium verdict used by the main
 * UI) additionally ANDs a gate check (the facade's h()) with J.
 *
 * The patch makes the five manager verdicts answer true via [trueMethod],
 * and also forces the facade's j() to true so the premium answer does not
 * depend on its gate. All six are pure queries: the singleton,
 * its initialization and the entire billing/purchase flow are untouched,
 * nothing is bought or restored, and no value any caller dereferences is
 * removed - callers simply get "yes" from the app's own checks. With a
 * valid premium license reported, the app stops serving ads by its own
 * design and unlocks the premium features.
 *
 * 6 methods in total, all boolean; every target is asserted to match
 * exactly one method.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Reports a valid Premium Basic license to the app: the license manager's " +
        "verdict methods are made to answer yes, so premium features unlock and ads stop " +
        "(the app serves no ads to licensed users). The billing code itself is untouched - " +
        "nothing is purchased.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FILE_MANAGER)

    execute {
        trueMethod(LICENSE_MANAGER, "H", STRING)
        trueMethod(LICENSE_MANAGER, "J", STRING)
        trueMethod(LICENSE_MANAGER, "K", STRING)
        trueMethod(LICENSE_MANAGER, "L", STRING)
        trueMethod(LICENSE_MANAGER, "p", STRING)
        trueMethod(LICENSE_FACADE, "j")
    }
}
