package app.template.patches.glassdoor.trackers

import app.template.patches.shared.requireProgress

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.GLASSDOOR_COMPATIBILITY
import app.template.patches.shared.clearBody

/**
 * Turns off AppsFlyer, Glassdoor's install-attribution and event analytics SDK.
 *
 * `AppsFlyerLib` is an abstract facade; the real implementation is the final class
 * `com.appsflyer.internal.AFa1uSDK` (the only class extending `AppsFlyerLib`). The app's
 * wrappers (`hy0`, `f8`, `ut0`, `k76`) call `AppsFlyerLib.getInstance()` and then
 * `start(...)` / `logEvent(...)` through it.
 *
 * This patch no-ops the concrete `start(...)` (×3 overloads — the SDK bootstrap that
 * registers the install and starts the attribution/analytics pipeline) and `logEvent(...)`
 * (×2 overloads — every analytics event) on `AFa1uSDK`. The getters the app also uses
 * (`getAppsFlyerUID`, `getHostPrefix`) keep returning their (now default) values so no
 * caller NPEs, and RudderStack's AppsFlyer integration sends nothing because the SDK is
 * never started.
 */
@Suppress("unused")
val glassdoorDisableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer",
    description = "No-ops AppsFlyer's start() and logEvent() entry points, so no install " +
        "attribution or analytics events are sent.",
    default = true,
) {
    compatibleWith(GLASSDOOR_COMPATIBILITY)

    execute {
        val cls = mutableClassDefByOrNull("Lcom/appsflyer/internal/AFa1uSDK;")

        fun noOp(m: MutableMethod?) {
            if (m == null) return
            m.clearBody()
            m.addInstructions(0, "return-void")
        }

        val methods = cls?.methods ?: return@execute
        var matched = 0
        var noOped = 0
        for (m in methods) {
            if (m.returnType == "V" && (m.name == "start" || m.name == "logEvent")) {
                matched++
                noOp(m)
                noOped++
            }
        }
        // Fail-closed: the AppsFlyer class was found and its entry points matched, but
        // nothing was no-oped → the anchor moved and tracking would still be live.
        requireProgress(matched, noOped, "AppsFlyer start()/logEvent()")
    }
}
