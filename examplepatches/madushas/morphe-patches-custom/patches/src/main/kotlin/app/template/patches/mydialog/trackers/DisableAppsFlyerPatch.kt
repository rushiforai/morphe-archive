package app.template.patches.mydialog.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.AppsFlyerCallSdkInternal
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * AppsFlyer is started from JS through the RN bridge: both `initSdkWithCallBack`
 * and `initSdkWithPromise` funnel into `callSdkInternal(ReadableMap)`, which
 * validates the dev key, registers conversion/deep-link listeners and (unless
 * `manualStart`) calls `AppsFlyerLib.start(...)`. There is no manifest-level
 * auto-init for AppsFlyer in 18.6.5, so this one method is the entire launch path.
 *
 * Replacing it with a `null` return (its documented success value) makes both JS
 * entry points resolve "Success" while the SDK is never initialized — subsequent
 * `logEvent`-style calls run into an unstarted lib that buffers locally and
 * never transmits.
 */
@Suppress("unused")
val myDialogDisableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer",
    description = "Neutralizes AppsFlyer attribution/telemetry: the SDK is never " +
        "initialized or started, and the JS bridge reports success as usual.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        AppsFlyerCallSdkInternal.method.returnEarly(null as Void?)
    }
}
