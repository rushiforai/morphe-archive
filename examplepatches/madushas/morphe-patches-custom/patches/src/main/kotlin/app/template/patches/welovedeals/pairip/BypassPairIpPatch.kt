package app.template.patches.welovedeals.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.WE_LOVE_DEALS_COMPATIBILITY
import app.template.patches.shared.killPairIpFull

/**
 * Bypasses We Love Deals' PairIP (Google Play application-licensing) launch gate.
 *
 * The app is a **Flutter** build: all logic is AOT Dart in `libapp.so` (8.2 MB,
 * plus `libflutter.so` / `libdartjni.so` / `libdatastore_shared_counter.so`), only
 * 15 plugins are registered and all are UI/peripheral, and
 * `com/thina/welovedeals/MainActivity.smali` is the only app-owned class. There is
 * no ad SDK, no Firebase, no billing and no analytics anywhere in the dex, so the
 * only bytecode surface is the licence check itself.
 *
 * Variant: **lite** — 37 `com/pairip` classes (`application/` + `licensecheck/`
 * only), no `VMRunner`, no `StartupLauncher`, and no `libpairipcore.so` in any
 * split. So the shared [killPairIpFull] primitive is the right tool: its VM and
 * `SignatureCheck` steps are no-ops on this build and its LicenseClient block does
 * the real work (force `LOCAL_CHECK_OK`, no-op `processResponse` / paywall /
 * error / shutdown, `performLocalInstallerCheck` → true, disable repeated checks).
 *
 * What is special here versus the other pairip apps in this bundle: this build
 * ships the **custom-trial extension** (`TrialClient.checkTrialStatus`,
 * `LicenseClient.stopTrial` → `handleTrialEnd`, `RepeatedCheckMetadata`,
 * `customTrialEndTriggered`, `EXTRA_END_CUSTOM_TRIAL`). `handleTrialEnd()` sets
 * `customTrialEndTriggered = true` **and** `licenseCheckState = CHECK_REQUIRED`, i.e.
 * it re-arms a real network check — so it must be neutralised too, otherwise the
 * launch gate is bypassed but the app later forces a full round trip anyway. OferHub
 * has none of this; that difference is why the two patches are not identical.
 *
 * Note on `stopTrial` specifically: it is a *trial terminator*, not a satisfier —
 * routing `checkLicense` through it would be exactly wrong. It is left alone and
 * becomes inert because the `handleTrialEnd()` it funnels into is no-op'd.
 *
 * Honest scope: this removes the launch gate only. Any server-authoritative deal
 * data the backend enforces is unaffected, and it is unreachable from the dex.
 */
@Suppress("unused")
val welovedealsBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables We Love Deals' PairIP / Play licence verification (including " +
        "its custom-trial re-check) so the app runs after Morphe re-signs it. Launch gate " +
        "only — the Flutter deals logic and any server-side checks are untouched.",
    default = true,
) {
    compatibleWith(WE_LOVE_DEALS_COMPATIBILITY)

    execute {
        // killPairIpFull covers the LicenseClient block (force LOCAL_CHECK_OK, no-op
        // processResponse / startPaywallActivity / validateResponse /
        // performLocalInstallerCheck → true, repeated checks off). Verified measured on
        // the 1.2.0 base APK: initializeLicenseCheck 29→3 instrs, processResponse 54→1,
        // performLocalInstallerCheck 53→2, startPaywallActivity 11→1.
        //
        // The extras below are the paths killPairIpFull does not touch, added for
        // defence in depth because none of them is reachable once the gate never starts,
        // but this app cannot be device-verified in this campaign yet:
        //   handleTrialEnd           — this build's custom-trial re-arm
        //                             (sets customTrialEndTriggered + CHECK_REQUIRED)
        //   startErrorDialogActivity — the error UI handleError would dispatch to
        //   handleError              — the exception sink
        //   scheduleAppShutdown      — the eventual-exit failsafe
        killPairIpFull(
            "Lcom/pairip/licensecheck/LicenseClient;" to "handleTrialEnd",
            "Lcom/pairip/licensecheck/LicenseClient;" to "startErrorDialogActivity",
            "Lcom/pairip/licensecheck/LicenseClient;" to "handleError",
            "Lcom/pairip/licensecheck/LicenseClient;" to "scheduleAppShutdown",
        )
    }
}