/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS_3_8
import java.io.File

/**
 * One architecture's copy of the engine library, and what has to be changed in it.
 *
 * The library kills the process on an APK that is not signed with the developer's certificate, in
 * two ways:
 *
 * - The first constructor the application declares destroys a global mutex, and every thread that
 *   locks that mutex afterwards dies with
 *   `FORTIFY: pthread_mutex_lock called on a destroyed mutex`. `INIT_ARRAY` runs in order and the
 *   constructor that follows it is the one calling the verification routine, so the two can be
 *   told apart by that neighbour - and by being the two largest functions of the array.
 * - The verification routine, which the library also runs periodically on a worker thread, is
 *   salted with traps meant to fire on such an APK: `udf #0` (SIGILL), and stores of the markers
 *   `0xdead` and `0xdeadbeef` (SIGSEGV) to a null pointer and to that marker as an address. A trap
 *   sits inside the routine's own arithmetic, which carries on both sides of it, so replacing the
 *   instruction with a no-op leaves the routine working.
 *
 * Replacing the whole routine with an early return was tried first, and it hangs: the routine does
 * more than verify.
 */
private class LibraryPatch(
    val path: String,
    /** `e_machine` of the ELF file, which also tells the two formats apart. */
    val machine: Long,
    /** An instruction that identifies the build, checked but never changed. */
    val guardAddress: Long,
    val guardWidth: Int,
    val guardExpected: Long,
    /** Instruction rewrites: where, how wide, what is there now, what it becomes. */
    val rewrites: List<Rewrite>,
    /**
     * The anti-tamper constructor, redirected by its `INIT_ARRAY` slot: the slot's address, the
     * constructor it holds now, and the harmless one to point it at instead.
     */
    val constructorSlot: Long? = null,
    val constructorExpected: Long? = null,
    val constructorReplacement: Long? = null,
)

private class Rewrite(val address: Long, val width: Int, val expected: Long, val replacement: Long)

private const val NOP_64 = 0xD503201FL // nop
private const val NOP_16 = 0x0000BF00L // nop.n
private const val BX_LR_16 = 0x00004770L // bx lr

/**
 * 64-bit ARM.
 *
 * The anti-tamper constructor is `INIT_ARRAY[2]`; index 1 guards itself with a variable it sets on
 * its first run, so pointing index 2 at it turns that constructor into a no-op while the other
 * eleven keep initialising the engine.
 */
private val ARM64 = LibraryPatch(
    path = "lib/arm64-v8a/libd.so",
    machine = 0xB7,
    guardAddress = 0x6e2b80,
    guardWidth = 4,
    guardExpected = 0xA9BA7BFDL, // stp x29, x30, [sp, #-96]!
    rewrites = listOf(
        // The traps first: they are unreachable once the routine returns, but a caller that
        // reaches an inner block keeps its no-ops.
        Rewrite(0x6e2e1c, 4, 0x00000000L, NOP_64), // udf #0
        Rewrite(0x6e2e30, 4, 0x00000000L, NOP_64), // udf #0
        Rewrite(0x6e30d0, 4, 0x39000109L, NOP_64), // strb w9, [x8], x8 = 0xdeadbeef
        Rewrite(0x6e33f8, 4, 0xB900014BL, NOP_64), // str w11, [x10], x10 = 0
        Rewrite(0x6e3414, 4, 0xB900014DL, NOP_64), // str w13, [x10], x10 = 0
        // Then the routine itself: it returns immediately. Running it instead of disarming it
        // was tried, and its failure path blocks the caller, so no caller ever finishes.
        Rewrite(0x6e2b80, 4, 0xA9BA7BFDL, 0x2A1F03E0L), // stp x29, x30, [sp, #-96]! -> mov w0, wzr
        Rewrite(0x6e2b84, 4, 0xA9016FFCL, 0xD65F03C0L), // stp x28, x27, [sp, #16]     -> ret
    ),
    constructorSlot = 0xbf96e8L + 8 * 2,
    constructorExpected = 0x68fb4cL,
    constructorReplacement = 0xb60cd8L,
)

