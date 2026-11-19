package app.smartlife.patches.smartlife.shared

/**
 * Minimal JSON tree used to edit the app's asset config files structurally.
 *
 * Plain text replacement cannot tell an array element from an object key or a
 * property value, and leaves dangling commas when the file has whitespace. Parsing
 * into a tree and writing it back keeps the output valid JSON whatever the input
 * formatting. String and number tokens are kept verbatim ([Str.raw], [Lit.raw]) so
 * values that are not touched are written back byte-for-byte; only insignificant
 * whitespace is dropped (the shipped assets are already minified).
 *
 * Gson is compile-only in this project (not bundled into the patches), so this
 * small parser avoids adding a runtime dependency.
 */
internal sealed class JsonNode {
    class Obj(val entries: MutableList<Pair<Str, JsonNode>>) : JsonNode() {
        operator fun get(key: String): JsonNode? = entries.firstOrNull { it.first.value == key }?.second
    }

    class Arr(val items: MutableList<JsonNode>) : JsonNode()

    /** A string token. [raw] includes the surrounding quotes and original escapes. */
    class Str(val raw: String, val value: String) : JsonNode()

    /** A number, `true`, `false` or `null`, kept as the original token text. */
    class Lit(val raw: String) : JsonNode()

    fun write(): String = StringBuilder().also { writeTo(it) }.toString()

    private fun writeTo(out: StringBuilder) {
        when (this) {
            is Obj -> {
                out.append('{')
                entries.forEachIndexed { index, (key, value) ->
                    if (index > 0) out.append(',')
                    out.append(key.raw).append(':')
                    value.writeTo(out)
                }
                out.append('}')
            }
            is Arr -> {
                out.append('[')
                items.forEachIndexed { index, item ->
                    if (index > 0) out.append(',')
                    item.writeTo(out)
                }
                out.append(']')
            }
            is Str -> out.append(raw)
            is Lit -> out.append(raw)
        }
    }

    /**
     * Visit this node and every node below it, depth first. [action] runs before the
     * children are visited, so it may remove children of the node it is given.
     */
    fun forEachNode(action: (JsonNode) -> Unit) {
        action(this)
        when (this) {
            is Obj -> entries.forEach { it.second.forEachNode(action) }
            is Arr -> items.forEach { it.forEachNode(action) }
            else -> Unit
        }
    }

    /**
     * Remove array elements identified by one of [targets], in every array in the tree.
     *
     * A string element matches when its value is a target. With [matchObjectElements],
     * an object element also matches when one of its *direct* string members has a
     * target as its value (e.g. `{"id":"ThingMainPageMarketing",...}`), and the whole
     * object is removed. Object keys, and members of objects that are not array
     * elements, are never touched.
     *
     * @return the targets that were removed.
     */
    fun removeArrayElements(targets: Set<String>, matchObjectElements: Boolean = false): Set<String> {
        val removed = mutableSetOf<String>()
        forEachNode { node ->
            if (node !is Arr) return@forEachNode
            node.items.removeAll { item ->
                val hits = when {
                    item is Str -> listOf(item.value).filter { it in targets }
                    matchObjectElements && item is Obj -> item.entries
                        .mapNotNull { (_, value) -> (value as? Str)?.value }
                        .filter { it in targets }
                    else -> emptyList()
                }
                removed += hits
                hits.isNotEmpty()
            }
        }
        return removed
    }

    /**
     * Remove `"interface":"impl"` pairs from every object stored under a
     * `"serviceMap"` key, when the interface (key) or the impl (string value) is in
     * [targets]. Objects outside a service map are not touched.
     *
     * @return the targets that matched at least one pair.
     */
    fun removeServiceMapEntries(targets: Set<String>): Set<String> {
        val removed = mutableSetOf<String>()
        forEachNode { node ->
            if (node !is Obj) return@forEachNode
            for ((key, map) in node.entries) {
                if (key.value != "serviceMap" || map !is Obj) continue
                map.entries.removeAll { (iface, impl) ->
                    if (impl !is Str) return@removeAll false
                    val hits = listOf(iface.value, impl.value).filter { it in targets }
                    removed += hits
                    hits.isNotEmpty()
                }
            }
        }
        return removed
    }

