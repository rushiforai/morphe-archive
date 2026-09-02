package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild

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
    "5002318" to NativeMicrophoneLayout(2_277_488, 0xF3240),
    "5002322" to NativeMicrophoneLayout(2_283_400, 0xF37E0),
)

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

@Suppress("unused")
val microphoneInputPresetPatch = rawResourcePatch(
    name = "Microphone input preset",
    description = "Selects the Android AAudio microphone processing mode used by Steam Link. Galaxy XR testing found Voice Recognition clearer and louder than stock Voice Communication.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())

    val preset by stringOption(
        key = "preset",
        default = "voice-recognition",
        values = mapOf(
            "Voice Recognition (Best from my tests)" to "voice-recognition",
            "Voice Communication (Valve stock)" to "voice-communication",
            "Voice Performance (quiet)" to "voice-performance",
            "Unprocessed (quiet)" to "unprocessed",
        ),
        title = "Microphone mode",
        description = "Voice Recognition was the clearest usable-level mode in Galaxy XR recordings. Voice Performance and Unprocessed were substantially quieter; Voice Communication sounded more processed.",
        required = true,
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val selected = SUPPORTED_PRESETS[preset]
            ?: throw PatchException("Unknown microphone input preset: $preset")
        val bytes = file.readBytes()
        val matches = mutableListOf<Int>()

        if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            val layout = NATIVE_MICROPHONE_LAYOUTS[packageMetadata.versionCode]
                ?: throw PatchException("No verified microphone layout for Steam Link ${packageMetadata.versionCode}")
            if (bytes.size != layout.librarySize) {
                throw PatchException(
                    "Unsupported native microphone library size=${bytes.size}; expected ${layout.librarySize}",
                )
            }
            val currentIsSupported = SUPPORTED_PRESETS.values.any {
                bytes.matchesAt(layout.instructionOffset, movW1Immediate(it))
            }
            if (!bytes.matchesAt(layout.instructionOffset - INPUT_PRESET_PREFIX.size, INPUT_PRESET_PREFIX) ||
                !currentIsSupported
            ) {
                throw PatchException(
                    "Native microphone instruction did not match the verified layout at 0x${layout.instructionOffset.toString(16)}",
                )
            }
            val replacement = movW1Immediate(selected)
            if (!bytes.matchesAt(layout.instructionOffset, replacement)) {
                val result = bytes.copyOf()
                replacement.copyInto(result, layout.instructionOffset)
                file.writeBytes(result)
            }
            return@execute
        }

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
