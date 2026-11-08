package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.InputStream
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.charset.StandardCharsets
import java.net.HttpURLConnection
import java.net.URI
import java.security.MessageDigest
import java.util.zip.ZipInputStream

private val CODEC_3_1_0_MARKER = "dav1d_version".toByteArray(StandardCharsets.US_ASCII)
private val CUSTOM_DECODER_MARKER = "ac3_eac3_probe".toByteArray(StandardCharsets.US_ASCII)

private val codecFileOption = filePathOption(
    key = "codecFilePath",
    default = null,
    title = "Custom codec file",
    description = "Choose an MX Player v3.1.0 AIO ZIP, official ARMv7 or ARM64 ZIP, or a codec library. " +
        "For an official single-ABI codec on a dual-ABI APK, the matching official companion is " +
        "downloaded and verified during patching. An internet connection may be needed.",
    required = true,
)

private val allowUnverifiedCodecOption = booleanOption(
    key = "allowUnverifiedCodec",
    default = false,
    title = "Allow unverified codecs",
    description = "Allow an unrecognized codec only when it covers every input APK architecture. " +
        "Its authenticity and decoding capabilities are not verified; use at your own risk. " +
        "Automatic companion downloads work only for recognized official codecs.",
    required = false,
)

private const val MAX_CODEC_FILE_BYTES = 128L * 1024 * 1024
private const val MAX_CODEC_ENTRY_BYTES = 64 * 1024 * 1024
private const val MAX_CODEC_UNPACKED_BYTES = 256L * 1024 * 1024
private const val MAX_CODEC_ENTRIES = 128
private const val MAX_COMPANION_ZIP_BYTES = 16 * 1024 * 1024
private const val CODEC_STATUS_FILE = "gin-arena-mx-codec-status-v1.txt"

private data class OfficialCodec(val libraryHash: String, val archiveName: String, val archiveHash: String)
private val officialCodecs = mapOf(
    "armeabi-v7a" to OfficialCodec(
        "f90ec3f3e21b9197802eb4231e3aec9f2ac8f9c2465294cfb13195b759f3ad74",
        "neon-3.1.0-build_1.zip",
        "5813e02d437230a3a055c3fb050dc195d2d0289a5d5cc59ab5b5f3c360537a2a",
    ),
    "arm64-v8a" to OfficialCodec(
        "a6872a98d5101a2dfa63401e6b612e09134ba339f36731d268abe161ddcebba8",
        "neon64-3.1.0-build_1.zip",
        "9bb53b27f1956a6397396006c6d14237b4e60ea22712a3188a7d641b1e954f40",
    ),
)
private fun ByteArray.sha256Hex() = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }

private fun isOfficialCodec(abi: String, bytes: ByteArray): Boolean =
    officialCodecs[abi]?.libraryHash == bytes.sha256Hex()

private class CodecArchiveBudget {
    var entryCount = 0
    var unpackedBytes = 0L
}

