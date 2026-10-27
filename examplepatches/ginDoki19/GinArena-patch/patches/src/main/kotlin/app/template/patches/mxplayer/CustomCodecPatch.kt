package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.ByteArrayInputStream
import java.io.File
import java.nio.charset.StandardCharsets
import java.util.zip.ZipInputStream

private val SONAME_MARKER = "libffmpeg.mx.so".toByteArray(StandardCharsets.US_ASCII)
private val CODEC_3_1_0_MARKER = "dav1d_version".toByteArray(StandardCharsets.US_ASCII)
private val CUSTOM_DECODER_MARKER = "ac3_eac3_probe".toByteArray(StandardCharsets.US_ASCII)

private val codecFileOption = filePathOption(
    key = "codecFilePath",
    default = null,
    title = "Custom codec file",
    description = "Select an MX Player Custom Codec v3.1.0 file — recommended: aio-v3.1.0_r1.zip " +
        "(all CPU types), or neon64-3.1.0-build_1.zip (ARMv8 NEON), neon-3.1.0-build_1.zip " +
        "(ARMv7 NEON), or a raw libffmpeg.mx.so* binary.",
    required = true,
)

@Volatile
private var bundledCodecSummary: String = "Bundled custom codec (v3.1.0)"

private val customCodecResourcePatch = rawResourcePatch {
    execute {
        val rawPath = codecFileOption.value?.trim().orEmpty()
        if (rawPath.isEmpty()) {
            throw PatchException(
                "No custom codec file selected. Please pick an MX Player v3.1.0 custom codec file " +
                    "(e.g. aio-v3.1.0_r1.zip) in the 'Custom codec' patch options, or uncheck 'Custom codec'.",
            )
        }

        val codecFile = File(rawPath)
        if (!codecFile.isFile || !codecFile.canRead()) {
            throw PatchException("Selected custom codec file does not exist or cannot be read: $rawPath")
        }

        val extractedCodecs = LinkedHashMap<String, ByteArray>()
        collectCustomCodecBinaries(
            sourceName = codecFile.name,
            bytes = codecFile.readBytes(),
            depth = 0,
            outByAbi = extractedCodecs,
        )

        if (extractedCodecs.isEmpty()) {
            throw PatchException(
                "No valid MX Player libffmpeg.mx.so binary was found in '${codecFile.name}'. " +
                    "Select aio-v3.1.0_r1.zip, an architecture ZIP (neon64/neon-3.1.0-*.zip), or libffmpeg.mx.so*.",
            )
        }

        val apkAbis = listApkEntries("lib/")
            .mapNotNull { entry ->
                val parts = entry.split('/')
                if (parts.size == 3 && parts[0] == "lib" && parts[2] == "libffmpeg.mx.so") parts[1] else null
            }
            .distinct()

        if (apkAbis.isEmpty()) {
            throw PatchException("Target APK does not contain any lib/<abi>/libffmpeg.mx.so entries.")
        }

        val bundledAbis = ArrayList<String>()
        for (abi in apkAbis) {
            val customSo = extractedCodecs[abi] ?: continue
            get("lib/$abi/libffmpeg.mx.so", copy = false).writeBytes(customSo)
            bundledAbis += abi
        }

        if (bundledAbis.isEmpty()) {
            throw PatchException(
                "Selected custom codec (${extractedCodecs.keys.joinToString(", ")}) does not match " +
                    "any ABI in the target MX Player APK (${apkAbis.joinToString(", ")}). " +
                    "Use aio-v3.1.0_r1.zip to bundle both ARMv8 NEON and ARMv7 NEON.",
            )
        }

        bundledCodecSummary = if (bundledAbis.containsAll(apkAbis)) {
            "Bundled custom codec (v3.1.0)"
        } else {
            val abiLabels = bundledAbis.joinToString(", ") { abiDisplayLabel(it) }
            "Bundled custom codec (v3.1.0 - $abiLabels)"
        }
    }
}

