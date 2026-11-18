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
    val densities by lazy { rows("density-payloads").groupBy({ it[0] }, { it[1] }).mapValues { it.value.toSet() } }
    val feature by lazy { rows("feature") }
}

internal fun ResourcePatchContext.requireCompleteResources() {
    val entries = listApkEntries("").toSet()
    val expected = InputContracts.payloads
    val native = entries.filter { it.startsWith("lib/") && it.endsWith(".so") }.toSet()
    val architectures = native.map { it.split('/')[1] }.toSet()
    val requiredNative = expected.keys.filter {
        it.startsWith("lib/") && it.split('/')[1] in architectures
    }.toSet()
    check(native.isNotEmpty() && native == requiredNative) {
        "Incomplete or unsupported 2dehands native input: include a complete ARM64 or ARMv7 split"
    }

    // A device-specific XAPK need not include every density or both ABIs.
    // Split resource paths overlap across densities, so validate the union of
    // complete publisher split profiles. These paths do not occur in the base.
    // Manager preserves API qualifiers (drawable-xhdpi-v4, anydpi-v21), while
    // Desktop normalizes them. Compare the same logical paths in both cases;
    // retain density and layout-direction qualifiers and the native byte pins.
    val apiQualifier = Regex("-v[0-9]+(?=/)")
    val resources = entries.filter { it.startsWith("res/") }
        .map { it.replace(apiQualifier, "") }.toSet()
    val profiles = InputContracts.densities.values
    val complete = profiles.filter { resources.containsAll(it) }
    val observed = resources.intersect(profiles.flatten().toSet())
    check(complete.isNotEmpty() && observed == complete.flatten().toSet()) {
        "Incomplete 2dehands density input: include complete density splits from the 16.19.0 XAPK"
    }
    for (name in requiredNative) {
        val digest = expected.getValue(name)
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
