import org.luckypray.dexkit.DexKitBridge
import org.luckypray.dexkit.query.FindMethod
import org.luckypray.dexkit.query.matchers.MethodMatcher
import org.luckypray.dexkit.query.enums.StringMatchType
import java.io.File

private fun json(v: Any?): String = when(v) {
    null -> "null"
    is String -> "\"" + v.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t") + "\""
    is Number, is Boolean -> v.toString()
    is Map<*,*> -> v.entries.joinToString(",", "{", "}") { json(it.key.toString()) + ":" + json(it.value) }
    is Iterable<*> -> v.joinToString(",", "[", "]") { json(it) }
    else -> error("Unsupported report value")
}

fun main(args: Array<String>) {
    require(args.size == 4) { "APK RULES_TSV OUTPUT_JSON NATIVE_LIBRARY" }
    System.load(File(args[3]).canonicalPath)
    val report = linkedMapOf<String, Any>()
    DexKitBridge.create(File(args[0]).canonicalPath).use { bridge ->
        for (line in File(args[1]).readLines().filter { it.isNotBlank() && !it.startsWith("#") }) {
            val columns = line.split('\t'); require(columns.size == 4)
            val (id, returnType, count, strings) = columns
            val matcher = MethodMatcher.create().usingStrings(strings.split('|'), StringMatchType.Equals)
            if (returnType != "*") matcher.returnType(returnType)
            if (count != "*") matcher.paramCount(count.toInt())
            val methods = bridge.findMethod(FindMethod.create().matcher(matcher))
            report[id] = mapOf("status" to when(methods.size) { 0 -> "missing"; 1 -> "unique_candidate"; else -> "ambiguous" },
                "count" to methods.size, "candidates" to methods.sortedBy { it.descriptor }.map { method ->
                    mapOf("descriptor" to method.descriptor,
                        "fields" to method.usingFields.map { "${it.usingType}:${it.field.descriptor}" }.distinct(),
                        "invokes" to method.invokes.map { it.descriptor }.distinct(),
                        "callers" to method.callers.map { it.descriptor }.distinct())
                })
        }
    }
    File(args[2]).writeText(json(mapOf("discoveryOnly" to true, "rules" to report)) + "\n")
    println("DexKit: ${report.size} rules searched; report=${args[2]}; candidates require DEX validation")
}
