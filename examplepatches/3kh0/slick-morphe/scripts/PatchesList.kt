// Writes patches-list.json for a built .mpp, in the same shape as morphe-patches-template's
// PatchListGenerator, so the Morphe index and other tools can read what this bundle patches.
// Usage: java -cp morphe.jar:<this> PatchesListKt <bundle.mpp> <version> <out.json>

import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonNull
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.addJsonObject
import kotlinx.serialization.json.buildJsonArray
import kotlinx.serialization.json.buildJsonObject
import kotlinx.serialization.json.put
import kotlinx.serialization.json.putJsonArray
import java.io.File

private fun json(value: Any?): JsonElement =
    when (value) {
        null -> JsonNull
        is JsonElement -> value
        is Boolean -> JsonPrimitive(value)
        is Number -> JsonPrimitive(value)
        is String -> JsonPrimitive(value)
        is Enum<*> -> JsonPrimitive(value.name)
        is Map<*, *> -> JsonObject(value.entries.associate { (k, v) -> (if (k is Enum<*>) k.name else k.toString()) to json(v) })
        is Iterable<*> -> JsonArray(value.map(::json))
        is Array<*> -> JsonArray(value.map(::json))
        else -> JsonPrimitive(value.toString())
    }

@Suppress("DEPRECATION")
fun main(args: Array<String>) {
    val (bundle, version, out) = args
    val patches = loadPatchesFromJar(setOf(File(bundle))).filter { it.name != null }.sortedBy { it.name }
    val list =
        buildJsonObject {
            put(
                "NOTE",
                "Do NOT manually edit this file. This file is automatically updated when " +
                    "release.yml runs. Manually editing this file can break your releases and " +
                    "break third party tools that use this file.",
            )
            put("version", version)
            putJsonArray("patches") {
                for (patch in patches) {
                    addJsonObject {
                        put("name", patch.name)
                        put("description", patch.description)
                        put("default", patch.default)
                        put("category", patch.category)
                        put(
                            "compatiblePackages",
                            patch.compatibility?.let { compat ->
                                buildJsonArray {
                                    for (c in compat) {
                                        addJsonObject {
                                            put("packageName", c.packageName)
                                            put("name", c.name)
                                            put("description", c.description)
                                            put("apkFileType", c.apkFileType?.name)
                                            put("appIconColor", c.appIconColor?.let { "#%06X".format(it) })
                                            put("signatures", json(c.signatures))
                                            put("formFactor", c.formFactor?.name)
                                            putJsonArray("targets") {
                                                for (t in c.targets) {
                                                    addJsonObject {
                                                        put("version", t.version)
                                                        put("versionCodes", json(t.versionCodes))
                                                        put("isExperimental", t.isExperimental)
                                                        put("minSdk", t.minSdk)
                                                        put("description", t.description)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            } ?: JsonNull,
                        )
                        putJsonArray("options") {
                            for (o in patch.options.values) {
                                addJsonObject {
                                    put("key", o.key)
                                    put("title", o.title)
                                    put("description", o.description)
                                    put("required", o.required)
                                    put("type", o.type.toString())
                                    put("default", json(o.default))
                                    put("values", json(o.values))
                                }
                            }
                        }
                    }
                }
            }
        }

    @OptIn(kotlinx.serialization.ExperimentalSerializationApi::class)
    val format =
        Json {
            prettyPrint = true
            prettyPrintIndent = "  "
        }
    File(out).writeText(format.encodeToString(JsonObject.serializer(), list) + "\n")
}
