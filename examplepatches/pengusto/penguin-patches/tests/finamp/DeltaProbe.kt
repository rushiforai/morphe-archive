package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.RawResourcePatch
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.InputStream
import java.security.MessageDigest
import java.util.zip.Deflater
import java.util.zip.DeflaterOutputStream

/** Standalone probe: compile with the two Finamp sources and the provided Morphe API JAR. */
private var assertions = 0

private fun expect(condition: Boolean, label: String) {
    check(condition) { label }
    assertions++
}

private fun longLe(value: Long): ByteArray = ByteArray(8) { (value ushr (8 * it)).toByte() }

private fun controls(vararg entries: Triple<Long, Long, Long>): ByteArray = ByteArrayOutputStream().apply {
    entries.forEach { (x, y, z) ->
        write(longLe(x))
        write(longLe(y))
        write(longLe(z))
    }
}.toByteArray()

private fun compressed(bytes: ByteArray, dictionary: ByteArray? = null): ByteArray {
    val deflater = Deflater()
    try {
        if (dictionary != null) deflater.setDictionary(dictionary)
        return ByteArrayOutputStream().also { output ->
            DeflaterOutputStream(output, deflater).use { it.write(bytes) }
        }.toByteArray()
    } finally {
        deflater.end()
    }
}

private fun fixture(old: ByteArray, new: ByteArray, ctrl: ByteArray, diff: ByteArray, extra: ByteArray): ByteArray =
    ByteArrayOutputStream().apply {
        write("PFD1".toByteArray(Charsets.US_ASCII))
        write(longLe(old.size.toLong()))
        write(longLe(new.size.toLong()))
        write(MessageDigest.getInstance("SHA-256").digest(old))
        write(MessageDigest.getInstance("SHA-256").digest(new))
        write(longLe(ctrl.size.toLong()))
        write(longLe(diff.size.toLong()))
        write(longLe(extra.size.toLong()))
        write(compressed(ctrl + diff + extra))
    }.toByteArray()

private fun reject(label: String, old: ByteArray, delta: InputStream, fragment: String) {
    try {
        delta.use { FinampDelta.apply(old, it) }
        error("Accepted invalid delta: $label")
    } catch (exception: PatchException) {
        expect(exception.message.orEmpty().startsWith("Finamp PFD1:"), "$label has a clear patch error")
        expect(exception.message.orEmpty().contains(fragment, ignoreCase = true),
            "$label: expected '$fragment', got ${exception.message}")
    }
}

private fun reject(label: String, old: ByteArray, delta: ByteArray, fragment: String) =
    reject(label, old, ByteArrayInputStream(delta), fragment)

private fun changedLong(delta: ByteArray, offset: Int, value: Long): ByteArray =
    delta.copyOf().also { longLe(value).copyInto(it, offset) }

