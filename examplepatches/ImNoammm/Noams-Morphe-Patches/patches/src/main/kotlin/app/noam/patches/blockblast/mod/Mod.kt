package app.noam.patches.blockblast.mod

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.shared.Hek
import java.security.MessageDigest

/**
 * The patches run on top of the game's own JavaScript. [modLoaderPatch] makes the boot script load
 * `assets/src/bbmod.js`; each feature patch adds its script and options with [Mod.enable], and the loader
 * writes them all into that file once every patch has run. Scripts several features share (`mod/lib/<name>.js`)
 * are named in `uses` and written once, ahead of every feature script.
 */
internal object Mod {
    private val features = linkedMapOf<String, Map<String, Any?>>()
    private val libraries = linkedSetOf<String>()

    fun enable(feature: String, options: Map<String, Any?> = emptyMap(), uses: List<String> = emptyList()) {
        features[feature] = options
        libraries += uses
    }

    internal fun reset() {
        features.clear()
        libraries.clear()
    }

    internal fun script() = buildString {
        append("window.__bbmod = ").append(json(features)).append(";\n")
        append(resource("mod/core.js"))
        append(resource("mod/ui.js"))
        libraries.forEach { append(resource("mod/lib/$it.js")) }
        features.keys.forEach { append(resource("mod/$it.js")) }
        append("bb.start();\n")
    }

    /** A JSON document from the patch resources, written into the options as it is. */
    internal fun jsonResource(path: String) = RawJson(resource(path).trim())

    internal class RawJson(val text: String)

    internal fun resource(path: String) = String(resourceBytes(path))

    internal fun resourceBytes(path: String) = Mod::class.java.getResourceAsStream("/blockblast/$path")
        ?.use { it.readBytes() }
        ?: throw PatchException("Missing patch resource $path")

    private fun json(value: Any?): String = when (value) {
        null -> "null"
        is RawJson -> value.text
        is String -> buildString {
            append('"')
            value.forEach { c ->
                when {
                    c == '"' || c == '\\' -> append('\\').append(c)
                    c < ' ' || c == ' ' || c == ' ' -> append("\\u%04x".format(c.code))
                    else -> append(c)
                }
            }
            append('"')
        }
        is Boolean, is Int, is Long -> value.toString()
        is Number -> value.toDouble().let { if (it.isFinite()) value.toString() else "null" }
        is Map<*, *> -> value.entries.joinToString(",", "{", "}") { json(it.key.toString()) + ":" + json(it.value) }
        is Iterable<*> -> value.joinToString(",", "[", "]") { json(it) }
        else -> json(value.toString())
    }
}

// assets/main.js of Block Blast 10.8.1 (HEK-encrypted), the only build the replacement boot script is made from.
private const val STOCK_MAIN_JS_SHA256 = "ad3bec65265ca02c21669d558d7851c3befa46de6d82f7d82b1824de8f95baa5"

internal val modLoaderPatch = rawResourcePatch(
    description = "Loads the patches' script when the game starts and stops hot updates from replacing the game code.",
) {
    execute {
        Mod.reset()
        val mainJs = get("assets/main.js")
        val digest = MessageDigest.getInstance("SHA-256").digest(mainJs.readBytes()).joinToString("") { "%02x".format(it) }
        if (digest != STOCK_MAIN_JS_SHA256) {
            throw PatchException("Unsupported Block Blast build: assets/main.js is not the one from version 10.8.1")
        }
        mainJs.writeBytes(Hek.encode(Mod.resource("main.js").toByteArray()))
    }

    finalize {
        get("assets/src/bbmod.js").writeText(Mod.script())
    }
}