/**
 * 32-bit ARM, which is what Android TV 10 boxes commonly run.
 *
 * The same two functions have the same neighbours as on 64-bit ARM: `INIT_ARRAY[1]` is the
 * constructor that calls the verification routine, and `INIT_ARRAY[0]` is the anti-tamper one -
 * both times the two largest functions of the array. This one is not redirected at a replacement
 * constructor but turned into `bx lr`, there being no guarded constructor to borrow here.
 */
private val ARM32 = LibraryPatch(
    path = "lib/armeabi-v7a/libd.so",
    machine = 0x28,
    guardAddress = 0x356ad8,
    guardWidth = 2,
    guardExpected = 0xB5F0L, // push {r4, r5, r6, r7, lr}
    rewrites = listOf(
        Rewrite(0x304304, 2, 0xB5F0L, BX_LR_16), // the anti-tamper constructor -> return
        Rewrite(0x356e14, 2, 0x7001L, NOP_16), // strb r1, [r0], r0 = 0xdeadbeef
        Rewrite(0x356fe8, 2, 0x6001L, NOP_16), // str r1, [r0], r0 = 0
        Rewrite(0x356ad8, 2, 0xB5F0L, BX_LR_16), // the verification routine -> return
    ),
)

/**
 * The server-only engine library, `liba.so`, contains the shell path that can stop the app when
 * the ADB speed-up server loads it. The ARM32 build has one call site; ARM64 has seven flattened
 * direct call sites plus a small system() thunk. ARM64 command strings are assembled at runtime,
 * so these exact 3.8.0 sites are neutralized while preserving call/return flow: direct calls receive
 * a null command (the libc shell-availability probe), and the thunk returns success without running
 * a command. Later builds must be inspected again rather than receiving broad byte replacements.
 */
private val ARM32_SUPPORT = LibraryPatch(
    path = "lib/armeabi-v7a/liba.so",
    machine = 0x28,
    guardAddress = 0x430178,
    guardWidth = 2,
    guardExpected = 0xF2E5L, // first halfword of the `blx system` at 0x430178
    rewrites = listOf(
        Rewrite(0x430178, 2, 0xF2E5L, NOP_16), // blx system -> nop
        Rewrite(0x43017A, 2, 0xE8F2L, NOP_16), // rest of the blx -> nop
    ),
)

private val ARM64_SUPPORT = LibraryPatch(
    path = "lib/arm64-v8a/liba.so",
    machine = 0xB7,
    guardAddress = 0x7AC368,
    guardWidth = 4,
    guardExpected = 0x940D1F8AL, // system@plt call identifies tvQuickActions 3.8.0 liba
    rewrites = listOf(
        Rewrite(0x7AC364, 4, 0x9A9B1500L, 0xAA1F03E0L), // x0 = NULL before system()
        Rewrite(0x7AC3BC, 4, 0x9A9B1680L, 0xAA1F03E0L),
        Rewrite(0x7B04CC, 4, 0x9A961680L, 0xAA1F03E0L),
        Rewrite(0x7B5328, 4, 0x9A971520L, 0xAA1F03E0L),
        Rewrite(0x7B5340, 4, 0x9A971680L, 0xAA1F03E0L),
        Rewrite(0x7BD594, 4, 0x9A981500L, 0xAA1F03E0L),
        Rewrite(0x7BD5D4, 4, 0x9A981680L, 0xAA1F03E0L),
        Rewrite(0x84D620, 4, 0x940A9ADCL, 0x2A1F03E0L), // wrapper: return 0 without running system
    ),
)

