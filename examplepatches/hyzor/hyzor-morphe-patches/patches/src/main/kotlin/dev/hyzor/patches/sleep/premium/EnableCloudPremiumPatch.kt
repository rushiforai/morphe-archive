package dev.hyzor.patches.sleep.premium

import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.sleep.shared.Constants.SLEEP
import dev.hyzor.patches.util.returnEarly

/**
 * Sleep Cloud is a *second*, separately billed subscription ("CLOUD_PREMIUM", SKU
 * `sleep.cloud.premium`). The client keeps its state in the same "TVF" file as key
 * "CP", written by `JavaBilling.refreshCloudSubscriptionState()` only when Play
 * reports both `sleep.cloud` and `sleep.unlock` as OWNED.
 *
 * This patch fixes the client-side flag only. Uploads still authenticate to
 * `sleep-cloud.appspot.com` with an account token, so the backend can still refuse
 * storage for an account that never paid. Keep it opt-in for that reason.
 */
@Suppress("unused")
val enableCloudPremiumPatch = bytecodePatch(
    name = "Enable Cloud Premium",
    description = "Reports the Sleep Cloud subscription as active. Client side only; the backend may still refuse.",
    default = false,
) {
    compatibleWith(SLEEP)

    execute {
        IsCloudPremiumStatusFingerprint.method.returnEarly(true)
        IsCloudPremiumStatusUnknownFingerprint.methodOrNull?.returnEarly(false)
    }
}
