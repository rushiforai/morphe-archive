package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.charset.CodingErrorAction
import java.nio.file.Files
import java.nio.file.LinkOption
import java.security.MessageDigest

internal const val TELEMETRY_PACKAGE = "com.valvesoftware.steamlinkvr"
internal const val TELEMETRY_LIBRARY = "libgxr_telemetry.so"
internal const val TELEMETRY_MANIFEST = "XR_APILAYER_local_GalaxyXR_telemetry.json"
private val TELEMETRY_EXACT_PAIRS = setOf(
    "2.0.20" to "5001712",
    "2.0.20" to "5001812",
    "2.0.21" to "5001968",
    "2.0.22" to "5002244",
    "2.0.23" to "5002363",
)
internal const val TELEMETRY_PROFILES_SHA256 =
    "41182cc919023d48348e0a33e752fef87ebeaab59c88974e70fb760c8bb5499a"

// Pins are replaced together with the independently built, tracked payloads.
internal val TELEMETRY_PAYLOAD_SHA256 = linkedMapOf(
    TELEMETRY_LIBRARY to "6420bc2ca1549f70e3a34f4725ae794b3dea0e98eda528f4b762dbaf5cc38b93",
    "libshadowhook.so" to "fc84287eac46e3bade2f7e07e3c9efdca005822e21191d6db5b8cb222d53e8a0",
    "libshadowhook_nothing.so" to "f2cc6a6f94d7361be915daafff1d25b7b3af34972e7308ac540982cfd608bd32",
    TELEMETRY_MANIFEST to "4c87b76c6a8b39240165ff0b29e60934a5057601c2d7494589d5d7a0aed930b8",
    "NOTICE.txt" to "63204388d1ac7b371e03223fb4910a04fdb41cd67d4f0e0a030d5249d811d7eb",
)

internal data class TelemetryAnchor(val offset: Int, val size: Int, val sha256: String)
internal data class TelemetryImport(val name: String, val relocation: Long)
internal data class TelemetrySegment(
    val virtualAddress: Long, val fileSize: Long, val memorySize: Long, val flags: Long,
)
internal data class TelemetryProfile(
    val versionName: String, val versionCode: String, val sceneSize: Int,
    val stockSha256: String, val anchors: List<TelemetryAnchor>,
    val imports: List<TelemetryImport>, val segments: List<TelemetrySegment>,
)

internal fun isTelemetrySteamLinkTarget(packageName: String, versionName: String, versionCode: String): Boolean =
    packageName == TELEMETRY_PACKAGE && (versionName to versionCode) in TELEMETRY_EXACT_PAIRS

internal fun telemetryResource(name: String): ByteArray = object {}.javaClass
    .getResourceAsStream("/steamlink/androidxr/telemetry/$name")?.use { it.readBytes() }
    ?: throw PatchException("Missing bundled Steam Link telemetry resource: $name")

private fun telemetrySha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

private fun telemetryCheck(condition: Boolean, message: String) {
    if (!condition) throw PatchException(message)
}

