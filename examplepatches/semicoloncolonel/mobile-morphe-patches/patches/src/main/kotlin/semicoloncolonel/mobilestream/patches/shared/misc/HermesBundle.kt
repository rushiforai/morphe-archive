package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

// ─────────────────────────────────────────────────────────────────────────────
// A React Native app's Hermes bytecode bundle (assets/index.android.bundle),
// for patches that change what a named JavaScript function returns.
//
// Hermes keeps each function's source name in the bundle, so a function is
// found by name rather than by its position or bytes. Bytecode versions 96 and
// 98 are read; any other version fails the patch rather than guessing at a
// layout. After editing, the SHA-1 footer at the end of the file is
// recomputed.
//
// Layout: a 128-byte file header; one header per function, 16 bytes in
// version 96 and 12 in version 98 (a function whose fields do not fit is
// "overflowed", and its full header sits elsewhere in the file); then the
// string kinds, identifier hashes, the string table (4 bytes per string), the
// overflow string table (8 bytes per entry), and the string storage. Version
// 98 also renumbered the opcodes.
// ─────────────────────────────────────────────────────────────────────────────

internal class HermesBundle(private val bytes: ByteArray) {
    enum class Value(val v96: Int, val v98: Int) {
        UNDEFINED(118, 147), NULL(119, 148), TRUE(120, 149), FALSE(121, 150)
    }

    private class Function(val offset: Int, val size: Int, val frameSize: Int, val name: String)

    private val version: Int
    private var stringCountField = 0
    private var stringTableAt = 0
    private var overflowTableAt = 0
    private var storageAt = 0

    private val functions: List<Function>

    init {
        if (bytes.size < 128 || u8(0) != 0xC6 || u8(1) != 0x1F) {
            throw PatchException("Not a Hermes bytecode bundle")
        }
        version = u32(8)
        if (version != 96 && version != 98) throw PatchException("Unsupported Hermes bytecode version $version")
        val headerSize = if (version == 96) 16 else 12

        val functionCount = u32(40)
        val stringKindCount = u32(44)
        val identifierCount = u32(48)
        val stringCount = u32(52)
        val overflowStringCount = u32(56)

        var pos = 128 + functionCount * headerSize
        pos = align(pos) + stringKindCount * 4
        pos = align(pos) + identifierCount * 4
        val stringTable = align(pos)
        val overflowTable = align(stringTable + stringCount * 4)
        val storage = align(overflowTable + overflowStringCount * 8)

        stringCountField = stringCount
        stringTableAt = stringTable
        overflowTableAt = overflowTable
        storageAt = storage

        functions = (0 until functionCount).map { id ->
            val header = 128 + id * headerSize
            val word0 = u32(header)
            val word1 = u32(header + 4)
            if (version == 96) {
                if (u8(header + 15) and 0x20 != 0) {
                    val large = ((u32(header + 8) and 0x1FFFFFF) shl 16) or (word0 and 0x1FFFFFF)
                    Function(u32(large), u32(large + 8), u32(large + 20), stringAt(u32(large + 12)))
                } else {
                    Function(word0 and 0x1FFFFFF, word1 and 0x7FFF, u32(header + 8) ushr 25, stringAt(word1 ushr 15))
                }
            } else {
                // Version 98: word1 is size (14 bits), name (8), number and
                // non-pointer register counts (5 each); then frame size and
                // cache sizes (1 byte each) and the flags byte.
                val name = (word1 ushr 14) and 0xFF
                if (u8(header + 11) and 0x20 != 0) {
                    val large = (name shl 24) or (word0 and 0x1FFFFFF)
                    Function(u32(large), u32(large + 12), u32(large + 28), stringAt(u32(large + 16)))
                } else {
                    Function(word0 and 0x1FFFFFF, word1 and 0x3FFF, u8(header + 8), stringAt(name))
                }
            }
        }
    }

