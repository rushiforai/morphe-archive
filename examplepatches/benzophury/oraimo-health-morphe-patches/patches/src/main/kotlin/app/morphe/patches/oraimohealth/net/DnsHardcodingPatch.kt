package app.morphe.patches.oraimohealth.net

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching the lookup method in okhttp3.Dns$Companion$DnsSystem.
 */
object DnsSystemLookupFingerprint : Fingerprint(
    definingClass = "Lokhttp3/Dns\$Companion\$DnsSystem;",
    name = "lookup",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Bytecode patch that hardcodes DNS resolution to throw UnknownHostException,
 * blackholing all cloud HTTP requests locally.
 */
@Suppress("unused")
val dnsHardcodingPatch = bytecodePatch(
    name = "DNS Hardcoding",
    description = "Hardcodes DNS lookup in OkHttp to fail locally with UnknownHostException, preventing any remote DNS or HTTP traffic.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ORAIMO_HEALTH)

    execute {
        DnsSystemLookupFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/net/UnknownHostException;
                const-string v1, "Offline Mode"
                invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V
                throw v0
            """
        )
    }
}
