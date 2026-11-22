package patapon888.morphe.patches.bejeweled.native

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import java.io.RandomAccessFile

private const val GAME_LIBRARY = "lib/arm64-v8a/libBejeweled3.so"

/**
 * One 32-bit instruction word in [GAME_LIBRARY], addressed by file offset.
 * Instructions are little endian, so they are compared and written as such.
 */
internal class InstructionEdit(val offset: Long, val expected: Int, val replacement: Int)

/**
 * Edits are verified all at once before any is written, so an unexpected library
 * fails the patch instead of leaving a half patched game behind.
 */
internal fun ResourcePatchContext.patchGameLibrary(edits: List<InstructionEdit>) {
    val library = get(GAME_LIBRARY)
    if (!library.isFile) throw PatchException("$GAME_LIBRARY not found. Patch the arm64-v8a build of the app.")

    RandomAccessFile(library, "rw").use { file ->
        fun read(offset: Long): Int {
            file.seek(offset)
            return Integer.reverseBytes(file.readInt())
        }

        edits.forEach { edit ->
            val found = read(edit.offset)
            if (found != edit.expected && found != edit.replacement) throw PatchException(
                "Unexpected instruction 0x%08x at 0x%x in %s (expected 0x%08x). Unsupported app version?"
                    .format(found, edit.offset, GAME_LIBRARY, edit.expected)
            )
        }
        edits.forEach { edit ->
            file.seek(edit.offset)
            file.writeInt(Integer.reverseBytes(edit.replacement))
        }
    }
}

/**
 * Only the arm64-v8a library is patched, so the armeabi-v7a one is dropped.
 * Otherwise a device could load the unpatched 32 bit game.
 */
internal val arm64OnlyPatch = resourcePatch {
    execute {
        delete("lib/armeabi-v7a/")
    }
}
