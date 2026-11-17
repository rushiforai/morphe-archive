package app.zdrgon.patches.appfinder.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.appfinder.shared.Constants.COMPATIBILITY_APP_FINDER

/**
 * App Finder — Enable Professional.
 *
 * App Finder's paid plans (Advance / Ultimate / Professional) are
 * Play Billing products validated entirely on-device: BlKt.chkP
 * reads the user's Play purchases, derives a plan tier int
 * (0 = free, 1/2 = Advance, 3 = Ultimate, 4 = Professional) and
 * stores it on the user-state object, Lscadica/aq/UU;. From then
 * on every paid feature asks that one value through
 * Lscadica/aq/UU;->getF()I (~39 call sites): the Advance filters
 * and sorts, the other-country option, the Ultimate local-ratings
 * lists, developer-country display/filter and min/target-API
 * display, and the CSV export limit (2,000 results, or 20,000
 * when getF() > 3).
 *
 * This patch pins the tier reader to 4 (Professional) at its
 * entry, so the app runs with its top plan state on — every
 * Professional feature unlocked, including the 20,000-result CSV
 * export. No expiry is consulted on any read path, so the state
 * never lapses: the same effective state a lifetime Professional
 * purchase produces (chkP stores those with an end ~200 years
 * out). It creates no purchase, forges no receipt, and touches
 * nothing in the billing library; it only changes the app's own
 * answer to its own question.
 *
 * App Finder 1.5.1 carries no PairIP (the manifest names
 * scadica.aq.App directly with the stock AndroidX component
 * factory, and there is no libpairipcore.so), and the app performs
 * no signature self-check, so nothing else is needed for a
 * re-signed build to launch.
 */
@Suppress("unused")
val enableProfessionalPatch = bytecodePatch(
    name = "Enable Professional",
    description = "Turns on the app's Professional plan state (all Advance and Ultimate features, CSV export of up to 20,000 results) as if the lifetime Professional plan were bought.",
    default = true
) {
    compatibleWith(COMPATIBILITY_APP_FINDER)

    execute {
        PlanTierFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x4
                return v0
            """.trimIndent()
        )
    }
}
