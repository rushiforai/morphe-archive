package app.airofit.patches

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

private const val SOURCE_SHA256 = "32058e5c3813a8d3a7690a7ed7a40968e1d667b995ef12996205c75e8f7861b4"
private const val OUTPUT_SHA256 = "27b474fb4faca5f7bd5f52ff8fb159b802eababb3a869552dca2d0cf638449e8"
private const val PAYLOAD_SHA256 = "d517d54ccb995c55ba19781aa4bb5f254a7e97b716272cbab4dc6b3136e126c3"
private const val SOURCE_SIZE = 8226776
private const val OUTPUT_SIZE = 8228444
private const val INSERT_AT = 8226740
private const val PAYLOAD_SIZE = 1668

private data class Edit(val offset: Int, val before: ByteArray, val after: ByteArray)

/**
 * Pro 2-only experimental adapter for exactly Airofit Elite 1.9.0.
 * No firmware, server, paid-feature, sensor-calibration success, or orientation result is forged.
 */
@Suppress("unused")
val airofitPro2CompatibilityPatch = rawResourcePatch(
    name = "Experimental Pro 2 compatibility adapter (Elite 1.9.0)",
    description = "PRO 2 ONLY. Adds guarded Pro 2 discovery, flow conversion and truthful unavailable-orientation routing. " +
        "Pressure/flow/volume physical accuracy and complete Android lifecycle remain unvalidated. Elite hardware is rejected.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Airofit Elite",
        packageName = "com.airofit.elite",
        targets = listOf(AppTarget(version = "1.9.0", isExperimental = true)),
    ))
    execute {
        if (packageMetadata.packageName != "com.airofit.elite" || packageMetadata.versionName != "1.9.0") {
            throw PatchException("Only com.airofit.elite version 1.9.0 is supported.")
        }
        val bundle = get("assets/index.android.bundle")
        val original = bundle.readBytes()
        val patched = patchPro2Bundle(original)
        // Publish only after all source, payload, edit, footer and output guards succeed.
        bundle.writeBytes(patched)
    }
}

internal fun patchPro2Bundle(original: ByteArray): ByteArray {
    fun guard(condition: Boolean, message: String) {
        if (!condition) throw PatchException(message)
    }
    fun digest(name: String, bytes: ByteArray): ByteArray = MessageDigest.getInstance(name).digest(bytes)
    fun hex(bytes: ByteArray): String = bytes.joinToString("") { "%02x".format(it.toInt() and 0xff) }

    guard(original.size == SOURCE_SIZE, "Unexpected Hermes bundle size.")
    guard(ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN).getInt(8) == 98, "Expected Hermes bytecode version 98.")
    guard(hex(digest("SHA-256", original)) == SOURCE_SHA256, "Source bundle SHA-256 mismatch; refusing unknown or already patched input.")
    guard(original.copyOfRange(original.size - 20, original.size).contentEquals(digest("SHA-1", original.copyOfRange(0, original.size - 20))), "Source SHA-1 footer is invalid.")
    guard(INSERT_AT in 1 until original.size - 20 && INSERT_AT % 4 == 0, "Invalid insertion point.")
    guard(ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN).getInt(108) == INSERT_AT, "Unexpected debug insertion point.")

    val payload = object {}.javaClass.getResourceAsStream("/pro2-1.9.0-payload.bin")?.use { it.readBytes() }
        ?: throw PatchException("Embedded Pro 2 payload is missing.")
    guard(payload.size == PAYLOAD_SIZE && hex(digest("SHA-256", payload)) == PAYLOAD_SHA256, "Embedded payload integrity failure.")

    val edits = listOf(
        Edit(20492, "a4876f000000000000000020".hexBytes(), "6c897d000000000000000020".hexBytes()),
        Edit(215768, "30ae76000000000000000020".hexBytes(), "888a7d000000000000000020".hexBytes()),
        Edit(215792, "80ae76000000000000000020".hexBytes(), "ac8c7d000000000000000020".hexBytes()),
        Edit(328484, "50aa7c000000000000000020".hexBytes(), "108e7d000000000000000020".hexBytes()),
        Edit(32, "d8877d00".hexBytes(), "5c8e7d00".hexBytes()),
        Edit(108, "b4877d00".hexBytes(), "388e7d00".hexBytes()),
    )
    val touched = HashSet<Int>()
    edits.forEach { edit ->
        guard(edit.before.size == edit.after.size && edit.offset >= 0 && edit.offset + edit.before.size <= INSERT_AT, "Invalid edit range.")
        guard((edit.offset until edit.offset + edit.before.size).all { touched.add(it) }, "Overlapping fixed edits.")
        guard(original.copyOfRange(edit.offset, edit.offset + edit.before.size).contentEquals(edit.before), "Expected source bytes missing at ${edit.offset}.")
    }

    val prefix = original.copyOfRange(0, INSERT_AT)
    val suffixWithoutFooter = original.copyOfRange(INSERT_AT, original.size - 20)
    val result = ByteArray(prefix.size + payload.size + suffixWithoutFooter.size)
    prefix.copyInto(result)
    payload.copyInto(result, destinationOffset = prefix.size)
    suffixWithoutFooter.copyInto(result, destinationOffset = prefix.size + payload.size)
    edits.forEach { it.after.copyInto(result, destinationOffset = it.offset) }
    val output = result + digest("SHA-1", result)
    guard(output.size == OUTPUT_SIZE && hex(digest("SHA-256", output)) == OUTPUT_SHA256, "Final output verification failed.")
    return output
}

private fun String.hexBytes(): ByteArray {
    require(length % 2 == 0)
    return ByteArray(length / 2) { index -> substring(index * 2, index * 2 + 2).toInt(16).toByte() }
}