private val customCodecResourcePatch = rawResourcePatch {
    execute {
        val statusFile = fileWorkspace.resolve(CODEC_STATUS_FILE)
        if (statusFile.exists() && !statusFile.delete()) {
            throw PatchException("Cannot clear the previous custom codec status.")
        }
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

        if (codecFile.length() > MAX_CODEC_FILE_BYTES) {
            throw PatchException("Custom codec file is too large (maximum 128 MiB).")
        }

        val extractedCodecs = LinkedHashMap<String, ByteArray>()
        collectCustomCodecBinaries(
            sourceName = codecFile.name,
            bytes = codecFile.readBytes(),
            depth = 0,
            outByAbi = extractedCodecs,
            budget = CodecArchiveBudget(),
        )

        if (extractedCodecs.isEmpty()) {
            throw PatchException(
                "No valid MX Player libffmpeg.mx.so binary was found in '${codecFile.name}'. " +
                    "Select aio-v3.1.0_r1.zip, an architecture ZIP (neon64/neon-3.1.0-*.zip), or libffmpeg.mx.so*.",
            )
        }

        val libEntries = listApkEntries("lib/").toSet()
        val apkAbis = libEntries.mapNotNull { entry ->
            val parts = entry.split('/')
            if (parts.size == 3 && parts[0] == "lib" && parts[2].endsWith(".so")) parts[1] else null
        }.toSet()
        if (apkAbis.isEmpty()) {
            throw PatchException("Target APK does not contain native libraries.")
        }
        val missingStockCodecs = apkAbis.filter { "lib/$it/libffmpeg.mx.so" !in libEntries }
        if (missingStockCodecs.isNotEmpty()) {
            throw PatchException("Target APK is missing libffmpeg.mx.so for ABI(s): ${missingStockCodecs.sorted().joinToString()}")
        }
        val suppliedAbis = apkAbis.intersect(extractedCodecs.keys)
        if (suppliedAbis.isEmpty()) {
            throw PatchException("The selected codec does not match any ABI in the input APK.")
        }
        val missingCustomCodecs = apkAbis - extractedCodecs.keys
        val allSuppliedOfficial = suppliedAbis.all { abi -> isOfficialCodec(abi, extractedCodecs.getValue(abi)) }
        if (missingCustomCodecs.isNotEmpty()) {
            if (!allSuppliedOfficial || missingCustomCodecs.any { it !in officialCodecs }) {
                throw PatchException(
                    "The selected codec is missing ABI(s): ${missingCustomCodecs.sorted().joinToString()}. " +
                        "Automatic companions are available only for recognized official v3.1.0_r1 codecs. " +
                        "Provide a complete matching codec ZIP instead.",
                )
            }
            for (abi in missingCustomCodecs.sorted()) {
                extractedCodecs[abi] = downloadOfficialCodec(abi)
            }
        }
        val allOfficial = apkAbis.all { abi -> isOfficialCodec(abi, extractedCodecs.getValue(abi)) }
        if (!allOfficial && allowUnverifiedCodecOption.value != true) {
            throw PatchException(
                "The selected codec is not a recognized official v3.1.0_r1 build. " +
                    "Use the official codec or explicitly enable 'Allow unverified codecs' in patch options.",
            )
        }
        // Write only after all input ABIs have a validated codec. Manager may strip ABIs later.
        for (abi in apkAbis) {
            get("lib/$abi/libffmpeg.mx.so", copy = false).writeBytes(extractedCodecs.getValue(abi))
        }
        if (!fileWorkspace.isDirectory && !fileWorkspace.mkdirs()) {
            throw PatchException("Cannot create custom codec patch workspace.")
        }
        statusFile.writeText(if (allOfficial) "official" else "unverified", Charsets.US_ASCII)
    }
}

