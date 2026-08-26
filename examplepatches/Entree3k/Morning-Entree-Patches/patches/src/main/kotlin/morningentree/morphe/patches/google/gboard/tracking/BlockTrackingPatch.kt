package morningentree.morphe.patches.google.gboard.tracking

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import morningentree.morphe.patches.shared.misc.hosts.DEFAULT_REDIRECTION_IP
import morningentree.morphe.patches.shared.misc.hosts.HostsBlocker
import morningentree.morphe.patches.shared.misc.hosts.HostsBlockerConfig
import morningentree.morphe.patches.shared.misc.hosts.baseHostsBlockerPatch

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking and analytics",
    description = "Redirects Gboard's known tracking, analytics, and ad host to 0.0.0.0. Note: telemetry sent through Google Play Services is not " +
        "affected; use the always-incognito patch for that.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val isWildcardOption by booleanOption(
        key = "isWildcard",
        default = true,
        title = "Wildcard blocking",
        description = "When enabled, an entry like \"example.com\" also blocks subdomains such as " +
            "\"www.example.com\".",
    )

    dependsOn(
        baseHostsBlockerPatch {
            HostsBlockerConfig(
                hostsBlocker = HostsBlocker.fromString(GBOARD_TRACKING_HOSTS),
                redirectionIp = DEFAULT_REDIRECTION_IP,
                wildcard = isWildcardOption!!,
            )
        },
    )
}