/** Canonical audit metadata, not a guess based on a neighboring version's layout. */
internal fun parseTelemetryProfiles(bytes: ByteArray): List<TelemetryProfile> {
    val text = try {
        Charsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
            .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString()
    } catch (failure: Exception) {
        throw PatchException("Malformed UTF-8 telemetry profiles: ${failure.javaClass.simpleName}")
    }
    val hash = Regex("[0-9a-f]{64}")
    val decimal = Regex("0|[1-9][0-9]*")
    fun number(value: String): Long {
        telemetryCheck(decimal.matches(value), "Invalid telemetry profile decimal: $value")
        return value.toLongOrNull() ?: throw PatchException("Telemetry profile decimal overflow")
    }
    val profiles = text.lineSequence().filter { it.isNotBlank() && !it.startsWith("#") }.map { line ->
        val fields = line.split('\t')
        telemetryCheck(fields.size == 7, "Telemetry profile must contain seven tab-separated fields")
        val version = fields[0]
        val code = fields[1]
        val sceneSize = fields[2]
        val stockHash = fields[3]
        val anchorText = fields[4]
        val importText = fields[5]
        val segmentText = fields[6]
        telemetryCheck(isTelemetrySteamLinkTarget(TELEMETRY_PACKAGE, version, code), "Unknown telemetry profile pair: $version/$code")
        val size = number(sceneSize)
        telemetryCheck(size in 64..Int.MAX_VALUE.toLong() && hash.matches(stockHash), "Invalid telemetry scene size/hash")
        val anchors = anchorText.split(';').map { item ->
            val parts = item.split(':')
            telemetryCheck(parts.size == 3, "Malformed telemetry code anchor")
            val offset = number(parts[0])
            val length = number(parts[1])
            telemetryCheck(offset <= size && length > 0 && length <= size - offset && hash.matches(parts[2]), "Out-of-range telemetry code anchor")
            TelemetryAnchor(offset.toInt(), length.toInt(), parts[2])
        }
        telemetryCheck(anchors.map { it.offset }.distinct().size == anchors.size, "Duplicate telemetry code anchor")
        val imports = importText.split(';').map { item ->
            val parts = item.split('@')
            telemetryCheck(parts.size == 2 && Regex("[A-Za-z_][A-Za-z0-9_]*").matches(parts[0]) &&
                Regex("(?:0x)?[0-9a-fA-F]+").matches(parts[1]), "Malformed telemetry import")
            val relocation = parts[1].removePrefix("0x").toLongOrNull(16) ?: throw PatchException("Telemetry relocation overflow")
            telemetryCheck(relocation >= 0 && relocation % 8 == 0L, "Unaligned telemetry import relocation")
            TelemetryImport(parts[0], relocation)
        }
        telemetryCheck(imports.map { it.name }.distinct().size == imports.size &&
            imports.map { it.relocation }.distinct().size == imports.size, "Duplicate telemetry import")
        val segments = segmentText.split(';').map { item ->
            val parts = item.split(':')
            telemetryCheck(parts.size == 4, "Malformed telemetry PT_LOAD segment")
            val values = parts.map(::number)
            telemetryCheck(values[1] <= values[2] && values[3] <= 7 && values[0] <= Long.MAX_VALUE - values[2], "Invalid telemetry PT_LOAD segment")
            TelemetrySegment(values[0], values[1], values[2], values[3])
        }
        telemetryCheck(segments.distinct().size == segments.size, "Duplicate telemetry PT_LOAD segment")
        telemetryCheck(imports.all { imported -> segments.any { segment ->
            imported.relocation >= segment.virtualAddress && segment.memorySize >= 8 &&
                imported.relocation - segment.virtualAddress <= segment.memorySize - 8
        } }, "Telemetry import lies outside PT_LOAD segments")
        TelemetryProfile(version, code, size.toInt(), stockHash, anchors, imports, segments)
    }.toList()
    val actual = profiles.map { it.versionName to it.versionCode }
    telemetryCheck(actual.size == actual.distinct().size && actual.toSet() == TELEMETRY_EXACT_PAIRS,
        "Telemetry profiles must cover each exact Codecs Support pair once")
    return profiles
}

private fun validateTelemetryElf(bytes: ByteArray, label: String) {
    telemetryCheck(bytes.size >= 64 && bytes[0] == 0x7f.toByte() && bytes[1] == 69.toByte() &&
        bytes[2] == 76.toByte() && bytes[3] == 70.toByte() && bytes[4] == 2.toByte() &&
        bytes[5] == 1.toByte() && bytes[6] == 1.toByte() && bytes[18] == 0xb7.toByte() &&
        bytes[19] == 0.toByte(), "$label is not an ARM64 little-endian ELF64 library")
}

internal fun validateTelemetryScene(scene: ByteArray, profile: TelemetryProfile) {
    telemetryCheck(scene.size == profile.sceneSize, "Telemetry scene size does not match ${profile.versionName}/${profile.versionCode}")
    validateTelemetryElf(scene, "Steam Link scene")
    val elf = ByteBuffer.wrap(scene).order(ByteOrder.LITTLE_ENDIAN)
    val tableOffset = elf.getLong(32)
    val entrySize = elf.getShort(54).toInt() and 0xffff
    val entryCount = elf.getShort(56).toInt() and 0xffff
    telemetryCheck(tableOffset >= 64 && entrySize >= 56 && entryCount in 1..1024 &&
        tableOffset <= scene.size && entryCount.toLong() * entrySize <= scene.size - tableOffset, "Invalid telemetry scene program headers")
    val segments = (0 until entryCount).mapNotNull { index ->
        val start = (tableOffset + index.toLong() * entrySize).toInt()
        if (elf.getInt(start) != 1) null else {
            val fileOffset = elf.getLong(start + 8)
            val fileSize = elf.getLong(start + 32)
            telemetryCheck(fileOffset >= 0 && fileSize >= 0 && fileOffset <= scene.size &&
                fileSize <= scene.size - fileOffset, "Out-of-range telemetry PT_LOAD file region")
            TelemetrySegment(elf.getLong(start + 16), fileSize, elf.getLong(start + 40),
                elf.getInt(start + 4).toLong() and 0xffffffffL)
        }
    }
    telemetryCheck(segments == profile.segments, "Telemetry PT_LOAD layout does not match exact scene")
    profile.anchors.forEach { anchor ->
        telemetryCheck(telemetrySha256(scene.copyOfRange(anchor.offset, anchor.offset + anchor.size)) == anchor.sha256,
            "Telemetry decoder function changed at 0x${anchor.offset.toString(16)}")
    }
    profile.imports.forEach { imported ->
        val symbol = (imported.name + "\u0000").toByteArray(Charsets.US_ASCII)
        telemetryCheck((0..scene.size - symbol.size).any { offset ->
            symbol.indices.all { scene[offset + it] == symbol[it] }
        }, "Missing audited telemetry decoder import: ${imported.name}")
    }
    // stockSha256 records the pristine audit input. Exact code anchors + layout
    // intentionally permit independent patches elsewhere in the scene ELF.
}

