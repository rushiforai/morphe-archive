package app.template.patches.steamlink.binary

import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import app.template.patches.shared.buildLabel

// QSVLClientAudioNdk::Init(bool, int), immediately before
// AAudioStreamBuilder_setInputPreset(builder, preset):
//     ldr x0, [sp, #0x10]
//     mov w1, #preset
//
// The surrounding instruction is intentionally part of the signature. It is
// unique in the tested 5002244 library and also survives later Valve layouts,
// unlike the file offset of the MOV instruction.
private val INPUT_PRESET_PREFIX = byteArrayOf(
    0xe0.toByte(), 0x0b, 0x40, 0xf9.toByte(),
)

private val SUPPORTED_PRESETS = mapOf(
    "voice-communication" to 7,
    "voice-recognition" to 6,
    "unprocessed" to 9,
    "voice-performance" to 10,
)

private data class NativeMicrophoneLayout(
    val librarySize: Int,
    val instructionOffset: Int,
)

private val NATIVE_MICROPHONE_LAYOUTS = mapOf(
    // Independently traced QSVLClientAudioNdk::Init on each exact legacy base.
    "5001812" to NativeMicrophoneLayout(2_220_872, 0xF4484),
    "5001968" to NativeMicrophoneLayout(2_234_048, 0xEFDB4),
    // SHA-256: 628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0.
    // Symbol-derived QSVLClientAudioNdk::Init -> AAudioStreamBuilder_setInputPreset.
    "5002363" to NativeMicrophoneLayout(2_292_008, 0xF44C0),
    // SHA-256: 5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b.
    // Symbol-derived QSVLClientAudioNdk::Init -> AAudioStreamBuilder_setInputPreset.
    "5002395" to NativeMicrophoneLayout(2_301_432, 0xF5710),
    // SHA-256: cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03.
    // The only AAudioStreamBuilder_setInputPreset caller is the input-stream half of
    // QSVLClientAudioNdk::OpenStreams(int) (0xf8d88, size 908; Init moved to 0xf8c98 and no
    // longer opens streams). Call at 0xf9040; `ldr x0, [sp, #0x10]` at 0xf9038, preset MOV at
    // 0xf903c follows setDirection(1)=input and setChannelCount(1) in the same builder.
    "5002527" to NativeMicrophoneLayout(2_333_472, 0xF903C),
)

// Whole-function identity for layouts that need more than the prefix+MOV signature. The
// preset MOV is normalised to the stock `mov w1, #7` before hashing, so all four preset
// outcomes (and reapplication) verify against the same stock function.
private data class MicrophoneFunctionIdentity(val offset: Int, val size: Int, val stockMovSite: Int, val sha256: String)

private val NATIVE_MICROPHONE_FUNCTIONS = mapOf(
    "5002527" to MicrophoneFunctionIdentity(
        0xF8D88, 908, 0xF903C,
        "1687a5e83bf1b081b254d7c9edc4e50db04cc13d7f6ee0ab78ac38b0fae5cccd",
    ),
)

private fun verifyMicrophoneFunction(bytes: ByteArray, versionCode: String) {
    val identity = NATIVE_MICROPHONE_FUNCTIONS[versionCode] ?: return
    val function = bytes.copyOfRange(identity.offset, identity.offset + identity.size)
    movW1Immediate(7).copyInto(function, identity.stockMovSite - identity.offset)
    val digest = java.security.MessageDigest.getInstance("SHA-256").digest(function)
        .joinToString("") { "%02x".format(it) }
    if (digest != identity.sha256) {
        throw PatchException(
            "Native microphone function identity mismatch for Steam Link $versionCode at " +
                "0x${identity.offset.toString(16)}",
        )
    }
}

private const val STEAM_LINK_PACKAGE_NAME = "com.valvesoftware.steamlinkvr"

private fun hasExactMicrophoneLayout(version: String, code: String): Boolean =
    isNativeXrSteamLinkBuild(version, code) ||
        (version == "2.0.20" && code == "5001812") ||
        (version == "2.0.21" && code == "5001968")

private fun movW1Immediate(value: Int): ByteArray {
    require(value in 0..0xffff)
    val instruction = 0x52800001 or (value shl 5) // MOVZ W1, #value
    return byteArrayOf(
        instruction.toByte(),
        (instruction ushr 8).toByte(),
        (instruction ushr 16).toByte(),
        (instruction ushr 24).toByte(),
    )
}

private fun ByteArray.matchesAt(offset: Int, pattern: ByteArray): Boolean =
    offset >= 0 && offset + pattern.size <= size &&
        pattern.indices.all { this[offset + it] == pattern[it] }

