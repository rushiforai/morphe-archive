package io.github.kirby1997.patches.mitm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Universal "enable MITM proxying" patches. Neither declares compatibleWith — both
// apply to any app so an intercepting proxy (Burp/mitmproxy/Charles) can read the
// app's own TLS traffic on an UNROOTED device. Split into two independently
// selectable patches:
//
//   1. "Allow user certificates" (resource) — the half that actually unlocks most
//      apps. Apps targeting API >= 24 ignore user-installed CAs unless their
//      networkSecurityConfig opts in, so a proxy CA installed via Settings is not
//      trusted and TLS fails. This injects a config that trusts system + user CAs
//      (and permits cleartext), so the proxy's CA is honoured. No root needed.
//
//   2. "Bypass certificate pinning" (bytecode) — bolt-on for apps that additionally
//      PIN. Neutralises OkHttp's CertificatePinner.check* so pinned hosts stop
//      rejecting the proxy cert. Covers the common Java/OkHttp case only.
//
// SCOPE / LIMITS:
//   - Only exposes traffic the app itself sends; it is a research aid for the
//     device owner inspecting their OWN app + account, not an attack on third
//     parties or servers.
//   - The pinning bypass matches Lokhttp3/CertificatePinner; by class+signature.
//     It will NOT catch pinning that is (a) native/NDK (Flutter, BoringSSL), or
//     (b) in an OkHttp shaded/renamed to a non-`okhttp3` package by R8. Those
//     still need Frida/LSPosed (root).
//   - Resource patches recompile resources via aapt2. On some React Native / Expo
//     manifests the recompile can be fragile — verify the app still boots after
//     patching; fall back to APKEditor if a specific RN app breaks.

// ---------------------------------------------------------------------------
// 1. Allow user certificates (resource / manifest)
// ---------------------------------------------------------------------------

private const val NETWORK_SECURITY_CONFIG =
    """<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system" />
            <certificates src="user" />
        </trust-anchors>
    </base-config>
</network-security-config>
"""

@Suppress("unused")
val enableUserCertTrustPatch = resourcePatch(
    name = "Allow user certificates (MITM)",
    description = "Makes the app trust user-installed CA certificates so an intercepting proxy " +
        "(Burp/mitmproxy) can read its HTTPS traffic on an unrooted device. Overwrites any existing " +
        "network security config to trust system + user CAs and permit cleartext. For inspecting your " +
        "own app/account traffic; does not defeat certificate pinning (see the pinning-bypass patch).",
) {
    // Optional: also flip android:debuggable so `adb run-as` can read app-private
    // storage. Off by default — some apps refuse to run / detect debuggable builds.
    val makeDebuggable by booleanOption(
        key = "makeDebuggable",
        default = false,
        description = "Also set android:debuggable=\"true\" (enables adb run-as disk access). " +
            "Leave off unless you need it — some apps detect debuggable builds.",
        required = false,
    )

    execute {
        // Drop the network-security config resource.
        val configFile = get("res/xml/network_security_config.xml")
        configFile.parentFile?.mkdirs()
        configFile.writeText(NETWORK_SECURITY_CONFIG)

        // Point <application> at it + permit cleartext (+ optionally debuggable).
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.setAttribute(
                "android:networkSecurityConfig",
                "@xml/network_security_config",
            )
            application.setAttribute("android:usesCleartextTraffic", "true")
            if (makeDebuggable == true) {
                application.setAttribute("android:debuggable", "true")
            }
        }
    }
}

// ---------------------------------------------------------------------------
// 2. Bypass certificate pinning (bytecode / OkHttp)
// ---------------------------------------------------------------------------

// OkHttp 3.x / 4.x public entry: check(hostname, List<Certificate>).
object CertificatePinnerCheckListFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
)

// Legacy varargs entry: check(hostname, Certificate...).
object CertificatePinnerCheckVarargsFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "[Ljava/security/cert/Certificate;"),
)

// OkHttp 4.x internal entry: check$okhttp(hostname, () -> List<Certificate>).
object CertificatePinnerCheckOkhttpFingerprint : Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check\$okhttp",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;"),
)

@Suppress("unused")
val bypassCertificatePinningPatch = bytecodePatch(
    name = "Bypass certificate pinning",
    description = "No-ops OkHttp's CertificatePinner so pinned hosts accept an intercepting proxy's " +
        "certificate. Covers the common Java/OkHttp case (class Lokhttp3/CertificatePinner;). Does not " +
        "defeat native/NDK pinning (Flutter, BoringSSL) or OkHttp shaded to a non-okhttp3 package.",
) {
    // Each overload is guarded so the patch applies to whatever OkHttp version an
    // app ships (any subset present), and silently no-ops when okhttp3 is absent.
    execute {
        runCatching { CertificatePinnerCheckListFingerprint.method.addInstructions(0, "return-void") }
        runCatching { CertificatePinnerCheckVarargsFingerprint.method.addInstructions(0, "return-void") }
        runCatching { CertificatePinnerCheckOkhttpFingerprint.method.addInstructions(0, "return-void") }
    }
}
