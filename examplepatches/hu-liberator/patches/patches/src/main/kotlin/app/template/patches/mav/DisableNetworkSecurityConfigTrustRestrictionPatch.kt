package app.template.patches.mav

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import org.w3c.dom.Element

/**
 * Verified against hu.mav.emmapp_merged.apk (res/xml/network_security_config.xml):
 *
 *   <?xml version="1.0" encoding="utf-8"?>
 *   <network-security-config>
 *       <base-config cleartextTrafficPermitted="false" />
 *   </network-security-config>
 *
 * This declares no `<pin-set>` (no SPKI hash pinning at the network-security-config
 * level -- see DisableCertificatePinningPatch.kt for the app's actual code-level
 * OkHttp CertificatePinner), but it also declares no `<trust-anchors>`. Since
 * Android API 24+, an app with no explicit trust-anchors override trusts only
 * *system* CAs, never user-installed ones -- which is exactly what blocks a MITM
 * proxy (Burp, mitmproxy, etc.) for inspection, since those are installed as a
 * user CA. This is a separate mechanism from certificate pinning: pinning checks
 * a specific key/cert hash, while this is just the default trust-anchor scope,
 * but it produces the same practical symptom (TLS handshake rejected) and needs
 * its own fix even with pinning already disabled.
 *
 * This adds `<trust-anchors><certificates src="system"/><certificates src="user"/></trust-anchors>`
 * to every `<base-config>` and `<domain-config>` element found (currently just
 * the one base-config, but this covers a future config with per-domain overrides
 * too), and strips any `<pin-set>` elements that might be introduced later (none
 * exist currently), so a MITM proxy's user-installed CA is accepted alongside the
 * system trust store.
 */
private fun ensureUserTrustAnchors(element: Element) {
    // Remove any pin-set first (present or not, this makes the intent explicit
    // and covers the config gaining one in a future app update).
    val pinSets = element.getElementsByTagName("pin-set")
    while (pinSets.length > 0) {
        element.removeChild(pinSets.item(0))
    }

    val existingTrustAnchors = element.getElementsByTagName("trust-anchors")
    if (existingTrustAnchors.length > 0) {
        // Already has a trust-anchors block (unexpected for this app today, but
        // handle it defensively): just add a user-cert entry if it isn't there.
        val trustAnchors = existingTrustAnchors.item(0) as Element
        val certs = trustAnchors.getElementsByTagName("certificates")
        val hasUserSrc = (0 until certs.length).any {
            (certs.item(it) as Element).getAttribute("src") == "user"
        }
        if (!hasUserSrc) {
            val userCert = element.ownerDocument.createElement("certificates")
            userCert.setAttribute("src", "user")
            trustAnchors.appendChild(userCert)
        }
        return
    }

    val trustAnchors = element.ownerDocument.createElement("trust-anchors")

    val systemCert = element.ownerDocument.createElement("certificates")
    systemCert.setAttribute("src", "system")
    trustAnchors.appendChild(systemCert)

    val userCert = element.ownerDocument.createElement("certificates")
    userCert.setAttribute("src", "user")
    trustAnchors.appendChild(userCert)

    element.appendChild(trustAnchors)
}

@Suppress("unused")
val disableNetworkSecurityConfigTrustRestrictionPatch = resourcePatch(
    name = "Trust user-installed certificates",
    description = "Adds a user certificate trust anchor to the network security config, so a MITM proxy's installed CA is accepted (this is separate from and in addition to disabling OkHttp's code-level certificate pinning).",
    default = false
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        document("res/xml/network_security_config.xml").use { doc ->
            val root = doc.documentElement
            for (tagName in listOf("base-config", "domain-config")) {
                val elements = root.getElementsByTagName(tagName)
                for (i in 0 until elements.length) {
                    ensureUserTrustAnchors(elements.item(i) as Element)
                }
            }
        }
    }
}
