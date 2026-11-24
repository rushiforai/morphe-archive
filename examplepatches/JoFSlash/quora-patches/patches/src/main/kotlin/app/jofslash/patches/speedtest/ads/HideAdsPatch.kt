package app.jofslash.patches.speedtest.ads

import app.jofslash.patches.speedtest.shared.Constants.COMPATIBILITY_SPEEDTEST
import app.jofslash.patches.speedtest.shared.methodOf
import app.jofslash.patches.speedtest.shared.returnEarly
import app.jofslash.patches.speedtest.shared.returnInt
import app.morphe.patcher.patch.bytecodePatch

// The one class in com.ookla.speedtest.ads that implements the AdsManager interface (and
// Application.ActivityLifecycleCallbacks). Its name is R8-assigned; the patch throws if it is gone.
private const val ADS_MANAGER_IMPL = "Lcom/ookla/speedtest/ads/e;"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides the banner and the ad after a speed test, and never starts the ad networks " +
            "(Google Ad Manager, Prebid and Amazon) or asks for ad consent. Premium and your subscription " +
            "aren't touched.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        // AdsManager.initialize() starts the whole ad pipeline: it computes the ad state, subscribes
        // to the purchase/privacy/config feeds and, when the state says "show ads", calls
        // MobileAds.initialize(). Returning at once leaves the cached state at its default 0, so no
        // network is started and every screen reads the app as ad-free.
        methodOf(ADS_MANAGER_IMPL, "initialize").returnEarly()

        // The ad state the UI reads through isAdsFree(AdsManager) = (state != 2). 2 means "show ads";
        // forcing 1 ("ad-free") hides the banner, the post-test native ad and the ad-free delegate,
        // whatever the purchase feed later reports. This does not grant the paid ad-free add-on.
        methodOf(ADS_MANAGER_IMPL, "b", emptyList()).returnInt(1)
    }
}
