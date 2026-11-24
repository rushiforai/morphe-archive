/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import io.airlift.compress.zstd.ZstdCompressor
import io.airlift.compress.zstd.ZstdDecompressor
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val SCRIPT = "assets/scripts/game_state.gdc"
private const val ZSTD_MAGIC = 0xFD2FB528.toInt()
private const val SKIPPABLE_MAGIC = 0x184D2A50

// Godot 4 compiles a script to tokens: a 16 byte header (identifier, constant, line and token counts), the
// identifiers (a length, then one XOR 0xB6B6B6B6 UTF-32 code unit each), the constants (Variants), a line and a column
// map (token index, value) of `lines * 8` bytes each, and the tokens, 8 bytes each. A token is its type in the low 7
// bits of the first byte (bit 7 set) with the identifier or constant index in bits 8 to 31, and its line in the upper
// 32 bits. The maps mark the first token of each statement, from which Godot rebuilds newlines and indentation, so
// they follow every token that moves.
private const val TOKEN_IDENTIFIER = 2
private const val TOKEN_LITERAL = 3
private const val TOKEN_STAR = 24
private const val TOKEN_EQUAL = 28
private const val TOKEN_IF = 40
private const val TOKEN_PLUS_EQUAL = 29
private const val TOKEN_CONST = 57
private const val TOKEN_FUNC = 60
private const val TOKEN_VAR = 70
private const val TOKEN_PAREN_OPEN = 77
private const val TOKEN_PAREN_CLOSE = 78
private const val TOKEN_SEMICOLON = 80
private const val TOKEN_COLON = 84

/** The line of a token, in its upper 32 bits. */
private const val TOKENS_ADDED = 4
private const val LINE_MASK = -0x100000000L
private const val KEEP_TYPE_AND_LINE = LINE_MASK or 0xFFL

/** Number of floats (4 or 8 bytes each) in the fixed-size Variant types that can hold constants. */
private val FLOAT_PARTS = mapOf(5 to 2, 7 to 4, 9 to 3, 11 to 4, 13 to 4, 14 to 4, 19 to 4)

/** Number of ints (always 4 bytes each) in the fixed-size Variant types that can hold constants. */
private val INT_PARTS = mapOf(6 to 2, 8 to 4, 10 to 3, 12 to 4)

/** Returns the offset after the Variant that starts at [start]. */
private fun variantEnd(buffer: ByteBuffer, start: Int): Int {
    val header = buffer.getInt(start)
    val wide = header and (1 shl 16) != 0
    var offset = start + 4
    val type = header and 0xFFFF
    return when (type) {
        0 -> offset
        1 -> offset + 4
        2, 3 -> offset + if (wide) 8 else 4
        4, 20, 21 -> offset + 4 + ((buffer.getInt(offset) + 3) and 3.inv())
        26, 27 -> {
            val count = buffer.getInt(offset) and 0x7FFFFFFF
            offset += 4
            repeat(if (type == 26) count * 2 else count) { offset = variantEnd(buffer, offset) }
            offset
        }
        else -> offset + (FLOAT_PARTS[type]?.times(if (wide) 8 else 4) ?: INT_PARTS[type]?.times(4)
            ?: throw PatchException("Warung Life: constant of type $type in $SCRIPT is not supported."))
    }
}

/** The tokens of `game_state.gdc` as an editable list, with its identifiers and int constants looked up by name. */
internal class GameScript(private val data: ByteArray) {
    private val buffer = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
    private val names = HashMap<String, Int>()
    private val ints = HashMap<Int, Int>()
    private var trueConstant = -1
    private val floats = HashMap<Double, Int>()
    private val floatAt = HashMap<Int, Double>()
    private val constantsEnd: Int
    private val lines = ArrayList<Pair<Int, Int>>()
    private val columns = ArrayList<Pair<Int, Int>>()
    private val tokens = ArrayList<Long>()
    private val identifierCount = buffer.getInt(0)
    private val constantCount = buffer.getInt(4)

