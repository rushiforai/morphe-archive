package semicoloncolonel.mobilestream.patches.foxnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Fox News 5.49.2 starts each analytics SDK from its own androidx.startup
// initializer, and keeps their names. Adobe, Chartbeat, comScore, Nielsen,
// Fox's Pyxis ad telemetry and Firebase Analytics never start; AppsFlyer and
// Fox's XID ad-ID graph are stopped at their wrappers. Fox News keeps OkHttp's
// public names, so both shared blocking layers apply as well.
//
// Not touched: crash reporting, Braze (it also delivers push), Optimizely
// feature flags, Fox and TV-provider sign-in, comments, podcasts, or video.
// ─────────────────────────────────────────────────────────────────────────────

private const val INITIALIZERS = "Lcom/foxnews/android/initializer/"

private class InitializerCreateFingerprint(name: String) : Fingerprint(
    definingClass = "$INITIALIZERS${name}Initializer;",
    name = "create",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

private val trackerInitializers = listOf(
    "Adobe", "Chartbeat", "Comscore", "Nielsen", "PyxisAnalytics", "FirebaseAnalytics",
).map(::InitializerCreateFingerprint)

internal object StartAppsFlyerFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/analytics/appsflyer/AppsFlyerWrapper;",
    name = "startAppsFlyer",
    returnType = "V",
)

internal object XidTrackAppLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/xid/XidClient;",
    name = "trackAppLaunch",
    returnType = "V",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the Fox News phone app: Adobe, AppsFlyer, " +
        "Chartbeat, comScore, Nielsen, Firebase, and Fox's own ad telemetry and ad-ID graph. " +
        "Blocking happens on the device, inside the app. Sign-in, push notifications and " +
        "video are left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        (trackerInitializers + StartAppsFlyerFingerprint + XidTrackAppLaunchFingerprint).forEach {
            it.methodOrNull?.addInstructions(0, "return-void")
        }

        blockTrackers()
    }
}
