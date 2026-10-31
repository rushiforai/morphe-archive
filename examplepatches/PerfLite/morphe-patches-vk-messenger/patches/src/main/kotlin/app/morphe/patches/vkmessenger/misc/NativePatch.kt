package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import java.io.File

private const val MOV_W0_ONE = 0x52800020
private const val BL_OPCODE = 0b100101
private const val B_COND_BASE = 0x54000000
private const val B_COND_MASK = 0xFF000010.toInt()
private const val TBZ_BASE = 0x36000000
private const val TBZ_MASK = 0x7E000010
private const val NOP_INSTRUCTION = 0xD503201F.toInt()
private const val RET_INSTRUCTION = 0xD65F03C0.toInt()
private const val CANARY_LOAD = 0xF9401688.toInt()

// Offset of the clean-return epilogue (stack canary check + ret) closing the function that holds a kill block.
private const val EPILOGUE_OFFSET = -0x20

private val tamperLibraries = listOf(
    "lib/arm64-v8a/libvkmedia.so",
)

private fun Int.leBytes() = byteArrayOf(
    (this and 0xff).toByte(),
    ((this shr 8) and 0xff).toByte(),
    ((this shr 16) and 0xff).toByte(),
    ((this shr 24) and 0xff).toByte(),
)

/**
 * ELF64 shared library, decoded just enough to locate executable code and resolve one import.
 */
private class Elf64(private val bytes: ByteArray) {
    private val loads: List<Triple<Long, Long, Long>> // virtual address, file offset, size
    private val sections: List<Section>
    private val sectionNamesOffset: Int

    private class Section(
        val nameOffset: Int,
        val address: Long,
        val offset: Long,
        val size: Long,
        val link: Int,
        val entrySize: Long,
    )

    init {
        require(bytes.size > 64 && bytes.u32(0) == 0x464C457F) { "not an ELF file" }
        require(bytes[4] == 2.toByte()) { "not ELF64" }

        val programHeaderOffset = bytes.u64(0x20)
        val programHeaderSize = bytes.u16(0x36).toLong()
        val programHeaderCount = bytes.u16(0x38).toLong()
        loads = (0 until programHeaderCount)
            .map { index -> programHeaderOffset + index * programHeaderSize }
            .filter { bytes.u32(it) == 1 /* PT_LOAD */ }
            .map { header -> Triple(bytes.u64(header + 16), bytes.u64(header + 8), bytes.u64(header + 32)) }

        val sectionHeaderOffset = bytes.u64(0x28)
        val sectionHeaderSize = bytes.u16(0x3A).toLong()
        val sectionHeaderCount = bytes.u16(0x3C).toLong()
        sections = (0 until sectionHeaderCount).map { index ->
            val header = sectionHeaderOffset + index * sectionHeaderSize
            Section(
                nameOffset = bytes.u32(header),
                address = bytes.u64(header + 0x10),
                offset = bytes.u64(header + 0x18),
                size = bytes.u64(header + 0x20),
                link = bytes.u32(header + 0x28),
                entrySize = bytes.u64(header + 0x38),
            )
        }
        sectionNamesOffset = sections[bytes.u16(0x3E)].offset.toInt()
    }

    fun toFileOffset(virtualAddress: Long): Int? = loads
        .firstOrNull { (address, _, size) -> virtualAddress in address until address + size }
        ?.let { (address, offset, _) -> (offset + (virtualAddress - address)).toInt() }

    /** File offset of the PLT stub that tail-calls the import named [symbol], or null when absent. */
    fun pltStub(symbol: String): Int? {
        val plt = named(".plt") ?: return null
        val rela = named(".rela.plt") ?: return null
        val symbolTable = named(".dynsym") ?: return null
        val strings = sections[symbolTable.link]

        val entryCount = (rela.size / rela.entrySize).toInt()
        val symbolCount = (symbolTable.size / 24).toInt()
        for (entry in 0 until entryCount) {
            val at = (rela.offset + entry * rela.entrySize).toInt()
            val symbolIndex = (bytes.u64(at + 8L) ushr 32).toInt()
            if (symbolIndex !in 1 until symbolCount) continue

            val nameOffset = (strings.offset + bytes.u32(symbolTable.offset + symbolIndex * 24)).toInt()
            if (bytes.cString(nameOffset) == symbol) return toFileOffset(plt.address + 32 + entry * 16)
        }
        return null
    }

    /** File offset range of executable code, so data is never scanned as instructions. */
    fun codeRange(): Pair<Int, Int>? {
        val text = named(".text") ?: return null
        val start = toFileOffset(text.address) ?: text.offset.toInt()
        return start to start + text.size.toInt()
    }

    private fun named(name: String) = sections.firstOrNull {
        bytes.cString(sectionNamesOffset + it.nameOffset) == name
    }
}

private fun ByteArray.u32(at: Long): Int = u32(at.toInt())

private fun ByteArray.u16(at: Long): Int = u16(at.toInt())

private fun ByteArray.u16(at: Int): Int =
    (this[at].toInt() and 0xff) or ((this[at + 1].toInt() and 0xff) shl 8)