    init {
        val lineCount = buffer.getInt(8)
        val tokenCount = buffer.getInt(12)
        var offset = 16
        repeat(identifierCount) { index ->
            val length = buffer.getInt(offset)
            val name = CharArray(length) { (buffer.getInt(offset + 4 + it * 4) xor 0xB6B6B6B6.toInt()).toChar() }
            names.putIfAbsent(String(name), index)
            offset += 4 + length * 4
        }
        repeat(constantCount) { index ->
            if (buffer.getInt(offset) == 2) ints.putIfAbsent(buffer.getInt(offset + 4), index)
            if (buffer.getInt(offset) == 1 && buffer.getInt(offset + 4) != 0 && trueConstant < 0) trueConstant = index
            val kind = buffer.getInt(offset)
            if (kind and 0xFFFF == 3) {
                val value = if (kind and (1 shl 16) != 0) buffer.getDouble(offset + 4) else buffer.getFloat(offset + 4).toDouble()
                floats.putIfAbsent(value, index)
                floatAt[index] = value
            }
            offset = variantEnd(buffer, offset)
        }
        constantsEnd = offset
        if (offset != data.size - tokenCount * 8 - lineCount * 16) {
            throw PatchException("Warung Life: $SCRIPT has an unexpected layout.")
        }
        repeat(lineCount) { lines += buffer.getInt(offset + it * 8) to buffer.getInt(offset + it * 8 + 4) }
        offset += lineCount * 8
        repeat(lineCount) { columns += buffer.getInt(offset + it * 8) to buffer.getInt(offset + it * 8 + 4) }
        offset += lineCount * 8
        repeat(tokenCount) { tokens += buffer.getLong(offset + it * 8) }
    }

    private fun type(index: Int): Int = (tokens[index] and 0x7F).toInt()

    private fun data(index: Int): Int = ((tokens[index] shr 8) and 0xFFFFFF).toInt()

    private fun isIdentifier(index: Int, name: String): Boolean =
        type(index) == TOKEN_IDENTIFIER && data(index) == identifier(name)

    private fun identifier(name: String): Int = names[name] ?: throw PatchException("Warung Life: $name not found.")

    /** The index of the constant holding the int [value], which must already be in the script. */
    fun intConstant(value: Int): Int =
        ints[value] ?: throw PatchException("Warung Life: $SCRIPT has no constant $value; use one of ${ints.keys.sorted()}.")

    /** Points the literal of `const NAME := <literal>` at [constant]; the old one is shared, so only this token changes. */
    fun setConstant(name: String, constant: Int) {
        val at = (1 until tokens.size - 3).filter {
            isIdentifier(it, name) && type(it - 1) == TOKEN_CONST && type(it + 1) == TOKEN_COLON &&
                type(it + 2) == TOKEN_EQUAL && type(it + 3) == TOKEN_LITERAL
        }
        if (at.size != 1) throw PatchException("Warung Life: expected one declaration of $name, found ${at.size}.")
        tokens[at[0] + 3] = (tokens[at[0] + 3] and KEEP_TYPE_AND_LINE) or (constant.toLong() shl 8)
    }

    private fun insert(index: Int, new: List<Long>) {
        tokens.addAll(index, new)
        for (map in listOf(lines, columns)) map.replaceAll { if (it.first >= index) it.first + new.size to it.second else it }
    }

    private fun delete(index: Int) {
        if (lines.any { it.first == index }) throw PatchException("Warung Life: token $index starts a statement.")
        tokens.removeAt(index)
        for (map in listOf(lines, columns)) map.replaceAll { if (it.first > index) it.first - 1 to it.second else it }
    }

