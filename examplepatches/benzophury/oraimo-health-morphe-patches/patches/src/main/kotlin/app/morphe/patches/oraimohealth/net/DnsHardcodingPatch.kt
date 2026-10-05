package app.morphe.patches.oraimohealth.net

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching the lookup method in okhttp3.Dns$Companion$DnsSystem (v2.0.4).
 */
object DnsSystemLookupFingerprint : Fingerprint(
    definingClass = "Lokhttp3/Dns\$Companion\$DnsSystem;",
    name = "lookup",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Fingerprint matching obfuscated OkHttp Dns lookup in v2.0.6 (fn/t.a).
 */
object ObfuscatedDnsLookupFingerprint : Fingerprint(
    definingClass = "Lfn/t;",
    name = "a",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Universal fingerprint matching OkHttp DnsSystem lookup across any obfuscation via unique string constant.
 */
object UniversalDnsLookupFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("getAllByName(hostname)")
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
        val dnsInstructions = """
            new-instance v0, Ljava/net/UnknownHostException;
            const-string v1, "Offline Mode"
            invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V
            throw v0
        """

        listOfNotNull(
            UniversalDnsLookupFingerprint.methodOrNull,
            DnsSystemLookupFingerprint.methodOrNull,
            ObfuscatedDnsLookupFingerprint.methodOrNull
        ).distinct().forEach { method ->
            method.addInstructions(0, dnsInstructions)
        }
    }
}
