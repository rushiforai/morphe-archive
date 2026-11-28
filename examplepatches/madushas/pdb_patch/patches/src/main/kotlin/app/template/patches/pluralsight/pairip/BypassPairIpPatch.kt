package app.template.patches.pluralsight.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PLURALSIGHT_COMPATIBILITY
import app.template.patches.shared.killPairIpFull

/**
 * Bypasses Pluralsight's PairIP (Google Play application-licensing) launch gate.
 *
 * Same lite shape as the other pairip apps in this bundle: `application/` plus
 * `licensecheck/` only, no `VMRunner`, no `StartupLauncher`, no `SignatureCheck`,
 * no `libpairipcore.so`, and `LicenseContentProvider` is not declared. The one
 * extra this build carries — shared with We Love Deals but **not** OferHub — is
 * the **custom-trial extension** (`checkTrialStatus`, `stopTrial`, `handleTrialEnd`,
 * `customTrialEndTriggered`).
 *
 * As with OferHub the gate is a *subclass*, not a manifest swap:
 *
 *     com/pairip/application/Application .super Lcom/pluralsight/KMPApplication;
 *
 * so the manifest `android:name` is left alone (the KMP app class must stay the
 * Application) and the shared [killPairIpFull] primitive does the work.
 *
 * What is neutralised (measured on the 2026.11.05 base APK):
 *   initializeLicenseCheck          29 → 3 instrs  (forces LOCAL_CHECK_OK)
 *   processResponse                 54 → 1         (paywall on NOT_LICENSED + exit)
 *   performLocalInstallerCheck      53 → 2         (→ true)
 *   startPaywallActivity            11 → 1
 *   startErrorDialogActivity         9 → 1
 *   handleError                      5 → 1
 *   scheduleAppShutdown              7 → 1
 *   handleTrialEnd                  26 → 1         (custom-trial re-arm)
 *   initiateFreshLicensingServiceConnection           (the newer service-bind name)
 *
 * HONEST SCOPE: this removes the launch gate only. Pluralsight's entitlement is
 * server-authoritative — subscription state (`GET /v1/subscription`) and course
 * access (`GET /v2/user/courses` → `viewableModules` / `mayDownload` / `isEmbargoed`)
 * are Room-cached server responses, and media URLs are issued by the backend
 * (`VideoResponseDto.url` over the authenticated offline-media endpoints). No
 * client patch can mint playable or downloadable premium media, so no premium patch
 * is shipped for this app; see `docs/phase2-analysis.md` for the full trace.
 */
@Suppress("unused")
val pluralsightBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables Pluralsight's PairIP / Play licence verification (including " +
        "its custom-trial re-check) so the app runs after Morphe re-signs it. Launch gate " +
        "only — subscriptions and course access are validated by Pluralsight's servers.",
    default = true,
) {
    compatibleWith(PLURALSIGHT_COMPATIBILITY)

    execute {
        killPairIpFull(
            // This build's custom-trial re-arm: sets customTrialEndTriggered +
            // licenseCheckState = CHECK_REQUIRED, forcing a real network check.
            "Lcom/pairip/licensecheck/LicenseClient;" to "handleTrialEnd",
            "Lcom/pairip/licensecheck/LicenseClient;" to "startErrorDialogActivity",
            "Lcom/pairip/licensecheck/LicenseClient;" to "handleError",
            "Lcom/pairip/licensecheck/LicenseClient;" to "scheduleAppShutdown",
            // The newer service-connection entry killPairIpFull does not name.
            "Lcom/pairip/licensecheck/LicenseClient;" to "initiateFreshLicensingServiceConnection",
        )
    }
}