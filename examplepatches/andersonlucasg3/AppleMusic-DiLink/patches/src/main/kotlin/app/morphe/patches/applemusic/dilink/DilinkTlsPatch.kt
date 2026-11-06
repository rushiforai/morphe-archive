package app.morphe.patches.applemusic.dilink

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK

private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

/**
 * Apple Music 7.0.0 references res/raw/apple_ca.pem (Apple Root CA - G3 + intermediate) from its
 * own network security config, but the DiLink 3.0 system CA store does not contain that root:
 * gsd.apple.com fails with ERR_CERT_AUTHORITY_INVALID before the sign-in page even loads.
 *
 * The test APK proved that trusting the CA **from inside the APK** fixes the TLS handshake
 * (HTTP 200 from https://gsd.apple.com/auth/container/signin), with no certificate installed on
 * the head unit. This patch replaces the config with the narrowest version: the base config keeps
 * the system store, and only gsd.apple.com (the domain that presents the Apple chain) also trusts
 * @raw/apple_ca. Everything else, including appleid.cdn-apple.com's public chain, is unchanged.
 */
@Suppress("unused")
internal val dilinkTlsPatch = resourcePatch(
    name = "DiLink: TLS trust",
    description = "Trusts the bundled Apple Root CA (res/raw/apple_ca) for gsd.apple.com only, " +
        "inside the APK, so the Apple sign-in page loads on a head unit whose system CA store " +
        "lacks that root. Nothing is installed on the device.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)

    execute {
        get(NETWORK_SECURITY_CONFIG, copy = false).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <network-security-config>
                <base-config cleartextTrafficPermitted="false">
                    <trust-anchors>
                        <certificates src="system" />
                    </trust-anchors>
                </base-config>
                <domain-config>
                    <domain includeSubdomains="true">gsd.apple.com</domain>
                    <trust-anchors>
                        <certificates src="system" />
                        <certificates src="@raw/apple_ca" />
                    </trust-anchors>
                </domain-config>
            </network-security-config>
            """.trimIndent(),
        )
    }
}
