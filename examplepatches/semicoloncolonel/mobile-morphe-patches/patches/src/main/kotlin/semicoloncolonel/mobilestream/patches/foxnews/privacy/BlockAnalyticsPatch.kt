package semicoloncolonel.mobilestream.patches.foxnews.privacy

import semicoloncolonel.mobilestream.patches.shared.privacy.gatedAnalyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
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
val blockAnalyticsPatch: BytecodePatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Blocks the tracking you choose in the patch options.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(optOutOfDataSalePatch)

    dependsOn(gatedAnalyticsKillSwitchesPatch { isOptionOn(blockAnalyticsPatch, "analytics") })

    extendWith("extensions/extension.mpe")

    booleanOption(
        key = "analytics",
        default = false,
        title = "Analytics and tracking services",
        description = "Stops the app's analytics, ad measurement, and marketing services.",
    )
    booleanOption(
        key = "dataSale",
        default = true,
        title = "Opt out of data sale & sharing",
        description = "Starts the app opted out of the sale and sharing of your data.",
    )

    execute {
        if (!isOptionOn(blockAnalyticsPatch, "analytics")) return@execute
        (trackerInitializers + StartAppsFlyerFingerprint + XidTrackAppLaunchFingerprint).forEach {
            it.methodOrNull?.addInstructions(0, "return-void")
        }

        blockTrackers()
    }
}