/**
 * The engine library refuses to run on an APK that is not signed with the developer's certificate,
 * which is what makes **Web Widget Overlay** and **button emulation** unusable: the app dies as
 * the library loads. Neither dropping the `System.loadLibrary("d")` call nor stubbing the Java
 * wrappers keeps the engine, because the abort comes from the library's own code.
 *
 * This patch edits the libraries themselves, for both the 64-bit and the 32-bit ARM build, so the
 * engine loads and keeps working.
 */
@Suppress("unused")
val nativeEnginePatch = resourcePatch(
    name = "Unlock native engine",
    description = "Patches the native engine libraries so that they run on a re-signed APK. The " +
            "anti-tamper constructor of libd.so that destroys a global mutex is disabled, and the " +
            "trap instructions the verification routine plants inside its own code - udf #0 " +
            "(SIGILL) and stores of the markers 0xdead and 0xdeadbeef (SIGSEGV) - are replaced " +
            "by no-ops, leaving the routine's work intact. This is what makes Web Widget Overlay " +
            "and button emulation work. The server-only liba.so self-stop calls are also disabled " +
            "for ARM32 and ARM64 so ADB speed-up does not terminate the app.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS_3_8)
    dependsOn(unlockPremiumPatch)

    execute {
        val patched = listOf(ARM64, ARM32, ARM32_SUPPORT, ARM64_SUPPORT).filter { target ->
            val lib = get(target.path)

            if (lib.isFile) {
                patchLibrary(lib, target)
                true
            } else {
                false
            }
        }

        if (patched.isEmpty()) {
            throw PatchException(
                "The APK has neither lib/arm64-v8a/libd.so nor lib/armeabi-v7a/libd.so. " +
                        "This patch supports the ARM builds only."
            )
        }
    }
}

private fun patchLibrary(lib: File, target: LibraryPatch) {
    val data = lib.readBytes()
    val is64Bit = elfIs64Bit(data, lib.name)
    val segments = segments(data, is64Bit)

    if (target.machine != u16(data, 0x12)) {
        throw PatchException(
            "${target.path}: expected a 0x${target.machine.toString(16)} ELF, found " +
                    "0x${u16(data, 0x12).toString(16)}. Patch tvQuickActions Pro 3.8.0."
        )
    }

    // The build is identified by one instruction of the verification routine, which is never
    // changed. A library that does not match is refused rather than corrupted.
    if (u(data, segments.offsetOf(target.guardAddress), target.guardWidth) != target.guardExpected) {
        throw PatchException(
            "${target.path} is not the library this patch was written for. " +
                    "Patch tvQuickActions Pro 3.8.0."
        )
    }

    if (target.constructorSlot != null) {
        redirectConstructor(data, segments, target)
    }

    for (rewrite in target.rewrites) {
        val offset = segments.offsetOf(rewrite.address)
        val found = u(data, offset, rewrite.width)

        if (found != rewrite.expected) {
            throw PatchException(
                "${target.path}: expected 0x${rewrite.expected.toString(16)} at " +
                        "0x${rewrite.address.toString(16)}, found 0x${found.toString(16)}. " +
                        "Patch tvQuickActions Pro 3.8.0."
            )
        }

        w(data, offset, rewrite.width, rewrite.replacement)
    }

    lib.writeBytes(data)
}

/**
 * A 64-bit `INIT_ARRAY` is filled at load time from R_AARCH64_RELATIVE relocations, so the
 * constructor is replaced through the addend of the relocation that fills its slot.
 */
