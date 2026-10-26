package app.template.patches.mydialog.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.FbAppEventQueue
import app.template.patches.mydialog.FbFetchedAppSettingsManager
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Residual beacon traffic the init-level tracker patches cannot reach (proven
 * by decrypted MITM flows on the patched build):
 *
 *  - Facebook `POST /v16.0/<app-id>/activities` and `POST /v16.0/app` — the FB
 *    SDK's AppEvents flush path. `FacebookInitProvider` must stay alive (RN's
 *    Facebook module needs an initialized SDK — removing it crashed RN startup
 *    in v0.1.0), so the SDK lives but must never send. `AppEventQueue.h(..)` is
 *    the single enqueue point for every app event: with it a no-op the queue
 *    stays permanently empty and the flush path fires with nothing to send.
 *  - Facebook `GET /v16.0/app/mobile_sdk_gk` — the SDK's remote config fetch
 *    (`FetchedAppSettingsManager.i(..)`); a pure phone-home with no feature
 *    value, no-op'd.
 *
 * CleverTap's residual `POST /a1` is handled in DisableCleverTapPatch (domain
 * resolver -> dead loopback).
 */
@Suppress("unused")
val myDialogHardenBeaconsPatch = bytecodePatch(
    name = "Kill residual beacon traffic",
    description = "Silences the Facebook SDK's remaining phone-home: app-event " +
        "uploads (/activities, /app) and the SDK config fetch (mobile_sdk_gk). " +
        "The SDK class init stays alive (required by RN); only transmission dies.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        // void static -> plain early return, no nullability concerns.
        FbAppEventQueue.method.returnEarly()
        FbFetchedAppSettingsManager.method.returnEarly()
    }
}