    private fun stringAt(id: Int): String {
        val entry = u32(stringTableAt + id * 4)
        val utf16 = entry and 1 != 0
        var offset = (entry ushr 1) and 0x7FFFFF
        var length = entry ushr 24
        if (length == 0xFF) {
            val overflow = overflowTableAt + offset * 8
            offset = u32(overflow)
            length = u32(overflow + 4)
        }
        val start = storageAt + offset
        return if (utf16) String(bytes, start, length * 2, Charsets.UTF_16LE)
        else String(bytes, start, length, Charsets.ISO_8859_1)
    }

    /**
     * Whether the function's bytecode may load string [id]: its operand bytes
     * appear in the body (2 bytes for an id that fits, as in GetById and
     * LoadConstString, otherwise 4). Used only to tell apart functions that
     * share a name.
     */
    private fun Function.mentions(id: Int): Boolean {
        val width = if (id <= 0xFFFF) 2 else 4
        val operand = ByteArray(width) { ((id ushr (8 * it)) and 0xFF).toByte() }
        for (at in offset..offset + size - width) {
            if (operand.indices.all { bytes[at + it] == operand[it] }) return true
        }
        return false
    }

    /** The one function named [name] that loads every string in [using]. */
    private fun single(name: String, using: List<String>): Function {
        val ids = using.map { text ->
            (0 until stringCountField).firstOrNull { stringAt(it) == text }
                ?: throw PatchException("Hermes string \"$text\" not found")
        }
        val matches = functions.filter { function -> function.name == name && ids.all { function.mentions(it) } }
        if (matches.size != 1) {
            throw PatchException("Hermes function \"$name\" using $using: expected 1, found ${matches.size}")
        }
        return matches.single()
    }

    /**
     * Like [returnAtStart], for a name several functions share: only the
     * function that also loads the string [using] is changed.
     */
    fun returnAtStart(name: String, using: String, value: Value) {
        patch(single(name, listOf(using)), name, value)
    }

    /**
     * Replaces the one occurrence of the instruction bytes [find] with
     * [replace] (the same length) in the function named [name] that loads
     * every string in [using]. The bytes are opcodes of bytecode version
     * [forVersion], and the patch fails on any other version.
     */
    fun replaceInstructions(name: String, using: List<String>, forVersion: Int, find: ByteArray, replace: ByteArray) {
        if (version != forVersion) throw PatchException("Expected Hermes bytecode version $forVersion, found $version")
        if (find.size != replace.size) throw PatchException("Replacement must keep the instruction length")
        val function = single(name, using)
        val hits = (function.offset..function.offset + function.size - find.size).filter { at ->
            find.indices.all { bytes[at + it] == find[it] }
        }
        if (hits.size != 1) {
            throw PatchException("Hermes function \"$name\": expected the instructions once, found ${hits.size}")
        }
        replace.copyInto(bytes, hits.single())
    }

    /**
     * Makes the one function named [name] return [value] at once: its first
     * four bytes become "LoadConst<value> r0; Ret r0". The function must have
     * a frame of at least one register, and the rest of its body is left
     * unreachable. Fails unless exactly one function has that name.
     */
    fun returnAtStart(name: String, value: Value) {
        val matches = functions.filter { it.name == name }
        if (matches.size != 1) {
            throw PatchException("Hermes function $name: expected 1, found ${matches.size}")
        }
        patch(matches.single(), name, value)
    }

    /**
     * The value the one function named [name] was made to return by
     * [returnAtStart], or null when it is unchanged. Lets two patches that
     * would set the same function to different values notice each other.
     */
    fun returnedAtStart(name: String): Value? {
        val function = functions.singleOrNull { it.name == name }
            ?: throw PatchException("Hermes function $name: expected 1")
        if (u8(function.offset + 2) != (if (version == 96) 92 else 118) || u8(function.offset + 3) != 0) return null
        if (u8(function.offset + 1) != 0) return null
        val op = u8(function.offset)
        return Value.entries.firstOrNull { (if (version == 96) it.v96 else it.v98) == op }
    }

