package patches.tweedehands

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import java.security.MessageDigest

private object InputContracts {
    fun rows(name: String): List<List<String>> = checkNotNull(
        javaClass.getResourceAsStream("/tweedehands/$name-1619.tsv"),
    ) { "Missing 2dehands original-input contract: $name" }.bufferedReader().use { reader ->
        reader.readLines().filter(String::isNotBlank).map { it.split('\t') }
    }
    val payloads by lazy { rows("input-payloads").associate { it[0] to it[1] } }
    val feature by lazy { rows("feature") }
}

internal fun ResourcePatchContext.requireCompleteResources() {
    val entries = listApkEntries("").toSet()
    val expected = InputContracts.payloads
    val native = entries.filter { it.startsWith("lib/") && it.endsWith(".so") }.toSet()
    check(native == expected.keys.filter { it.startsWith("lib/") }.toSet() &&
        entries.containsAll(expected.keys)) {
        "Incomplete 2dehands input: select all native, density and feature splits from the complete 16.19.0 XAPK"
    }
    for ((name, digest) in expected) {
        // Binary XML is decoded by the resource coder. Density resources use
        // presence contracts; native library bytes are checked exactly.
        if (digest == "-") continue
        val actual = MessageDigest.getInstance("SHA-256").digest(get(name).readBytes())
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(actual == digest) { "2dehands original resource changed: $name" }
    }
}

internal fun BytecodePatchContext.requireCompleteFeature() {
    val contract = InputContracts.feature
    val methods = contract.filter { it[0] == "M" }.groupBy { it[1] }
    for (row in contract.filter { it[0] == "C" }) {
        val owner = row[1]
        val original = classDefByOrNull(owner)
        check(original != null && original.accessFlags == row[2].toInt() &&
            original.superclass == row[3].takeUnless { it == "-" } &&
            original.interfaces == row[4].takeUnless { it == "-" }?.split(',').orEmpty()) {
            "Incomplete or changed 2dehands Notifications declaration: $owner"
        }
        val actual = original.methods.associate { method ->
            (method.name + "(" + method.parameterTypes.joinToString("") + ")" + method.returnType) to method.accessFlags
        }
        val expected = methods[owner].orEmpty().associate { it[2] to it[3].toInt() }
        check(actual == expected) { "Incomplete or changed 2dehands Notifications methods: $owner" }
    }
}
