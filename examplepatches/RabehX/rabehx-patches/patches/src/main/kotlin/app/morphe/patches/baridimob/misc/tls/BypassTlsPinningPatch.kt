/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.tls

import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.resourceXmlOrNull
import app.morphe.patches.baridimob.shared.BaridimobConstants
import app.morphe.patches.shared.returnEarlyVoidAll

/** Updates certificate checks and network security config. */
@Suppress("unused")
val bypassTlsPinningPatch = patch(
    name = "Bypass certificate checks",
    description = "Bypasses certificate pinning so intercepted TLS connections are accepted.",
    default = true,
) {
    category("Security")
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)

    execute {
        mutableClassDefByOrNull("Lru/bpc/mobilebanksdk/net/impl/ACLTrustManager;")
            ?.returnEarlyVoidAll { it.name == "checkServerTrusted" }

        // Resolve or register android:networkSecurityConfig via binary XML (no DOM decode).
        var networkSecurityFileName = "network_security_config.xml"

        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.elements("application").first()
            val existing = app.attribute("android:networkSecurityConfig")
            if (existing != null && existing.contains("/")) {
                networkSecurityFileName = existing.substringAfter("/") + ".xml"
            } else {
                app.setAttribute("android:networkSecurityConfig", "@xml/network_security_config")
            }
        }

        val configPath = "res/xml/$networkSecurityFileName"
        val existingXml = resourceXmlOrNull(configPath)
        if (existingXml != null) {
            existingXml.use { xml ->
                val root = xml.root
                listOf("base-config", "debug-overrides").forEach { tagName ->
                    val config = root.children(tagName).firstOrNull() ?: root.appendChild(tagName) {
                        if (tagName == "base-config") {
                            setAttribute("cleartextTrafficPermitted", "true")
                        }
                    }
                    val trustAnchors = config.children("trust-anchors").firstOrNull()
                        ?: config.appendChild("trust-anchors") {}
                    val userCerts = trustAnchors.children("certificates")
                        .firstOrNull { it.attribute("src") == "user" }
                        ?: trustAnchors.appendChild("certificates") {
                            setAttribute("src", "user")
                        }
                    userCerts.setAttribute("overridePins", "true")
                }
            }
        } else {
            resourceFile(configPath, copy = false).apply {
                parentFile?.mkdirs()
                writeText(
                    """
                    <?xml version="1.0" encoding="utf-8"?>
                    <network-security-config>
                        <base-config cleartextTrafficPermitted="true">
                            <trust-anchors>
                                <certificates src="system" />
                                <certificates src="user" overridePins="true" />
                            </trust-anchors>
                        </base-config>
                        <debug-overrides>
                            <trust-anchors>
                                <certificates src="system" />
                                <certificates src="user" overridePins="true" />
                            </trust-anchors>
                        </debug-overrides>
                    </network-security-config>
                    """.trimIndent(),
                )
            }
        }
    }
}
