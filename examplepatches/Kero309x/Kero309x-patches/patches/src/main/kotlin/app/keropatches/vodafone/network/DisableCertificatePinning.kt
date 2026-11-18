// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.network

import app.keropatches.core.PatchCategory
import app.keropatches.core.removeCallAndResult
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch

/**
 * The pinner of the application's own network layer.
 *
 * The class and the method are both renamed by the shrinker, so the class and
 * the full signature together identify it.
 */
private object NetworkPinnerFingerprint : Fingerprint(
    definingClass = "Lo/getPrintScreenEK5gGoQ\$AnimatedBarChartKtAnimatedBarChart1;",
    name = "AnimatedBarChartKtAnimatedBarChart1",
    isStatic = false,
    returnType = "Lokhttp3/CertificatePinner;",
    parameters = emptyList(),
)

/**
 * The pinner of the authentication network layer.
 *
 * The two stacks are separate and build their own pinner, so both are changed.
 */
private object AuthenticationPinnerFingerprint : Fingerprint(
    definingClass = "Lo/updateAuxData\$AnimatedBarChartKtAnimatedBarChart1;",
    name = "AnimatedBarChartKtAnimatedBarChart1",
    isStatic = false,
    returnType = "Lokhttp3/CertificatePinner;",
    parameters = emptyList(),
)

/**
 * Stops the application from pinning the certificate of its own server.
 *
 * The stock build pins `mobile.vodafone.com.eg` to two public keys. A request
 * whose certificate chain matches neither of them fails, whatever the reason is:
 * a proxy in the way, a certificate the operator renewed, or a debugging
 * tool. The authentication stack pins the same host the same way.
 *
 * The patch removes the pins from both pinners, so the pinner the client carries
 * has no host and enforces nothing. The certificate is then validated the way
 * the platform validates it: against the trust store of the device.
 *
 * The pins are removed rather than pointed at another host. The library refuses
 * a pattern it cannot make a host of, so an empty pattern would make the
 * application fail to start instead of just not pinning.
 *
 * The rest of the network layer is untouched: the same requests are made, with
 * the same headers, and the certificate checks the platform does still happen.
 */
@Suppress("unused")
val disableCertificatePinningPatch = bytecodePatch(
    name = "Disable certificate pinning",
    description = "Stops the app refusing servers whose certificate is not one of its two pinned keys.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.SECURITY.label)

    execute {
        val addPin = "Lokhttp3/CertificatePinner\$Builder;->add(Ljava/lang/String;[Ljava/lang/String;)" +
            "Lokhttp3/CertificatePinner\$Builder;"

        NetworkPinnerFingerprint.method.removeCallAndResult(addPin)
        AuthenticationPinnerFingerprint.method.removeCallAndResult(addPin)
    }
}
