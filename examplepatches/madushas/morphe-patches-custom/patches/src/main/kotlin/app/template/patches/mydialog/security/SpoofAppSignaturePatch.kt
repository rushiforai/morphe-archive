package app.template.patches.mydialog.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

/**
 * The server's device-integrity verdict ("App Error: NO IMSI" when it answers
 * integrity:false) is driven by the `appSignature` field every API request
 * carries. Reverse-engineered composition (decompiled Hermes, generator
 * _fun9420 at decompiled.js:329617, build block 330265-330342) — NO crypto:
 *
 *   part1 = S[0:5] + rand(5) + S[5:]        where S = Base64(SHA1(signing-cert DER))
 *   part2 = Base64(reverse(rand(8)) + unix-seconds)
 *   part3 = Base64(reverse(rand(3) + T[0:5] + rand(5) + T))   T = config appTitle
 *   appSignature = part1 + "_" + part2 + "_" + part3
 *
 * So the ONLY build-derived input is the signing-certificate SHA-1 (S), fetched
 * once at init via `NativeUtils.setAppToken()` -> Utils.d() =
 * getPackageInfo(GET_SIGNATURES).signatures[0] -> SHA1 -> base64. The stock
 * value is even hardcoded in the bundle's iOS branch:
 * "cMLSQD1z0wMqB3iBS80mbNCGWmY=" (verified = Base64(SHA1(cert DER)) of the
 * Play APK's v2 signing block). A re-signed patched build embeds its own hash
 * instead ("60QxMXQ..." in our capture) — MITM-proven to be what the server
 * flags with integrity:false.
 *
 * This patch makes setAppToken() resolve the stock constant, so the signature
 * pattern is byte-shape-identical to stock. Randomness/timestamp parts are
 * per-request anyway; no client-side integrity mechanism re-checks the value.
 */
@Suppress("unused")
val myDialogSpoofAppSignaturePatch = bytecodePatch(
    name = "Spoof stock signing cert hash",
    description = "Makes NativeUtils.setAppToken() return the stock app's " +
        "certificate hash instead of the patched build's, so the server-side " +
        "device/app integrity verdict ('App Error: NO IMSI') is not tripped by " +
        "the re-signed APK.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        val m = app.morphe.patcher.Fingerprint(
            definingClass = "Lnet/omobio/dialogsc/utils/NativeUtilsModule;",
            name = "setAppToken",
            returnType = "V",
            parameters = listOf("Lcom/facebook/react/bridge/Promise;"),
        ).method
        // Instance method: p0=this, p1=Promise.
        m.clearBody()
        m.ensureRegisters(4)
        m.addInstructions(
            0,
            """
            const-string v0, "cMLSQD1z0wMqB3iBS80mbNCGWmY="
            invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
            return-void
            """.trimIndent(),
        )
    }
}
