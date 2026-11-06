package app.yaziopatches.patches.trustusercerts

import app.morphe.patcher.patch.resourcePatch
import app.yaziopatches.patches.shared.Constants
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

private fun Element.childElements(name: String): List<Element> =
    (0 until childNodes.length)
        .map { childNodes.item(it) }
        .filter { it.nodeType == Node.ELEMENT_NODE && (it as Element).tagName == name }
        .map { it as Element }

/**
 * Ergänzt die Network-Security-Config der App um die Vertrauensanker
 * `system` und `user`.
 *
 * Android vertraut ab Werk nur System-CAs. Ohne diese Änderung lehnt die App
 * jede TLS-Verbindung ab, deren Zertifikat von einer benutzerinstallierten CA
 * (z. B. mitmproxy) ausgestellt wurde. Die Änderung ist rein deklarativ: sie
 * lockert ausschließlich die Zertifikatsprüfung, der App-Code bleibt unberührt.
 */
@Suppress("unused")
val trustUserCertificatesPatch = resourcePatch(
    name = "Trust user certificates",
    description = "Akzeptiert benutzerinstallierte CA-Zertifikate. Nötig, um den " +
        "API-Verkehr der App mit einem Proxy (mitmproxy) mitzuschneiden.",
    default = false,
) {
    compatibleWith(Constants.YAZIO)

    execute {
        document(NETWORK_SECURITY_CONFIG).use { doc ->
            val root = doc.documentElement

            val baseConfig = root.childElements("base-config").firstOrNull()
                ?: doc.createElement("base-config").also { root.insertBefore(it, root.firstChild) }

            val trustAnchors = baseConfig.childElements("trust-anchors").firstOrNull()
                ?: doc.createElement("trust-anchors").also { baseConfig.appendChild(it) }

            val existingSources = trustAnchors.childElements("certificates")
                .map { it.getAttribute("src") }

            // Die System-CAs müssen erhalten bleiben, sonst vertraut die App
            // nur noch der Proxy-CA und echte Verbindungen brechen.
            for (source in listOf("system", "user")) {
                if (source !in existingSources) {
                    trustAnchors.appendChild(
                        doc.createElement("certificates").apply { setAttribute("src", source) },
                    )
                }
            }
        }
    }
}