@Suppress("unused")
val customCodecPatch = bytecodePatch(
    name = "Custom codec",
    description = "Bundles an MX Player custom codec; official v3.1.0_r1 codecs are verified.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    codecFileOption()
    allowUnverifiedCodecOption()

    dependsOn(mxIntegrityCorePatch, customCodecResourcePatch)

    execute {
        // 1. Disable `CustomCodecCheckerAsync.c()V` so MX Player does not scan `/sdcard/Download`
        //    on startup or prompt to re-import the same `.zip` file that is already bundled in `lib/`.
        val checkerClass = CustomCodecCheckerFingerprint.classDef
        checkerClass.returnVoid(CustomCodecCheckerFingerprint.method)

        val summaryText = when (fileWorkspace.resolve(CODEC_STATUS_FILE).readText(Charsets.US_ASCII)) {
            "official" -> "Bundled custom codec (official v3.1.0)"
            "unverified" -> "Bundled custom codec (unverified)"
            else -> throw PatchException("Missing or invalid custom codec verification status.")
        }

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

private fun downloadOfficialCodec(abi: String): ByteArray {
    val expected = officialCodecs[abi] ?: throw PatchException("No official companion is available for $abi.")
    val archive = try {
        downloadPinnedReleaseArchive(expected.archiveName)
    } catch (e: Exception) {
        throw PatchException(
            "Could not download the official $abi companion. Check your internet connection, " +
                "or select the official aio-v3.1.0_r1.zip instead.",
            e,
        )
    }
    if (archive.sha256Hex() != expected.archiveHash) {
        throw PatchException("The downloaded $abi companion archive failed SHA-256 verification.")
    }
    val codecs = LinkedHashMap<String, ByteArray>()
    collectCustomCodecBinaries(expected.archiveName, archive, 0, codecs, CodecArchiveBudget())
    val codec = codecs[abi] ?: throw PatchException("The downloaded companion does not contain $abi.")
    if (codecs.size != 1 || !isOfficialCodec(abi, codec)) {
        throw PatchException("The downloaded $abi codec failed SHA-256 verification.")
    }
    return codec
}

private fun downloadPinnedReleaseArchive(archiveName: String): ByteArray {
    val allowedHosts = setOf("github.com", "release-assets.githubusercontent.com", "objects.githubusercontent.com", "github-releases.githubusercontent.com")
    var uri = URI("https://github.com/iDNA420/MX-FFmpeg/releases/download/v3.1.0_r1/$archiveName")
    repeat(6) {
        if (uri.scheme != "https" || uri.userInfo != null || (uri.port != -1 && uri.port != 443) ||
            uri.host?.lowercase() !in allowedHosts
        ) throw PatchException("Untrusted companion download redirect.")
        val connection = uri.toURL().openConnection() as? HttpURLConnection
            ?: throw PatchException("Invalid companion download connection.")
        try {
            connection.instanceFollowRedirects = false
            connection.connectTimeout = 15_000
            connection.readTimeout = 30_000
            connection.useCaches = false
            connection.setRequestProperty("User-Agent", "GinArena-Morphe-MX-Codec/1")
            when (val code = connection.responseCode) {
                301, 302, 303, 307, 308 -> {
                    val location = connection.getHeaderField("Location")
                        ?: throw PatchException("Companion download redirect has no location.")
                    uri = uri.resolve(location)
                }
                200 -> {
                    if (connection.contentLengthLong > MAX_COMPANION_ZIP_BYTES) {
                        throw PatchException("Companion archive is too large.")
                    }
                    val output = ByteArrayOutputStream()
                    connection.inputStream.use { input ->
                        val buffer = ByteArray(32 * 1024)
                        while (true) {
                            val n = input.read(buffer)
                            if (n < 0) break
                            if (n == 0) continue
                            if (output.size().toLong() + n > MAX_COMPANION_ZIP_BYTES) {
                                throw PatchException("Companion archive is too large.")
                            }
                            output.write(buffer, 0, n)
                        }
                    }
                    return output.toByteArray()
                }
                else -> throw PatchException("Companion download failed (HTTP $code).")
            }
        } finally {
            connection.disconnect()
        }
    }
    throw PatchException("Too many companion download redirects.")
}

private fun collectCustomCodecBinaries(
    sourceName: String,
    bytes: ByteArray,
    depth: Int,
    outByAbi: MutableMap<String, ByteArray>,
    budget: CodecArchiveBudget,
) {
    if (bytes.size >= 4 &&
        bytes[0] == 0x7F.toByte() &&
        bytes[1] == 'E'.code.toByte() &&
        bytes[2] == 'L'.code.toByte() &&
        bytes[3] == 'F'.code.toByte()
    ) {
        val abi = parseAndValidateMxCodecElf(sourceName, bytes)
        val previous = outByAbi[abi]
        if (previous != null && !previous.contentEquals(bytes)) {
            throw PatchException("Multiple different custom codec libraries supplied for $abi.")
        }
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
                    if (++budget.entryCount > MAX_CODEC_ENTRIES) {
                        throw PatchException("Custom codec archive contains too many entries.")
                    }
                    val entryBytes = zis.readCodecEntry(budget)
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
                            collectCustomCodecBinaries(entry.name, entryBytes, depth + 1, outByAbi, budget)
                        }
                    }
                }
                zis.closeEntry()
            }
        }
    }
}

private fun InputStream.readCodecEntry(budget: CodecArchiveBudget): ByteArray {
    val out = ByteArrayOutputStream()
    val buffer = ByteArray(32 * 1024)
    while (true) {
        val count = read(buffer)
        if (count < 0) break
        if (count == 0) continue
        budget.unpackedBytes += count
        if (out.size().toLong() + count > MAX_CODEC_ENTRY_BYTES || budget.unpackedBytes > MAX_CODEC_UNPACKED_BYTES) {
            throw PatchException("Custom codec archive exceeds the safe unpacked size limit.")
        }
        out.write(buffer, 0, count)
    }
    return out.toByteArray()
}

