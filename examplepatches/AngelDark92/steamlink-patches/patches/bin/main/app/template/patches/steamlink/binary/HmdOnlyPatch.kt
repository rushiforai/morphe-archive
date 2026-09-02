package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_HMD_ONLY
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002172
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002206
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002244
import app.template.patches.steamlink.util.BinaryPatchHelper.vaddrToFileOffset
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

// Injects an AArch64 trampoline that adds a configurable offset to the HMD pose query time
// and zeroes the six HMD velocity fields exported to SteamVR.
// Controller paths are not modified.

private val ORIG_HOOK = byteArrayOf(0xe2.toByte(), 0x07, 0x40, 0xf9.toByte())

private data class VelocityPatch(
    val vaddr: Long,
    val byteOffset: Int,
    val paired: Boolean = false,
)

private data class HmdLayout(
    val versionCode: Int,
    val fileSize: Int,
    val hookVaddr: Long,
    val velocityPatches: List<VelocityPatch>,
)

private val HMD_LAYOUTS = listOf(
    HmdLayout(
        versionCode = 5001712,
        fileSize = 2_221_072,
        hookVaddr = 0x001014E8L,
        velocityPatches = listOf(
            VelocityPatch(0x00101514L, 28, paired = true),
            VelocityPatch(0x00101530L, 36),
            VelocityPatch(0x00101610L, 40),
            VelocityPatch(0x00101614L, 44),
            VelocityPatch(0x00101620L, 48),
        ),
    ),
    HmdLayout(
        versionCode = 5002172,
        fileSize = 2_238_792,
        hookVaddr = 0x000FD860L,
        velocityPatches = listOf(
            VelocityPatch(0x000FD91CL, 28, paired = true),
            VelocityPatch(0x000FD8C8L, 36),
            VelocityPatch(0x000FD950L, 40),
            VelocityPatch(0x000FD954L, 44),
            VelocityPatch(0x000FD958L, 48),
        ),
    ),
    HmdLayout(
        versionCode = 5002206,
        fileSize = 2_239_920,
        hookVaddr = 0x000FDD68L,
        velocityPatches = listOf(
            VelocityPatch(0x000FDE24L, 28, paired = true),
            VelocityPatch(0x000FDDD0L, 36),
            VelocityPatch(0x000FDE58L, 40),
            VelocityPatch(0x000FDE5CL, 44),
            VelocityPatch(0x000FDE60L, 48),
        ),
    ),
    HmdLayout(
        versionCode = 5002244,
        fileSize = 2_251_920,
        hookVaddr = 0x000FEAD8L,
        velocityPatches = listOf(
            VelocityPatch(0x000FED48L, 28),
            VelocityPatch(0x000FED4CL, 32),
            VelocityPatch(0x000FED50L, 36),
            VelocityPatch(0x000FED5CL, 40),
            VelocityPatch(0x000FED60L, 44),
            VelocityPatch(0x000FED6CL, 48),
        ),
    ),
)

private val NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
private val BR_X17 = byteArrayOf(0x20, 0x02, 0x1f, 0xd6.toByte())

private fun buildTrampolineBody(offsetMs: Int): ByteArray {
    val offsetNs = offsetMs.toLong() * 1_000_000L
    val low = (offsetNs and 0xFFFF).toInt()
    val high = ((offsetNs ushr 16) and 0xFFFF).toInt()
    val movzX16 = 0xD2800000.toInt() or (low shl 5) or 16
    val movkX16Lsl16 = 0xF2A00000.toInt() or (high shl 5) or 16
    val addX2X2X16 = 0x8B100042.toInt()
    return ByteBuffer.allocate(12).order(ByteOrder.LITTLE_ENDIAN)
        .putInt(movzX16)
        .putInt(movkX16Lsl16)
        .putInt(addX2X2X16)
        .array()
}

