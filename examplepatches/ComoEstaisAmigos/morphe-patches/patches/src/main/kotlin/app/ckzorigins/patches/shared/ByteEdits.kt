package app.ckzorigins.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import java.security.MessageDigest

internal class ByteEdit(val offset: Int, oldHex: String, newHex: String) {
    val old: ByteArray = oldHex.hexToBytes()
    val new: ByteArray = newHex.hexToBytes()

    init {
        require(old.isNotEmpty() && old.size == new.size) {
            "0x${offset.toString(16)}: old/new length mismatch"
        }
    }
}

internal fun String.hexToBytes(): ByteArray {
    require(length % 2 == 0) { "odd hex length: $this" }
    return ByteArray(length / 2) { substring(it * 2, it * 2 + 2).toInt(16).toByte() }
}

internal fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }

internal fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }

/**
 * Replaces [edits] in [data], all or nothing. Each range must still hold its old bytes.
 */
internal fun ByteArray.applyEdits(edits: List<ByteEdit>): ByteArray {
    val data = copyOf()
    for (edit in edits) {
        val end = edit.offset + edit.old.size
        if (edit.offset < 0 || end > data.size) {
            throw IllegalArgumentException("0x${edit.offset.toString(16)} is outside the file")
        }
        val current = data.copyOfRange(edit.offset, end)
        if (!current.contentEquals(edit.old)) {
            throw IllegalStateException(
                "0x${edit.offset.toString(16)} holds ${current.toHex()}, expected ${edit.old.toHex()}",
            )
        }
    }
    for (edit in edits) {
        edit.new.copyInto(data, edit.offset)
    }
    return data
}

/**
 * Replaces [edits] in [path], all or nothing. Each range must still hold its old bytes.
 */
internal fun applyByteEdits(path: String, edits: List<ByteEdit>) {
    val file = resourceFile(path, copy = true)
    if (!file.exists()) throw PatchException("$path is missing from this APK")
    val patched = try {
        file.readBytes().applyEdits(edits)
    } catch (e: IllegalStateException) {
        throw PatchException(
            "$path: ${e.message}. Patch the Origins 2.0.1 APK signed by Glu Mobile, not a repack.",
            e,
        )
    } catch (e: IllegalArgumentException) {
        throw PatchException("$path: ${e.message}", e)
    }
    file.writeBytes(patched)
}
