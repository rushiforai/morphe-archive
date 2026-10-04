/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.util

import com.google.gson.JsonObject
import java.security.MessageDigest

/** The input identity is independent of generated payload bytes and their external receipts. */
object BuildIdentityMetadata {
    fun requireId(value: String?): String {
        require(value != null && value.matches(Regex("hg1:[0-9a-f]{64}"))) {
            "The bundle has no valid canonical production build identity. Rebuild it before patching."
        }
        return value
    }

    fun requireInputs(inputs: JsonObject): String {
        require(inputs.keySet() == setOf("schemaVersion", "sourceSha256", "catalogSha256", "toolchainSha256", "id")) {
            "The canonical production inputs contain missing or unsupported fields."
        }
        val schema = inputs["schemaVersion"]
        require(schema?.isJsonPrimitive == true && schema.asJsonPrimitive.isNumber && schema.asString == "1") {
            "The canonical production inputs have no supported schema."
        }
        val text = buildString {
            append("hushgram-production-inputs-v1\n")
            for (category in listOf("source", "catalog", "toolchain")) {
                val value = inputs[category + "Sha256"]
                require(value?.isJsonPrimitive == true && value.asJsonPrimitive.isString &&
                    value.asString.matches(Regex("[0-9a-f]{64}"))) { "The canonical inputs have no $category SHA-256." }
                append(category).append(':').append(value.asString).append('\n')
            }
        }
        val id = requireId(inputs["id"]?.takeIf { it.isJsonPrimitive && it.asJsonPrimitive.isString }?.asString)
        val digest = MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8))
            .joinToString("") { "%02x".format(it) }
        require(id == "hg1:$digest") { "The canonical build identity does not match its input digests." }
        return id
    }
}
