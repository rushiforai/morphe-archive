package lab.ltediscovery.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import lab.ltediscovery.patches.shared.COMPATIBILITY_LTEDISCOVERY

/**
 * Unlocks Pro and Pro Plus.
 *
 * The commercial entitlement is entirely client-side: Play Billing purchase
 * results are mapped to a `BillingEntitlements` value object and persisted as
 * encrypted SharedPreferences booleans. Every feature gate then calls one of
 * two predicates:
 *
 *   - `a()` — "has any Pro access"
 *   - `b()` — "has Pro Plus access"
 *
 * Forcing both to `true` unlocks the full Pro / Pro Plus UI without a Play
 * purchase. The patch also stubs Google PairIP App Licensing
 * (`LicenseClient.checkLicense`), which would otherwise stop any repackaged
 * build with a Play Store paywall and `System.exit(0)`.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro and Pro Plus features by forcing the two client-side " +
        "BillingEntitlements predicates to true. Also disables Google PairIP App " +
        "Licensing so the repackaged build can start.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LTEDISCOVERY)

    execute {
        // 1. PairIP: return before any licence work so a Morphe-signed build runs.
        LicenseClientCheckFingerprint.method.addInstructions(0, "return-void")

        // 2. BillingEntitlements predicates: a() = Pro, b() = Pro Plus.
        val predicates = BillingEntitlementPredicateFingerprint.matchAll()
        if (predicates.size != 2) {
            throw PatchException(
                "Expected exactly 2 BillingEntitlements predicates (a/b), found ${predicates.size}",
            )
        }

        predicates.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }
    }
}