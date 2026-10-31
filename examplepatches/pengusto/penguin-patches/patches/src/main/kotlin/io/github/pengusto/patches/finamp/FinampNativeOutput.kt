package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.PatchException
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.attribute.FileTime

/** Make same-size writes visible to Morphe's eager raw-resource metadata snapshots. */
internal object FinampNativeOutput {
    fun markWritten(path: Path, before: FileTime) {
        // Android NIO may retain second precision while java.io.File reports milliseconds.
        // Use the same API as the patcher and cross even a two-second filesystem tick.
        Files.setLastModifiedTime(path, FileTime.fromMillis(Math.addExact(before.toMillis(), 2_000L)))
        if (Files.getLastModifiedTime(path) == before) {
            throw PatchException("Finamp native patch: native output modification was not detectable")
        }
    }
}
