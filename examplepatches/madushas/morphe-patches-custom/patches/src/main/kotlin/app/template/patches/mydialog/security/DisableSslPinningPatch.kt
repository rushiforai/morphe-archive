package app.template.patches.mydialog.security

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.mydialog.CertificatePinCheck
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.returnEarly
import org.w3c.dom.Element

/**
 * MyDialog pins server certificates in TWO independent layers:
 *
 * 1. **OkHttp layer** — `CustomCertificatePinner`: an `EnhancedTrustManager` runs
 *    the default system validation and then compares the chain against three
 *    baked-in sha256 pins (`CustomCertificatePinner.d(X509Certificate[])`); an
 *    OkHttp interceptor additionally probes stack traces / proxy headers for
 *    hooking frameworks.
 * 2. **Platform layer** — `res/xml/network_security_config.xml` carries a
 *    `<pin-set>` for selfcare.dialog.lk / mda.dialog.lk / qoe.dialog.lk /
 *    mwc.dialog.lk / did.dialog.lk, enforced by the OS itself. The OkHttp patch
 *    alone does not disable this; and the config does not trust user-installed
 *    CAs (targetSdk 30+ default), so a MITM proxy is rejected even with the
 *    OkHttp pins gone.
 *
 * This patch removes both: the OkHttp pin comparison is skipped (system
 * validation stays — normal TLS is unaffected for the user), and the network
 * security config drops its pin-set and adds user-certificate trust so traffic
 * inspection with a user CA becomes possible.
 */
private val securityConfigPatch = resourcePatch {
    execute {
        document("res/xml/network_security_config.xml").use { doc ->
            val root = doc.documentElement

            // Drop every <pin-set> element (platform-enforced pins).
            val pinSets = doc.getElementsByTagName("pin-set")
            while (pinSets.length > 0) {
                val n = pinSets.item(0)
                n.parentNode.removeChild(n)
            }

            // Base config: trust system + user CAs.
            val base = doc.createElement("base-config")
            val cleartext = doc.createAttribute("cleartextTrafficPermitted")
            cleartext.value = "false"
            base.setAttributeNode(cleartext)
            for (src in listOf("system", "user")) {
                val certs = doc.createElement("certificates")
                val a = doc.createAttribute("src")
                a.value = src
                certs.setAttributeNode(a)
                base.appendChild(certs)
            }
            root.appendChild(base)

            // Keep the app's cleartext exceptions, but they must not inherit pins
            // (pin-sets are gone) or user certs — leave those domain-configs as-is.
        }
    }
}

@Suppress("unused")
val myDialogDisableSslPinningPatch = bytecodePatch(
    name = "Disable SSL pinning",
    description = "Removes certificate pinning at both layers (OkHttp pin comparison " +
        "and the platform network-security-config pin-set) and trusts user-installed " +
        "CAs, so HTTPS traffic can be inspected with a MITM proxy. Normal TLS " +
        "validation stays intact.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    dependsOn(securityConfigPatch)

    execute {
        CertificatePinCheck.method.returnEarly()
    }
}
