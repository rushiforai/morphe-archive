package app.template.patches.youcut.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YOUCUT

/**
 * YouCut's Pro state is client-side: `store/billing/d.d(Context)Z` reads the "SubscribePro" and
 * "com.camerasideas.trimmer.vip" SharedPreferences flags, the signed-in user's expireType, the
 * "SubscribeProOfHw" flag and the fup/redeem package checks. 82 call sites ask this one method
 * (editor gates, export watermark, template locks, the ad support check), so forcing it true
 * unlocks the Pro experience without touching Play Billing or the purchase flow.
 *
 * Server-side Pro features (cloud storage, AI services) can still be refused by InShot's backend;
 * this patch only unlocks what the app decides locally.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Pro features.",
) {
    compatibleWith(COMPATIBILITY_YOUCUT)

    execute {
        ProGateFingerprint.method.returnEarly(true)
    }
}