internal fun validateTelemetryPayloads(payloads: Map<String, ByteArray>) {
    telemetryCheck(payloads.keys == TELEMETRY_PAYLOAD_SHA256.keys, "Telemetry payload set is incomplete or contains unknown files")
    payloads.forEach { (name, bytes) ->
        if (name.endsWith(".so")) validateTelemetryElf(bytes, name)
        telemetryCheck(telemetrySha256(bytes) == TELEMETRY_PAYLOAD_SHA256.getValue(name), "Telemetry payload failed its SHA-256 precondition: $name")
    }
}

/** Validate the optional component before the caller starts its combined transaction. */
internal fun prepareTelemetryResources(
    apkRoot: File, versionName: String, versionCode: String,
    packageName: String = TELEMETRY_PACKAGE,
    payloads: Map<String, ByteArray>? = null, profileBytes: ByteArray? = null,
): List<Pair<File, ByteArray>> {
    if (!isTelemetrySteamLinkTarget(packageName, versionName, versionCode)) return emptyList()
    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    telemetryCheck(sceneFile.isFile, "Missing exact Steam Link telemetry scene library")
    val profiles = profileBytes ?: telemetryResource("profiles.tsv")
    telemetryCheck(telemetrySha256(profiles) == TELEMETRY_PROFILES_SHA256, "Telemetry profiles failed their SHA-256 precondition")
    val profile = parseTelemetryProfiles(profiles).single { it.versionName == versionName && it.versionCode == versionCode }
    validateTelemetryScene(sceneFile.readBytes(), profile)
    val resources = payloads ?: TELEMETRY_PAYLOAD_SHA256.keys.associateWith(::telemetryResource)
    validateTelemetryPayloads(resources)
    val targets = resources.map { (name, bytes) ->
        val relative = when {
            name.endsWith(".so") -> "lib/arm64-v8a/$name"
            name == TELEMETRY_MANIFEST -> "assets/openxr/1/api_layers/implicit.d/$name"
            else -> "assets/gxr-telemetry/NOTICE.txt"
        }
        File(apkRoot, relative) to bytes
    }
    targets.forEach { (target, expected) ->
        telemetryCheck(!Files.isSymbolicLink(target.toPath()), "Telemetry target is a symbolic link: $target")
        if (Files.exists(target.toPath(), LinkOption.NOFOLLOW_LINKS)) {
            telemetryCheck(target.isFile && target.readBytes().contentEquals(expected), "Telemetry found a stale or modified resource: $target")
        }
    }
    return targets
}

/** Internal component harness; production Codecs Support merges prepared targets. */
internal fun installTelemetryResources(
    apkRoot: File, versionName: String, versionCode: String,
    packageName: String = TELEMETRY_PACKAGE,
    payloads: Map<String, ByteArray>? = null, profileBytes: ByteArray? = null,
): Boolean {
    val targets = prepareTelemetryResources(apkRoot, versionName, versionCode, packageName, payloads, profileBytes)
    if (targets.isEmpty()) return false
    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        targets.filterNot { (target, _) -> target.exists() }.forEach { (target, bytes) ->
            telemetryCheck(target.parentFile.isDirectory || target.parentFile.mkdirs(), "Could not create telemetry resource directory")
            val temporary = File.createTempFile("gxr-telemetry-", ".tmp", target.parentFile)
            staged += temporary to target
            temporary.writeBytes(bytes)
        }
        staged.forEach { (temporary, target) ->
            Files.move(temporary.toPath(), target.toPath())
            created += target
        }
    } catch (failure: Exception) {
        created.asReversed().forEach { target ->
            try { Files.deleteIfExists(target.toPath()) } catch (rollback: Exception) { failure.addSuppressed(rollback) }
        }
        throw failure
    } finally {
        staged.forEach { (temporary, _) -> Files.deleteIfExists(temporary.toPath()) }
    }
    return true
}

