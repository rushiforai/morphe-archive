// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami

import app.keropatches.anghami.integrity.STOCK_CERTIFICATE_BASE64
import java.security.MessageDigest
import java.util.Base64
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Proves the embedded certificate is the one the rest of the bundle claims to be.
 *
 * The patched build presents this certificate to the server, so a single wrong
 * character would produce a request signature the server refuses, with no local
 * symptom to explain it. Comparing the digest against the value already used for
 * the compatibility check keeps the two declarations from drifting apart.
 */
class SigningCertificateTest {
    @Test
    fun embeddedCertificateIsTheStockOne() {
        val der = Base64.getDecoder().decode(STOCK_CERTIFICATE_BASE64)
        val hex = MessageDigest.getInstance("SHA-256")
            .digest(der)
            .joinToString("") { byte -> "%02x".format(byte) }

        assertEquals(AnghamiApp.SIGNING_CERTIFICATE_SHA256, hex)
    }
}