private fun redirectConstructor(data: ByteArray, segments: List<Segment>, target: LibraryPatch) {
    val slot = target.constructorSlot!!
    val expected = target.constructorExpected!!
    val replacement = target.constructorReplacement!!

    val dynamic = segments.firstOrNull { it.type == PT_DYNAMIC }
        ?: throw PatchException("${target.path} has no PT_DYNAMIC segment")

    var rela = -1L
    var relaSize = 0L
    var relaEntrySize = 24L

    var offset = dynamic.offset.toInt()
    val end = offset + dynamic.fileSize.toInt()
    while (offset < end) {
        val tag = u(data, offset, 8)
        if (tag == DT_NULL) break

        val value = u(data, offset + 8, 8)
        when (tag) {
            DT_RELA -> rela = value
            DT_RELASZ -> relaSize = value
            DT_RELAENT -> relaEntrySize = value
        }
        offset += 16
    }

    if (rela < 0 || relaSize <= 0) {
        throw PatchException("${target.path} has no relocation table")
    }

    var found = false
    var entry = rela
    while (entry < rela + relaSize) {
        if (u(data, entry.toInt(), 8) == slot) {
            val addendOffset = (entry + 16).toInt()

            if (u(data, addendOffset, 8) != expected) {
                throw PatchException("${target.path}: INIT_ARRAY slot is not the expected constructor")
            }

            w(data, addendOffset, 8, replacement)
            found = true
        }
        entry += relaEntrySize
    }

    if (!found) throw PatchException("${target.path}: could not find the constructor slot")
}

private class Segment(val type: Long, val offset: Long, val vaddr: Long, val fileSize: Long)

private fun elfIs64Bit(data: ByteArray, name: String): Boolean {
    if (data.size < 64 ||
        data[0] != 0x7F.toByte() || data[1] != 'E'.code.toByte() ||
        data[2] != 'L'.code.toByte() || data[3] != 'F'.code.toByte()
    ) {
        throw PatchException("$name is not an ELF file")
    }
    if (data[5].toInt() != 1) throw PatchException("$name is not little-endian")

    return when (data[4].toInt()) {
        1 -> false
        2 -> true
        else -> throw PatchException("$name is neither a 32-bit nor a 64-bit ELF file")
    }
}

private fun segments(data: ByteArray, is64Bit: Boolean): List<Segment> {
    val headerOffset: Long
    val headerSize: Long
    val headerCount: Long

    if (is64Bit) {
        headerOffset = u(data, 0x20, 8)
        headerSize = u(data, 0x36, 2)
        headerCount = u(data, 0x38, 2)
    } else {
        headerOffset = u(data, 0x1C, 4)
        headerSize = u(data, 0x2A, 2)
        headerCount = u(data, 0x2C, 2)
    }

    return (0 until headerCount).map { index ->
        val offset = (headerOffset + index * headerSize).toInt()

        if (is64Bit) {
            Segment(
                type = u(data, offset, 4),
                offset = u(data, offset + 8, 8),
                vaddr = u(data, offset + 16, 8),
                fileSize = u(data, offset + 32, 8),
            )
        } else {
            Segment(
                type = u(data, offset, 4),
                offset = u(data, offset + 4, 4),
                vaddr = u(data, offset + 8, 4),
                fileSize = u(data, offset + 16, 4),
            )
        }
    }
}

private fun List<Segment>.offsetOf(vaddr: Long): Int {
    val segment = firstOrNull { it.type == PT_LOAD && vaddr >= it.vaddr && vaddr < it.vaddr + it.fileSize }
        ?: throw PatchException("0x${vaddr.toString(16)} is not inside a loadable segment")

    return (segment.offset + (vaddr - segment.vaddr)).toInt()
}

private fun u(data: ByteArray, offset: Int, width: Int): Long {
    var value = 0L

    for (byte in 0 until width) {
        value = value or ((data[offset + byte].toLong() and 0xFF) shl (8 * byte))
    }

    return value
}

private fun w(data: ByteArray, offset: Int, width: Int, value: Long) {
    for (byte in 0 until width) {
        data[offset + byte] = ((value shr (8 * byte)) and 0xFF).toByte()
    }
}

private fun u16(data: ByteArray, offset: Int) = u(data, offset, 2)

// ELF constants.
private const val PT_LOAD = 1L
private const val PT_DYNAMIC = 2L
private const val DT_NULL = 0L
private const val DT_RELA = 7L
private const val DT_RELASZ = 8L
private const val DT_RELAENT = 9L