    /**
     * Hides the Expo Router tab [tab] in [function], the component that lists
     * the tabs with Tabs.Screen (bytecode version 98 only). A shown tab gets
     * the options object {title: <label>}, built as
     *
     *   NewObjectWithBufferLong  r, <title shape>, <values>
     *   LoadFromEnvironment      x, ...
     *   GetById / GetByIdShort   x, x, <cache>, "<tab>"
     *   PutOwnBySlotIdx          r, x, 0
     *
     * and a hidden one gets {href: null}, which Expo Router leaves out of the
     * tab bar. The object's shape becomes the {href: null} shape that the same
     * function already uses, and the label is no longer written into it: the
     * PutOwnBySlotIdx becomes two LoadConstUndefined of the label register.
     */
    fun hideTab(function: String, tab: String) {
        if (version != 98) throw PatchException("Expected Hermes bytecode version 98, found $version")
        val target = functions.singleOrNull { it.name == function }
            ?: throw PatchException("Hermes function $function: expected 1")
        val id = (0 until stringCountField).firstOrNull { stringAt(it) == tab }
            ?: throw PatchException("Hermes string \"$tab\" not found")
        val end = target.offset + target.size
        val objects = (target.offset until end - 10).filter { u8(it) == 0x02 }
        val sites = objects.mapNotNull { at ->
            if (u8(at + 10) != 0x3B) return@mapNotNull null
            val get = at + 14
            val (strId, put) = when (u8(get)) {
                0x45 -> (u8(get + 4) or (u8(get + 5) shl 8)) to get + 6
                0x44 -> u8(get + 4) to get + 5
                else -> return@mapNotNull null
            }
            val label = u8(get + 1)
            if (strId != id || put + 4 > end) return@mapNotNull null
            if (u8(put) != 0x52 || u8(put + 1) != u8(at + 1) || u8(put + 2) != label || u8(put + 3) != 0) {
                return@mapNotNull null
            }
            Triple(at, put, label)
        }
        val (at, put, label) = sites.singleOrNull()
            ?: throw PatchException("Hermes tab \"$tab\" in $function: expected 1 title object, found ${sites.size}")
        val titleShape = u32(at + 2)
        val values = u32(at + 6)
        // A {href: null} object is used as it is: the next instruction jumps
        // (Jmp, 0xAE) or builds the next object (0x02). Objects that are filled
        // in afterwards, such as {backgroundColor: ...}, are left out.
        val hrefShapes = objects
            .filter { u32(it + 6) == values && u32(it + 2) != titleShape && u8(it + 10) in setOf(0xAE, 0x02) }
            .map { u32(it + 2) }
            .toSet()
        val hrefShape = hrefShapes.singleOrNull()
            ?: throw PatchException("Hermes tab \"$tab\" in $function: expected 1 hidden-tab shape, found ${hrefShapes.size}")
        for (i in 0 until 4) bytes[at + 2 + i] = ((hrefShape ushr (8 * i)) and 0xFF).toByte()
        byteArrayOf(0x93.toByte(), label.toByte(), 0x93.toByte(), label.toByte()).copyInto(bytes, put)
    }

    private fun patch(function: Function, name: String, value: Value) {
        if (function.size < 4 || function.frameSize < 1) {
            throw PatchException("Hermes function $name is too small to patch")
        }
        bytes[function.offset] = (if (version == 96) value.v96 else value.v98).toByte()
        bytes[function.offset + 1] = 0
        bytes[function.offset + 2] = (if (version == 96) 92 else 118).toByte()
        bytes[function.offset + 3] = 0
    }

    /** The bundle with its SHA-1 footer recomputed. */
    fun toByteArray(): ByteArray {
        val footer = MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(0, bytes.size - 20))
        footer.copyInto(bytes, bytes.size - 20)
        return bytes
    }

    private fun u8(at: Int) = bytes[at].toInt() and 0xFF
    private fun u32(at: Int) = u8(at) or (u8(at + 1) shl 8) or (u8(at + 2) shl 16) or (u8(at + 3) shl 24)
    private fun align(at: Int) = (at + 3) and 3.inv()
}

internal const val HERMES_BUNDLE = "assets/index.android.bundle"
