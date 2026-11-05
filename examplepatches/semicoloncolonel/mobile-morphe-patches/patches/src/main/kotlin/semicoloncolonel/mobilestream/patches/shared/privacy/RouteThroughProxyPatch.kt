package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants as WhiteHouse

// Sends the app's traffic through a proxy chosen in the patch option, for
// example Orbot's local SOCKS proxy to use Tor. ProxyRouter replaces the
// default ProxySelector when the app starts, which both OkHttp and
// HttpURLConnection ask. Connections fail if the proxy is down, instead of
// going out directly. WebViews do not use the ProxySelector.

private const val PROXY_ROUTER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/ProxyRouter;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

@Suppress("unused")
val routeThroughProxyPatch = bytecodePatch(
    name = "Route traffic through a proxy",
    description = "Sends the app's network traffic through a proxy you choose, such as Orbot.",
    default = false,
) {
    compatibleWith(WhiteHouse.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val proxy by stringOption(
        key = "proxy",
        default = "socks5://127.0.0.1:9050",
        values = mapOf(
            "Orbot (Tor), SOCKS" to "socks5://127.0.0.1:9050",
            "Orbot (Tor), HTTP" to "http://127.0.0.1:8118",
        ),
        title = "Proxy",
        description = "The proxy address, as socks5://host:port or http://host:port.",
        required = true,
    )

    execute {
        val spec = proxy?.trim().orEmpty()
        if (!Regex("^(socks5?|https?)://[^\\s:/]+:\\d{1,5}/?$").matches(spec)) {
            throw PatchException("Proxy must look like socks5://host:port or http://host:port")
        }

        forEachMatchingMethod(
            { it.type == PROXY_ROUTER },
            { it.name == "proxySpec" },
        ) { it.addInstructions(0, "const-string v0, \"${spec.smaliEscaped()}\"\nreturn-object v0") }

        // Every Application subclass's onCreate starts the router first. It
        // runs once even when one Application class extends another.
        val hooked = forEachMatchingMethod(
            { it.superclass == "Landroid/app/Application;" && !it.type.startsWith(EXTENSION_PACKAGE) },
            { it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" },
        ) { it.addInstructions(0, "invoke-static {}, $PROXY_ROUTER->install()V") }
        if (hooked == 0) throw PatchException("No Application.onCreate found")
    }
}