private fun ByteArray.u32(at: Int): Int =
    (this[at].toInt() and 0xff) or
        ((this[at + 1].toInt() and 0xff) shl 8) or
        ((this[at + 2].toInt() and 0xff) shl 16) or
        ((this[at + 3].toInt() and 0xff) shl 24)

private fun ByteArray.u64(at: Long): Long {
    var value = 0L
    for (i in 0 until 8) value = value or ((this[at.toInt() + i].toLong() and 0xff) shl (8 * i))
    return value
}

private fun ByteArray.cString(at: Int): String {
    var end = at
    while (end < size && this[end] != 0.toByte()) end++
    return String(this, at, end - at, Charsets.ISO_8859_1)
}

private fun neutralize(file: File, label: String) {
    if (!file.exists()) {
        println("WARNING: $label is missing - native anti-tamper not patched")
        return
    }

    val bytes = file.readBytes()
    val elf = runCatching { Elf64(bytes) }.getOrNull()
    if (elf == null) {
        println("WARNING: $label is not a parsable ELF64 library - left alone")
        return
    }

    val exitStub = elf.pltStub("_exit")
    if (exitStub == null) {
        println("WARNING: $label does not import _exit - left alone")
        return
    }

    val (codeFrom, codeTo) = elf.codeRange() ?: run {
        println("WARNING: $label has no .text section - left alone")
        return
    }

    // A kill block is `mov w0, #1 ; bl _exit`. Only the tamper ones are entered by exactly one
    // conditional branch, and that branch is what gets neutralized.
    val blocks = ArrayList<Int>()
    for (offset in codeFrom until minOf(codeTo, bytes.size - 8) step 4) {
        if (bytes.u32(offset) != MOV_W0_ONE) continue
        val call = bytes.u32(offset + 4)
        if (call ushr 26 != BL_OPCODE) continue
        var immediate = call and 0x3FFFFFF
        if (immediate and 0x2000000 != 0) immediate -= 0x4000000
        if (offset + 4 + immediate * 4 == exitStub) blocks.add(offset)
    }

    if (blocks.isEmpty()) {
        println("$label: no _exit kill blocks - nothing to do")
        return
    }

    val blockSet = blocks.toHashSet()
    val guardsByBlock = HashMap<Int, MutableList<Int>>()
    val scanFrom = (blocks.min() - 0x10000).coerceAtLeast(codeFrom)
    val scanTo = (blocks.max() + 0x1000).coerceAtMost(minOf(codeTo, bytes.size - 4))
    for (offset in scanFrom..scanTo step 4) {
        val instruction = bytes.u32(offset)
        val isConditionalBranch = instruction and B_COND_MASK == B_COND_BASE
        val isTestBranch = instruction and TBZ_MASK == TBZ_BASE
        if (!isConditionalBranch && !isTestBranch) continue

        // tbz/tbnz carry a 14 bit offset, b.cond a 19 bit one; both are scaled by the instruction size.
        val fieldWidth = if (isTestBranch) 14 else 19
        var immediate = (instruction ushr 5) and ((1 shl fieldWidth) - 1)
        if (immediate and (1 shl (fieldWidth - 1)) != 0) immediate -= 1 shl fieldWidth
        val target = offset + immediate * 4
        if (target in blockSet) guardsByBlock.getOrPut(target) { mutableListOf() }.add(offset)
    }

    var patched = 0
    for ((block, guards) in guardsByBlock) {
        if (guards.size != 1) {
            println("WARNING: $label kill block 0x${block.toString(16)} has ${guards.size} guards - left alone")
            continue
        }

        val guard = guards.single()
        if (bytes.u32(guard) and TBZ_MASK == TBZ_BASE) {
            NOP_INSTRUCTION.leBytes().copyInto(bytes, guard)
            patched++
            println("$label: nopped kill guard 0x${guard.toString(16)}")
            continue
        }

        // The fall-through of a b.cond guard is a JNI ThrowNew("error! verify new libraries in
        // application!"), so nopping it would trade a silent exit for a fatal exception. Jump to the
        // epilogue of the same function instead, after proving the anchors really close that function.
        val epilogue = block + EPILOGUE_OFFSET
        if (bytes.u32(block - 4) != RET_INSTRUCTION || bytes.u32(epilogue) != CANARY_LOAD) {
            println("WARNING: $label epilogue anchors missing before 0x${block.toString(16)} - guard 0x${guard.toString(16)} left alone")
            continue
        }

        (0x14000000 or (((epilogue - guard) shr 2) and 0x03FFFFFF)).leBytes().copyInto(bytes, guard)
        patched++
        println("$label: redirected kill guard 0x${guard.toString(16)} -> epilogue 0x${epilogue.toString(16)}")
    }

    if (patched > 0) {
        file.writeBytes(bytes)
        println("$label: neutralized $patched kill guard(s) from ${blocks.size} block(s)")
    } else {
        println("WARNING: $label has ${blocks.size} kill block(s) but no neutralizable guard")
    }
}

@Suppress("unused")
val nativePatch = resourcePatch(
    name = "Native anti-tamper bypass",
    description = "Neutralizes the signature checks in libvkmedia.so that exit the process when the APK carries a custom signing key.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

    finalize {
        tamperLibraries.forEach { path -> neutralize(get(path), path.substringAfterLast('/')) }
    }
}
