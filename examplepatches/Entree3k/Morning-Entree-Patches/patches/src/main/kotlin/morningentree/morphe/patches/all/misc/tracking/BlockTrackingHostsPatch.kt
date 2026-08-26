package morningentree.morphe.patches.all.misc.tracking

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import morningentree.morphe.patches.shared.misc.hosts.DEFAULT_REDIRECTION_IP
import morningentree.morphe.patches.shared.misc.hosts.HostsBlocker
import morningentree.morphe.patches.shared.misc.hosts.HostsBlockerConfig
import morningentree.morphe.patches.shared.misc.hosts.baseHostsBlockerPatch
import java.io.File

@Suppress("unused")
val blockTrackingHostsPatch = bytecodePatch(
    name = "Block tracking hosts",
    description = "Redirects known tracking, analytics, and ad host literals to 0.0.0.0 using a " +
        "built-in blocklist, optionally extended with your own hosts file. Only affects hosts that " +
        "appear as literal strings in the app; telemetry sent through Google Play Services is not " +
        "affected.",
    default = false,
) {
    val isWildcardOption by booleanOption(
        key = "isWildcard",
        default = true,
        title = "Wildcard blocking",
        description = "When enabled, an entry like \"example.com\" also blocks subdomains such as " +
            "\"www.example.com\".",
    )

    val userHostsFileOption by stringOption(
        key = "userHostsFile",
        default = null,
        title = "Additional hosts file",
        description = "Optional absolute path to a hosts/blocklist file (hosts-file lines, bare " +
            "domains, or URLs; one per line, \"#\" comments allowed). Its entries are added to the " +
            "built-in blocklist. Leave empty to use the built-in list only.",
        required = false,
    ) { true }

    dependsOn(
        baseHostsBlockerPatch {
            val combinedHosts = buildString {
                append(UNIVERSAL_TRACKING_HOSTS)

                userHostsFileOption
                    ?.trim()
                    ?.takeIf { it.isNotEmpty() }
                    ?.let { path ->
                        val file = File(path)
                        require(file.isFile) { "Additional hosts file not found: $path" }
                        append('\n').append(file.readText())
                    }
            }

            HostsBlockerConfig(
                hostsBlocker = HostsBlocker.fromString(combinedHosts),
                redirectionIp = DEFAULT_REDIRECTION_IP,
                wildcard = isWildcardOption != false,
            )
        },
    )
}
