package app.template.patches.mydialog.security

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.ensureRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/**
 * Routes every React-Native network request through an explicit HTTP proxy at
 * 127.0.0.1:8080 on the device, which `adb reverse tcp:8080 tcp:8080` tunnels to
 * a mitmproxy instance on the host. Combined with "Disable SSL pinning" (which
 * trusts user/system-added CAs) this gives full plaintext visibility of the app's
 * API traffic without touching system proxy settings.
 *
 * OFF by default — it breaks networking unless the tunnel is up. Enable for
 * diagnosis: `mydbuild` does this when MYD_INSPECT=1.
 *
 * The app bundles an obfuscated OkHttp, so the Builder calls use its renamed
 * methods: `g0(Proxy)` sets the proxy, `f()` builds. The patched entry point is
 * `OkHttpClientProvider.a()` — the single factory behind every RN fetch/XHR
 * (the app never sets a custom OkHttpClientFactory).
 */
@Suppress("unused")
val myDialogInspectTrafficPatch = bytecodePatch(
    name = "Inspect HTTPS traffic (adb reverse proxy)",
    description = "Routes RN network traffic through 127.0.0.1:8080 on the device " +
        "(adb reverse tunnel to mitmproxy). Off by default; needs the tunnel and " +
        "a trusted CA.",
    default = false,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    val proxyHost by stringOption(key = "Proxy host", default = "127.0.0.1")
    val proxyPort by stringOption(key = "Proxy port", default = "8080")

    execute {
        // FINAL CHOKEPOINT: the app bundles obfuscated OkHttp; EVERY client
        // (RN networking, createSecureClient, uploaders, anything else) funnels
        // through OkHttpClient$Builder.f() (the obfuscated build()). Rename the
        // original to f$nopx and add a wrapper that forces the proxy onto the
        // builder before building. This catches clients we have not identified.
        val builderCls = mutableClassDefBy("Lokhttp3/OkHttpClient\$Builder;")
        val buildMethod = builderCls.methods.firstOrNull {
            it.name == "f" && it.returnType == "Lokhttp3/OkHttpClient;" && it.parameterTypes.isEmpty()
        } ?: throw IllegalStateException("OkHttpClient\$Builder.f() (obfuscated build) not found")
        if (builderCls.methods.none { it.name == "f\$nopx" }) {
            buildMethod.name = "f\$nopx"

            val wrapper = ImmutableMethod(
                builderCls.type,
                "f",
                emptyList(),
                "Lokhttp3/OkHttpClient;",
                buildMethod.accessFlags and AccessFlags.PRIVATE.value.inv(),
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(12, emptyList(), emptyList(), emptyList()),
            ).toMutable()

            wrapper.addInstructions(
                0,
                """
                new-instance v0, Ljava/net/Proxy;
                sget-object v1, Ljava/net/Proxy${'$'}Type;->HTTP:Ljava/net/Proxy${'$'}Type;
                new-instance v2, Ljava/net/InetSocketAddress;
                const-string v3, "$proxyHost"
                const v4, $proxyPort
                invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V
                invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy${'$'}Type;Ljava/net/SocketAddress;)V
                invoke-virtual {p0, v0}, Lokhttp3/OkHttpClient${'$'}Builder;->g0(Ljava/net/Proxy;)Lokhttp3/OkHttpClient${'$'}Builder;
                invoke-virtual {p0}, Lokhttp3/OkHttpClient${'$'}Builder;->f${'$'}nopx()Lokhttp3/OkHttpClient;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
            builderCls.methods.add(wrapper)
        }

        // The app's OWN API client (used by the ajaxCall bridge for every backend
        // request, e.g. getDeviceStatusOnboarding): CustomCertificatePinner
        // .createSecureClient() and its fallback b(). Wrap them via
        // rename-original + add-wrapper so the returned OkHttpClient is forced
        // through the inspection proxy.
        val ccp = mutableClassDefBy("Lnet/omobio/dialogsc/security/CustomCertificatePinner;")
        for (m in listOf("createSecureClient", "b")) {
            val orig = ccp.methods.firstOrNull {
                it.name == m && it.returnType == "Lokhttp3/OkHttpClient;" && it.parameterTypes.isEmpty()
            } ?: continue
            val renamed = "${m}\$noproxy"
            if (ccp.methods.any { it.name == renamed }) continue
            orig.name = renamed

            val wrapper = ImmutableMethod(
                ccp.type,
                m,
                emptyList(),
                "Lokhttp3/OkHttpClient;",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
            ).toMutable()

            wrapper.addInstructions(
                0,
                """
                invoke-static {}, Lnet/omobio/dialogsc/security/CustomCertificatePinner;->$renamed()Lokhttp3/OkHttpClient;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/OkHttpClient;->Z()Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
                new-instance v1, Ljava/net/Proxy;
                sget-object v2, Ljava/net/Proxy${'$'}Type;->HTTP:Ljava/net/Proxy${'$'}Type;
                new-instance v3, Ljava/net/InetSocketAddress;
                const-string v4, "$proxyHost"
                const/16 v5, $proxyPort
                invoke-direct {v3, v4, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V
                invoke-direct {v1, v2, v3}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy${'$'}Type;Ljava/net/SocketAddress;)V
                invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient${'$'}Builder;->g0(Ljava/net/Proxy;)Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/OkHttpClient${'$'}Builder;->f()Lokhttp3/OkHttpClient;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
            ccp.methods.add(wrapper)
        }

        // React-Native's networking clients (fetch/XHR): both factory methods.
        val fingerprints = listOf(
            Fingerprint(
                definingClass = "Lcom/facebook/react/modules/network/OkHttpClientProvider;",
                name = "a",
                returnType = "Lokhttp3/OkHttpClient;",
            ),
            Fingerprint(
                definingClass = "Lcom/facebook/react/modules/network/OkHttpClientProvider;",
                name = "b",
                returnType = "Lokhttp3/OkHttpClient;",
                parameters = listOf("Landroid/content/Context;"),
            ),
        )
        for (f in fingerprints) {
            val m = f.method
            m.clearBody()
            m.ensureRegisters(8)
            m.addInstructions(
                0,
                """
                invoke-static {}, Lcom/facebook/react/modules/network/OkHttpClientProvider;->c()Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
                new-instance v1, Ljava/net/Proxy;
                sget-object v2, Ljava/net/Proxy${'$'}Type;->HTTP:Ljava/net/Proxy${'$'}Type;
                new-instance v3, Ljava/net/InetSocketAddress;
                const-string v4, "$proxyHost"
                const/16 v5, $proxyPort
                invoke-direct {v3, v4, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V
                invoke-direct {v1, v2, v3}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy${'$'}Type;Ljava/net/SocketAddress;)V
                invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient${'$'}Builder;->g0(Ljava/net/Proxy;)Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
                invoke-virtual {v0}, Lokhttp3/OkHttpClient${'$'}Builder;->f()Lokhttp3/OkHttpClient;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }
    }
}
