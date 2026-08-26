package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.util.BinaryPatchHelper.vaddrToFileOffset
import java.nio.ByteBuffer
import java.nio.ByteOrder

private enum class PoseCadenceMode(val key: String) {
    STOCK("stock-4x"),
    HALF("half-2x"),
    DISPLAY("display-1x"),
    ;

    companion object {
        fun from(raw: String): PoseCadenceMode = when (raw) {
            STOCK.key, "Stock (4x display rate)" -> STOCK
            HALF.key, "Half (2x display rate)" -> HALF
            DISPLAY.key, "Display rate (1x)" -> DISPLAY
            else -> throw PatchException("Unknown controller pose-send cadence: $raw")
        }
    }
}

private data class CadenceBlock(
    val countVaddr: Long,
    val pointerVaddr: Long,
    val phase2Vaddr: Long,
    val phase3Vaddr: Long,
    val event2TimeVaddr: Long,
    val event3TimeVaddr: Long,
    val baseTimeRegister: Int,
    val stockEvent3TimeRegister: Int,
)

private data class CadenceLayout(
    val versionCode: Int,
    val fileSize: Int,
    val blocks: List<CadenceBlock>,
)

private val CADENCE_LAYOUTS = listOf(
    CadenceLayout(
        versionCode = 5001712,
        fileSize = 2_221_072,
        blocks = listOf(
            CadenceBlock(0x000F6468L, 0x000F6458L, 0x000F64B0L, 0x000F64C4L, 0x000F64ECL, 0x000F64D0L, 10, 9),
            CadenceBlock(0x000F6568L, 0x000F6558L, 0x000F65B0L, 0x000F65C4L, 0x000F65ECL, 0x000F65D0L, 10, 9),
            CadenceBlock(0x000F6630L, 0x000F6620L, 0x000F6678L, 0x000F6688L, 0x000F66B4L, 0x000F66BCL, 9, 10),
        ),
    ),
    CadenceLayout(
        versionCode = 5002206,
        fileSize = 2_239_920,
        blocks = listOf(
            CadenceBlock(0x000F2950L, 0x000F2940L, 0x000F2998L, 0x000F29ACL, 0x000F29D4L, 0x000F29B8L, 10, 9),
            CadenceBlock(0x000F2A54L, 0x000F2A44L, 0x000F2A9CL, 0x000F2AB0L, 0x000F2AD8L, 0x000F2ABCL, 10, 9),
            CadenceBlock(0x000F2B1CL, 0x000F2B0CL, 0x000F2B64L, 0x000F2B74L, 0x000F2BA0L, 0x000F2BA8L, 9, 10),
        ),
    ),
    CadenceLayout(
        versionCode = 5002244,
        fileSize = 2_251_920,
        blocks = listOf(
            CadenceBlock(0x000F3518L, 0x000F3508L, 0x000F3560L, 0x000F3574L, 0x000F359CL, 0x000F3580L, 10, 9),
            CadenceBlock(0x000F361CL, 0x000F360CL, 0x000F3664L, 0x000F3678L, 0x000F36A0L, 0x000F3684L, 10, 9),
            CadenceBlock(0x000F36E4L, 0x000F36D4L, 0x000F372CL, 0x000F373CL, 0x000F3768L, 0x000F3770L, 9, 10),
        ),
    ),
    CadenceLayout(
        versionCode = 5002313,
        fileSize = 2_276_872,
        blocks = listOf(
            CadenceBlock(0x000F5484L, 0x000F5474L, 0x000F54CCL, 0x000F54E0L, 0x000F5508L, 0x000F54ECL, 10, 9),
            CadenceBlock(0x000F5588L, 0x000F5578L, 0x000F55D0L, 0x000F55E4L, 0x000F560CL, 0x000F55F0L, 10, 9),
            CadenceBlock(0x000F5650L, 0x000F5640L, 0x000F5698L, 0x000F56A8L, 0x000F56D4L, 0x000F56DCL, 9, 10),
        ),
    ),
)

private enum class CadenceField {
    COUNT,
    POINTER,
    PHASE2,
    PHASE3,
    EVENT2_TIME,
    EVENT3_TIME,
}

private data class CadenceWords(
    val count: Int,
    val pointer: Int,
    val phase2: Int,
    val phase3: Int,
    val event2Time: Int,
    val event3Time: Int,
) {
    operator fun get(field: CadenceField): Int = when (field) {
        CadenceField.COUNT -> count
        CadenceField.POINTER -> pointer
        CadenceField.PHASE2 -> phase2
        CadenceField.PHASE3 -> phase3
        CadenceField.EVENT2_TIME -> event2Time
        CadenceField.EVENT3_TIME -> event3Time
    }
}

private data class PreparedEdit(
    val field: CadenceField,
    val vaddr: Long,
    val fileOffset: Int,
    val targetWord: Int,
    val allowedWords: Set<Int>,
)

