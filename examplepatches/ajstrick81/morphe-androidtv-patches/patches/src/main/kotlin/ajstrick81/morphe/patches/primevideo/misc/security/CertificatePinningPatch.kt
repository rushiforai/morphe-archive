package ajstrick81.morphe.patches.primevideo.misc.security

import app.morphe.patcher.patch.resourcePatch
import ajstrick81.morphe.patches.primevideo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Certificate Pinning Override
//
// Prime Video ATV does not ship a network_security_config.xml — this patch
// creates one and references it in AndroidManifest.xml.
//
// What this enables:
//   HTTPS inspection tools (AdGuard Premium) can intercept Prime Video's
//   HTTPS connections when their CA certificate is installed on the device.
//   Without this patch, Android's default TLS stack rejects interception
//   proxies even when a user CA is present, because apps targeting API 24+
//   only trust system CAs by default.
//
// What this creates:
//   res/xml/network_security_config.xml:
//     - Trusts user-installed CA certificates (required for AGP HTTPS filtering)
//     - Removes any hardcoded certificate pin sets
//     - Applies to all domains (base-config)
//
//   AndroidManifest.xml:
//     - Adds android:networkSecurityConfig="@xml/network_security_config"
//       to the <application> tag
//
// Confirmed benefit:
//   AGP blocking api.us-east-1.aiv-delivery.net (SSAI manifest endpoint)
//   consistently suppresses Prime Video pre-roll ads from cold launch.
//   This patch ensures that blocking is reliable across all sessions rather
//   than dependent on whether pinning happens to be enforced per-connection.
//
// Note: This patch is optional and independent of the Skip ads patch.
// It is most useful when running AdGuard Premium alongside the bytecode patch.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val certificatePinningPatch = resourcePatch(
    name = "Override certificate pinning",
    description = "Allows HTTPS traffic inspection tools like AdGuard Premium to intercept app connections. Enables consistent pre-roll suppression when used alongside AdGuard Premium.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        // ─────────────────────────────────────────────────────────────────────
        // Step 1 — Create network_security_config.xml
        //
        // Trusts user-installed CAs and removes any pin-set constraints.
        // This is the standard approach used across the patching community
        // for enabling HTTPS inspection on apps targeting API 24+.
        // ─────────────────────────────────────────────────────────────────────
        get("res/xml/network_security_config.xml").writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="false">
        <trust-anchors>
            <!-- Trust system CA certificates (default) -->
            <certificates src="system" />
            <!-- Trust user-installed CA certificates (required for AGP HTTPS inspection) -->
            <certificates src="user" />
        </trust-anchors>
    </base-config>
</network-security-config>"""
        )

        // ─────────────────────────────────────────────────────────────────────
        // Step 2 — Reference the new config in AndroidManifest.xml
        //
        // Adds android:networkSecurityConfig="@xml/network_security_config"
        // to the <application> tag so Android loads our config at runtime.
        // ─────────────────────────────────────────────────────────────────────
        document("AndroidManifest.xml").use { document ->
            val applicationNode = document
                .getElementsByTagName("application")
                .item(0)

            applicationNode
                .attributes
                .setNamedItem(
                    document.createAttribute("android:networkSecurityConfig").also {
                        it.value = "@xml/network_security_config"
                    }
                )
        }
    }
}
