package tutto.build

import kotlinx.serialization.json.*
import java.io.File
import tutto.patches.labelSuggestionsPatch
import tutto.patches.tuttoEnhancementsPatch

/** Build tool only; deliberately excluded from both the MPP and APK. */
fun main(args: Array<String>) {
    val catalog = mapOf(
        "version" to args[0],
        "patches" to listOf(tuttoEnhancementsPatch, labelSuggestionsPatch).map { p -> mapOf(
            "name" to p.name, "description" to p.description, "default" to p.default,
            "category" to p.category, "dependencies" to emptyList<String>(), "options" to emptyList<String>(),
            "compatiblePackages" to p.compatibility!!.map { c -> mapOf(
                "packageName" to c.packageName, "name" to c.name, "description" to c.description,
                "apkFileType" to c.apkFileType?.name, "appIconColor" to "#FFFFFF", "signatures" to c.signatures,
                "targets" to c.targets.map { t -> mapOf("version" to t.version, "versionCodes" to null,
                    "isExperimental" to t.isExperimental, "minSdk" to t.minSdk, "description" to t.description) }
            ) }
        ) }
    )
    fun json(v: Any?): JsonElement = when (v) {
        null -> JsonNull
        is Map<*, *> -> JsonObject(v.entries.associate { it.key.toString() to json(it.value) })
        is List<*> -> JsonArray(v.map { json(it) })
        is Boolean -> JsonPrimitive(v)
        is Number -> JsonPrimitive(v)
        else -> JsonPrimitive(v.toString())
    }
    File(args[1]).writeText(Json { prettyPrint = true }.encodeToString(JsonElement.serializer(), json(catalog)) + "\n")
}
