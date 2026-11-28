package me.toidicakhia.patches.locket

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element

private const val ANDROID_MANIFEST = "AndroidManifest.xml"
private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

/**
 * Locket has no network security config at all. Create one that trusts
 * user-installed CAs (with overridePins) and point the manifest at it.
 */
internal fun ResourcePatchContext.trustUserCertificates() {
    document(ANDROID_MANIFEST).use { manifest ->
        val application = manifest.getElementsByTagName("application").item(0) as? Element
            ?: throw PatchException("$ANDROID_MANIFEST has no application element")
        application.setAttribute("android:networkSecurityConfig", "@xml/network_security_config")
    }

    get(NETWORK_SECURITY_CONFIG).writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <network-security-config>
            <base-config cleartextTrafficPermitted="false">
                <trust-anchors>
                    <certificates src="system" />
                    <certificates src="user" overridePins="true" />
                </trust-anchors>
            </base-config>
        </network-security-config>
        """.trimIndent() + "\n"
    )
}
