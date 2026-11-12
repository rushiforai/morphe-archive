package app.template.patches.protonvpn.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.protonvpn.AppConfigGetChangeServerAttemptLimit
import app.template.patches.protonvpn.AppConfigGetChangeServerLongDelay
import app.template.patches.protonvpn.AppConfigGetChangeServerShortDelay
import app.template.patches.shared.Constants.PROTON_VPN_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Removes the imposed wait and the attempt cap when changing VPN servers.
 *
 * The values come from the server config object `AppConfigResponse`
 * (`changeServerShortDelayInSeconds` / `changeServerLongDelayInSeconds` /
 * `changeServerAttemptLimit`), so patching its getters works regardless of what the
 * API returns and does not depend on method names inside R8-shrunk UI code (the
 * community patch fingerprinted the delay methods by name, which breaks on rename).
 */
@Suppress("unused")
val removeProtonServerChangeDelayPatch = bytecodePatch(
    name = "Remove server-change delay",
    description = "Sets the \"change server\" wait to zero and raises the attempt " +
        "limit, so you can switch VPN servers freely.",
    default = true,
) {
    category("Misc")
    compatibleWith(PROTON_VPN_COMPATIBILITY)

    val removeDelay by booleanOption(
        key = "protonRemoveServerChangeDelay",
        default = true,
        title = "Remove server-change delay",
        description = "No wait and no attempt cap when changing VPN servers.",
    )

    execute {
        if (removeDelay != true) return@execute

        AppConfigGetChangeServerShortDelay.method.returnEarly(0)
        AppConfigGetChangeServerLongDelay.method.returnEarly(0)
        AppConfigGetChangeServerAttemptLimit.method.returnEarly(100)
    }
}