private fun cadenceWords(block: CadenceBlock, mode: PoseCadenceMode): CadenceWords {
    val eventCount: Int
    val firstEventOffset: Int
    val phase2: Int
    val phase3: Int
    val event2TimeRegister: Int
    val event3TimeRegister: Int

    when (mode) {
        PoseCadenceMode.STOCK -> {
            eventCount = 5
            firstEventOffset = 0x08
            phase2 = 2
            phase3 = 3
            event2TimeRegister = 13
            event3TimeRegister = block.stockEvent3TimeRegister
        }

        PoseCadenceMode.HALF -> {
            // Post rewritten phase-0 and phase-2 pose events, then the original type-2 update event.
            eventCount = 3
            firstEventOffset = 0x28
            phase2 = 0
            phase3 = 2
            event2TimeRegister = block.baseTimeRegister
            event3TimeRegister = 13
        }

        PoseCadenceMode.DISPLAY -> {
            // Post the rewritten phase-0 pose event, then the original type-2 update event.
            eventCount = 2
            firstEventOffset = 0x38
            phase2 = 2 // Event 2 is not posted; retain its stock encoding for reversible switching.
            phase3 = 0
            event2TimeRegister = 13
            event3TimeRegister = block.baseTimeRegister
        }
    }

    return CadenceWords(
        count = movzW(register = 2, immediate = eventCount),
        pointer = addImmediateX(destination = 1, base = 31, immediate = firstEventOffset),
        phase2 = movzW(register = 11, immediate = phase2),
        phase3 = movzW(register = 12, immediate = phase3),
        event2Time = strWUnsigned(register = event2TimeRegister, base = 31, byteOffset = 0x2C),
        event3Time = strWUnsigned(register = event3TimeRegister, base = 31, byteOffset = 0x3C),
    )
}

internal fun patchControllerPoseCadence(bytes: ByteArray, rawMode: String): ByteArray {
    val mode = PoseCadenceMode.from(rawMode)
    val layout = CADENCE_LAYOUTS.singleOrNull { it.fileSize == bytes.size }
    if (layout == null) {
        // Any cadence requires fixed instruction locations. Unknown layouts are experimental:
        // leave this optional native mutation untouched instead of aborting the APK patch.
        return bytes.copyOf()
    }

    val prepared = buildList {
        for (block in layout.blocks) {
            val addresses = mapOf(
                CadenceField.COUNT to block.countVaddr,
                CadenceField.POINTER to block.pointerVaddr,
                CadenceField.PHASE2 to block.phase2Vaddr,
                CadenceField.PHASE3 to block.phase3Vaddr,
                CadenceField.EVENT2_TIME to block.event2TimeVaddr,
                CadenceField.EVENT3_TIME to block.event3TimeVaddr,
            )
            val target = cadenceWords(block, mode)
            for ((field, vaddr) in addresses) {
                add(
                    PreparedEdit(
                        field = field,
                        vaddr = vaddr,
                        fileOffset = vaddrToFileOffset(bytes, vaddr, 4),
                        targetWord = target[field],
                        allowedWords = PoseCadenceMode.entries.map { cadenceWords(block, it)[field] }.toSet(),
                    )
                )
            }
        }
    }

    // Validate every instruction before modifying any bytes.
    for (edit in prepared) {
        val actual = bytes.readU32LE(edit.fileOffset)
        if (actual !in edit.allowedWords) {
            throw PatchException(
                "Controller cadence precondition failed for versionCode ${layout.versionCode}, " +
                    "${edit.field.name.lowercase()}@vaddr 0x${edit.vaddr.toString(16)}: " +
                    "word 0x${actual.toUInt().toString(16)}"
            )
        }
    }

    return bytes.copyOf().apply {
        for (edit in prepared) writeU32LE(edit.fileOffset, edit.targetWord)
    }
}

private fun movzW(register: Int, immediate: Int): Int {
    require(register in 0..31 && immediate in 0..0xFFFF)
    return 0x52800000 or (immediate shl 5) or register
}

private fun addImmediateX(destination: Int, base: Int, immediate: Int): Int {
    require(destination in 0..31 && base in 0..31 && immediate in 0..0xFFF)
    return 0x91000000.toInt() or (immediate shl 10) or (base shl 5) or destination
}

private fun strWUnsigned(register: Int, base: Int, byteOffset: Int): Int {
    require(register in 0..31 && base in 0..31 && byteOffset % 4 == 0 && byteOffset / 4 in 0..0xFFF)
    return 0xB9000000.toInt() or ((byteOffset / 4) shl 10) or (base shl 5) or register
}

private fun ByteArray.readU32LE(offset: Int): Int =
    (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8) or
        ((this[offset + 2].toInt() and 0xFF) shl 16) or
        ((this[offset + 3].toInt() and 0xFF) shl 24)

private fun ByteArray.writeU32LE(offset: Int, word: Int) {
    ByteBuffer.wrap(this, offset, 4).order(ByteOrder.LITTLE_ENDIAN).putInt(word)
}
