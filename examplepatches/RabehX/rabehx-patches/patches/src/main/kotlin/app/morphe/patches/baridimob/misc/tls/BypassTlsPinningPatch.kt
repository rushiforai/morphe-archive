/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.tls

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.baridimob.shared.BaridimobConstants
import app.morphe.patches.shared.dom.adoptChild
import app.morphe.patches.shared.dom.childElementsSequence
import app.morphe.patches.shared.dom.getNode
import app.morphe.patches.shared.dom.trimIndentMultiline
import org.w3c.dom.Element
import java.io.File

/**
 * Resource half: network_security_config trusts user CAs (with overridePins).
 *
 * Private on purpose: it is applied through [bypassTlsPinningPatch]'s
 * dependsOn and must not appear as a separate entry in the patch list.
 */
@Suppress("unused")
private val bypassTlsPinningResourcePatch = resourcePatch {
    execute {
        val resXmlDirectory = get("res/xml")
        var networkSecurityFileName = "network_security_config.xml"

        document("AndroidManifest.xml").use { document ->
            val applicationNode = document.getElementsByTagName("application").item(0) as Element

            if (applicationNode.hasAttribute("android:networkSecurityConfig")) {
                networkSecurityFileName =
                    applicationNode.getAttribute("android:networkSecurityConfig")
                        .split("/")[1] + ".xml"
            } else {
                document.createAttribute("android:networkSecurityConfig")
                    .apply { value = "@xml/network_security_config" }
                    .let(applicationNode.attributes::setNamedItem)
            }
        }

        if (resXmlDirectory.resolve(networkSecurityFileName).exists()) {
            document("res/xml/$networkSecurityFileName").use { document ->
                arrayOf(
                    "base-config",
                    "debug-overrides",
                ).forEach { tagName ->
                    val configElement = document.getNode(tagName) as? Element ?: tagName.let {
                        document.getNode("network-security-config")?.adoptChild(tagName) {
                            if (tagName == "base-config") {
                                setAttribute("cleartextTrafficPermitted", "true")
                            }
                        }
                        document.getNode(tagName) as Element
                    }
                    val trustAnchors = configElement.childElementsSequence()
                        .firstOrNull { it.tagName == "trust-anchors" }
                        ?: configElement.adoptChild("trust-anchors")

                    val userCertificates = trustAnchors.childElementsSequence()
                        .firstOrNull {
                            it.tagName == "certificates" &&
                                it.getAttribute("src") == "user"
                        }
                        ?: trustAnchors.adoptChild("certificates") {
                            setAttribute("src", "user")
                        }

                    userCertificates.setAttribute("overridePins", "true")
                }
            }
        } else {
            File(resXmlDirectory, networkSecurityFileName).apply {
                writeText(
                    """
                    <?xml version="1.0" encoding="utf-8"?>
                    <network-security-config>
                        <base-config cleartextTrafficPermitted="true">
                            <trust-anchors>
                                <certificates src="system" />
                                <certificates
                                    src="user"
                                    overridePins="true" />
                            </trust-anchors>
                        </base-config>
                        <debug-overrides>
                            <trust-anchors>
                                <certificates src="system" />
                                <certificates
                                    src="user"
                                    overridePins="true" />
                            </trust-anchors>
                        </debug-overrides>
                    </network-security-config>
                    """.trimIndentMultiline(),
                )
            }
        }
    }
}

/**
 * Bytecode half: ACLTrustManager.checkServerTrusted is the central trust
 * boundary used by both the native SDK and the WebView SSL-error handler.
 * Returning directly is intentional: delegating to clientTrustDelegate would
 * still reject a user-installed interception certificate.
 */
@Suppress("unused")
val bypassTlsPinningBytecodePatch = bytecodePatch(
    name = "Bypass certificate checks",
    description = "Bypasses certificate pinning so intercepted TLS connections are accepted.",
    default = true,
) {
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)
    dependsOn(bypassTlsPinningResourcePatch)

    execute {
        val aclTrustManagerFingerprint = object : Fingerprint(
            definingClass = "Lru/bpc/mobilebanksdk/net/impl/ACLTrustManager;",
            name = "checkServerTrusted",
            returnType = "V",
            parameters = listOf(
                "[Ljava/security/cert/X509Certificate;",
                "Ljava/lang/String;",
            ),
        ) {}

        runCatching { aclTrustManagerFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    return-void
                """,
            )
        }
    }
}
