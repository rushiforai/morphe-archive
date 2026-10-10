package app.venus.patches

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Needs the user's unmodified asset; never commits or distributes Discord bytecode. */
fun main(args: Array<String>) {
    require(args.size in 2..3) { "Usage: HbcPreludeTest original.hbc output-directory [combined-prelude.js]" }
    val input = File(args[0])
    val directory = File(args[1]).apply { mkdirs() }
    val original = input.readBytes()
    fun sha1(bytes: ByteArray) = MessageDigest.getInstance("SHA-1").digest(bytes)
    fun checkFooter(file: File) {
        val bytes = file.readBytes()
        check(sha1(bytes.copyOf(bytes.size - 20)).contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size)))
    }
    val cases = mutableListOf(
        "normal" to "globalThis.__venusProbe = 42; print('HBC98_PRELUDE_PASS');",
        "throwing" to "throw new Error('guarded bootstrap failure');"
    )
    if (args.size == 3) cases.add("environment" to File(args[2]).readText())
    for ((name, source) in cases) {
        val output = File(directory, "$name.hbc")
        input.copyTo(output, overwrite = true)
        val result = HbcPrelude.inject(output, source)
        checkFooter(output)
        val bytes = output.readBytes()
        val headerBytes = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        val expanded = (((headerBytes.getInt(132) ushr 14) and 255) shl 24) or
            (headerBytes.getInt(128) and 0x1ffffff)
        check(bytes[expanded + 36].toInt() and 8 != 0)
        check(bytes[expanded + 36].toInt() and 16 == 0)
        check(headerBytes.getInt(expanded + 40) == 1)
        check(headerBytes.getInt(expanded + 44) == 0)
        check(headerBytes.getInt(expanded + 48) == result.prefixSize - 7)
        check(headerBytes.getInt(expanded + 52) == result.prefixSize - 2)
        check(bytes.copyOfRange(result.codeOffset + result.prefixSize,
            result.codeOffset + result.prefixSize + result.originalCodeSize)
            .contentEquals(original.copyOfRange(HbcPrelude.GLOBAL_OFFSET, HbcPrelude.GLOBAL_OFFSET + HbcPrelude.GLOBAL_SIZE)))
        val unchanged = bytes.copyOf(original.size - 20)
        for (range in listOf(32..35, 128..135)) for (index in range) unchanged[index] = original[index]
        check(unchanged.contentEquals(original.copyOf(original.size - 20))) { "Unrelated original HBC bytes changed" }
        // Engine fixture: exercise the real prelude, then return instead of starting the whole app.
        if (name != "environment") RandomAccessFile(output, "rw").use { raf ->
            fun intAt(at: Long): Int { raf.seek(at); return Integer.reverseBytes(raf.readInt()) }
            val a = intAt(128); val b = intAt(132)
            val header = (((b ushr 14) and 255).toLong() shl 24) or (a and 0x1ffffff).toLong()
            raf.seek(header + 12); raf.writeInt(Integer.reverseBytes(result.prefixSize + 4))
            raf.seek((result.codeOffset + result.prefixSize).toLong())
            // HBC98 LoadConstUndefined r14; Ret r14.
            raf.write(byteArrayOf(147.toByte(), 14, 118, 14))
        }
        val fixture = output.readBytes()
        val footer = sha1(fixture.copyOf(fixture.size - 20))
        RandomAccessFile(output, "rw").use { it.seek(fixture.size.toLong() - 20); it.write(footer) }
        println("Fixture: ${output.path}")
    }
    val invalid = File(directory, "invalid.hbc")
    input.copyTo(invalid, overwrite = true)
    RandomAccessFile(invalid, "rw").use { it.seek(8); it.writeInt(Integer.reverseBytes(97)) }
    check(runCatching { HbcPrelude.inject(invalid, "print('no');") }.isFailure)
    println("PASS: HBC relocation, original-code identity, unchanged original tables, checksum and version guard")
}
