package app.olaelectric.patches.routing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.olaelectric.patches.shared.Constants.COMPATIBILITY_OLA
import app.olaelectric.patches.shared.HttpUrlBuilderFingerprint

@Suppress("unused")
val rerouteApiPatch = bytecodePatch(
    name = "Reroute API Calls to Self-Hosted Server",
    description = "Redirects API requests from Ola servers to your custom backend.",
    default = false
) {
    compatibleWith(COMPATIBILITY_OLA)

    val targetHost = stringOption(
        key = "targetHost",
        default = "192.168.1.20",
        title = "Self-Hosted Server Host / IP",
        description = "IP address or domain of your self-hosted backend (e.g. 192.168.1.20 or myola.local)",
        required = true
    )

    val targetPort = stringOption(
        key = "targetPort",
        default = "80",
        title = "Self-Hosted Server Port",
        description = "Port number of the self-hosted backend (e.g. 80, 443, 8080)",
        required = true
    )

    val targetScheme = stringOption(
        key = "targetScheme",
        default = "http",
        title = "Target Protocol Scheme",
        description = "Protocol scheme to use for rerouted calls ('http' or 'https')",
        required = true
    )

    val routeKong = booleanOption(
        key = "routeKong",
        default = true,
        title = "Reroute kong2.olaelectric.com",
        description = "Reroute vehicle telemetry, scooter controls, and core APIs"
    )

    val routeApps2 = booleanOption(
        key = "routeApps2",
        default = false,
        title = "Reroute apps2.olacabs.com",
        description = "Reroute authentication, token exchange, and account APIs"
    )

    execute {
        val host = targetHost.value ?: "192.168.1.20"
        val port = (targetPort.value ?: "80").toIntOrNull() ?: 80
        val scheme = targetScheme.value ?: "http"
        val doKong = routeKong.value ?: false
        val doApps2 = routeApps2.value ?: false

        val instructions = buildString {
            appendLine("iget-object v0, p0, Lokhttp3/h\$a;->d:Ljava/lang/String;")
            appendLine("if-eqz v0, :cond_reroute_done")

            if (doKong) {
                appendLine("const-string v1, \"kong2.olaelectric.com\"")
                appendLine("invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z")
                appendLine("move-result v1")
                appendLine("if-eqz v1, :cond_check_apps2")
                appendLine("const-string v1, \"$host\"")
                appendLine("iput-object v1, p0, Lokhttp3/h\$a;->d:Ljava/lang/String;")
                appendLine("const-string v1, \"$scheme\"")
                appendLine("iput-object v1, p0, Lokhttp3/h\$a;->a:Ljava/lang/String;")
                appendLine("const v1, $port")
                appendLine("iput v1, p0, Lokhttp3/h\$a;->e:I")
                appendLine("const-string v1, \"OlaReroute\"")
                appendLine("const-string v2, \"Rerouted kong2.olaelectric.com -> $scheme://$host:$port\"")
                appendLine("invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I")
                appendLine("goto :cond_reroute_done")
            }

            appendLine(":cond_check_apps2")
            if (doApps2) {
                appendLine("const-string v1, \"apps2.olacabs.com\"")
                appendLine("invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z")
                appendLine("move-result v1")
                appendLine("if-eqz v1, :cond_reroute_done")
                appendLine("const-string v1, \"$host\"")
                appendLine("iput-object v1, p0, Lokhttp3/h\$a;->d:Ljava/lang/String;")
                appendLine("const-string v1, \"$scheme\"")
                appendLine("iput-object v1, p0, Lokhttp3/h\$a;->a:Ljava/lang/String;")
                appendLine("const v1, $port")
                appendLine("iput v1, p0, Lokhttp3/h\$a;->e:I")
                appendLine("const-string v1, \"OlaReroute\"")
                appendLine("const-string v2, \"Rerouted apps2.olacabs.com -> $scheme://$host:$port\"")
                appendLine("invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I")
            }

            appendLine(":cond_reroute_done")
            appendLine("nop")
        }

        HttpUrlBuilderFingerprint.method.addInstructionsWithLabels(0, instructions)
    }
}