private fun parseAndValidateMxCodecElf(entryName: String, bytes: ByteArray): String {
    fun invalid(reason: String): Nothing = throw PatchException("Invalid custom codec ELF '$entryName': $reason")
    if (bytes.size < 64 || bytes[5].toInt() != 1 || bytes[6].toInt() != 1) {
        invalid("expected a complete little-endian ELF header")
    }
    val elf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
    fun u16(offset: Int) = elf.getShort(offset).toInt() and 0xffff
    fun u32(offset: Int) = elf.getInt(offset).toLong() and 0xffffffffL
    fun u64(offset: Int): Long = elf.getLong(offset).also { if (it < 0) invalid("oversized ELF field") }
    fun inFile(offset: Long, count: Long): Boolean =
        offset >= 0 && count >= 0 && offset <= bytes.size.toLong() && count <= bytes.size.toLong() - offset

    val elfClass = bytes[4].toInt() and 0xff
    if (elfClass != 1 && elfClass != 2) invalid("unsupported ELF class")
    val is64 = elfClass == 2
    if (u16(16) != 3 || u32(20) != 1L) invalid("expected a current ET_DYN shared object")
    val machine = u16(18)
    val abi = when (machine) {
        183 -> "arm64-v8a"
        40 -> "armeabi-v7a"
        62 -> "x86_64"
        3 -> "x86"
        else -> invalid("unsupported CPU architecture (e_machine=$machine)")
    }
    if (is64 != (machine == 183 || machine == 62)) invalid("ELF class does not match CPU architecture")
    val headerSize = if (is64) 64 else 52
    val phOffset = if (is64) u64(32) else u32(28)
    val declaredHeaderSize = u16(if (is64) 52 else 40)
    val phEntrySize = u16(if (is64) 54 else 42)
    val phCount = u16(if (is64) 56 else 44)
    if (declaredHeaderSize != headerSize || phEntrySize != (if (is64) 56 else 32) ||
        phCount == 0 || !inFile(phOffset, phEntrySize.toLong() * phCount)
    ) invalid("invalid or truncated program headers")

    data class LoadSegment(val offset: Long, val address: Long, val size: Long)
    val loads = ArrayList<LoadSegment>()
    var executableLoad = false
    var dynamicOffset = -1L
    var dynamicSize = -1L
    for (index in 0 until phCount) {
        val at = (phOffset + phEntrySize.toLong() * index).toInt()
        val type = u32(at)
        if (type != 1L && type != 2L) continue
        val offset = if (is64) u64(at + 8) else u32(at + 4)
        val address = if (is64) u64(at + 16) else u32(at + 8)
        val fileSize = if (is64) u64(at + 32) else u32(at + 16)
        val memorySize = if (is64) u64(at + 40) else u32(at + 20)
        if (!inFile(offset, fileSize) || fileSize > memorySize) invalid("invalid program segment")
        if (type == 1L) {
            val flags = if (is64) u32(at + 4) else u32(at + 24)
            if (fileSize > 0 && flags and 1L != 0L) executableLoad = true
            loads.add(LoadSegment(offset, address, fileSize))
        } else {
            if (dynamicOffset != -1L) invalid("multiple dynamic segments")
            dynamicOffset = offset
            dynamicSize = fileSize
        }
    }
    val dynEntrySize = if (is64) 16 else 8
    if (!executableLoad || dynamicOffset < 0 || dynamicSize < dynEntrySize || dynamicSize % dynEntrySize != 0L) {
        invalid("missing executable load or dynamic segment")
    }
    var strAddress = -1L
    var strSize = -1L
    var sonameIndex = -1L
    var terminated = false
    var at = dynamicOffset
    while (at < dynamicOffset + dynamicSize) {
        val idx = at.toInt()
        val tag = if (is64) u64(idx) else u32(idx)
        val value = if (is64) u64(idx + 8) else u32(idx + 4)
        if (tag == 0L) { terminated = true; break }
        when (tag) {
            5L -> strAddress = value
            10L -> strSize = value
            14L -> sonameIndex = value
        }
        at += dynEntrySize
    }
    if (!terminated || strAddress < 0 || strSize <= 0 || sonameIndex < 0 || sonameIndex >= strSize) {
        invalid("missing dynamic string table or SONAME")
    }
    val segment = loads.singleOrNull { strAddress >= it.address && strAddress - it.address <= it.size &&
        strSize <= it.size - (strAddress - it.address) } ?: invalid("invalid dynamic string table")
    val nameOffset = segment.offset + (strAddress - segment.address) + sonameIndex
    val maxName = (strSize - sonameIndex).coerceAtMost(256).toInt()
    val end = (0 until maxName).firstOrNull { bytes[nameOffset.toInt() + it].toInt() == 0 }
        ?: invalid("unterminated SONAME")
    val soname = String(bytes, nameOffset.toInt(), end, StandardCharsets.US_ASCII)
    if (soname != "libffmpeg.mx.so") invalid("unexpected SONAME")
    if (!bytes.containsSequence(CODEC_3_1_0_MARKER)) {
        throw PatchException(
            "Outdated custom codec '$entryName': MX Player 3.4.1/3.4.3 requires Custom Codec v3.1.0 " +
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
