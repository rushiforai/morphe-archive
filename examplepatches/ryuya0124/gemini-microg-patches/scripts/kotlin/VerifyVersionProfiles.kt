import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import java.io.File

/** Assert unsupported inputs fail; keep reviewable JSON records in sync with executable profiles. */
fun main(args: Array<String>) {
    require(args.size in 1..2)
    val root = File(args[0])
    val write = args.getOrNull(1) == "--write"
    val declaredInputs = mutableMapOf<String, MutableSet<String>>()
    for (profile in VersionHookRegistry.profiles) {
        check(profile.versionCode.all(Char::isDigit))
        check(profile.validation.isNotEmpty())
        check(VersionHookRegistry.findProfile(profile.packageName, profile.versionName + ".unverified") == null)
        check(runCatching { VersionHookRegistry.requireProfile(profile.packageName, "unknown") }.isFailure)
        check(runCatching {
            VersionHookRegistry.requireProfile(profile.packageName, profile.versionName, "0")
        }.isFailure) { "Mismatched versionCode must fail" }
        for ((file, sha) in profile.inputSha256) {
            check(sha.matches(Regex("[0-9a-f]{64}")))
            declaredInputs.getOrPut(file) { mutableSetOf() }.add(sha)
        }
        for ((id, spec) in profile.hooks) {
            spec.expectedMatches?.let { check(it > 0) }
            if (id == HookId.MICROG_RUNTIME_PERMISSIONS) {
                val scratch = listOf("scratchArray", "scratchIndex", "scratchString").map(spec::int)
                check(scratch.distinct().size == 3)
                check(scratch.all { it >= 0 && it < spec.int("minRegisters") - spec.int("thisParameterOffset") })
            }
        }
        val file = File(root, "docs/versions/${profile.packageName}/${profile.versionName}.json")
        val json = encodeJson(mapOf(
            "appName" to profile.appName, "packageName" to profile.packageName,
            "versionName" to profile.versionName, "versionCode" to profile.versionCode,
            "inputSha256" to profile.inputSha256, "validation" to profile.validation,
            "hooks" to profile.hooks.mapKeys { it.key.name }.mapValues { (_, spec) -> mapOf(
                "className" to spec.className, "methodName" to spec.methodName,
                "methodDescriptor" to spec.methodDescriptor, "fieldName" to spec.fieldName,
                "fieldType" to spec.fieldType, "anchorStrings" to spec.anchorStrings,
                "methodSignatures" to spec.methodSignatures, "expectedMatches" to spec.expectedMatches,
                "integers" to spec.integers, "values" to spec.values,
                "enabled" to spec.enabled, "description" to spec.description
            ) }
        )) + "\n"
        if (write) {
            file.parentFile.mkdirs()
            file.writeText(json)
        } else check(file.isFile && file.readText() == json) {
            "Stale version record: $file. Compile patches, then scripts/check-hook-profiles.sh --write"
        }
    }
    val lockedInputs = File(root, "config/inputs.sha256").readLines().filter { it.isNotBlank() }.associate {
        val parts = it.trim().split(Regex("\\s+")); parts[1] to parts[0]
    }
    check(lockedInputs.all { (file, sha) -> sha in declaredInputs[file].orEmpty() })
    val active = VersionHookRegistry.profiles.filter { profile ->
        profile.inputSha256.all { (file, sha) -> lockedInputs[file] == sha }
    }
    check(active.map { it.packageName }.toSet() == VersionHookRegistry.profiles.map { it.packageName }.toSet()) {
        "config/inputs.sha256 must select a complete recorded version for each app"
    }
    check(active.flatMap { it.inputSha256.entries }.associate { it.toPair() } == lockedInputs)
    println("Version profiles verified: exact versions/codes, unknown-version rejection, input hashes, JSON records")
}

// Small JSON writer for the deliberately limited record types; no runtime dependencies.
private fun quote(value: String): String = buildString {
    append('"')
    for (character in value) when (character) {
        '"' -> append("\\\"")
        '\\' -> append("\\\\")
        '\n' -> append("\\n")
        '\r' -> append("\\r")
        '\t' -> append("\\t")
        else -> if (character.code < 32) append("\\u%04x".format(character.code)) else append(character)
    }
    append('"')
}
private fun encodeJson(value: Any?, depth: Int = 0): String {
    val indent = "  ".repeat(depth)
    val child = "  ".repeat(depth + 1)
    return when (value) {
        null -> "null"
        is String -> quote(value)
        is Int, is Boolean -> value.toString()
        is Map<*, *> -> if (value.isEmpty()) "{}" else value.entries.joinToString(
            ",\n", "{\n", "\n$indent}"
        ) { child + quote(it.key as String) + ": " + encodeJson(it.value, depth + 1) }
        is List<*> -> if (value.isEmpty()) "[]" else value.joinToString(
            ",\n", "[\n", "\n$indent]"
        ) { child + encodeJson(it, depth + 1) }
        else -> error("Unsupported JSON record type: ${value.javaClass}")
    }
}
