package app.badfella.patches.remoteatv

import java.security.MessageDigest
import java.util.Base64

// Stock 6.1.0 runtime constants. Keep this data tied to the exact reviewed DEX hashes.
internal val remoteAtvStrings: Map<String, Map<String, String>> by lazy {
    val bytes = checkNotNull(object {}.javaClass.getResourceAsStream("/remoteatv/strings-6.1.0.tsv"))
        .use { it.readBytes() }
    check(MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) } ==
        "abdc09eea9b7bea04666ecd07ce84801da053c90bdca982104f15ff3d372c047") { "Remote ATV string data changed" }
    val rows = bytes.toString(Charsets.UTF_8).lineSequence().filter { it.isNotEmpty() }.map {
        val parts = it.split('\t')
        check(parts.size == 3)
        Triple(parts[0], parts[1], Base64.getDecoder().decode(parts[2]).toString(Charsets.UTF_8))
    }.toList()
    check(rows.size == 1443 && rows.map { it.first to it.second }.toSet().size == rows.size)
    rows.groupBy { it.first }.mapValues { (_, fields) -> fields.associate { it.second to it.third } }
        .also { check(it.size == 32) }
}
