/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package me.toidicakhia.patches.terabox.misc.ssl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import me.toidicakhia.patches.shared.Constants.TERABOX_COMPATIBILITY
import org.w3c.dom.Element

private const val PATCH = "Bypass SSL pinning"
private const val NETWORK_SECURITY_CONFIG = "res/xml/terabox_network_security_config.xml"

/**
 * Opts the manifest's network security config into user-added certificates,
 * which is what lets the platform trust manager (and therefore OkHttp and
 * WebView) accept a debugging proxy. Android ignores those certificates since
 * API 24 unless the config says otherwise.
 */
private val trustUserCertificatesPatch = resourcePatch(description = "Trust user-added certificates") {
    execute {
        document(NETWORK_SECURITY_CONFIG).use { config ->
            val root = config.documentElement
                ?: throw PatchException("$PATCH: $NETWORK_SECURITY_CONFIG has no root element")

            val anchors = root.getElementsByTagName("trust-anchors")
            if (anchors.length == 0) {
                throw PatchException("$PATCH: $NETWORK_SECURITY_CONFIG has no trust-anchors element")
            }

            for (index in 0 until anchors.length) {
                val set = anchors.item(index) as? Element ?: continue
                val certificates = set.getElementsByTagName("certificates")
                val user = (0 until certificates.length)
                    .mapNotNull { certificates.item(it) as? Element }
                    .firstOrNull { it.getAttribute("src") == "user" }
                    ?: config.createElement("certificates").also {
                        it.setAttribute("src", "user")
                        set.appendChild(it)
                    }
                user.setAttribute("overridePins", "true")
            }
        }
    }
}

@Suppress("unused")
val teraboxBypassSslPinningPatch = bytecodePatch(
    name = PATCH,
    description = "Skips TeraBox certificate pinning and hostname checks, trusts user-installed " +
        "certificates and lets the WebView ignore certificate errors, so a proxy can read HTTPS.",
    default = false
) {
    compatibleWith(TERABOX_COMPATIBILITY)
    dependsOn(trustUserCertificatesPatch)

    execute {
        listOf(
            OkHttpCertificatePinnerCheckFingerprint,
            OkHttpCertificatePinnerCheckOkHttpFingerprint,
            ApplovinCertificatePinnerCheckFingerprint,
            ApplovinCertificatePinnerCheckOkHttpFingerprint,
            BaiduCertificatePinnerCheckFingerprint,
            TencentTrustManagerFingerprint,
        ).forEach { fingerprint ->
            fingerprint.match().method.returnEarly()
        }

        listOf(
            OkHttpHostnameVerifierCertificateFingerprint,
            OkHttpHostnameVerifierSessionFingerprint,
            ApplovinHostnameVerifierCertificateFingerprint,
            ApplovinHostnameVerifierSessionFingerprint,
            BaiduHostnameVerifierCertificateFingerprint,
            BaiduHostnameVerifierSessionFingerprint,
            TencentHostnameVerifierFingerprint,
            TencentLoginHostnameVerifierFingerprint,
            TencentDownloadHostnameVerifierFingerprint,
            ObfuscatedHostnameVerifierFingerprint,
            NcHostnameVerifierFingerprint,
            FeHostnameVerifierFingerprint,
            QdHostnameVerifierFingerprint,
            HttpDnsHostnameVerifierFingerprint,
            MintegralHostnameVerifierFingerprint,
            MintegralOkHttpHostnameVerifierFingerprint,
            GrpcHostnameVerifierFingerprint,
        ).forEach { fingerprint ->
            fingerprint.match().method.returnEarly(true)
        }

        // The other WebView clients of the app inherit from this one and call
        // super, so proceeding here covers the login and hybrid pages too.
        WebViewSslErrorFingerprint.match().method.addInstructions(
            0,
            """
                if-eqz p2, :proceed
                invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V
                :proceed
                return-void
            """.trimIndent()
        )
    }
}