    /**
     * Makes the sale in `jual` pay [factor] times: `var harga := harga_jual(id)` becomes `harga_jual(id) * factor`.
     * Two `:=` of other variables in the function lose their colon (`var b = ...`, the same code without the type
     * hint), so the script keeps its token count and the start of the file stays as the game wrote it.
     */
    fun multiplySale(factor: Int) {
        val function = (0 until tokens.size - 1).filter { type(it) == TOKEN_FUNC && isIdentifier(it + 1, "jual") }
        if (function.size != 1) throw PatchException("Warung Life: expected one jual function, found ${function.size}.")
        val body = function[0] until ((function[0] + 2 until tokens.size).firstOrNull { type(it) == TOKEN_FUNC } ?: tokens.size)
        fun declaration(name: String): Int = body.filter {
            type(it) == TOKEN_VAR && isIdentifier(it + 1, name) && type(it + 2) == TOKEN_COLON && type(it + 3) == TOKEN_EQUAL
        }.also { if (it.size != 1) throw PatchException("Warung Life: expected one `var $name :=` in jual.") }[0] + 2

        val price = declaration("harga")
        if (!isIdentifier(price + 2, "harga_jual") || type(price + 3) != TOKEN_PAREN_OPEN || type(price + 5) != TOKEN_PAREN_CLOSE) {
            throw PatchException("Warung Life: unexpected price in jual.")
        }
        val colons = listOf(declaration("b"), declaration("modal"))
        val line = tokens[price + 5] and LINE_MASK
        val literal = (line or 0x80L or TOKEN_LITERAL.toLong()) or (intConstant(factor).toLong() shl 8)
        val star = line or 0x80L or TOKEN_STAR.toLong()
        insert(price + 6, listOf(star, literal))
        // The colons come out from the back, so the indexes of the ones still to remove stay put.
        colons.sortedDescending().forEach { delete(if (it > price) it + 2 else it) }
    }

    /**
     * Pays [amount] into the wallet at the start of every day: `uang += amount` joins the first statement of
     * `_kosongkan_catatan_hari`, which runs when a day begins, after a `;` so the line map needs no new entry. The
     * [TOKENS_ADDED] tokens are paid for with as many `:=` in later functions that lose their colon.
     */
    fun addDailyBonus(amount: Int) {
        val function = (0 until tokens.size - 1).filter { type(it) == TOKEN_FUNC && isIdentifier(it + 1, "_kosongkan_catatan_hari") }
        if (function.size != 1) throw PatchException("Warung Life: expected one _kosongkan_catatan_hari, found ${function.size}.")
        val starts = lines.map { it.first }.filter { it > function[0] }.sorted()
        val first = starts[0]
        val second = starts[1]
        if (second - first != 3 || type(first) != TOKEN_IDENTIFIER || type(first + 1) != TOKEN_EQUAL || type(first + 2) != TOKEN_LITERAL) {
            throw PatchException("Warung Life: unexpected start of _kosongkan_catatan_hari.")
        }
        val line = tokens[second - 1] and LINE_MASK
        val wallet = (identifier("uang").toLong() shl 8) or 0x80L or TOKEN_IDENTIFIER.toLong()
        val literal = (intConstant(amount).toLong() shl 8) or 0x80L or TOKEN_LITERAL.toLong()
        val colons = (second until tokens.size - 4).filter {
            type(it) == TOKEN_VAR && type(it + 1) == TOKEN_IDENTIFIER && type(it + 2) == TOKEN_COLON && type(it + 3) == TOKEN_EQUAL
        }.take(TOKENS_ADDED).map { it + 2 + TOKENS_ADDED }
        if (colons.size < TOKENS_ADDED) throw PatchException("Warung Life: not enough `:=` to keep the token count.")
        insert(
            second,
            listOf(line or 0x80L or TOKEN_SEMICOLON.toLong(), line or wallet, line or 0x80L or TOKEN_PLUS_EQUAL.toLong(), line or literal),
        )
        // From the back, so the indexes of the colons still to remove stay put.
        colons.sortedDescending().forEach { delete(it) }
    }

