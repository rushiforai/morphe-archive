package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5001712
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel

// Steam Link 2.0.20 / 5001712, libvrlink_scene.so (2,221,072 bytes), QSVLClientAudioNdk::Init.
//
// When the platform closes the shared microphone input (for example when the Gemini window
// opens), libaaudio turns the framework's successful AudioRecord restore into a permanent
// AAUDIO_ERROR_DISCONNECTED and stops the capture callback. The only app-visible signal is the
// stream error callback, which Steam Link registers on the OUTPUT builder only. This patch
// registers the library's existing OnOutputAudioErrorProc on the INPUT builder as well, so a
// disconnected input sets the same "re-init" flag that the output path already uses and the
// library's own Tick -> Init(reinit) path rebuilds both streams.
//
// Three regions change, 66 bytes, file size unchanged:
//   0xF459C  bl AAudioStreamBuilder_openStream (input)  -> bl 0xF4808
//   0xF4808  64 bytes inside the unreferenced member OnOutputAudioError: a small wrapper that
//            calls AAudioStreamBuilder_setErrorCallback(builder, OnOutputAudioErrorProc, this)
//            and then tail-calls AAudioStreamBuilder_openStream; plus a failure-clear tail
//   0xF4898  blr x8 (Init call inside Tick)             -> b 0xF4830 (clears the flag if Init failed)
// Design and disassembly: gxr-mic-share docs/recovery-patch-design (DESIGN.md, evidence 06).
private const val RECOVERY_VERSION_NAME = "2.0.20"
private const val RECOVERY_VERSION_CODE = "5001712"
private const val RECOVERY_LIBRARY_SIZE = 2_221_072

private const val SITE_INPUT_OPEN = 0xF459C
private const val SITE_CAVE = 0xF4808
private const val SITE_TICK_INIT = 0xF4898
private const val CAVE_REGION_SIZE = 0x50

private fun recoveryHex(value: String): ByteArray =
    ByteArray(value.length / 2) { value.substring(it * 2, it * 2 + 2).toInt(16).toByte() }

private val INPUT_OPEN_ORIGINAL = recoveryHex("7d520494")
private val INPUT_OPEN_PATCHED = recoveryHex("9b000094")
private val TICK_INIT_ORIGINAL = recoveryHex("00013fd6")
private val TICK_INIT_PATCHED = recoveryHex("e6ffff17")

// Original OnOutputAudioError (member variant), 0x50 bytes.
private val CAVE_ORIGINAL = recoveryHex(
    "5f0c0e31e1010054fd7bbea9f30b00f9fd030091f30300aa80fdff9000ac20915651049408b48352" +
        "290080526802088b09fd9f08f30b40f9fd7bc2a8c0035fd660fdfff0e103022a00403c914b510414",
)

// 64 replacement bytes followed by the unchanged 16 original tail bytes.
private val CAVE_PATCHED = recoveryHex(
    "fd7bbea9fd030091e00701a9210900b021d047f9e20314aad8510494e00741a9fd7bc2a8d9510414" +
        "00013fd64003003508b483526802088b1ffd9f0816000014",
) + CAVE_ORIGINAL.copyOfRange(64, CAVE_REGION_SIZE)

// Context that must be intact for the call-site assumptions (x20 = this, x1 = &inputStream,
// x0 = builder at the open call; x0 = this, w1 = 1, w2 = 48000, x8 = Init at the Tick call).
private val INPUT_OPEN_CONTEXT = listOf(
    0xF4580 to recoveryHex("e00b40f9"), // ldr x0, [sp, #0x10]
    0xF4588 to recoveryHex("9a520494"), // bl setInputPreset
    0xF458C to recoveryHex("08b38352"), // mov w8, #0x1d98
    0xF4590 to recoveryHex("e00b40f9"), // ldr x0, [sp, #0x10]
    0xF4594 to recoveryHex("9502088b"), // add x21, x20, x8
    0xF4598 to recoveryHex("e10315aa"), // mov x1, x21
)
private val TICK_INIT_CONTEXT = listOf(
    0xF4884 to recoveryHex("680240f9"), // ldr x8, [x19]
    0xF4888 to recoveryHex("e00313aa"), // mov x0, x19
    0xF488C to recoveryHex("21008052"), // mov w1, #1
    0xF4890 to recoveryHex("02709752"), // mov w2, #0xbb80
    0xF4894 to recoveryHex("080940f9"), // ldr x8, [x8, #0x10]
    0xF489C to recoveryHex("f30b40f9"), // ldr x19, [sp, #0x10]
)
private val PRESET_MOV_IMMEDIATES = setOf(6, 7, 9, 10)

// Pin the callback implementation and the exact PLT -> GOT -> relocation -> dynsym
// chain used by the wrapper. Whole-file hashes would reject legitimate earlier patches.
internal val RECOVERY_LINKAGE_GUARDS = listOf(
    18 to recoveryHex("b700"), // EM_AARCH64
    0xF472C to recoveryHex(
        "5f0c0e31e1010054fd7bbea9f30b00f9fd03009180fdff90f30301aa00ac20918d510494" +
            "08b48352290080526802088b09fd9f08f30b40f9fd7bc2a8c0035fd660fdfff0e103022a00403c9182510414",
    ),
    0x208F80 to recoveryHex("900000f0112240f91002019120021fd6900000f0112640f91022019120021fd6"),
    0x7F1D0 to recoveryHex("a09f21000000000001040000f20500000000000000000000"),
    0x8DE70 to recoveryHex("40b021000000000002040000230000000000000000000000"),
    0x8DE88 to recoveryHex("48b021000000000002040000240000000000000000000000"),
    0x91A8 to recoveryHex("4916000022000f002c470f00000000005000000000000000"),
    0x640 to recoveryHex("921600001200000000000000000000000000000000000000"),
    0x658 to recoveryHex("b71600001200000000000000000000000000000000000000"),
    0x32495 to "_ZN18QSVLClientAudioNdk22OnOutputAudioErrorProcEP18AAudioStreamStructPvi\u0000"
        .toByteArray(Charsets.US_ASCII),
    0x324DE to "AAudioStreamBuilder_setErrorCallback\u0000".toByteArray(Charsets.US_ASCII),
    0x32503 to "AAudioStreamBuilder_openStream\u0000".toByteArray(Charsets.US_ASCII),
)

