package com.jcapretta.chessable.hermes

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

internal fun String.hexBytes(): ByteArray {
    require(length % 2 == 0) { "Odd-length hex string" }
    return chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

internal fun ByteArray.digest(algorithm: String): ByteArray =
    MessageDigest.getInstance(algorithm).digest(this)

internal data class HermesEdit(
    val name: String,
    val offset: Int,
    val original: ByteArray,
    val replacement: ByteArray,
)

/** Fixed-size edits for one audited bundle. Never changes offsets or exception tables. */
internal class HermesEdits(
    private val originalSha256: String,
    private val edits: List<HermesEdit>,
    private val recognizedEdits: List<HermesEdit> = edits,
) {
    fun apply(input: ByteArray): ByteArray {
        require(input.size >= 128 + 20) { "Truncated Hermes bundle" }
        require(input.copyOfRange(0, 8).contentEquals("c61fbc03c103191f".hexBytes())) {
            "Not a Hermes bytecode bundle"
        }
        val header = ByteBuffer.wrap(input).order(ByteOrder.LITTLE_ENDIAN)
        require(header.getInt(8) == 96) { "Only Hermes bytecode version 96 is supported" }
        require(header.getInt(32) == input.size) { "Invalid Hermes file length" }
        val footer = input.size - 20
        require(input.copyOfRange(0, footer).digest("SHA-1")
            .contentEquals(input.copyOfRange(footer, input.size))) { "Invalid Hermes checksum" }

        var end = 128
        require(edits.all { it in recognizedEdits }) { "Selected edits must be recognized" }
        for (edit in recognizedEdits.sortedBy { it.offset }) {
            require(edit.original.isNotEmpty() && edit.original.size == edit.replacement.size) {
                "${edit.name}: edits must preserve instruction size"
            }
            require(edit.offset >= end && edit.offset <= footer - edit.original.size) {
                "${edit.name}: overlapping or out-of-bounds edit"
            }
            end = edit.offset + edit.original.size
            val actual = input.copyOfRange(edit.offset, end)
            require(actual.contentEquals(edit.original) || actual.contentEquals(edit.replacement)) {
                "${edit.name}: unexpected instructions; use the supported original APK"
            }
        }

        // Normalize only our known edits to recognize repeated application safely.
        val normalized = input.copyOf()
        recognizedEdits.forEach { it.original.copyInto(normalized, it.offset) }
        updateChecksum(normalized)
        require(normalized.digest("SHA-256").contentEquals(originalSha256.hexBytes())) {
            "Unsupported Chessable bundle. Expected 3.0.4 (118333); other builds or bundle patches need review."
        }

        return input.copyOf().also { output ->
            edits.forEach { it.replacement.copyInto(output, it.offset) }
            updateChecksum(output)
        }
    }

    private fun updateChecksum(bytes: ByteArray) {
        val footer = bytes.size - 20
        bytes.copyOfRange(0, footer).digest("SHA-1").copyInto(bytes, footer)
    }
}