    /**
     * Gives the player the outfit that testers get. `_cek_tester` grants it when the build is in its test period, so its
     * `if masa_uji:` becomes `if true:`.
     */
    fun unlockTesterOutfit() {
        if (trueConstant < 0) throw PatchException("Warung Life: $SCRIPT has no true constant.")
        val function = (0 until tokens.size - 1).filter { type(it) == TOKEN_FUNC && isIdentifier(it + 1, "_cek_tester") }
        if (function.size != 1) throw PatchException("Warung Life: expected one _cek_tester, found ${function.size}.")
        val check = (function[0] until tokens.size - 1).filter { type(it) == TOKEN_IF && isIdentifier(it + 1, "masa_uji") }
        if (check.isEmpty()) throw PatchException("Warung Life: the test period check was not found.")
        tokens[check[0] + 1] = (tokens[check[0] + 1] and LINE_MASK) or (trueConstant.toLong() shl 8) or 0x80L or TOKEN_LITERAL.toLong()
    }

    /**
     * Makes the legendary fish [percent] percent of the catches from its group instead of 0.6. `acak_hasil_alam` rolls
     * `randf() * 100.0 < 0.6` for it, so the 100.0 there becomes `60.0 / percent`, a float already in the table
     * (5, 10, 25, 50, 75 and 100 percent all land on one).
     */
    fun setLegendaryChance(percent: Int) {
        val function = (0 until tokens.size - 1).filter { type(it) == TOKEN_FUNC && isIdentifier(it + 1, "acak_hasil_alam") }
        if (function.size != 1) throw PatchException("Warung Life: expected one acak_hasil_alam, found ${function.size}.")
        val body = function[0] until ((function[0] + 2 until tokens.size).firstOrNull { type(it) == TOKEN_FUNC } ?: tokens.size)
        val rolls = body.filter {
            isIdentifier(it, "randf") && type(it + 1) == TOKEN_PAREN_OPEN && type(it + 2) == TOKEN_PAREN_CLOSE &&
                type(it + 3) == TOKEN_STAR && type(it + 4) == TOKEN_LITERAL && floatAt[data(it + 4)] == 100.0
        }
        if (rolls.size != 1) throw PatchException("Warung Life: expected one legendary roll, found ${rolls.size}.")
        val scale = 60.0 / percent
        val constant = floats[scale] ?: throw PatchException("Warung Life: $SCRIPT has no constant $scale; use another factor.")
        tokens[rolls[0] + 4] = (tokens[rolls[0] + 4] and KEEP_TYPE_AND_LINE) or (constant.toLong() shl 8)
    }

    /** The script with its edits, laid out as the game wrote it. */
    fun toBytes(): ByteArray {
        val out = ByteBuffer.allocate(constantsEnd + (lines.size + columns.size) * 8 + tokens.size * 8)
            .order(ByteOrder.LITTLE_ENDIAN)
        out.put(data, 0, constantsEnd).putInt(12, tokens.size)
        for (map in listOf(lines, columns)) map.forEach { out.putInt(it.first).putInt(it.second) }
        tokens.forEach { out.putLong(it) }
        return out.array()
    }
}

private fun blockHeader(bytes: ByteArray, at: Int): Int =
    (bytes[at].toInt() and 0xFF) or ((bytes[at + 1].toInt() and 0xFF) shl 8) or ((bytes[at + 2].toInt() and 0xFF) shl 16)

/**
 * Packs [data] into the zstd frame of [script], keeping the first blocks that lie before [editedFrom] as they are (a
 * run of blocks is a frame of its own once the last one is marked) and encoding only the rest. The game only loads the
 * script when it has its original size, so the result is padded to exactly that with a skippable frame.
 */
