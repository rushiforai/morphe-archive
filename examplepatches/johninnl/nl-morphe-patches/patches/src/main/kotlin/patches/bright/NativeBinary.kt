package patches.bright

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

internal data class NativeRange(val name: String, val address: Long, val size: Int, val sha256: String)
internal data class NativeEdit(val function: NativeRange, val address: Long, val before: ByteArray, val after: ByteArray)

private data class NativeImage(val elfClass: Int, val machine: Int, val size: Int, val sha256: String)
private val images = mapOf(
    // nl.bright.pro 10.181.0 (2026072000) audited five-APK Play split set.
    "arm64-v8a" to NativeImage(2, 183, 7275440, "7473bdeb14b277dcfc7d407e8a84e3dfcfcd6f8427963e88cbd50a6ecaab12a5"),
)
internal val nativeAbis: Set<String> get() = images.keys

internal fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }

private data class Segment(val address: Long, val offset: Long, val size: Long, val executable: Boolean)

/** Read only the declared little-endian ELF layout; never guess file == virtual offsets. */
private class Elf(private val data: ByteArray, abi: String) {
    private val format = images[abi] ?: error("Unsupported Bright ABI set: $abi")
    private val buffer = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
    private val segments: List<Segment>

    private fun u16(at: Int) = buffer.getShort(at).toInt() and 0xffff
    private fun u32(at: Int) = buffer.getInt(at).toLong() and 0xffffffffL
    private fun u64(at: Int): Long = buffer.getLong(at).also { check(it >= 0) { "Invalid ELF range" } }
    private fun bounded(start: Long, length: Long, limit: Long, label: String) {
        check(start >= 0 && length >= 0 && start <= limit && length <= limit - start) { "Invalid ELF $label" }
    }

    init {
        check(data.size >= 64 && data[0] == 0x7f.toByte() && data[1] == 'E'.code.toByte() &&
            data[2] == 'L'.code.toByte() && data[3] == 'F'.code.toByte()) { "Invalid ELF header" }
        check(data[4].toInt() == format.elfClass) { "Unsupported ELF class" }
        check(data[5].toInt() == 1) { "Expected little-endian ELF" }
        check(data[6].toInt() == 1 && u32(20) == 1L && u16(16) == 3) { "Unsupported ELF header" }
        check(u16(18) == format.machine) { "Unsupported ELF machine" }
        check(data.size >= 64) { "Truncated ELF header" }
        check(u16(52) == 64) { "Invalid ELF header size" }
        val table = u64(32)
        val entrySize = u16(54)
        val count = u16(56)
        check(entrySize == 56) { "Unsupported ELF program table entry" }
        check(count > 0 && count < 0xffff) { "Unsupported ELF program table count" }
        bounded(table, entrySize.toLong() * count, data.size.toLong(), "program table")
        segments = (0 until count).mapNotNull { index ->
            val at = (table + index.toLong() * entrySize).toInt()
            if (u32(at) != 1L) return@mapNotNull null
            val offset = u64(at + 8)
            val address = u64(at + 16)
            val size = u64(at + 32)
            val memorySize = u64(at + 40)
            val flags = u32(at + 4)
            val alignment = u64(at + 48)
            bounded(offset, size, data.size.toLong(), "segment bounds")
            bounded(address, memorySize, Long.MAX_VALUE, "segment range")
            check(size <= memorySize) { "Invalid ELF segment bounds" }
            check(alignment <= 1 || (alignment and (alignment - 1) == 0L &&
                address % alignment == offset % alignment)) { "Invalid ELF segment alignment" }
            Segment(address, offset, size, flags and 1L != 0L)
        }
        check(segments.any { it.executable && it.size > 0 }) { "Missing executable ELF segment" }
    }

    fun offset(address: Long, size: Int): Int {
        check(size > 0) { "Invalid native range size" }
        bounded(address, size.toLong(), Long.MAX_VALUE, "range")
        val matches = segments.filter { segment ->
            segment.executable && address >= segment.address &&
                address - segment.address <= segment.size && size.toLong() <= segment.size - (address - segment.address)
        }
        check(matches.size == 1) { "Native range is not uniquely executable" }
        return (matches.single().let { it.offset + address - it.address }).toInt()
    }
}

/** Called before any mutation and again on canonical inputs during policy composition. */
internal fun validateNativeInputs(inputs: Map<String, ByteArray>) {
    check(inputs.keys == images.keys) { "Unexpected Bright ABI set" }
    inputs.forEach { (abi, input) ->
        Elf(input, abi)
        val expected = images.getValue(abi)
        check(input.size == expected.size && input.sha256() == expected.sha256) { "Unexpected Bright image hash: $abi" }
    }
}

/**
 * Produce a new image only after the complete ownership/preimage set is checked.
 * Prior policies are restored only when every previously owned byte matches exactly.
 */
internal fun transformNative(abi: String, input: ByteArray, edits: List<NativeEdit>, prior: List<NativeEdit>): ByteArray {
    val elf = Elf(input, abi)
    val width = 4
    val all = prior + edits
    all.forEach { edit ->
        val function = edit.function
        check(function.size > 0 && function.address >= 0 && function.address <= Long.MAX_VALUE - function.size) { "Invalid native range" }
        check(edit.before.isNotEmpty() && edit.before.size == edit.after.size) { "Native edit size changed" }
        check(function.address % width == 0L && function.size % width == 0 &&
            edit.address % width == 0L && edit.before.size % width == 0) { "Invalid native alignment" }
        check(edit.address >= function.address && edit.address - function.address <= function.size &&
            edit.before.size <= function.size - (edit.address - function.address)) { "Native edit outside function bounds" }
        elf.offset(function.address, function.size)
    }
    all.sortedBy { it.address }.zipWithNext().forEach { (a, b) ->
        check(a.address <= Long.MAX_VALUE - a.before.size && a.address + a.before.size <= b.address) { "Native edits overlap" }
    }
    val canonical = input.copyOf()
    prior.forEach { edit ->
        val offset = elf.offset(edit.address, edit.after.size)
        check(canonical.copyOfRange(offset, offset + edit.after.size).contentEquals(edit.after)) { "Unexpected prior native bytes" }
        edit.before.copyInto(canonical, offset)
    }
    all.map { it.function }.distinct().forEach { function ->
        val offset = elf.offset(function.address, function.size)
        check(canonical.copyOfRange(offset, offset + function.size).sha256() == function.sha256) { "Native function hash changed: ${function.name}" }
    }
    edits.forEach { edit ->
        val offset = elf.offset(edit.address, edit.before.size)
        check(canonical.copyOfRange(offset, offset + edit.before.size).contentEquals(edit.before)) { "Native instruction preimage changed" }
    }
    val expected = images.getValue(abi)
    check(canonical.size == expected.size && canonical.sha256() == expected.sha256) { "Unexpected Bright image hash: $abi" }
    return input.copyOf().also { output ->
        edits.forEach { edit -> edit.after.copyInto(output, elf.offset(edit.address, edit.after.size)) }
    }
}
