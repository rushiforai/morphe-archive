package app.proxypatches.patches.reddit.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.proxypatches.patches.shared.Constants.COMPATIBILITY_REDDIT
import org.w3c.dom.Element

private const val EXTENSION_PACKAGE = "app.proxypatches.extension"
private const val EXTENSION_FORWARDER = "Lapp/proxypatches/extension/ProxyForwarder;"
private const val EXTENSION_CONFIG = "Lapp/proxypatches/extension/ProxyConfig;"
private const val SETTINGS_ACTIVITY = "$EXTENSION_PACKAGE.ProxySettingsActivity"

/** Hostname, IPv4 or bracket-less IPv6. */
private val HOST_REGEX = Regex("^[A-Za-z0-9.:\\-]{1,253}$")

/** Escapes a value for a smali string literal. */
private fun smaliString(s: String) = buildString {
    for (c in s) when {
        c == '\\' -> append("\\\\")
        c == '"' -> append("\\\"")
        c.code in 0x20..0x7E -> append(c)
        else -> append("\\u%04x".format(c.code))
    }
}

/** Registers the "Proxy settings" screen in the manifest. */
private val proxySettingsActivityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                if ((activities.item(i) as Element).getAttribute("android:name") == SETTINGS_ACTIVITY) return@execute
            }
            application.appendChild(
                doc.createElement("activity").apply {
                    setAttribute("android:name", SETTINGS_ACTIVITY)
                    setAttribute("android:label", "Proxy settings")
                    setAttribute("android:exported", "false")
                    setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                    // Its own task, so opening it from the launcher shortcut doesn't disturb the app.
                    setAttribute("android:taskAffinity", "$EXTENSION_PACKAGE.settings")
                    setAttribute("android:windowSoftInputMode", "adjustResize")
                },
            )
        }
    }
}

@Suppress("unused")
val proxyPatch = bytecodePatch(
    name = "Proxy",
    description = "Routes all of the app's traffic through your HTTP, HTTPS or SOCKS5 proxy, with optional " +
        "username and password. Change it any time in the app: long-press the app icon → Proxy " +
        "settings. Nothing goes direct, even if the proxy is down, unless you turn on \"Run without proxy\" there.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(proxySettingsActivityPatch)

    extendWith("extensions/proxy.mpe")

    val proxyHost by stringOption(
        key = "proxyHost",
        default = "",
        title = "Proxy host (optional)",
        description = "Starting value. Hostname or IP address of the proxy, for example proxy.example.com. " +
            "You can also leave this empty and set it in the app (long-press the app icon → Proxy settings). " +
            "Until a proxy is set, the app has no internet.",
    ) { it.isNullOrBlank() || HOST_REGEX.matches(it.trim()) }

    val proxyPort by intOption(
        key = "proxyPort",
        default = 443,
        title = "Proxy port",
        description = "Starting value. For example 443 for an HTTPS proxy, 8080 for a plain HTTP proxy, " +
            "or 1080 for SOCKS5.",
    ) { it == null || it in 1..65535 }

    val proxyType by stringOption(
        key = "proxyType",
        default = "https",
        values = mapOf(
            "HTTPS (encrypted connection to the proxy)" to "https",
            "HTTP" to "http",
            "SOCKS5" to "socks5",
        ),
        title = "Proxy type",
        description = "Starting value. HTTPS: the connection to the proxy itself is encrypted " +
            "(such as Caddy forward_proxy). HTTP: a plain HTTP proxy. SOCKS5: a SOCKS5 proxy (not encrypted).",
    ) { it == null || it in setOf("https", "http", "socks5") }

    val username by stringOption(
        key = "username",
        default = "",
        title = "Username (optional)",
        description = "Starting value. Leave empty if the proxy has no login. " +
            "Stored in plain text inside the patched app, so don't share the patched APK.",
    )

    val password by stringOption(
        key = "password",
        default = "",
        title = "Password (optional)",
        description = "Starting value. Leave empty if the proxy has no login.",
    )

    execute {
        // ---- 1. Starting values from the patch options ------------------------------------
        val host = proxyHost.orEmpty().trim()
        if (host.isNotEmpty() && !HOST_REGEX.matches(host)) throw PatchException("Invalid proxy host: $host")

        val config = mutableClassDefBy(EXTENSION_CONFIG)
        fun body(name: String, smali: String) =
            config.methods.first { it.name == name }.addInstructions(0, smali)

        body("host", "const-string v0, \"${smaliString(host)}\"\nreturn-object v0")
        body("port", "const v0, ${proxyPort ?: 443}\nreturn v0")
        body("type", "const-string v0, \"${smaliString(proxyType ?: "https")}\"\nreturn-object v0")
        body("username", "const-string v0, \"${smaliString(username.orEmpty())}\"\nreturn-object v0")
        body("password", "const-string v0, \"${smaliString(password.orEmpty())}\"\nreturn-object v0")

        // ---- 2. Start the forwarder before anything else in the app ---------------------------
        ApplicationAttachBaseContextFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_FORWARDER->start(Landroid/content/Context;)V",
        )

        // ---- 3. Cronet: re-read the (Java) proxy properties instead of Android's system proxy --
        CronetProxySettingsChangedFingerprint.method.addInstruction(0, "const/4 p1, 0x0")

        // ---- 4. Cronet: no DNS lookups of its own --------------------------------------------
        mutableClassDefByOrNull("Lorg/chromium/net/DnsOptions\$Builder;")?.methods
            ?.filter {
                it.name in setOf(
                    "useBuiltInDnsResolver",
                    "enableStaleDns",
                    "persistHostCache",
                    "preestablishConnectionsToStaleDnsResults",
                ) && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Z"
            }
            ?.forEach { it.addInstruction(0, "const/4 p1, 0x0") }

        // ---- 5. Play Services Cronet (reCAPTCHA): report unavailable -> app's own Cronet ------
        PlayServicesCronetProviderIsEnabledFingerprint.methodOrNull?.addInstructions(
            0,
            "const/4 v0, 0x0\nreturn v0",
        )
    }
}
