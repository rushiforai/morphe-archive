package app.template.patches.jooble.trackers

import app.template.patches.shared.requireProgress

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.JOOBLE_COMPATIBILITY
import app.template.patches.shared.clearBody

/**
 * Turns off AppsFlyer, Jooble's install-attribution and event analytics SDK.
 *
 * Same shape as Glassdoor's: `AppsFlyerLib` is an abstract facade and the only implementation
 * is the final `com.appsflyer.internal.AFa1uSDK`. The Flutter `appsflyer` plugin calls
 * `AppsFlyerLib.getInstance()` and then `start(...)` / `logEvent(...)` on it, so no-oping
 * those entry points stops attribution and analytics without touching the plugin.
 */
@Suppress("unused")
val joobleDisableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer",
    description = "No-ops AppsFlyer's start() and logEvent() entry points, so no install " +
        "attribution or analytics events are sent.",
    default = true,
) {
    category("Privacy")
    compatibleWith(JOOBLE_COMPATIBILITY)

    execute {
        val methods = mutableClassDefByOrNull("Lcom/appsflyer/internal/AFa1uSDK;")?.methods
            ?: return@execute
        var matched = 0
        var noOped = 0
        for (m in methods) {
            if (m.returnType == "V" && (m.name == "start" || m.name == "logEvent")) {
                matched++
                m.clearBody()
                m.addInstructions(0, "return-void")
                noOped++
            }
        }
        // Fail-closed: matched AppsFlyer entry points that were not no-oped means the
        // anchor moved and attribution/analytics would still be sent.
        requireProgress(matched, noOped, "AppsFlyer start()/logEvent()")
    }
}
