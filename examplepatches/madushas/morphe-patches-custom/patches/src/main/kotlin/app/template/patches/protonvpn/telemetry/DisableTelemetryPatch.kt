package app.template.patches.protonvpn.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.protonvpn.AppConfigGetLargeMetricsSamplingMultiplier
import app.template.patches.protonvpn.SentryBootstrap
import app.template.patches.shared.Constants.PROTON_VPN_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.returnEarly

/**
 * Turns off Proton VPN's telemetry.
 *
 *  - **Sentry** (crash + performance reporting, DSN `…@vpn-api.proton.me/…/sentry/…`):
 *    `wl.y.b()V` is the app's Sentry bootstrap — it is no-op'ed so the SDK is never
 *    initialised (Sentry calls elsewhere become safe no-ops).
 *  - **Large metrics**: `AppConfigResponse.getLargeMetricsSamplingMultiplier()` is
 *    forced to 0, disabling Proton's own metrics sampling.
 *
 * Nothing else in the app is affected (accounts, VPN and NetShield keep working).
 */
@Suppress("unused")
val disableProtonTelemetryPatch = bytecodePatch(
    name = "Disable telemetry (Sentry)",
    description = "Stops Proton VPN's Sentry crash/telemetry reporting and disables " +
        "the large-metrics sampling multiplier. Accounts and VPN stay unaffected.",
    default = true,
) {
    category("Privacy")
    compatibleWith(PROTON_VPN_COMPATIBILITY)

    val disableTelemetry by booleanOption(
        key = "protonDisableTelemetry",
        default = true,
        title = "Disable telemetry",
        description = "Disable Sentry reporting and Proton's large-metrics sampling.",
    )

    execute {
        if (disableTelemetry != true) return@execute

        SentryBootstrap.method.apply {
            clearBody()
            addInstructions(0, "return-void")
        }
        AppConfigGetLargeMetricsSamplingMultiplier.method.returnEarly(0)
    }
}