private fun ByteArray.regionEquals(offset: Int, expected: ByteArray): Boolean =
    offset >= 0 && offset + expected.size <= size &&
        expected.indices.all { this[offset + it] == expected[it] }

private fun ByteArray.regionHex(offset: Int, length: Int): String =
    copyOfRange(offset, offset + length).joinToString("") { "%02x".format(it) }

private fun isPresetMovW1(word: ByteArray): Boolean {
    if (word.size != 4) return false
    val value = (word[0].toInt() and 0xff) or
        ((word[1].toInt() and 0xff) shl 8) or
        ((word[2].toInt() and 0xff) shl 16) or
        ((word[3].toInt() and 0xff) shl 24)
    return PRESET_MOV_IMMEDIATES.any { value == (0x52800001 or (it shl 5)) }
}

private enum class RegionState { ORIGINAL, PATCHED }

private fun ByteArray.regionState(
    patchName: String,
    offset: Int,
    original: ByteArray,
    patched: ByteArray,
): RegionState = when {
    regionEquals(offset, patched) -> RegionState.PATCHED
    regionEquals(offset, original) -> RegionState.ORIGINAL
    else -> throw PatchException(
        "$patchName precondition failed at 0x${offset.toString(16)}: " +
            "actual=${regionHex(offset, original.size)}, " +
            "expected=${original.joinToString("") { "%02x".format(it) }} " +
            "or patched=${patched.joinToString("") { "%02x".format(it) }}",
    )
}

internal fun patchMicrophoneInputRecovery(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    if (versionName != RECOVERY_VERSION_NAME || versionCode != RECOVERY_VERSION_CODE) {
        return bytes.copyOf()
    }
    val patchName = "Microphone input recovery"
    if (bytes.size != RECOVERY_LIBRARY_SIZE) {
        throw PatchException(
            "$patchName library size=${bytes.size} for Steam Link $versionName/$versionCode; " +
                "expected $RECOVERY_LIBRARY_SIZE",
        )
    }
    if (!bytes.regionEquals(0, recoveryHex("7f454c46")) || bytes[4].toInt() != 2 || bytes[5].toInt() != 1) {
        throw PatchException("$patchName input is not a little-endian ELF64 library")
    }
    RECOVERY_LINKAGE_GUARDS.forEach { (offset, expected) ->
        if (!bytes.regionEquals(offset, expected)) {
            throw PatchException("$patchName callback/linkage mismatch at 0x${offset.toString(16)}")
        }
    }
    INPUT_OPEN_CONTEXT.forEach { (offset, expected) ->
        if (!bytes.regionEquals(offset, expected)) {
            throw PatchException(
                "$patchName input-open context mismatch at 0x${offset.toString(16)}: " +
                    "actual=${bytes.regionHex(offset, expected.size)}",
            )
        }
    }
    if (!isPresetMovW1(bytes.copyOfRange(0xF4584, 0xF4588))) {
        throw PatchException(
            "$patchName microphone preset instruction at 0xf4584 is not a supported MOV W1: " +
                bytes.regionHex(0xF4584, 4),
        )
    }
    TICK_INIT_CONTEXT.forEach { (offset, expected) ->
        if (!bytes.regionEquals(offset, expected)) {
            throw PatchException(
                "$patchName Tick context mismatch at 0x${offset.toString(16)}: " +
                    "actual=${bytes.regionHex(offset, expected.size)}",
            )
        }
    }

    val states = listOf(
        bytes.regionState(patchName, SITE_INPUT_OPEN, INPUT_OPEN_ORIGINAL, INPUT_OPEN_PATCHED),
        bytes.regionState(patchName, SITE_CAVE, CAVE_ORIGINAL, CAVE_PATCHED),
        bytes.regionState(patchName, SITE_TICK_INIT, TICK_INIT_ORIGINAL, TICK_INIT_PATCHED),
    )
    if (states.toSet().size != 1) {
        throw PatchException(
            "$patchName found a partially patched library " +
                "(input-open=${states[0]}, wrapper=${states[1]}, tick=${states[2]}); refusing to continue",
        )
    }
    if (states[0] == RegionState.PATCHED) return bytes.copyOf()

    val result = bytes.copyOf()
    INPUT_OPEN_PATCHED.copyInto(result, SITE_INPUT_OPEN)
    CAVE_PATCHED.copyInto(result, SITE_CAVE)
    TICK_INIT_PATCHED.copyInto(result, SITE_TICK_INIT)
    return result
}

@Suppress("unused")
val microphoneInputRecoveryPatch = rawResourcePatch(
    name = "Microphone input recovery",
    description = "Restores microphone capture after Android disconnects it; concurrent capture still needs platform support. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_5001712),
    default = false,
) {
    category(PatchCategories.TRACKING_AND_AUDIO)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5001712.toTypedArray())

    execute {
        if (packageMetadata.packageName != "com.valvesoftware.steamlinkvr") return@execute
        val versionName = packageMetadata.versionName
        val versionCode = packageMetadata.versionCode
        if (versionName != RECOVERY_VERSION_NAME || versionCode != RECOVERY_VERSION_CODE) return@execute
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchMicrophoneInputRecovery(bytes, versionName, versionCode)
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}
