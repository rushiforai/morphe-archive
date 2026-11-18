package patches.detijd

import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

/** One in-place entry edit; byte lengths and all file/function tables stay fixed. */
internal class HermesEdit(
    val name: String,
    val functionId: Int,
    val offset: Int,
    val functionSize: Int,
    val frameSize: Int,
    val params: Int,
    val functionSha256: String,
    before: String,
    after: String,
) {
    val before = before.hexBytes()
    val after = after.hexBytes()
}

private const val BUNDLE_SIZE = 9112324
private const val BUNDLE_SHA256 = "e14787df25e9b2529bd18ee6860332ace0742646282bf4471043070cd8bb8c35"
private const val FUNCTION_COUNT = 39206
private const val HEADER_SIZE = 128
private const val FOOTER_SIZE = 20

private fun String.hexBytes(): ByteArray {
    check(length % 2 == 0 && all { it in '0'..'9' || it in 'a'..'f' }) { "Invalid Hermes edit encoding" }
    return chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

private fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }

private fun ByteArray.footer(): ByteArray = MessageDigest.getInstance("SHA-1").run {
    update(this@footer, 0, this@footer.size - FOOTER_SIZE)
    digest()
}

private fun ByteArray.matches(offset: Int, expected: ByteArray): Boolean =
    offset >= 0 && offset <= size && expected.size <= size - offset &&
        expected.indices.all { this[offset + it] == expected[it] }

private data class FunctionHeader(val offset: Int, val size: Int, val frame: Int, val params: Int)

private class HermesImage(private val bytes: ByteArray) {
    private val reader = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)

    init {
        check(bytes.size == BUNDLE_SIZE) { "Unsupported De Tijd Hermes bundle length" }
        check(reader.getLong(0) == 0x1f1903c103bc1fc6L && reader.getInt(8) == 98) {
            "Unsupported De Tijd Hermes bytecode format"
        }
        check(reader.getInt(32) == bytes.size && reader.getInt(40) == FUNCTION_COUNT) {
            "De Tijd Hermes file header changed"
        }
        check(bytes.matches(bytes.size - FOOTER_SIZE, bytes.footer())) { "Invalid Hermes SHA-1 footer" }
    }

    fun function(id: Int): FunctionHeader {
        check(id in 0 until FUNCTION_COUNT) { "Invalid Hermes function id" }
        val at = HEADER_SIZE + id * 12
        val first = reader.getInt(at)
        val second = reader.getInt(at + 4)
        val flags = bytes[at + 11].toInt() and 0xff
        if (flags and 0x20 == 0) {
            return FunctionHeader(
                first and 0x1ffffff,
                second and 0x3fff,
                bytes[at + 8].toInt() and 0xff,
                (first ushr 25) and 31,
            )
        }
        val large = (((second ushr 14) and 0xff) shl 24) or (first and 0x1ffffff)
        check(large >= 0 && large <= bytes.size - 36) { "Invalid Hermes large function header" }
        return FunctionHeader(reader.getInt(large), reader.getInt(large + 12), reader.getInt(large + 28), reader.getInt(large + 4))
    }
}

/**
 * Compose only recognized policies. Restore every recognized prior edit into a
 * scratch copy and authenticate that complete copy against the publisher hash.
 * No module-global mutable state survives across patch runs.
 */
internal fun transformHermes(input: ByteArray, requested: List<HermesEdit>): ByteArray {
    val image = HermesImage(input)
    check(requested.isNotEmpty() && requested.distinct().size == requested.size &&
        requested.all { it in allHermesEdits }) { "Unknown or duplicate Hermes policy" }
    val ranges = allHermesEdits.sortedBy { it.offset }
    ranges.zipWithNext().forEach { (a, b) ->
        check(a.offset.toLong() + a.before.size <= b.offset) { "Overlapping Hermes policies" }
    }
    val canonical = input.copyOf()
    ranges.forEach { edit ->
        check(edit.before.isNotEmpty() && edit.before.size == edit.after.size &&
            edit.before.size <= edit.functionSize && edit.offset >= HEADER_SIZE &&
            edit.functionSize > 0 && edit.offset <= input.size - FOOTER_SIZE - edit.functionSize) {
            "Invalid Hermes edit bounds: ${edit.name}"
        }
        check(image.function(edit.functionId) == FunctionHeader(edit.offset, edit.functionSize, edit.frameSize, edit.params)) {
            "Hermes function header changed: ${edit.name}"
        }
        when {
            canonical.matches(edit.offset, edit.before) -> Unit
            canonical.matches(edit.offset, edit.after) -> edit.before.copyInto(canonical, edit.offset)
            else -> error("Hermes function preimage changed: ${edit.name}")
        }
    }
    canonical.footer().copyInto(canonical, canonical.size - FOOTER_SIZE)
    check(canonical.sha256() == BUNDLE_SHA256) { "Unsupported De Tijd Hermes bundle hash" }
    ranges.forEach { edit ->
        check(canonical.copyOfRange(edit.offset, edit.offset + edit.functionSize).sha256() == edit.functionSha256) {
            "Hermes function digest changed: ${edit.name}"
        }
    }
    return input.copyOf().also { output ->
        requested.forEach { it.after.copyInto(output, it.offset) }
        output.footer().copyInto(output, output.size - FOOTER_SIZE)
        HermesImage(output)
        check(requested.all { output.matches(it.offset, it.after) }) { "Hermes edit readback failed" }
    }
}

internal fun patchHermes(file: File, requested: List<HermesEdit>) {
    file.writeBytes(transformHermes(file.readBytes(), requested))
}