@Suppress("unused")
val customCodecPatch = bytecodePatch(
    name = "Custom codec",
    description = "Bundles an MX Player v3.1.0 custom codec (aio-v3.1.0_r1.zip, architecture ZIP, " +
        "or libffmpeg.mx.so*) directly into the app for out-of-the-box E-AC-3, TrueHD, MLP, DTS, " +
        "and AC-3 software audio decoding.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    codecFileOption()

    dependsOn(mxIntegrityCorePatch, customCodecResourcePatch)

    execute {
        // 1. Disable `CustomCodecCheckerAsync.c()V` so MX Player does not scan `/sdcard/Download`
        //    on startup or prompt to re-import the same `.zip` file that is already bundled in `lib/`.
        val checkerClass = CustomCodecCheckerFingerprint.classDef
        checkerClass.returnVoid(CustomCodecCheckerFingerprint.method)

        val summaryText = bundledCodecSummary

        // 2. Update `Settings -> Decoder -> Custom codec` default summary in
        //    `DecoderPreferences$Fragment.onCreate(Bundle)V` (when no external file override is set)
        //    so the user immediately sees `"Bundled custom codec (v3.1.0)"` instead of
        //    `"Use ARMv8/ARMv7 NEON type custom codec."`.
        val onCreate = DecoderPrefsFragmentOnCreateFingerprint.method
        val onCreateInsns = onCreate.instructions
        val fromHtmlIdx = onCreateInsns.indexOfFirst { insn ->
            val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
            mRef?.definingClass == "Landroid/text/Html;" && mRef.name == "fromHtml"
        }
        if (fromHtmlIdx < 0 || fromHtmlIdx + 2 >= onCreateInsns.size) {
            throw PatchException("Html.fromHtml summary call not found in DecoderPreferences\$Fragment->onCreate")
        }
        val setSummaryIdx = fromHtmlIdx + 2
        val setSummaryCall = (onCreate.getInstruction(setSummaryIdx) as? ReferenceInstruction)
            ?.reference as? MethodReference
        if (setSummaryCall?.definingClass != "Landroid/preference/Preference;" ||
            setSummaryCall.name != "setSummary" ||
            setSummaryCall.parameterTypes != listOf("Ljava/lang/CharSequence;")
        ) {
            throw PatchException("Unexpected instruction after Html.fromHtml in DecoderPreferences\$Fragment->onCreate: $setSummaryCall")
        }
        val summaryArgReg = (onCreate.getInstruction(setSummaryIdx) as FiveRegisterInstruction).registerD
        onCreate.addInstructions(
            setSummaryIdx,
            "const-string v$summaryArgReg, \"$summaryText\"",
        )

        // 3. Also update `DecoderPreferences$b.onClick(DialogInterface, I)V` ("Use default codec"
        //    reset action) so reverting any manual runtime override restores the bundled summary.
        val resetMethod = DecoderPrefsCodecResetFingerprint.method
        val resetSetSummaryIdx = resetMethod.instructions.indexOfFirst { insn ->
            val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
            mRef?.definingClass == "Landroid/preference/Preference;" &&
                mRef.name == "setSummary" &&
                mRef.parameterTypes == listOf("I")
        }
        if (resetSetSummaryIdx >= 1 && resetMethod.getInstruction(resetSetSummaryIdx - 1).opcode == Opcode.SGET) {
            val sgetReg = (resetMethod.getInstruction(resetSetSummaryIdx - 1) as OneRegisterInstruction).registerA
            val invokeInsn = resetMethod.getInstruction(resetSetSummaryIdx) as FiveRegisterInstruction
            val prefReg = invokeInsn.registerC
            resetMethod.replaceInstruction(
                resetSetSummaryIdx - 1,
                "const-string v$sgetReg, \"$summaryText\"",
            )
            resetMethod.replaceInstruction(
                resetSetSummaryIdx,
                "invoke-virtual {v$prefReg, v$sgetReg}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V",
            )
        }
    }
}

