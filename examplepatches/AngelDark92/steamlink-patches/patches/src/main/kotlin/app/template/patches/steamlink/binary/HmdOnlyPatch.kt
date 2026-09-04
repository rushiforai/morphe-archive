package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intSliderOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.steamlink.util.BinaryPatchHelper.vaddrToFileOffset
import java.nio.ByteBuffer
import java.nio.ByteOrder

// Injects an AArch64 trampoline that adds a configurable offset to the HMD pose query time
// and zeroes the six HMD velocity fields exported to SteamVR.
// Controller paths are not modified.
// Target function: _ZN13QSVLDeviceHmd7GetPoseER10XRQContextR12PackedPose_t (QSVLDeviceHmd::GetPose)

// `ldr x2,[sp,#8]` — loads pose query timestamp into X2; replaced by B <cave> to inject offset
private val ORIG_HOOK = byteArrayOf(0xe2.toByte(), 0x07, 0x40, 0xf9.toByte())

private data class VelocityPatch(
    val vaddr: Long,
    // Byte offset of the velocity float(s) within the PackedPose_t struct, relative to X19 base
    val byteOffset: Int,
    // paired=true: two floats stored as STUR D (64-bit); false: single float STR W (32-bit)
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
        versionCode = 5001740,
        fileSize = 2_220_528,
        hookVaddr = 0x00101378L,
        velocityPatches = listOf(
            VelocityPatch(0x001013A4L, 28, paired = true),
            VelocityPatch(0x001013C0L, 36),
            VelocityPatch(0x001014A0L, 40),
            VelocityPatch(0x001014A4L, 44),
            VelocityPatch(0x001014B0L, 48),
        ),
    ),
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
    HmdLayout(
        versionCode = 5002313,
        fileSize = 2_276_872,
        hookVaddr = 0x00100B8CL,
        velocityPatches = listOf(
            VelocityPatch(0x00100E00L, 28),
            VelocityPatch(0x00100E04L, 32),
            VelocityPatch(0x00100E08L, 36),
            VelocityPatch(0x00100E14L, 40),
            VelocityPatch(0x00100E18L, 44),
            VelocityPatch(0x00100E24L, 48),
        ),
    ),
    HmdLayout(
        versionCode = 5002318,
        fileSize = 2_277_488,
        hookVaddr = 0x00100B0CL,
        velocityPatches = listOf(
            VelocityPatch(0x00100D80L, 28),
            VelocityPatch(0x00100D84L, 32),
            VelocityPatch(0x00100D88L, 36),
            VelocityPatch(0x00100D94L, 40),
            VelocityPatch(0x00100D98L, 44),
            VelocityPatch(0x00100DA4L, 48),
        ),
    ),
    HmdLayout(
        versionCode = 5002322,
        fileSize = 2_283_400,
        hookVaddr = 0x00101154L,
        velocityPatches = listOf(
            VelocityPatch(0x001013C8L, 28),
            VelocityPatch(0x001013CCL, 32),
            VelocityPatch(0x001013D0L, 36),
            VelocityPatch(0x001013DCL, 40),
            VelocityPatch(0x001013E0L, 44),
            VelocityPatch(0x001013ECL, 48),
        ),
    ),
)

private const val PT_LOAD = 1
private const val PT_NOTE = 4
private const val PF_X = 1
private const val PF_R = 4
private const val SHF_ALLOC = 2L

private data class TrampolineCave(
    val fileOffset: Int,
    val vaddr: Long,
    val programHeaderOffset: Int,
    val alreadyMapped: Boolean,
    val mapFileOffset: Long,
    val mapVaddr: Long,
    val mapSize: Long,
    val mapAlignment: Long,
)

