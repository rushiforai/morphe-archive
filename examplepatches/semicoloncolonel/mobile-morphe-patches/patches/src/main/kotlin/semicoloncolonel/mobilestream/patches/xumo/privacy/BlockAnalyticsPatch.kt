package semicoloncolonel.mobilestream.patches.xumo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.xumo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Xumo Play 4.6.21 — Block analytics & tracking.
//
// Shared layers: the SDKs' manifest kill switches (Firebase Analytics off, no
// ad-ID or SSAID collection) and the host blocklist at every
// URL.openConnection() call site. That covers Braze, Kochava, Google
// measurement, and the Adobe Analytics (Omniture) hits Xumo sends to
// saa.cbsi.com. Xumo's OkHttp is renamed, so the OkHttp layer does not apply.
//
// Xumo's own beacons go to android-beacons.xumo.com through that renamed
// OkHttp, so they are stopped at their senders instead. Every player and
// browse beacon passes through BeaconsKt (content beacons, impressions, and
// the keep-alive impression timer), and XumoWebService sends one more
// app-report beacon on its own thread. These are fire-and-forget calls that
// return nothing, so returning at once changes nothing the app waits on.
//
// Not touched: channel and on-demand catalog requests, playback, and
// favorites.
// ─────────────────────────────────────────────────────────────────────────────

private const val BEACONS = "Lcom/xumo/xumo/beacons/BeaconsKt;"

internal object SendContentBeaconFingerprint : Fingerprint(
    definingClass = BEACONS,
    name = "sendContentBeacon",
    returnType = "V",
)

internal object SendImpressionFingerprint : Fingerprint(
    definingClass = BEACONS,
    name = "sendImpression",
    returnType = "V",
)

internal object StartKeepAliveImpressionTimerFingerprint : Fingerprint(
    definingClass = BEACONS,
    name = "startKeepAliveImpressionTimer",
    parameters = listOf(),
    returnType = "V",
)

internal object SendAppReportBeaconFingerprint : Fingerprint(
    definingClass = "Lcom/xumo/xumo/service/XumoWebService;",
    name = "sendAppReportBeacon",
    parameters = listOf(),
    returnType = "V",
)

internal object OmnitureSendBeaconFingerprint : Fingerprint(
    definingClass = "Lcom/xumo/xumo/util/OmnitureBeaconUtil;",
    name = "sendBeacon",
    parameters = listOf("Lcom/xumo/xumo/model/Asset;"),
    returnType = "V",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Xumo's first-party beacons: required, so a changed player fails loudly.
        listOf(
            SendContentBeaconFingerprint,
            SendImpressionFingerprint,
            StartKeepAliveImpressionTimerFingerprint,
        ).forEach { it.method.addInstructions(0, "return-void") }

        // Also covered by the blocklist; returning early skips the work.
        SendAppReportBeaconFingerprint.methodOrNull?.addInstructions(0, "return-void")
        OmnitureSendBeaconFingerprint.methodOrNull?.addInstructions(0, "return-void")

        blockTrackers()
    }
}
