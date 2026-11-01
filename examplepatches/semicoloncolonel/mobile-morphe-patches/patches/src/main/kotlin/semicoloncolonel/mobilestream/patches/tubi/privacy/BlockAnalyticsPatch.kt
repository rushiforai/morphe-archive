/*
 * From ajstrick81's Tubi Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/privacy
 * ALL CREDIT FOR THE ORIGINAL DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.tubi.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// From ajstrick81's 2026-09 privacy study of the Tubi Android TV build. The
// phone build (10.43.1) ships the same SDKs. Besides crash reporting, Tubi
// ships Adjust, Branch, Braze, Nielsen, Conviva, NPAW/Youbora, Mux,
// Firebase/Google Analytics and Meta App Events. Its own analytics endpoint
// (analytics-ingestion) receives advertiser_id, device_id and postal_code /
// latitude / longitude fields.
//
// Layers: Adjust never starts (initSdk / onCreate -> return-void), plus the
// shared manifest kill switches and host blocklist (see BlockTrackers.kt).
// The TV patch also hooks the TV app's SPA WebView, which the phone app does
// not use.
//
// Not touched: crash/performance reporting, Statsig feature flags, OneTrust
// consent, sign-in, ads/playback/DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Tubi's analytics and tracking: Adjust, Branch, Braze, Nielsen, " +
        "Conviva, NPAW/Youbora, Mux, Firebase/Google Analytics, Meta app events, and Tubi's " +
        "own analytics endpoint (which receives your advertiser ID, device ID and ZIP/location " +
        "fields). Blocking happens on the device, inside the app. Crash reporting, feature " +
        "flags, sign-in and playback are left alone. Recommendations may be less personalised. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Adjust never starts, so it never reads ANDROID_ID / GAID or sends
        // attribution events.
        AdjustInitSdkFingerprint.methodOrNull?.addInstructions(0, "return-void")
        AdjustOnCreateFingerprint.methodOrNull?.addInstructions(0, "return-void")

        blockTrackers()
    }
}
