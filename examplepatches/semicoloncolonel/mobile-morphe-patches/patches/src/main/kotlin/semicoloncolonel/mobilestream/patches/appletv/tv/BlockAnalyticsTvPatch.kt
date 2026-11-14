package semicoloncolonel.mobilestream.patches.appletv.tv

import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants

// Apple TV Android TV 17.0.2 and 17.0.3. The engine networks from native code, so a
// blocker in Java cannot see its requests. The JavaScript in app.zip is
// changed instead (see AppZip):
//
// - Over-the-air updates are turned off (DISABLE_OTA), so a downloaded diff
//   cannot bring the metrics code back.
// - Apple's usage metrics (MetricsKit): every topic reports itself
//   disabled, so no event is queued or sent, and the xp.apple.com report and
//   config URLs point at a host that does not exist.
// - Playback reporting (PlayerStore.js): the player's real-time reporting
//   configuration URL points at a host that does not exist, and the player
//   error and debug log uploads are off.
// - Not covered: the app still looks up xp.apple.com at launch (DNS logs from
//   a Shield, 2026-11-08). The metrics libraries take report and config URLs
//   from the iTunes bag at run time, and the request is made where a guard in
//   main.js does not reach. The patch stays experimental until that path is
//   found.
//
// Sign-in, purchases, and playback are not changed. The phone app shares the
// package name but has no app.zip, so this patch does nothing there.

private const val NO_HOST = "https://xp.apple.invalid"

// MetricsKit's chunk: 2012.js in 17.0.2, 5273.js in 17.0.3.
private val METRICS_KIT = chunk("blacklistedEvents")

private val EDITS = listOf(
    DISABLE_OTA,
    // MetricsKit's three "is this topic disabled?" checks.
    AppZipEdit(
        METRICS_KIT,
        "p.prototype.disabled=function(e){return this.value(\"disabled\",e).then(function(e){return!!e})}",
        "p.prototype.disabled=function(e){return Promise.resolve(!0)}",
    ),
    AppZipEdit(METRICS_KIT, "function E(e){return!!this.value(\"disabled\",e)}", "function E(e){return!0}"),
    AppZipEdit(METRICS_KIT, "function k(e){return!!this.value(\"disabled\",e)}", "function k(e){return!0}"),
    AppZipEdit(METRICS_KIT, "\"https://xp.apple.com/report\"", "\"$NO_HOST/report\"", all = true),
    AppZipEdit(METRICS_KIT, "\"https://xp.apple.com/config/1/report\"", "\"$NO_HOST/config/1/report\"", all = true),
    // Playback reporting.
    AppZipEdit(
        "PlayerStore.js",
        "rtcStoreBagUrl:\"https://mediaservices.cdn-apple.com/store_bags/hlsjs/atve/v1/rtc_storebag.json\"",
        "rtcStoreBagUrl:\"$NO_HOST/rtc_storebag.json\"",
    ),
    AppZipEdit("PlayerStore.js", "reportAppErrorLogs:(null!=S?S:0)>y", "reportAppErrorLogs:!1"),
    AppZipEdit("PlayerStore.js", "reportAppDebugLogs:(null!=P?P:0)>y", "reportAppDebugLogs:!1"),
)

@Suppress("unused")
val blockAnalyticsTvPatch = resourcePatch(
    name = "Block analytics & tracking (Android TV)",
    description = "Reduces Apple's usage metrics and stops playback reports in the Android TV app. " +
        "The app also stops downloading updates to its screens between app updates.",
    default = false,
) {
    compatibleWith(Constants.TV_COMPATIBILITY)

    execute {
        editAppZip(EDITS)
    }
}
