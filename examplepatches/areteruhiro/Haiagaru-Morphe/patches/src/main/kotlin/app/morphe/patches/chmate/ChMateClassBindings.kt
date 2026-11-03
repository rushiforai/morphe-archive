package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.util.concurrent.ConcurrentHashMap

/** Exact version-specific owners, measured against the supported unmodified APKs.
 * No class enumeration or discovery fallback is permitted here.
 */
private object ChMateClassBindings {
    private val profiles = ConcurrentHashMap<String, Map<String, List<String>>>()

    fun profile(version: String): Map<String, List<String>> = profiles.computeIfAbsent(version) {
        val key = when (version) {
            "0.8.10.191 dev" -> "191"
            "0.8.10.226 dev" -> "226"
            "0.8.10.242 dev" -> "242"
            else -> error("No verified ChMate class bindings for $version")
        }
        val stream = checkNotNull(javaClass.getResourceAsStream("/chmate/class-bindings/$key.txt")) {
            "Missing ChMate class bindings for $version"
        }
        val result = linkedMapOf<String, MutableList<String>>()
        var section: MutableList<String>? = null
        stream.bufferedReader(Charsets.UTF_8).useLines { lines ->
            lines.forEach { raw ->
                val line = raw.trim()
                when {
                    line.isEmpty() || line.startsWith("#") -> Unit
                    line.startsWith("[") && line.endsWith("]") -> {
                        val name = line.substring(1, line.length - 1)
                        check(name !in result) { "Duplicate ChMate binding operation $name" }
                        section = mutableListOf<String>().also { result[name] = it }
                    }
                    else -> {
                        check(line.startsWith("L") && line.endsWith(";") && !line.contains(' ')) {
                            "Invalid ChMate class binding: $line"
                        }
                        checkNotNull(section) { "ChMate class binding without operation" }.add(line)
                    }
                }
            }
        }
        result.mapValues { (_, names) ->
            check(names.distinct().size == names.size) { "Duplicate ChMate class binding" }
            names.toList()
        }
    }
}

/** Iterate only the explicit owners for this operation; retain its native structural checks. */
internal fun BytecodePatchContext.boundClassForEach(operation: String, action: (ClassDef) -> Unit) {
    val names = checkNotNull(ChMateClassBindings.profile(packageMetadata.versionName)[operation]) {
        "Unverified ChMate binding operation: ${packageMetadata.versionName} $operation"
    }
    // Resolve all owners before mutation so a missing required class fails immediately.
    names.map { name -> classDefBy(name) }.forEach(action)
}
