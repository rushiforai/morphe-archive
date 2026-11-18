package me.mikem.musicleague

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val ML_HBC_HEADER_SIZE = 128
private const val ML_HBC_SMALL_FUNCTION_HEADER_SIZE = 16
private const val ML_HBC_SMALL_STRING_ENTRY_SIZE = 4
private const val ML_HBC_OVERFLOW_STRING_ENTRY_SIZE = 8

private const val ML_HBC_MAGIC_LOW = 0x03BC1FC6
private const val ML_HBC_MAGIC_HIGH = 0x1F1903C1
private const val ML_HBC_VERSION = 96

private const val ML_HBC_OPCODE_RET = 92
private const val ML_HBC_OPCODE_LOAD_CONST_NULL = 119

private data class MlHbcStringTables(
    val stringCount: Int,
    val smallStringTableOffset: Int,
    val overflowStringTableOffset: Int,
    val stringStorageOffset: Int,
)

private fun ByteArray.mlU8(offset: Int): Int = this[offset].toInt() and 0xFF

private fun ByteArray.mlU32(offset: Int): Int {
    return mlU8(offset) or
        (mlU8(offset + 1) shl 8) or
        (mlU8(offset + 2) shl 16) or
        (mlU8(offset + 3) shl 24)
}

private fun ByteArray.mlStringAt(stringId: Int, tables: MlHbcStringTables): String? {
    if (stringId < 0 || stringId >= tables.stringCount) return null

    val entry = mlU32(tables.smallStringTableOffset + stringId * ML_HBC_SMALL_STRING_ENTRY_SIZE)
    val isUtf16 = (entry and 1) != 0

    var stringOffset = (entry ushr 1) and ((1 shl 23) - 1)
    var stringLength = (entry ushr 24) and 0xFF

    if (stringLength == 0xFF) {
        val overflowOffset = tables.overflowStringTableOffset + stringOffset * ML_HBC_OVERFLOW_STRING_ENTRY_SIZE
        stringOffset = mlU32(overflowOffset)
        stringLength = mlU32(overflowOffset + 4)
    }

    val encodedLength = if (isUtf16) stringLength * 2 else stringLength
    val start = tables.stringStorageOffset + stringOffset
    val end = start + encodedLength

    if (start < 0 || end > size || start > end) return null

    return try {
        copyOfRange(start, end).toString(if (isUtf16) Charsets.UTF_16LE else Charsets.UTF_8)
    } catch (_: Throwable) {
        null
    }
}

private fun ByteArray.mlPatchReturnNull(functionOffset: Int) {
    this[functionOffset] = ML_HBC_OPCODE_LOAD_CONST_NULL.toByte()
    this[functionOffset + 1] = 0
    this[functionOffset + 2] = ML_HBC_OPCODE_RET.toByte()
    this[functionOffset + 3] = 0
}

@Suppress("unused")
val hermesHideAdPromoSurfacesPatch = resourcePatch(
    name = "Hermes hide ad promo surfaces",
    description = "Experimental Hermes bytecode edit: makes ad-card components return null. May prevent startup; opt in only for testing.",
    default = false,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        val original = bundleFile.readBytes()

        if (original.mlU32(0) != ML_HBC_MAGIC_LOW || original.mlU32(4) != ML_HBC_MAGIC_HIGH) {
            throw PatchException("assets/index.android.bundle is not a Hermes bytecode bundle")
        }

        val version = original.mlU32(8)
        if (version != ML_HBC_VERSION) {
            throw PatchException("Unsupported Hermes bytecode version: $version. Expected $ML_HBC_VERSION")
        }

        val functionCount = original.mlU32(40)
        val stringKindCount = original.mlU32(44)
        val identifierCount = original.mlU32(48)
        val stringCount = original.mlU32(52)
        val overflowStringCount = original.mlU32(56)

        val functionHeadersOffset = ML_HBC_HEADER_SIZE
        val stringKindsOffset = functionHeadersOffset + functionCount * ML_HBC_SMALL_FUNCTION_HEADER_SIZE
        val identifierHashesOffset = stringKindsOffset + stringKindCount * 4
        val smallStringTableOffset = identifierHashesOffset + identifierCount * 4
        val overflowStringTableOffset = smallStringTableOffset + stringCount * ML_HBC_SMALL_STRING_ENTRY_SIZE
        val stringStorageOffset = overflowStringTableOffset + overflowStringCount * ML_HBC_OVERFLOW_STRING_ENTRY_SIZE

        val tables = MlHbcStringTables(
            stringCount = stringCount,
            smallStringTableOffset = smallStringTableOffset,
            overflowStringTableOffset = overflowStringTableOffset,
            stringStorageOffset = stringStorageOffset,
        )

val targetFunctionNames = setOf(
    "AdsCard",
    "AdBanner",

    // Remaining top reward / zero-ads banner.
    "AdsRewardBanner",
    "AdRewardBanner",
    "RewardAdBanner",
    "RewardedAdBanner",
    "RewardedAdsBanner",
    "RewardBanner",
    "RewardedBanner",
    "ZeroAdsBanner",
    "ZeroAdBanner",
    "AdFreeBanner",
    "AdFreeRewardBanner",
    "SixHoursBanner",
    "SixHoursZeroAdsBanner",
    "FreeAdsRewardBanner",
    "PromoBanner",
    "PremiumBanner",
)

        val patched = original.copyOf()
        val patchedNames = mutableSetOf<String>()

        for (functionIndex in 0 until functionCount) {
            val headerOffset = functionHeadersOffset + functionIndex * ML_HBC_SMALL_FUNCTION_HEADER_SIZE
            if (headerOffset + ML_HBC_SMALL_FUNCTION_HEADER_SIZE > original.size) break

            val word1 = original.mlU32(headerOffset)
            val word2 = original.mlU32(headerOffset + 4)
            val word4 = original.mlU32(headerOffset + 12)

            val flags = (word4 ushr 24) and 0xFF
            val isOverflowedHeader = (flags and 0x20) != 0
            if (isOverflowedHeader) continue

            val functionOffset = word1 and ((1 shl 25) - 1)
            val bytecodeSize = word2 and ((1 shl 15) - 1)
            val functionNameId = (word2 ushr 15) and ((1 shl 17) - 1)

            if (bytecodeSize < 4) continue
            if (functionOffset < 0 || functionOffset + bytecodeSize > original.size) continue

            val functionName = original.mlStringAt(functionNameId, tables) ?: continue

            if (functionName in targetFunctionNames) {
                patched.mlPatchReturnNull(functionOffset)
                patchedNames.add(functionName)
            }
        }

        if (patchedNames.isEmpty()) {
            throw PatchException("No target Hermes ad UI functions were found")
        }

        bundleFile.writeBytes(patched)
    }
}