private fun buildTrampolineBody(offsetMs: Long): ByteArray {
    // Encode offsetMs as nanoseconds (ms * 1e6), split across MOVZ (bits 0-15) + MOVK lsl#16 (bits 16-31)
    // into X16, then ADD X2, X2, X16 adds the nanosecond delta to the pose query timestamp in X2
    val offsetNs = offsetMs * 1_000_000L
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

// Map the non-runtime .comment payload through the otherwise redundant PT_NOTE header. The note
// bytes are already covered by the first PT_LOAD; repurposing PT_NOTE preserves every live PLT
// entry and keeps the file size and all existing segment/section offsets unchanged.
private fun findTrampolineCave(bytes: ByteArray, trampolineSize: Int): TrampolineCave {
    val phoff = bytes.readU64LE(32).toInt()
    val phesz = bytes.readU16LE(54)
    val phnum = bytes.readU16LE(56)
    val shoff = bytes.readU64LE(40).toInt()
    val shesz = bytes.readU16LE(58)
    val shnum = bytes.readU16LE(60)
    val shstrndx = bytes.readU16LE(62)
    if (phoff <= 0 || phesz < 56 || shoff <= 0 || shesz < 64 || shstrndx !in 1 until shnum) {
        throw PatchException("Unsupported ELF header layout for Visual Delay trampoline")
    }

    val shstr = shoff + shstrndx * shesz
    val shstrOffset = bytes.readU64LE(shstr + 24).toInt()
    val shstrSize = bytes.readU64LE(shstr + 32).toInt()
    val comment = (1 until shnum).map { shoff + it * shesz }.singleOrNull { section ->
        val nameOffset = bytes.readU32LE(section)
        bytes.readCString(shstrOffset + nameOffset, shstrOffset + shstrSize) == ".comment"
    } ?: throw PatchException("Missing unique .comment section for Visual Delay trampoline")
    val commentFlags = bytes.readU64LE(comment + 8)
    val commentOffset = bytes.readU64LE(comment + 24).toInt()
    val commentSize = bytes.readU64LE(comment + 32).toInt()
    if ((commentFlags and SHF_ALLOC) != 0L || commentSize < trampolineSize ||
        commentOffset < 0 || commentOffset + trampolineSize > bytes.size
    ) {
        throw PatchException("Unsafe .comment section layout for Visual Delay trampoline")
    }

    val programHeaders = (0 until phnum).map { phoff + it * phesz }
    val loadHeaders = programHeaders.filter { bytes.readU32LE(it) == PT_LOAD }
    val mapAlignment = loadHeaders.maxOfOrNull { bytes.readU64LE(it + 48) }
        ?: throw PatchException("Missing PT_LOAD headers for Visual Delay trampoline")
    if (mapAlignment < 0x1000L || (mapAlignment and (mapAlignment - 1)) != 0L) {
        throw PatchException("Invalid PT_LOAD alignment 0x${mapAlignment.toString(16)}")
    }
    val mapFileOffset = commentOffset.toLong() and -mapAlignment
    val caveDelta = commentOffset.toLong() - mapFileOffset
    val mapSize = caveDelta + trampolineSize
    val existingLoad = programHeaders.singleOrNull { header ->
        bytes.readU32LE(header) == PT_LOAD &&
            bytes.readU32LE(header + 4) == (PF_R or PF_X) &&
            bytes.readU64LE(header + 8) == mapFileOffset &&
            bytes.readU64LE(header + 32) >= mapSize
    }
    if (existingLoad != null) {
        val mapVaddr = bytes.readU64LE(existingLoad + 16)
        return TrampolineCave(
            commentOffset,
            mapVaddr + caveDelta,
            existingLoad,
            true,
            mapFileOffset,
            mapVaddr,
            mapSize,
            mapAlignment,
        )
    }

    val noteHeader = programHeaders.singleOrNull { bytes.readU32LE(it) == PT_NOTE }
        ?: throw PatchException("Missing unique PT_NOTE header for Visual Delay trampoline")
    val maxLoadEnd = loadHeaders.maxOf { header ->
        bytes.readU64LE(header + 16) + bytes.readU64LE(header + 40)
    }
    val mapVaddr = (maxLoadEnd + mapAlignment - 1) and -mapAlignment
    return TrampolineCave(
        commentOffset,
        mapVaddr + caveDelta,
        noteHeader,
        false,
        mapFileOffset,
        mapVaddr,
        mapSize,
        mapAlignment,
    )
}

private fun installTrampolineLoad(bytes: ByteArray, cave: TrampolineCave) {
    val header = cave.programHeaderOffset
    bytes.writeU32LE(header, PT_LOAD)
    bytes.writeU32LE(header + 4, PF_R or PF_X)
    bytes.writeU64LE(header + 8, cave.mapFileOffset)
    bytes.writeU64LE(header + 16, cave.mapVaddr)
    bytes.writeU64LE(header + 24, cave.mapVaddr)
    bytes.writeU64LE(header + 32, cave.mapSize)
    bytes.writeU64LE(header + 40, cave.mapSize)
    bytes.writeU64LE(header + 48, cave.mapAlignment)
}

private fun strWzrX19(byteOffset: Int): ByteArray {
    // STR WZR, [X19, #byteOffset]: zeroes a 32-bit velocity float field at [x19+byteOffset] in PackedPose_t
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

internal fun patchVisualDelay(bytes: ByteArray, offsetMs: Long): ByteArray {
    val mutable = bytes.copyOf()
    val layout = HMD_LAYOUTS.singleOrNull { it.fileSize == mutable.size } ?: return mutable

    val cave = findTrampolineCave(mutable, 20)
    val caveOff = cave.fileOffset
    val caveVa = cave.vaddr
    val trampoline = ORIG_HOOK + buildTrampolineBody(offsetMs) +
        buildBranch(caveVa + 16, layout.hookVaddr + 4)
    val patchedHook = buildBranch(layout.hookVaddr, caveVa)
    val hookOffset = vaddrToFileOffset(mutable, layout.hookVaddr, ORIG_HOOK.size)
    val hookActual = mutable.sliceArray(hookOffset until hookOffset + ORIG_HOOK.size)
    val caveActual = mutable.sliceArray(caveOff until caveOff + trampoline.size)
    val velocityOffsets = layout.velocityPatches.map { vaddrToFileOffset(mutable, it.vaddr, 4) }
    val velocityWords = velocityOffsets.map { mutable.readU32LE(it) }

    val alreadyPatched = hookActual.contentEquals(patchedHook) &&
        caveActual.contentEquals(trampoline) &&
        cave.alreadyMapped &&
        velocityWords.indices.all { isPatchedVelocity(velocityWords[it], layout.velocityPatches[it]) }
    if (alreadyPatched) return mutable

    if (!hookActual.contentEquals(ORIG_HOOK)) {
        throw PatchException(
            "Visual Delay hook precondition failed for versionCode ${layout.versionCode}: " +
                "hook@0x${hookOffset.toString(16)}=${hookActual.toHex()} " +
                "(expected ${ORIG_HOOK.toHex()})"
        )
    }

    if (cave.alreadyMapped) {
        throw PatchException(
            "Visual Delay injected-load precondition failed at 0x${caveOff.toString(16)}"
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

    trampoline.copyInto(mutable, caveOff)
    installTrampolineLoad(mutable, cave)
    patchedHook.copyInto(mutable, hookOffset)
    for (i in velocityOffsets.indices) {
        replacementFor(layout.velocityPatches[i]).copyInto(mutable, velocityOffsets[i])
    }
    return mutable
}

@Suppress("unused")
val hmdOnlyPatch = rawResourcePatch(
    name = "Visual Delay Fix",
    description = "Adds a configurable offset to the HMD OpenXR pose-query time and zeroes all six " +
        "exported HMD velocity fields. Does not affect controller paths. Its trampoline uses a " +
        "dedicated executable mapping over non-runtime ELF comment bytes and preserves live PLT entries.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())

    val offsetMs = intSliderOption(
        key = "offsetMs",
        min = 0,
        max = 4000,
        default = 60,
        step = 1,
        title = "Pose offset (ms)",
        // 60 ms tested default for Galaxy XR; max 4000 ms (4 s) practical upper bound
        description = "libvrlink_scene.so: AArch64 MOVZ/MOVK at PLT cave adds value×1e6 ns to X2 in QSVLDeviceHmd::GetPose. Tested default: 60 ms. Allowed range: 0 to 4000 ms.",
        required = true,
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        // An unrecognized native layout must not block the rest of an experimental APK patch.
        // Fixed instruction addresses are unsafe to guess, so leave this one mutation untouched.
        val patched = patchVisualDelay(bytes, offsetMs.value!!.toLong())
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
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

private fun ByteArray.writeU32LE(off: Int, value: Int) {
    for (index in 0 until 4) this[off + index] = (value ushr (index * 8)).toByte()
}

private fun ByteArray.writeU64LE(off: Int, value: Long) {
    for (index in 0 until 8) this[off + index] = (value ushr (index * 8)).toByte()
}

private fun ByteArray.readCString(start: Int, limit: Int): String {
    if (start !in indices || limit !in 1..size || start >= limit) return ""
    var end = start
    while (end < limit && this[end] != 0.toByte()) end++
    return copyOfRange(start, end).decodeToString()
}

private fun ByteArray.toHex() = joinToString("") { "%02x".format(it) }