private fun collectCustomCodecBinaries(
    sourceName: String,
    bytes: ByteArray,
    depth: Int,
    outByAbi: MutableMap<String, ByteArray>,
) {
    if (bytes.size >= 4 &&
        bytes[0] == 0x7F.toByte() &&
        bytes[1] == 'E'.code.toByte() &&
        bytes[2] == 'L'.code.toByte() &&
        bytes[3] == 'F'.code.toByte()
    ) {
        val abi = parseAndValidateMxCodecElf(sourceName, bytes)
        outByAbi[abi] = bytes
        return
    }

    if (depth <= 2 &&
        bytes.size >= 4 &&
        bytes[0] == 'P'.code.toByte() &&
        bytes[1] == 'K'.code.toByte() &&
        bytes[2] == 0x03.toByte() &&
        bytes[3] == 0x04.toByte()
    ) {
        ZipInputStream(ByteArrayInputStream(bytes)).use { zis ->
            while (true) {
                val entry = zis.nextEntry ?: break
                if (!entry.isDirectory) {
                    val entryBytes = zis.readBytes()
                    if (entryBytes.size >= 4) {
                        val isElf = entryBytes[0] == 0x7F.toByte() &&
                            entryBytes[1] == 'E'.code.toByte() &&
                            entryBytes[2] == 'L'.code.toByte() &&
                            entryBytes[3] == 'F'.code.toByte()
                        val isZip = entryBytes[0] == 'P'.code.toByte() &&
                            entryBytes[1] == 'K'.code.toByte() &&
                            entryBytes[2] == 0x03.toByte() &&
                            entryBytes[3] == 0x04.toByte()
                        if (isElf || isZip) {
                            collectCustomCodecBinaries(entry.name, entryBytes, depth + 1, outByAbi)
                        }
                    }
                }
                zis.closeEntry()
            }
        }
    }
}

private fun parseAndValidateMxCodecElf(entryName: String, bytes: ByteArray): String {
    if (bytes.size < 64 || bytes[5].toInt() != 1) {
        throw PatchException("Invalid little-endian ELF shared library in '$entryName'.")
    }
    val eType = (bytes[16].toInt() and 0xFF) or ((bytes[17].toInt() and 0xFF) shl 8)
    val eMachine = (bytes[18].toInt() and 0xFF) or ((bytes[19].toInt() and 0xFF) shl 8)
    if (eType != 3) {
        throw PatchException("ELF file '$entryName' is not a shared object (ET_DYN expected).")
    }

    val abi = when (eMachine) {
        183 -> "arm64-v8a"
        40 -> "armeabi-v7a"
        62 -> "x86_64"
        3 -> "x86"
        else -> throw PatchException("Unsupported ELF CPU architecture (e_machine=$eMachine) in '$entryName'.")
    }

    if (!bytes.containsSequence(SONAME_MARKER)) {
        throw PatchException(
            "Shared library '$entryName' is not an MX Player FFmpeg codec (missing SONAME libffmpeg.mx.so).",
        )
    }
    if (!bytes.containsSequence(CODEC_3_1_0_MARKER)) {
        throw PatchException(
            "Outdated custom codec '$entryName': MX Player 3.3.1–3.4.1 requires Custom Codec v3.1.0 " +
                "(FFmpeg 4.2 + dav1d, e.g. aio-v3.1.0_r1.zip).",
        )
    }
    if (!bytes.containsSequence(CUSTOM_DECODER_MARKER)) {
        throw PatchException(
            "Library '$entryName' appears to be the stripped stock libffmpeg.mx.so without E-AC-3/AC-3/TrueHD " +
                "decoders. Please select a Custom Codec v3.1.0 build (e.g. aio-v3.1.0_r1.zip).",
        )
    }
    return abi
}

private fun ByteArray.containsSequence(needle: ByteArray): Boolean {
    if (needle.isEmpty() || size < needle.size) return false
    val first = needle[0]
    val limit = size - needle.size
    outer@ for (i in 0..limit) {
        if (this[i] != first) continue
        for (j in 1 until needle.size) {
            if (this[i + j] != needle[j]) continue@outer
        }
        return true
    }
    return false
}

private fun abiDisplayLabel(abi: String): String = when (abi) {
    "arm64-v8a" -> "ARMv8 NEON"
    "armeabi-v7a" -> "ARMv7 NEON"
    "x86_64" -> "x86_64"
    "x86" -> "x86"
    else -> abi
}