    companion object {
        /** @throws IllegalArgumentException if [text] is not valid JSON. */
        fun parse(text: String): JsonNode {
            val parser = Parser(text)
            parser.skipBom()
            val root = parser.readValue()
            parser.expectEnd()
            return root
        }
    }

    private class Parser(private val s: String) {
        private var pos = 0

        fun skipBom() {
            if (s.startsWith(BOM)) pos = 1
        }

        private fun skipWhitespace() {
            while (pos < s.length && s[pos] in JSON_WHITESPACE) pos++
        }

        fun expectEnd() {
            skipWhitespace()
            if (pos != s.length) fail("unexpected trailing content")
        }

        private fun fail(message: String): Nothing =
            throw IllegalArgumentException("Invalid JSON at offset $pos: $message")

        private fun peek(): Char {
            skipWhitespace()
            if (pos >= s.length) fail("unexpected end of input")
            return s[pos]
        }

        private fun expect(c: Char) {
            if (peek() != c) fail("expected '$c'")
            pos++
        }

        fun readValue(): JsonNode = when (peek()) {
            '{' -> readObject()
            '[' -> readArray()
            '"' -> readString()
            else -> readLiteral()
        }

        private fun readObject(): Obj {
            expect('{')
            val entries = mutableListOf<Pair<Str, JsonNode>>()
            if (peek() == '}') {
                pos++
                return Obj(entries)
            }
            while (true) {
                if (peek() != '"') fail("expected object key")
                val key = readString()
                expect(':')
                entries += key to readValue()
                when (peek()) {
                    ',' -> pos++
                    '}' -> { pos++; return Obj(entries) }
                    else -> fail("expected ',' or '}'")
                }
            }
        }

        private fun readArray(): Arr {
            expect('[')
            val items = mutableListOf<JsonNode>()
            if (peek() == ']') {
                pos++
                return Arr(items)
            }
            while (true) {
                items += readValue()
                when (peek()) {
                    ',' -> pos++
                    ']' -> { pos++; return Arr(items) }
                    else -> fail("expected ',' or ']'")
                }
            }
        }

        private fun readString(): Str {
            expect('"')
            val start = pos - 1
            val value = StringBuilder()
            while (true) {
                if (pos >= s.length) fail("unterminated string")
                when (val c = s[pos++]) {
                    '"' -> return Str(s.substring(start, pos), value.toString())
                    '\\' -> {
                        if (pos >= s.length) fail("unterminated escape")
                        when (val e = s[pos++]) {
                            '"', '\\', '/' -> value.append(e)
                            'b' -> value.append('\b')
                            'f' -> value.append('\u000C')
                            'n' -> value.append('\n')
                            'r' -> value.append('\r')
                            't' -> value.append('\t')
                            'u' -> {
                                val hex = s.substring(pos, minOf(pos + 4, s.length))
                                if (hex.length != 4 || !hex.all { it in HEX_DIGITS }) {
                                    fail("bad unicode escape")
                                }
                                value.append(hex.toInt(16).toChar())
                                pos += 4
                            }
                            else -> fail("bad escape '\\$e'")
                        }
                    }
                    else -> value.append(c)
                }
            }
        }

        private fun readLiteral(): Lit {
            // Read only characters that can occur in a number or true/false/null, so a
            // token glued to the next one (e.g. `true"x"`) fails at the real position.
            val start = pos
            while (pos < s.length && (s[pos].isLetterOrDigit() || s[pos] in "+-.")) pos++
            val raw = s.substring(start, pos)
            if (raw.isEmpty()) fail("unexpected character '${s[pos]}'")
            val valid = raw == "true" || raw == "false" || raw == "null" || NUMBER.matches(raw)
            if (!valid) {
                pos = start
                fail("unexpected token '$raw'")
            }
            return Lit(raw)
        }

        companion object {
            private const val BOM = "﻿"
            private const val JSON_WHITESPACE = " \t\n\r"
            private const val HEX_DIGITS = "0123456789abcdefABCDEF"
            private val NUMBER = Regex("-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?")
        }
    }
}