internal fun patchNativeMicrophonePreset(
    bytes: ByteArray,
    preset: String,
    versionName: String,
    versionCode: String,
): ByteArray {
    if (!hasExactMicrophoneLayout(versionName, versionCode)) return bytes.copyOf()
    val selected = SUPPORTED_PRESETS[preset]
        ?: throw PatchException("Unknown microphone input preset: $preset")
    val layout = NATIVE_MICROPHONE_LAYOUTS[versionCode]
        ?: throw PatchException("No verified microphone layout for Steam Link $versionName/$versionCode")
    if (bytes.size != layout.librarySize) {
        throw PatchException("Unsupported native microphone library size=${bytes.size}; expected ${layout.librarySize}")
    }
    verifyAddedLegacyNativeCode(bytes, versionName, versionCode)
    verifyMicrophoneFunction(bytes, versionCode)
    if (!bytes.matchesAt(layout.instructionOffset - INPUT_PRESET_PREFIX.size, INPUT_PRESET_PREFIX) ||
        SUPPORTED_PRESETS.values.none { bytes.matchesAt(layout.instructionOffset, movW1Immediate(it)) }
    ) {
        throw PatchException("Native microphone instruction did not match the verified layout at 0x${layout.instructionOffset.toString(16)}")
    }
    return bytes.copyOf().apply { movW1Immediate(selected).copyInto(this, layout.instructionOffset) }
}

@Suppress("unused")
val microphoneInputPresetPatch = rawResourcePatch(
    name = "Microphone input preset",
    description = "Switches microphone capture mode; Voice Recognition tested best. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK),
    default = true,
) {
    category(PatchCategories.TRACKING_AND_AUDIO)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())

    val preset by stringOption(
        key = "preset",
        default = "voice-recognition",
        values = mapOf(
            "Voice Recognition (tested best)" to "voice-recognition",
            "Voice Communication (Valve stock)" to "voice-communication",
            "Voice Performance (quiet)" to "voice-performance",
            "Unprocessed (quiet)" to "unprocessed",
        ),
        title = "Microphone mode",
        description = "Voice Recognition was the clearest and loudest tested on Galaxy XR. Voice " +
            "Performance and Unprocessed are much quieter; Voice Communication sounds more processed.",
        required = true,
    )

    execute {
        // Dependencies and forced runs bypass Morphe compatibility: an excluded package or exact
        // pair must return before any file is requested or read. Exact-layout builds patch via
        // their layout; the remaining legacy registry builds (e.g. 5001712) use the scanner below.
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE_NAME ||
            !(hasExactMicrophoneLayout(packageMetadata.versionName, packageMetadata.versionCode) ||
                isLegacyXrFoundationSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode))
        ) return@execute
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val selected = SUPPORTED_PRESETS[preset]
            ?: throw PatchException("Unknown microphone input preset: $preset")
        val bytes = file.readBytes()
        val matches = mutableListOf<Int>()

        if (hasExactMicrophoneLayout(packageMetadata.versionName, packageMetadata.versionCode)) {
            file.writeBytes(patchNativeMicrophonePreset(bytes, requireNotNull(preset),
                packageMetadata.versionName, packageMetadata.versionCode))
            return@execute
        }

        // A forced dependency must not run the legacy scanner on a mismatched modern base.
        if (packageMetadata.versionCode in NATIVE_MICROPHONE_LAYOUTS ||
            NATIVE_MICROPHONE_LAYOUTS.values.any { it.librarySize == bytes.size }) return@execute

        for (offset in 0..bytes.size - INPUT_PRESET_PREFIX.size - 4) {
            if (!bytes.matchesAt(offset, INPUT_PRESET_PREFIX)) continue
            val instructionOffset = offset + INPUT_PRESET_PREFIX.size
            if (SUPPORTED_PRESETS.values.any { bytes.matchesAt(instructionOffset, movW1Immediate(it)) }) {
                matches += instructionOffset
            }
        }

        if (matches.size != 1) {
            if (!isSupportedVideoLibrarySize(bytes.size)) return@execute
            throw PatchException(
                "Expected one supported AAudio input-preset instruction, found ${matches.size}",
            )
        }

        val instructionOffset = matches.single()
        val replacement = movW1Immediate(selected)
        if (bytes.matchesAt(instructionOffset, replacement)) return@execute

        val result = bytes.copyOf()
        replacement.copyInto(result, instructionOffset)
        file.writeBytes(result)
    }
}
