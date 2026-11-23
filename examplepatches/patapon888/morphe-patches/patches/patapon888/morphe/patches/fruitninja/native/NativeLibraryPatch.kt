package patapon888.morphe.patches.fruitninja.native

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import java.io.RandomAccessFile

private const val GAME_LIBRARY = "lib/arm64-v8a/libil2cpp.so"

// The executable segment of libil2cpp.so is loaded 0x4000 above its file offset.
private const val TEXT_RVA_TO_FILE_OFFSET = 0x4000L

/**
 * Replaces the bytes at [rva] (the address Il2CppDumper prints in dump.cs) in [GAME_LIBRARY].
 * [expected] and [replacement] are hex strings of the same length, in file (little endian) order.
 */
internal class LibraryEdit(val rva: Long, val expected: String, val replacement: String) {
    val offset get() = rva - TEXT_RVA_TO_FILE_OFFSET
    val expectedBytes get() = hex(expected)
    val replacementBytes get() = hex(replacement)

    private fun hex(s: String) = s.replace(" ", "").chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

// Common replacements, in file order.
internal const val RET = "c0035fd6"
internal const val RETURN_TRUE = "20008052 c0035fd6" // mov w0, #1; ret
internal const val RETURN_FALSE = "00008052 c0035fd6" // mov w0, #0; ret
internal const val NOP = "1f2003d5"

/**
 * Edits are verified all at once before any is written, so an unexpected library
 * fails the patch instead of leaving a half patched game behind.
 */
internal fun ResourcePatchContext.patchGameLibrary(edits: List<LibraryEdit>) {
    val library = get(GAME_LIBRARY)
    if (!library.isFile) throw PatchException("$GAME_LIBRARY not found. Patch the arm64-v8a build of the app.")

    RandomAccessFile(library, "rw").use { file ->
        fun read(offset: Long, length: Int) = ByteArray(length).also { file.seek(offset); file.readFully(it) }

        edits.forEach { edit ->
            val expected = edit.expectedBytes
            val replacement = edit.replacementBytes
            if (expected.size != replacement.size) throw PatchException("Bad edit at 0x%x".format(edit.rva))
            val found = read(edit.offset, expected.size)
            if (!found.contentEquals(expected) && !found.contentEquals(replacement)) throw PatchException(
                "Unexpected bytes %s at 0x%x in %s (expected %s). Unsupported app version?".format(
                    found.joinToString("") { "%02x".format(it) }, edit.rva, GAME_LIBRARY,
                    expected.joinToString("") { "%02x".format(it) }
                )
            )
        }
        edits.forEach { edit ->
            file.seek(edit.offset)
            file.write(edit.replacementBytes)
        }
    }
}

/**
 * Only the arm64-v8a library is patched, so any armeabi-v7a one is dropped.
 * Otherwise a device could load the unpatched 32 bit game.
 */
internal val arm64OnlyPatch = resourcePatch {
    execute {
        if (get("lib/armeabi-v7a").exists()) delete("lib/armeabi-v7a/")
    }
}
