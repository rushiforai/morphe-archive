package app.template.patches.hutch.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.hutch.SslPinningClientBuilder
import app.template.patches.shared.Constants.HUTCH_COMPATIBILITY
import app.template.patches.shared.clearBody
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"
private const val NSC_PATH = "res/xml/network_security_config.xml"

/**
 * Hutch ships the **react-native-ssl-pinning** module. Its `RNSslPinning.fetch`
 * builds a hardened OkHttp client through `B7.a.e(...)`, which pins in one of two
 * modes (chosen by the JS `sslPinning` options):
 *
 *  - `pkPinning=true` → public-key pinning via an OkHttp `CertificatePinner`
 *    (`B7.a.h` → `okhttp3.C2879g`), or
 *  - otherwise → a cert-bundle `X509TrustManager` built from the bundled
 *    `assets/<name>.cer` files (`B7.a.i`).
 *
 * Both reject any certificate the app didn't bake in, so a MITM proxy fails the
 * handshake even when the platform trusts the proxy CA.
 *
 * The module's own `disableAllSecurity` path calls `B7.a.c(...)`, which builds
 * the *same* client **without** any pinning. This patch rewrites the pinned
 * builder to delegate to that one, so every `RNSslPinning.fetch` call is
 * unpinned — normal system TLS validation is untouched.
 *
 * The app declares no `network-security-config` pin-set of its own (checked: no
 * `pin-set` in resources), but it targets SDK 35, where **user-installed CAs are
 * not trusted**. To make traffic actually inspectable with a proxy, this patch
 * also adds a `network-security-config` that trusts the system + user stores and
 * points the manifest at it.
 */
private val hutchNetworkSecurityConfigPatch = resourcePatch {
    execute {
        this["res/xml", true].resolve("network_security_config.xml").writeText(
            """
                <?xml version="1.0" encoding="utf-8"?>
                <network-security-config>
                    <base-config cleartextTrafficPermitted="false">
                        <trust-anchors>
                            <certificates src="system" />
                            <certificates src="user" />
                        </trust-anchors>
                    </base-config>
                </network-security-config>
            """.trimIndent(),
        )

        document(MANIFEST).use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:networkSecurityConfig", "@xml/network_security_config")
        }
    }
}

@Suppress("unused")
val hutchDisableSslPinningPatch = bytecodePatch(
    name = "Disable SSL pinning",
    description = "Unpins the react-native-ssl-pinning OkHttp client so HTTPS " +
        "traffic can be intercepted, and trusts user-installed CAs (targetSdk 35). " +
        "Normal TLS validation stays intact.",
    default = true,
) {
    category("Security")
    compatibleWith(HUTCH_COMPATIBILITY)

    dependsOn(hutchNetworkSecurityConfigPatch)

    execute {
        // B7.a.e(pinned builder) → B7.a.c(unpinned builder), same (client, domain, options).
        SslPinningClientBuilder.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    invoke-static {p0, p1, p3}, LB7/a;->c(Lokhttp3/n;Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)Lokhttp3/z;
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )
        }
    }
}
