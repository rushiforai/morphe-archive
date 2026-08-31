package morningentree.morphe.patches.google.gboard.tracking

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import morningentree.morphe.patches.google.gboard.shared.COMPATIBILITY_GBOARD
import morningentree.morphe.patches.shared.misc.hosts.DEFAULT_REDIRECTION_IP
import morningentree.morphe.patches.shared.misc.hosts.HostsBlocker
import morningentree.morphe.patches.shared.misc.hosts.HostsBlockerConfig
import morningentree.morphe.patches.shared.misc.hosts.baseHostsBlockerPatch
import org.w3c.dom.Element

private const val LEVEL_TELEMETRY = "telemetry"
private const val LEVEL_LOCKDOWN = "lockdown"
private const val LEVEL_BLOCK_ALL = "block_all"

@Suppress("unused")
val gboardNetworkPrivacyPatch = bytecodePatch(
    name = "Network privacy",
    description = "Controls what Gboard is allowed to talk to. Choose a network level: block core " +
        "telemetry, block ads & telemetry more aggressively (all typing features still work), or " +
        "block all internet access.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    val networkLevel by stringOption(
        key = "gboardNetworkLevel",
        default = LEVEL_TELEMETRY,
        values = mapOf(
            "Block telemetry only" to LEVEL_TELEMETRY,
            "Block ads & telemetry (keeps GIFs & voice)" to LEVEL_LOCKDOWN,
            "Block all internet" to LEVEL_BLOCK_ALL,
        ),
        title = "Network level",
        description = "How much of Gboard's network access to cut. \"Telemetry only\" nulls the core " +
            "analytics/logging hosts. \"Ads & telemetry\" is a wider deny-list of known ad, " +
            "analytics, and federated-learning hosts — GIF search, cloud voice typing, stickers and " +
            "translation keep working because their hosts are never touched. \"Block all internet\" " +
            "removes network access entirely (which also disables GIFs and cloud voice typing).",
        required = true,
    ) { it in setOf(LEVEL_TELEMETRY, LEVEL_LOCKDOWN, LEVEL_BLOCK_ALL) }

    val isWildcard by booleanOption(
        key = "isWildcard",
        default = true,
        title = "Wildcard blocking",
        description = "When enabled, a blocked entry like \"example.com\" also covers subdomains " +
            "such as \"sub.example.com\".",
    )

    dependsOn(
        baseHostsBlockerPatch {
            val hosts = when (networkLevel) {
                LEVEL_LOCKDOWN -> GBOARD_LOCKDOWN_HOSTS
                LEVEL_BLOCK_ALL -> ""
                else -> GBOARD_TRACKING_HOSTS
            }
            HostsBlockerConfig(
                hostsBlocker = HostsBlocker.fromString(hosts),
                redirectionIp = DEFAULT_REDIRECTION_IP,
                wildcard = isWildcard != false,
            )
        },
        resourcePatch {
            execute {
                if (networkLevel != LEVEL_BLOCK_ALL) return@execute
                document("AndroidManifest.xml").use { doc ->
                    val permissions = doc.getElementsByTagName("uses-permission")
                    for (index in permissions.length - 1 downTo 0) {
                        val node = permissions.item(index) as Element
                        if (node.getAttribute("android:name") == "android.permission.INTERNET") {
                            node.parentNode.removeChild(node)
                        }
                    }
                }
            }
        },
    )
}