// Encode AArch64 B <target> from <pc>.
private fun buildBranch(pc: Long, target: Long): ByteArray {
    val offsetWords = ((target - pc) / 4).toInt()
    val insn = 0x14000000.toInt() or (offsetWords and 0x3FFFFFF)
    return ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(insn).array()
}

// Find the last 32 bytes of the first PT_LOAD segment (two PLT entries = code cave).
private fun findPltCave(bytes: ByteArray): Pair<Int, Long> {
    val phoff  = bytes.readU32LE(32)
    val phesz  = bytes.readU16LE(54)
    val phnum  = bytes.readU16LE(56)
    for (i in 0 until phnum) {
        val base = phoff + i * phesz
        if (bytes.readU32LE(base) != 1) continue           // PT_LOAD
        if (bytes.readU64LE(base + 8) != 0L) continue      // first LOAD at fileoff=0
        val vaddr   = bytes.readU64LE(base + 16)
        val filesz  = bytes.readU64LE(base + 32).toInt()
        val caveOff = filesz - 32
        val caveVa  = vaddr + (filesz - 32).toLong()
        if (caveOff < 0 || caveOff + 32 > bytes.size) {
            throw PatchException("Invalid PLT cave range at 0x${caveOff.toString(16)}")
        }
        return Pair(caveOff, caveVa)
    }
    throw PatchException("No executable PT_LOAD segment found in ELF")
}

private fun strWzrX19(byteOffset: Int): ByteArray {
    // STR WZR, [X19, #byteOffset]: opcode 0xB9, Rn=19, Rt=31 (WZR)
    val imm12 = byteOffset / 4
    val word = 0xB9000000.toInt() or (imm12 shl 10) or (19 shl 5) or 31
    return ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(word).array()
}

private fun sturXzrX19(byteOffset: Int): ByteArray {
    val imm9 = byteOffset and 0x1FF
    val word = 0xF8000000.toInt() or (imm9 shl 12) or (19 shl 5) or 31
    return ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(word).array()
}

private fun isStrSUnsignedImm(word: Int, baseReg: Int, byteOffset: Int): Boolean =
    (word and 0xFFC00000.toInt()) == 0xBD000000.toInt() &&
    ((word ushr 5) and 0x1F) == baseReg &&
    (((word ushr 10) and 0xFFF) * 4) == byteOffset &&
    (word and 0x1F) != 31

private fun isSturDUnscaled(word: Int, baseReg: Int, byteOffset: Int): Boolean =
    (word and 0xFFE00C00.toInt()) == 0xFC000000.toInt() &&
    ((word ushr 5) and 0x1F) == baseReg &&
    ((word ushr 12) and 0x1FF) == (byteOffset and 0x1FF) &&
    (word and 0x1F) != 31

private fun replacementFor(patch: VelocityPatch): ByteArray =
    if (patch.paired) sturXzrX19(patch.byteOffset) else strWzrX19(patch.byteOffset)

private fun isPatchedVelocity(word: Int, patch: VelocityPatch): Boolean =
    word == ByteBuffer.wrap(replacementFor(patch)).order(ByteOrder.LITTLE_ENDIAN).int

private fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).toHex()

