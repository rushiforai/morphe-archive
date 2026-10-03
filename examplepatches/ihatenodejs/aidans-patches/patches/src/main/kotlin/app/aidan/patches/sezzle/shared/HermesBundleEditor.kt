package app.aidan.patches.sezzle.shared

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

/**
 * Utility for reading and in-place patching of Hermes bytecode bundles (HBC v98+).
 */
class HermesBundleEditor(private val data: ByteArray) {

    private val buffer: ByteBuffer = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)

    val version: Int
    val functionCount: Int
    val stringKindCount: Int
    val idCount: Int
    val stringCount: Int
    val overflowStringCount: Int
    val stringStorageSize: Int

    private val funcHeadersOffset = 128
    private val funcHeaderSize: Int
    private val stringKindsOffset: Int
    private val idHashesOffset: Int
    private val smallStringTableOffset: Int
    private val overflowTableOffset: Int
    private val stringStorageOffset: Int

    private val overflowEntries: List<Pair<Int, Int>>
    private val stringCache = mutableMapOf<Int, String>()
    private val reverseStringCache = mutableMapOf<String, Int>()

    init {
        val magic = buffer.getLong(0)
        require(magic == -0x60e6f21ef443e03aL || magic == 0x1f1903c103bc1fc6L) {
            "Invalid Hermes bytecode magic: ${java.lang.Long.toHexString(magic)}"
        }

        version = buffer.getInt(8)
        functionCount = buffer.getInt(40)
        stringKindCount = buffer.getInt(44)
        idCount = buffer.getInt(48)
        stringCount = buffer.getInt(52)
        overflowStringCount = buffer.getInt(56)
        stringStorageSize = buffer.getInt(60)

        funcHeaderSize = if (version >= 98) 12 else 16

        var pos = funcHeadersOffset + functionCount * funcHeaderSize
        pos = align4(pos)
        stringKindsOffset = pos
        pos += stringKindCount * 4

        pos = align4(pos)
        idHashesOffset = pos
        pos += idCount * 4

        pos = align4(pos)
        smallStringTableOffset = pos
        pos += stringCount * 4

        pos = align4(pos)
        overflowTableOffset = pos
        pos += overflowStringCount * 8

        pos = align4(pos)
        stringStorageOffset = pos

        val overflows = ArrayList<Pair<Int, Int>>(overflowStringCount)
        for (i in 0 until overflowStringCount) {
            val off = buffer.getInt(overflowTableOffset + i * 8)
            val len = buffer.getInt(overflowTableOffset + i * 8 + 4)
            overflows.add(Pair(off, len))
        }
        overflowEntries = overflows
    }

    private fun align4(pos: Int): Int = (pos + 3) and 3.inv()

    fun getString(id: Int): String {
        stringCache[id]?.let { return it }
        require(id in 0 until stringCount) { "String id $id out of bounds (0 until $stringCount)" }

        val entryVal = buffer.getInt(smallStringTableOffset + id * 4)
        val isUtf16 = (entryVal and 1) != 0
        var strOff = (entryVal ushr 1) and 0x7FFFFF
        var strLen = entryVal ushr 24

        if (strLen == 0xFF) {
            val overflow = overflowEntries[strOff]
            strOff = overflow.first
            strLen = overflow.second
        }

        val byteLen = if (isUtf16) strLen * 2 else strLen
        val absOff = stringStorageOffset + strOff

        val str = if (isUtf16) {
            String(data, absOff, byteLen, Charsets.UTF_16LE)
        } else {
            String(data, absOff, byteLen, Charsets.ISO_8859_1)
        }

        stringCache[id] = str
        reverseStringCache[str] = id
        return str
    }

    fun findStringId(target: String): Int? {
        reverseStringCache[target]?.let { return it }
        for (i in 0 until stringCount) {
            if (getString(i) == target) {
                return i
            }
        }
        return null
    }

    /**
     * Reuses an inert string-table entry as fixed-size storage for a replacement string.
     *
     * Hermes bytecode stores offsets to later sections, so growing the string table would
     * invalidate the bundle. The donor MUST be an unused development source-path string
     * with enough storage for [replacement].
     */
    fun replaceStringUsingDonor(target: String, replacement: String, donor: String) {
        val targetId = findStringId(target) ?: error("Missing target string: $target")
        val donorId = findStringId(donor) ?: error("Missing donor string: $donor")
        val replacementBytes = replacement.toByteArray(Charsets.ISO_8859_1)

        val donorEntry = buffer.getInt(smallStringTableOffset + donorId * 4)
        require((donorEntry and 1) == 0) { "Donor string must use single-byte encoding" }
        val donorOffset = (donorEntry ushr 1) and 0x7FFFFF
        val donorLength = donorEntry ushr 24
        require(donorLength != 0xFF && replacementBytes.size <= donorLength) {
            "Donor string is too short: $donor"
        }

        val donorStorageOffset = stringStorageOffset + donorOffset
        replacementBytes.copyInto(data, donorStorageOffset)
        data.fill(0, donorStorageOffset + replacementBytes.size, donorStorageOffset + donorLength)

        val replacementEntry = (replacementBytes.size shl 24) or (donorOffset shl 1)
        buffer.putInt(smallStringTableOffset + donorId * 4, replacementEntry)
        buffer.putInt(smallStringTableOffset + targetId * 4, replacementEntry)
        stringCache.remove(targetId)
        stringCache.remove(donorId)
        reverseStringCache.remove(target)
        reverseStringCache.remove(donor)
        reverseStringCache[replacement] = targetId
    }

    /**
     * Reads the indexed function's code offset, name ID, and overflow-header metadata.
     * Offsets are absolute byte offsets in the bundle. Bytecode size is read for v98+
     * and reported as zero for older versions; largeHeaderOffset is zero for small headers.
     *
     * @throws IllegalArgumentException if [funcIndex] is outside 0 until [functionCount].
     * @throws IndexOutOfBoundsException if the bundle's header data is out of bounds.
     */
    fun getFunctionHeader(funcIndex: Int): FunctionHeaderInfo {
        require(funcIndex in 0 until functionCount) { "Function index $funcIndex out of bounds" }
        val headerOffset = funcHeadersOffset + funcIndex * funcHeaderSize

        if (version >= 98) {
            val word0 = buffer.getInt(headerOffset)
            val word1 = buffer.getInt(headerOffset + 4)
            val byte11 = data[headerOffset + 11].toInt() and 0xFF

            val offset = word0 and 0x01FFFFFF
            val funcName = (word1 ushr 14) and 0xFF
            val isOverflowed = (byte11 and 0x20) != 0

            return if (isOverflowed) {
                val largeOffset = (funcName shl 24) or (offset and 0x00FFFFFF)
                val largeCodeOffset = buffer.getInt(largeOffset)
                val largeBytecodeSize = buffer.getInt(largeOffset + 12)
                val largeFuncName = buffer.getInt(largeOffset + 16)
                FunctionHeaderInfo(largeCodeOffset, largeFuncName, largeBytecodeSize, true, largeOffset)
            } else {
                val bytecodeSize = word1 and 0x3FFF
                FunctionHeaderInfo(offset, funcName, bytecodeSize, false, 0)
            }
        } else {
            val word0 = buffer.getInt(headerOffset)
            val word1 = buffer.getInt(headerOffset + 4)
            val byte15 = data[headerOffset + 15].toInt() and 0xFF

            val offset = word0 and 0x01FFFFFF
            val funcName = word1 ushr 15
            val isOverflowed = (byte15 and 0x20) != 0

            return if (isOverflowed) {
                val infoOffset = buffer.getInt(headerOffset + 8) and 0x01FFFFFF
                val largeCodeOffset = buffer.getInt(infoOffset)
                val largeFuncName = buffer.getInt(infoOffset + 12)
                FunctionHeaderInfo(largeCodeOffset, largeFuncName, 0, true, infoOffset)
            } else {
                FunctionHeaderInfo(offset, funcName, 0, false, 0)
            }
        }
    }

    /**
     * Redirects a function header to a new code offset and bytecode size in HBC v98+ bundles.
     * Updates either the small header fields or the large header fields as appropriate,
     * preserving all other metadata. Offsets are absolute byte offsets in the bundle;
     * sizes are in bytes. This does not move code, validate the new code range against
     * the bundle size, or update the footer hash.
     *
     * @throws IllegalArgumentException if the version is below 98, the function index
     * is out of range, the new offset is outside 0..0x01FFFFFF, the size is outside
     * 0..0x3FFF, or the resolved large-header range is invalid.
     * @throws IndexOutOfBoundsException if reading the small header exceeds the bundle.
     */
    fun redirectFunctionHeader(funcIndex: Int, newCodeOffset: Int, newBytecodeSize: Int) {
        require(version >= 98) { "Header redirection only supported for HBC v98+" }
        require(funcIndex in 0 until functionCount) { "Function index $funcIndex out of bounds" }
        require(newCodeOffset in 0..0x01FFFFFF) { "Code offset $newCodeOffset exceeds 25 bits" }
        require(newBytecodeSize in 0..0x3FFF) { "Bytecode size $newBytecodeSize exceeds 14 bits" }

        val headerOffset = funcHeadersOffset + funcIndex * funcHeaderSize
        val word0 = buffer.getInt(headerOffset)
        val word1 = buffer.getInt(headerOffset + 4)
        val byte11 = data[headerOffset + 11].toInt() and 0xFF
        val isOverflowed = (byte11 and 0x20) != 0

        if (isOverflowed) {
            val offset = word0 and 0x01FFFFFF
            val funcName = (word1 ushr 14) and 0xFF
            val largeOffset = (funcName shl 24) or (offset and 0x00FFFFFF)
            require(largeOffset >= 0 && largeOffset + 16 <= data.size) {
                "Invalid large header offset: $largeOffset"
            }
            buffer.putInt(largeOffset, newCodeOffset)
            buffer.putInt(largeOffset + 12, newBytecodeSize)
        } else {
            val newWord0 = (word0 and 0x01FFFFFF.inv()) or (newCodeOffset and 0x01FFFFFF)
            val newWord1 = (word1 and 0x3FFF.inv()) or (newBytecodeSize and 0x3FFF)
            buffer.putInt(headerOffset, newWord0)
            buffer.putInt(headerOffset + 4, newWord1)
        }
    }

    fun matchesBytes(offset: Int, expected: ByteArray): Boolean {
        if (offset < 0 || offset + expected.size > data.size) return false
        return data.copyOfRange(offset, offset + expected.size).contentEquals(expected)
    }

    fun findFunctionOffsetByName(functionName: String, predicate: (codeOffset: Int) -> Boolean = { true }): Int? {
        val nameId = findStringId(functionName) ?: return null
        for (i in 0 until functionCount) {
            val hdr = getFunctionHeader(i)
            if (hdr.functionNameId == nameId && predicate(hdr.codeOffset)) {
                return hdr.codeOffset
            }
        }
        return null
    }

    fun findFunctionOffsetsByName(functionName: String): List<Int> {
        val nameId = findStringId(functionName) ?: return emptyList()
        val offsets = mutableListOf<Int>()
        for (i in 0 until functionCount) {
            val hdr = getFunctionHeader(i)
            if (hdr.functionNameId == nameId) {
                offsets.add(hdr.codeOffset)
            }
        }
        return offsets
    }

    fun patchBytes(offset: Int, bytes: ByteArray) {
        System.arraycopy(bytes, 0, data, offset, bytes.size)
    }

    fun patchBytesIfMatches(offset: Int, expected: ByteArray, replacement: ByteArray) {
        require(expected.size == replacement.size) { "Patch must preserve bytecode size" }
        require(data.copyOfRange(offset, offset + expected.size).contentEquals(expected)) {
            "Unexpected bytecode at offset $offset"
        }
        System.arraycopy(replacement, 0, data, offset, replacement.size)
    }

    fun updateFooterHash() {
        val md = MessageDigest.getInstance("SHA-1")
        md.update(data, 0, data.size - 20)
        val hash = md.digest()
        System.arraycopy(hash, 0, data, data.size - 20, 20)
    }

    fun toByteArray(): ByteArray = data

    data class FunctionHeaderInfo(
        val codeOffset: Int,
        val functionNameId: Int,
        val bytecodeSize: Int = 0,
        val isOverflowed: Boolean = false,
        val largeHeaderOffset: Int = 0
    )
}
