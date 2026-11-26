/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.PACKAGE_NAME
import app.smtgpm.patches.belote.shared.Constants.VERSION
import app.smtgpm.patches.belote.shared.Constants.VERSION_CODE
import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.util.Base64

/*
 * The game logic is Unity IL2CPP code compiled into libil2cpp.so, so these patches edit
 * ARM64 instructions at fixed addresses of one exact library build. See docs/belote.md.
 */

private const val LIBRARY = "lib/arm64-v8a/libil2cpp.so"

/** SHA-256 of the original arm64 libil2cpp.so of 2.12.9 (2216). */
private const val LIBRARY_SHA256 = "47d5c37ff848231a98e6a0a2400f5f3d28f54d6525fbed8c03ac36554c1240b1"

/** Executable LOAD segment of libil2cpp.so: file offset = virtual address - 0x4000. */
private const val TEXT_START = 0x1843e1cL
private const val TEXT_END = TEXT_START + 0x227c994L
private const val TEXT_DELTA = 0x4000L

/** One 32-bit ARM64 instruction replacement at a libil2cpp.so virtual address. */
internal class NativeEdit(val address: Long, val original: UInt, val patched: UInt)

private fun ResourcePatchContext.library(): File =
    get(LIBRARY).takeIf(File::isFile)
        ?: throw PatchException("The arm64-v8a split (libil2cpp.so) is missing. Use the full $VERSION APKM.")

/** Checks the app version and the exact library build once, before any instruction is changed. */
internal val verifyNativeLibraryPatch = rawResourcePatch {
    execute {
        if (packageMetadata.packageName != PACKAGE_NAME || packageMetadata.versionName != VERSION) {
            throw PatchException("These patches need Belote.com $VERSION ($VERSION_CODE).")
        }

        val digest = MessageDigest.getInstance("SHA-256")
        library().inputStream().use { input ->
            val buffer = ByteArray(1 shl 16)
            while (true) {
                val count = input.read(buffer)
                if (count < 0) break
                digest.update(buffer, 0, count)
            }
        }
        val actual = digest.digest().joinToString("") { "%02x".format(it) }
        if (actual != LIBRARY_SHA256) {
            throw PatchException("Unrecognized libil2cpp.so ($actual). Use an unmodified Belote.com $VERSION.")
        }
    }
}

private fun offsetOf(address: Long, size: Int): Long {
    if (address < TEXT_START || address + size > TEXT_END || address % 4 != 0L) {
        throw PatchException("Address 0x${address.toString(16)} is outside libil2cpp.so code.")
    }
    return address - TEXT_DELTA
}

private fun RandomAccessFile.readWord(offset: Long): UInt {
    seek(offset)
    val bytes = ByteArray(4).also(::readFully)
    return bytes.foldIndexed(0u) { index, word, byte -> word or ((byte.toUInt() and 0xffu) shl (8 * index)) }
}

private fun RandomAccessFile.writeWord(offset: Long, word: UInt) {
    seek(offset)
    write(ByteArray(4) { index -> (word shr (8 * index)).toByte() })
}

/** Checks every original instruction first, then applies all edits. */
internal fun ResourcePatchContext.applyNativeEdits(edits: List<NativeEdit>) {
    RandomAccessFile(library(), "rw").use { file ->
        for (edit in edits) {
            val actual = file.readWord(offsetOf(edit.address, 4))
            if (actual != edit.original && actual != edit.patched) {
                throw PatchException(
                    "Unexpected instruction 0x${actual.toString(16)} at 0x${edit.address.toString(16)}.",
                )
            }
        }
        for (edit in edits) file.writeWord(offsetOf(edit.address, 4), edit.patched)
    }
}

/**
 * Writes the hook code (native/belote) over StartupManagerFsmWeb::DefineFsm, which only the
 * WebGL build of the game runs. Idempotent, so several patches can depend on it.
 */
internal val nativeHookPayloadPatch = rawResourcePatch {
    dependsOn(verifyNativeLibraryPatch)

    execute {
        val payload = Base64.getDecoder().decode(NativeData.PAYLOAD_BASE64)
        RandomAccessFile(library(), "rw").use { file ->
            val offset = offsetOf(NativeData.CAVE_ADDRESS, payload.size)
            file.seek(offset)
            val current = ByteArray(payload.size).also(file::readFully)
            if (current.contentEquals(payload)) return@execute
            file.seek(offset)
            file.write(payload)
        }
    }
}
