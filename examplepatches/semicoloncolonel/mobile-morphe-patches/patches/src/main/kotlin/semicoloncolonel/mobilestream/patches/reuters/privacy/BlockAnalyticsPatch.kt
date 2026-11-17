package semicoloncolonel.mobilestream.patches.reuters.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.TRACKER_BLOCKER
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackersAtDns

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Reuters 7.51.0 sends every screen and article it shows (article ID, URL,
// title, section, keywords, and authors) to Segment, with Firebase Analytics,
// Chartbeat, Datadog RUM, AppsFlyer, and AB Tasty's hit tracking alongside.
// Braze is kept: it delivers the breaking-news alerts and the topic
// notification settings. Hide promotions drops its marketing pop-ups.
// The native SDKs and React Native's networking go through OkHttp and
// URL.openConnection(), and the JavaScript's requests are checked against the
// same blocklist.
//
// Permutive runs in a hidden WebView, so the blocklist does not reach it. The
// two functions that inject its page views and events into that WebView now
// return at once, the same way they do before the WebView is ready.
//
// Not touched: Sophi, which counts article views on the device for the
// paywall meter, and AB Tasty's flag decisions. MetaRouter and ActionIQ read
// their hosts from remote config, so they are not covered.
// ─────────────────────────────────────────────────────────────────────────────

// The shared blocker's switch for Braze, which this app keeps for alerts.
internal object KeepBrazeFingerprint : Fingerprint(
    definingClass = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/TrackerBlocker;",
    name = "keepBraze",
    returnType = "Z",
)

private val blockPermutiveInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart(
            "", listOf("\n      permutive.addon(\"web\", ", "injectJavaScript"), HermesBundle.Value.UNDEFINED,
        )
        bundle.returnAtStart(
            "", listOf("\n      permutive.track(\n        \"", "injectJavaScript"), HermesBundle.Value.UNDEFINED,
        )
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch, blockPermutiveInBundlePatch)

    extendWith("extensions/extension.mpe")

    execute {
        filterJsRequests(TRACKER_BLOCKER)

        blockTrackers()
        blockTrackersAtDns()

        KeepBrazeFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}