@Suppress("unused")
val hmdOnlyPatch = rawResourcePatch(
    name = "HMD-only pose fix",
    description = "Adds a configurable offset to the HMD OpenXR pose-query time and zeroes all six exported HMD velocity fields. Does not affect controller paths.",
    default = true,
) {
    compatibleWith(
        COMPATIBILITY_STEAM_LINK_HMD_ONLY,
        COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002172,
        COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002206,
        COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002244,
    )

    val offsetMs by intOption(
        key = "offsetMs",
        default = 78,
        title = "Pose offset (ms)",
        description = "Milliseconds added to HMD pose-query time. Tested default: 78 ms. Allowed range: 0 to 4000 ms.",
        required = true,
        validator = { value -> value != null && value in 0..4000 },
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val mutable = file.readBytes().copyOf()
        val layout = HMD_LAYOUTS.singleOrNull { it.fileSize == mutable.size }
            ?: throw PatchException(
                "Unsupported libvrlink_scene.so size=${mutable.size}, sha256=${mutable.sha256()}. " +
                    "Supported versionCodes: ${HMD_LAYOUTS.joinToString { it.versionCode.toString() }}"
            )

        // Locate PLT cave at end of first executable segment (version-agnostic).
        val (caveOff, caveVa) = findPltCave(mutable)
        val trampoline = ORIG_HOOK + buildTrampolineBody(offsetMs!!) +
            buildBranch(caveVa + 16, layout.hookVaddr + 4) + NOP + NOP + NOP
        val patchedHook = buildBranch(layout.hookVaddr, caveVa)
        val hookOffset = vaddrToFileOffset(mutable, layout.hookVaddr, ORIG_HOOK.size)
        val hookActual = mutable.sliceArray(hookOffset until hookOffset + ORIG_HOOK.size)
        val caveActual = mutable.sliceArray(caveOff until caveOff + trampoline.size)
        val velocityOffsets = layout.velocityPatches.map { vaddrToFileOffset(mutable, it.vaddr, 4) }
        val velocityWords = velocityOffsets.map { mutable.readU32LE(it) }

        val alreadyPatched = hookActual.contentEquals(patchedHook) &&
            caveActual.contentEquals(trampoline) &&
            velocityWords.indices.all { isPatchedVelocity(velocityWords[it], layout.velocityPatches[it]) }
        if (alreadyPatched) return@execute

        if (!hookActual.contentEquals(ORIG_HOOK)) {
            throw PatchException(
                "HMD hook precondition failed for versionCode ${layout.versionCode}: " +
                "hook@0x${hookOffset.toString(16)}=${hookActual.toHex()} " +
                "(expected ${ORIG_HOOK.toHex()})"
            )
        }

        val originalCave =
            caveActual.sliceArray(12 until 16).contentEquals(BR_X17) &&
            caveActual.sliceArray(28 until 32).contentEquals(BR_X17)
        if (!originalCave) {
            throw PatchException(
                "HMD trampoline cave precondition failed at 0x${caveOff.toString(16)}: " +
                caveActual.toHex()
            )
        }

        for (i in velocityWords.indices) {
            val patch = layout.velocityPatches[i]
            val valid = if (patch.paired) {
                isSturDUnscaled(velocityWords[i], 19, patch.byteOffset)
            } else {
                isStrSUnsignedImm(velocityWords[i], 19, patch.byteOffset)
            }
            if (!valid) {
                throw PatchException(
                    "Velocity store precondition failed for versionCode ${layout.versionCode} " +
                    "at vaddr 0x${patch.vaddr.toString(16)}: " +
                    "word 0x${velocityWords[i].toUInt().toString(16)}"
                )
            }
        }

        // All checks passed. Commit changes only now.
        trampoline.copyInto(mutable, caveOff)
        patchedHook.copyInto(mutable, hookOffset)
        for (i in velocityOffsets.indices) {
            val off = velocityOffsets[i]
            replacementFor(layout.velocityPatches[i]).copyInto(mutable, off)
        }

        file.writeBytes(mutable)
    }
}

private fun ByteArray.readU16LE(off: Int): Int =
    (this[off].toInt() and 0xFF) or
    ((this[off + 1].toInt() and 0xFF) shl 8)

private fun ByteArray.readU32LE(off: Int): Int =
    (this[off].toInt() and 0xFF) or
    ((this[off + 1].toInt() and 0xFF) shl 8) or
    ((this[off + 2].toInt() and 0xFF) shl 16) or
    ((this[off + 3].toInt() and 0xFF) shl 24)

private fun ByteArray.readU64LE(off: Int): Long =
    (readU32LE(off).toLong() and 0xFFFFFFFFL) or
    ((readU32LE(off + 4).toLong() and 0xFFFFFFFFL) shl 32)

private fun ByteArray.toHex() = joinToString("") { "%02x".format(it) }