private fun pack(script: ByteArray, data: ByteArray, editedFrom: Int): ByteArray {
    val source = ByteBuffer.wrap(script).order(ByteOrder.LITTLE_ENDIAN)
    if (source.getInt(12) != ZSTD_MAGIC || script[16] != 0xA0.toByte()) {
        throw PatchException("Warung Life: $SCRIPT is not a single zstd frame with its size set.")
    }
    // The original frame header is 9 bytes (magic, descriptor, content size); the first block starts at 21.
    val decompressor = ZstdDecompressor()
    val readBack = ByteArray(data.size)
    var end = 21
    var best: ByteArray? = null
    var copied = 0
    while (true) {
        val header = blockHeader(script, end)
        if (header and 1 != 0 || (header shr 1) and 3 != 2) break
        // A frame of its own has no content size, because blocks do not decode to a fixed length: magic, descriptor
        // (no content size, no checksum), a 2 MiB window and the blocks so far, the last one marked as last.
        val blocks = script.copyOfRange(21, end + 3 + (header shr 3))
        val prefix = ByteBuffer.allocate(6 + blocks.size).order(ByteOrder.LITTLE_ENDIAN)
            .putInt(ZSTD_MAGIC).put(0).put(0x58).put(blocks).array()
        prefix[6 + end - 21] = (prefix[6 + end - 21].toInt() or 1).toByte()
        val length = decompressor.decompress(prefix, 0, prefix.size, readBack, 0, readBack.size)
        if (length > editedFrom) break
        best = prefix
        copied = length
        end += 3 + (header shr 3)
    }
    val prefix = best ?: throw PatchException("Warung Life: $SCRIPT is edited too early to keep its first block.")

    val rest = data.copyOfRange(copied, data.size)
    val compressor = ZstdCompressor()
    val encoded = ByteArray(compressor.maxCompressedLength(rest.size))
    val encodedSize = compressor.compress(rest, 0, rest.size, encoded, 0, encoded.size)

    val padding = script.size - 12 - prefix.size - encodedSize
    if (padding < 8) throw PatchException("Warung Life: no room to keep $SCRIPT at its original size.")
    val out = ByteBuffer.allocate(script.size).order(ByteOrder.LITTLE_ENDIAN)
    out.put(script, 0, 8).putInt(data.size).put(prefix).put(encoded, 0, encodedSize)
    out.putInt(SKIPPABLE_MAGIC).putInt(padding - 8)

    // Both frames are read back; the padding is a skippable frame that is not decoded.
    decompressor.decompress(out.array(), 12, prefix.size, readBack, 0, copied)
    decompressor.decompress(out.array(), 12 + prefix.size, encodedSize, readBack, copied, rest.size)
    if (!readBack.contentEquals(data)) throw PatchException("Warung Life: the repacked $SCRIPT does not read back.")
    return out.array()
}

private val edits = mutableListOf<(GameScript) -> Unit>()

/** Runs [edit] on the game's state script once every patch has asked for its change. */
internal fun editGameScript(edit: (GameScript) -> Unit) {
    edits += edit
}

/** Rewrites `game_state.gdc` once, after every patch that edits it has executed. */
internal val gameScriptPatch = rawResourcePatch {
    finalize {
        val requested = edits.toList()
        edits.clear()
        if (requested.isEmpty()) return@finalize
        val file = get(SCRIPT)
        val script = file.readBytes()
        val header = ByteBuffer.wrap(script).order(ByteOrder.LITTLE_ENDIAN)
        if (script.size < 21 || String(script, 0, 4, Charsets.US_ASCII) != "GDSC" || header.getInt(4) != 101 || header.getInt(8) == 0) {
            throw PatchException("Warung Life: $SCRIPT is not a compressed version 101 GDScript.")
        }
        val original = ByteArray(header.getInt(8))
        ZstdDecompressor().decompress(script, 12, script.size - 12, original, 0, original.size)
        val edited = GameScript(original).also { game -> requested.forEach { it(game) } }.toBytes()
        val editedFrom = original.indices.firstOrNull { it >= edited.size || original[it] != edited[it] } ?: return@finalize
        file.writeBytes(pack(script, edited, editedFrom))
    }
}
