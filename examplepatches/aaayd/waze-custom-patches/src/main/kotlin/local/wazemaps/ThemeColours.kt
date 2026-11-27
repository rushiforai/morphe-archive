package local.wazemaps

import app.morphe.patcher.patch.PatchException
import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Waze only refreshes extracted skins when Android's versionCode increases. */
fun refreshSkinVersion(source: ByteArray, versionCode: Int = 1030733, increment: Int = 1): ByteArray {
    val result = source.copyOf()
    val data = ByteBuffer.wrap(result).order(ByteOrder.LITTLE_ENDIAN)
    fun u16(offset: Int) = data.getShort(offset).toInt() and 0xffff
    if (result.size < 8 || u16(0) != 3 || data.getInt(4) != result.size) {
        throw PatchException("Expected a compiled Android manifest")
    }
    var resourceIds = IntArray(0)
    var offset = u16(2)
    var changed = 0
    while (offset < result.size) {
        if (offset + 8 > result.size) throw PatchException("Truncated manifest chunk")
        val type = u16(offset)
        val header = u16(offset + 2)
        val size = data.getInt(offset + 4)
        if (size < header || header < 8 || size > result.size - offset) {
            throw PatchException("Invalid manifest chunk")
        }
        if (type == 0x0180) {
            resourceIds = IntArray((size - header) / 4) { data.getInt(offset + header + it * 4) }
        } else if (type == 0x0102) {
            val ext = offset + header
            val start = u16(ext + 8)
            val stride = u16(ext + 10)
            val count = u16(ext + 12)
            if (stride < 20 || ext + start + stride * count > offset + size) {
                throw PatchException("Invalid manifest attributes")
            }
            repeat(count) { index ->
                val attr = ext + start + index * stride
                val name = data.getInt(attr + 4)
                if (resourceIds.getOrNull(name) == 0x0101021b) {
                    val valueType = result[attr + 15].toInt() and 0xff
                    val currentVersion = data.getInt(attr + 16)
                    if (valueType !in setOf(0x10, 0x11))
                        throw PatchException("Waze versionCode is not an integer")
                    if (increment <= 0 || currentVersion < 0 || currentVersion > Int.MAX_VALUE - increment || versionCode <= 0)
                        throw PatchException("Waze versionCode cannot be increased")
                    // Accept the input build number; never lower it or leave resources cached.
                    data.putInt(attr + 16, maxOf(versionCode, currentVersion + increment))
                    changed++
                }
            }
        }
        offset += size
    }
    if (changed != 1) throw PatchException("Expected exactly one Waze versionCode")
    return result
}

/** Find a Lua table without depending on indentation or the closing brace's line. */
private fun luaTable(source: String, name: String, required: Boolean = true): IntRange? {
    val declarations = Regex("(?m)(?:^|[,{])\\h*(?:local\\h+)?${Regex.escape(name)}\\h*=").findAll(source).toList()
    if (declarations.isEmpty() && !required) return null
    if (declarations.size != 1) throw PatchException("Expected one Lua table: $name")
    var index = declarations.single().range.last + 1
    while (index < source.length && source[index].isWhitespace()) index++
    if (index >= source.length || source[index] != '{') throw PatchException("Expected Lua table value: $name")
    val start = index
    var depth = 0
    while (index < source.length) {
        when {
            source.startsWith("--[[", index) -> {
                val end = source.indexOf("]]", index + 4)
                if (end < 0) throw PatchException("Unclosed Lua comment: $name")
                index = end + 2
            }
            source.startsWith("--", index) -> index = source.indexOf('\n', index).let { if (it < 0) source.length else it + 1 }
            source[index] == '\'' || source[index] == '"' -> {
                val quote = source[index++]
                while (index < source.length && source[index] != quote) index += if (source[index] == '\\') 2 else 1
                index++
            }
            source[index] == '{' -> { depth++; index++ }
            source[index] == '}' -> { if (--depth == 0) return start..index; index++ }
            else -> index++
        }
    }
    throw PatchException("Unclosed Lua table: $name")
}

/** Replace recognised entries and verify core colours before accepting optional omissions. */
fun recolorSkin(source: String, palette: Map<String, String>, colors: Map<String, String>): String {
    val table = luaTable(source, "Palette")!!
    val start = table.first
    val end = table.last + 1
    var block = source.substring(start, end)
    val missing = mutableListOf<String>()
    val required = setOf("map_background", "labels", "sea", "parks")
    for ((key, value) in palette) {
        if (!value.matches(Regex("[0-9A-F]{6}([0-9A-F]{2})?"))) {
            throw PatchException("Invalid theme colour for $key")
        }
        val declaration = Regex("(?m)(?:^|[,{])\\h*${Regex.escape(key)}\\h*=")
        if (!declaration.containsMatchIn(block) && key !in required) {
            missing.add("Palette.$key")
            continue
        }
        val entry = Regex("(?m)((?:^|[,{])\\h*${Regex.escape(key)}\\h*=\\h*)rgba?\\h*\\(\\h*0x[0-9a-fA-F]+\\h*\\)")
        if (entry.findAll(block).count() != 1) {
            throw PatchException("Expected exactly one Waze palette entry: $key")
        }
        val function = if (value.length == 8) "rgba" else "rgb"
        block = entry.replace(block) { "${it.groupValues[1]}$function(0x$value)" }
    }
    val overrides = buildString {
        append("\n-- Google Maps sampled colours v2: bypass Waze's palette colour transforms.\n")
        val colorSource = source.substring(luaTable(source, "Colors")!!)
        for ((path, value) in colors.toSortedMap()) {
            if (!path.matches(Regex("[A-Za-z][A-Za-z0-9]*\\.[A-Za-z][A-Za-z0-9_]*")) ||
                !value.matches(Regex("[0-9A-F]{6}([0-9A-F]{2})?"))) {
                throw PatchException("Invalid renderer colour: $path=$value")
            }
            val (group, key) = path.split('.')
            val groupRange = luaTable(colorSource, group, required = false)
            val groupSource = groupRange?.let { colorSource.substring(it) }
            if (groupSource == null || !Regex("(?m)(?:^|[,{])\\h*${Regex.escape(key)}\\h*=").containsMatchIn(groupSource)) {
                if (path == "General.map_background") throw PatchException("Missing Waze renderer colour: $path")
                missing.add("Colors.$path")
                continue
            }
            val function = if (value.length == 8) "rgba" else "rgb"
            append("Colors.$path = $function(0x$value)\n")
        }
    }
    if (missing.isNotEmpty()) println("Waze skin has no optional entries: ${missing.joinToString()}")
    return source.substring(0, start) + block + source.substring(end) + overrides
}
