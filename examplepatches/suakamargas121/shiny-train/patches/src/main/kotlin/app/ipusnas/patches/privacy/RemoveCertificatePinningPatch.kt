package app.ipusnas.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS
import com.android.tools.smali.dexlib2.Opcode

/**
 * Removes the OkHttp [CertificatePinner] and the SSL pinning interceptor from
 * every [RetrofitHelper.invoke] / [RetrofitHelper.invokeAttestation] builder.
 *
 * The app hard-codes certificate pins for backend-ipusnas.perpusnas.go.id, which
 * prevents intercepting its traffic with a user CA. Removing both the pinner and
 * the pinning interceptor restores normal TLS trust anchors.
 *
 * 2.1.4: pinning interceptor is the named inner class RetrofitHelper$SSLPinningInterceptor.
 * 2.1.6: obfuscation renamed the static field certificatePinner -> "a" and the
 * interceptor to a synthesised lambda-like class Liz; (implements okhttp3.Interceptor,
 * verifies via com.aksaramaya.core.utils.NativePinning). The filters match each
 * occurrence of the install sequence (sget field -> Builder.certificatePinner(...) ->
 * new interceptor -> init -> addInterceptor), so removing the matched instructions
 * uninstalls pinning without touching the unrelated interceptors added later.
 */
private val certificatePinningFingerprint = Fingerprint(
    definingClass = "Lcom/aksaramaya/core/net/RetrofitHelper;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            name = "certificatePinner",
        ),
        methodCall(
            definingClass = "Lokhttp3/OkHttpClient\$Builder;",
            name = "certificatePinner",
        ),
        newInstance("Lcom/aksaramaya/core/net/RetrofitHelper\$SSLPinningInterceptor;"),
        methodCall(
            definingClass = "Lcom/aksaramaya/core/net/RetrofitHelper\$SSLPinningInterceptor;",
            name = "<init>",
        ),
        methodCall(
            definingClass = "Lokhttp3/OkHttpClient\$Builder;",
            name = "addInterceptor",
        ),
    )
)

private val certificatePinningFingerprintV216 = Fingerprint(
    definingClass = "Lcom/aksaramaya/core/net/RetrofitHelper;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            name = "a",
            type = "Lokhttp3/CertificatePinner;",
        ),
        methodCall(
            definingClass = "Lokhttp3/OkHttpClient\$Builder;",
            name = "certificatePinner",
        ),
        newInstance("Liz;"),
        methodCall(
            definingClass = "Liz;",
            name = "<init>",
        ),
        methodCall(
            definingClass = "Lokhttp3/OkHttpClient\$Builder;",
            name = "addInterceptor",
        ),
    )
)

@Suppress("unused")
val removeCertificatePinningPatch = bytecodePatch(
    name = "Remove certificate pinning",
    description = "Removes the hard-coded OkHttp certificate pins and SSL pinning interceptor so the app trusts system and user CAs.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        val matches = certificatePinningFingerprint.matchAllOrNull()
            ?: certificatePinningFingerprintV216.matchAllOrNull()
            ?: throw IllegalStateException("RetrofitHelper pinning pattern not found")

        matches.forEach { match ->
            match.instructionMatches
                .map { it.index }
                .sortedDescending()
                .forEach { index -> match.method.removeInstruction(index) }
        }
    }
}