fun main() {
    val old = byteArrayOf(250.toByte(), 1, 2, 3, 4, 5)
    val new = byteArrayOf(4, 0, 3, 9, 2, 4, 6, 7, 8)
    val ctrl = controls(Triple(3, 1, -2), Triple(3, 2, 0))
    val diff = byteArrayOf(10, 255.toByte(), 1, 1, 2, 3)
    val extra = byteArrayOf(9, 7, 8)
    val delta = fixture(old, new, ctrl, diff, extra)
    expect(FinampDelta.apply(old, delta.inputStream()).contentEquals(new), "mixed diff/extra, negative seek and modulo 256")
    expect(FinampDelta.sha256("abc".toByteArray()) ==
        "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", "SHA-256 known vector")

    val shortReads = object : ByteArrayInputStream(delta) {
        override fun read(bytes: ByteArray, offset: Int, length: Int): Int = super.read(bytes, offset, minOf(length, 1))
    }
    expect(FinampDelta.apply(old, shortReads).contentEquals(new), "short stream reads")
    val zeroReads = object : ByteArrayInputStream(delta) {
        var zero = true
        override fun read(bytes: ByteArray, offset: Int, length: Int): Int {
            zero = !zero
            return if (!zero) 0 else super.read(bytes, offset, length)
        }
    }
    expect(FinampDelta.apply(old, zeroReads).contentEquals(new), "zero-length stream reads")

    val empty = byteArrayOf()
    expect(FinampDelta.apply(empty, fixture(empty, empty, empty, empty, empty).inputStream()).isEmpty(), "empty output")
    expect(FinampDelta.apply(empty,
        fixture(empty, new, controls(Triple(0, 9, 0)), empty, new).inputStream()).contentEquals(new), "literal-only delta")
    expect(FinampDelta.apply(old,
        fixture(old, old, controls(Triple(6, 0, 0)), ByteArray(6), empty).inputStream()).contentEquals(old), "identity delta")

    val two = byteArrayOf(10, 20)
    val before = byteArrayOf(3, 14, 25)
    expect(FinampDelta.apply(two, fixture(two, before,
        controls(Triple(0, 0, -1), Triple(3, 0, 0)), byteArrayOf(3, 4, 5), empty).inputStream())
        .contentEquals(before), "old bytes below zero are zero")
    val after = byteArrayOf(7, 8)
    expect(FinampDelta.apply(two, fixture(two, after,
        controls(Triple(0, 0, 3), Triple(2, 0, 0)), after, empty).inputStream())
        .contentEquals(after), "old bytes past EOF are zero")
    expect(FinampDelta.apply(empty, fixture(empty, byteArrayOf(7),
        controls(Triple(0, 0, Long.MAX_VALUE), Triple(0, 1, Long.MIN_VALUE)), empty, byteArrayOf(7)).inputStream())
        .contentEquals(byteArrayOf(7)), "normal signed LE Int64 extremes")
    expect(FinampDelta.apply(empty, fixture(empty, byteArrayOf(7, 8),
        controls(Triple(0, 0, Long.MAX_VALUE), Triple(2, 0, -Long.MAX_VALUE)), byteArrayOf(7, 8), empty).inputStream())
        .contentEquals(byteArrayOf(7, 8)), "mathematical source indices and cancellation before final seek bound check")

    for (length in 0 until 108) reject("header truncated at $length", old, delta.copyOf(length), "truncated header")
    reject("magic", old, delta.copyOf().also { it[3] = '2'.code.toByte() }, "magic")
    reject("base length", old, changedLong(delta, 4, old.size + 1L), "length does not match")
    reject("base hash", old, delta.copyOf().also { it[20] = (it[20].toInt() xor 1).toByte() }, "original library SHA")
    reject("target hash", old, delta.copyOf().also { it[52] = (it[52].toInt() xor 1).toByte() }, "reconstructed library SHA")
    for (offset in listOf(4, 12, 84, 92, 100)) {
        reject("UInt64 overflow at $offset", old, changedLong(delta, offset, -1L), "bounds")
        reject("oversized field at $offset", old,
            changedLong(delta, offset, FinampDelta.MAX_LIBRARY_BYTES + 1L), "bounds")
    }
    reject("unaligned controls", old, changedLong(delta, 84, 25), "multiple of 24")
    reject("diff/extra sum", old, changedLong(delta, 92, 7), "sum")
    reject("negative x", old, fixture(old, new, controls(Triple(-1, 0, 0)), diff, extra), "negative")
    reject("negative y", old, fixture(old, new, controls(Triple(0, -1, 0)), diff, extra), "negative")
    reject("oversized x", old, fixture(old, new, controls(Triple(Long.MAX_VALUE, 0, 0)), diff, extra), "output length")
    reject("oversized y", old, fixture(old, new, controls(Triple(0, Long.MAX_VALUE, 0)), diff, extra), "output length")
    reject("diff overrun", old, fixture(old, new, controls(Triple(7, 2, 0)), diff, extra), "diff stream")
    reject("extra overrun", old, fixture(old, new, controls(Triple(5, 4, 0)), diff, extra), "extra stream")
    reject("incomplete controls", old, fixture(old, new, controls(Triple(1, 0, 0)), diff, extra), "complete output")
    reject("missing controls", old, fixture(old, new, empty, diff, extra), "complete output")

    reject("old position diff overflow", empty, fixture(empty, byteArrayOf(7),
        controls(Triple(0, 0, Long.MAX_VALUE), Triple(1, 0, 0)), byteArrayOf(7), empty), "overflow")
    reject("old position seek overflow", empty, fixture(empty, byteArrayOf(7),
        controls(Triple(0, 0, Long.MAX_VALUE), Triple(0, 1, 1)), empty, byteArrayOf(7)), "overflow")
    reject("old position seek underflow", empty, fixture(empty, byteArrayOf(7),
        controls(Triple(0, 0, Long.MIN_VALUE), Triple(0, 1, -1)), empty, byteArrayOf(7)), "overflow")

    reject("truncated zlib", old, delta.copyOf(delta.size - 1), "truncated zlib")
    reject("corrupt zlib checksum", old,
        delta.copyOf().also { it[it.lastIndex] = (it.last().toInt() xor 1).toByte() }, "Finamp PFD1:")
    val header = delta.copyOf(108)
    val payload = ctrl + diff + extra
    reject("short expanded stream", old, header + compressed(payload.copyOf(payload.size - 1)), "shorter")
    reject("long expanded stream", old, header + compressed(payload + byteArrayOf(0)), "exceeds declared")
    reject("dictionary stream", old, header + compressed(payload, old), "dictionaries")
    reject("trailing byte", old, delta + byteArrayOf(0), "trailing")
    reject("concatenated zlib", old, delta + compressed(empty), "trailing")
    val unbufferedTrailing = object : ByteArrayInputStream(delta + byteArrayOf(0)) {
        override fun read(bytes: ByteArray, offset: Int, length: Int): Int = super.read(bytes, offset, minOf(length, 1))
    }
    reject("trailing byte beyond inflater buffer", old, unbufferedTrailing, "trailing")
    reject("stream read failure", old, object : InputStream() {
        override fun read(): Int = throw IOException("probe read failure")
    }, "probe read failure")

    val patches = listOf<Patch<*>>(finampTitleValidationPatch, finampArtistOrderPatch, finampFasterArtistPagePatch)
    expect(patches.all { !it.default && it is RawResourcePatch }, "three opt-in raw-resource patches")
    expect(patches.map { it.name }.toSet().size == 3, "distinct selectable names")
    val dependency = patches.first().dependencies.single()
    expect(dependency.name == null && patches.all { it.dependencies.single() === dependency }, "one hidden shared dependency")
    expect(patches.all { patch ->
        patch.compatibility!!.single().let {
            it.packageName == "com.unicornsonlsd.finamp" && it.targets.single().version == "1.0.1"
        }
    }, "exact package/version catalogue targets")
    expect(patches.all { it.description!!.contains("ARM64-only") && it.description!!.contains("official Finamp 1.0.1") },
        "descriptions disclose official input and ARM64 output")

    println("PASS: $assertions Finamp delta/patch metadata assertions")
}
