package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants as WhiteHouse
import semicoloncolonel.mobilestream.patches.npr.shared.Constants as Npr
import semicoloncolonel.mobilestream.patches.apnews.shared.Constants as ApNews
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants as NewsBreak
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants as TruthSocial

// Sends the app's traffic through a proxy chosen in the patch option, for
// example Orbot's local SOCKS proxy to use Tor, or a SOCKS5 server from a
// VPN service with its username and password. ProxyRouter replaces the
// default ProxySelector when the app starts, which both OkHttp and
// HttpURLConnection ask. Connections fail if the proxy is down, instead of
// going out directly. WebViews do not use the ProxySelector.

private const val PROXY_ROUTER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/ProxyRouter;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

@Suppress("unused")
val routeThroughProxyPatch = bytecodePatch(
    name = "Route traffic through a proxy",
    description = "Sends the app's network traffic through a proxy you choose, such as Orbot or a VPN service's SOCKS5 server.",
    default = false,
) {
    compatibleWith(
        WhiteHouse.COMPATIBILITY,
        Npr.COMPATIBILITY,
        ApNews.COMPATIBILITY,
        NewsBreak.COMPATIBILITY,
        TruthSocial.COMPATIBILITY,
    )

    extendWith("extensions/extension.mpe")

    val proxy by stringOption(
        key = "proxy",
        default = "socks5://127.0.0.1:9050",
        values = mapOf(
            "Orbot (Tor), SOCKS" to "socks5://127.0.0.1:9050",
            "Orbot (Tor), HTTP" to "http://127.0.0.1:8118",
        ),
        title = "Proxy",
        description = "The proxy address, as socks5://host:port or http://host:port. A SOCKS5 proxy that needs a login is written socks5://user:password@host:port; the login is stored in the patched app.",
        required = true,
    )

    execute {
        val spec = proxy?.trim().orEmpty()
        val plain = Regex("^(socks5?|https?)://[^\\s:/@]+:\\d{1,5}/?$")
        val withLogin = Regex("^socks5?://[^\\s:/@]+:[^\\s@]*@[^\\s:/@]+:\\d{1,5}/?$")
        if (!plain.matches(spec) && !withLogin.matches(spec)) {
            throw PatchException(
                "Proxy must look like socks5://host:port, socks5://user:password@host:port, or http://host:port",
            )
        }

        forEachMatchingMethod(
            { it.type == PROXY_ROUTER },
            { it.name == "proxySpec" },
        ) { it.addInstructions(0, "const-string v0, \"${spec.smaliEscaped()}\"\nreturn-object v0") }

        // The router starts in the Application constructor, right after its
        // super() call. Android creates content providers before
        // Application.onCreate, and an OkHttp client built there would keep
        // the original ProxySelector. onCreate also starts it, as a fallback.
        // It runs once even when one Application class extends another.
        forEachMatchingMethod(
            { it.superclass == "Landroid/app/Application;" && !it.type.startsWith(EXTENSION_PACKAGE) },
            { it.name == "<init>" && it.implementation != null },
        ) { method ->
            val superCall = method.implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "<init>"
            }
            if (superCall != -1) {
                method.addInstruction(superCall + 1, "invoke-static {}, $PROXY_ROUTER->install()V")
            }
        }

        val hooked = forEachMatchingMethod(
            { it.superclass == "Landroid/app/Application;" && !it.type.startsWith(EXTENSION_PACKAGE) },
            { it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" },
        ) { it.addInstructions(0, "invoke-static {}, $PROXY_ROUTER->install()V") }
        if (hooked == 0) throw PatchException("No Application.onCreate found")
    }
}
