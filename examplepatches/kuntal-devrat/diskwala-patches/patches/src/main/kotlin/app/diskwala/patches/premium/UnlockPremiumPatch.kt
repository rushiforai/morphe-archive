package app.diskwala.patches.premium

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks premium by making RevenueCat entitlements appear active.
 * Approach: stub isActive() to always return true and make getActive() return all entitlements.
 * This makes `Buy Subscription to enjoy Ads Free Experience` checks pass, and the app's own
 * `isPremiumUserContext` / ad gate will treat user as premium.
 *
 * Stubbing at this level is safe: isActive() is a pure getter, getActive() just returns a map.
 * No network calls are blocked; we just lie about the result. No crash because we keep types.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Makes RevenueCat entitlements appear active so ads-free and premium features are unlocked.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        // isActive()Z -> return true without reading field
        runCatching {
            EntitlementInfoIsActiveFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // getActive()Ljava/util/Map; -> return `all` instead of filtered `active`
        runCatching {
            EntitlementInfosGetActiveFingerprint.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;
                    return-object v0
                """
            )
        }
    }
}
