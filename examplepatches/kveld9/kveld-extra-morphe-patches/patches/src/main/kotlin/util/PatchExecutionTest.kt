package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.dex.NoOpDexVerifier
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.shared.Constants
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.apk.ApkUtils.applyTo
import kotlinx.coroutines.runBlocking
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.OutputStream
import java.io.PrintStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

enum class TargetApp(
    val id: String,
    val appName: String,
    val packageName: String,
    val candidateFilenames: List<String>,
    val filePattern: Regex,
    val patchDirectoryPart: String,
    val referenceSha256: String = "",
) {
    // Register one entry per target app, e.g.:
    // EXAMPLE(
    //     id = "example",
    //     appName = "Example",
    //     packageName = Constants.EXAMPLE_PACKAGE_NAME,
    //     candidateFilenames = listOf("example_${Constants.EXAMPLE_TARGET_VERSION}.apk"),
    //     filePattern = Regex("(?i).*example.*\\.(?:apk|apkm|xapk)$"),
    //     patchDirectoryPart = "example",
    //     referenceSha256 = Constants.EXAMPLE_INPUT_SHA256,
    // ),
    INSTAGRAM(
        id = "instagram",
        appName = "Instagram",
        packageName = Constants.INSTAGRAM_PACKAGE_NAME,
        candidateFilenames = listOf(
            "com.instagram.android_447.0.0.55.81-385311895_1dpi_af3be75e29a3de479232e9e7978c0003_apkmirror.com.apkm",
            "instagram_${Constants.INSTAGRAM_TARGET_VERSION}.apkm"
        ),
        filePattern = Regex("(?i).*instagram.*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "instagram",
        referenceSha256 = Constants.INSTAGRAM_INPUT_SHA256,
    ),
    TWITTER(
        id = "twitter",
        appName = "X",
        packageName = Constants.TWITTER_PACKAGE_NAME,
        candidateFilenames = listOf(
            "twitter_${Constants.TWITTER_TARGET_VERSION}.apkm"
        ),
        filePattern = Regex("(?i).*twitter.*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "twitter",
        referenceSha256 = Constants.TWITTER_INPUT_SHA256,
    ),
    MOOVIT(
        id = "moovit",
        appName = "Moovit",
        packageName = Constants.MOOVIT_PACKAGE_NAME,
        candidateFilenames = listOf(
            "moovit_${Constants.MOOVIT_TARGET_VERSION}.apkm"
        ),
        filePattern = Regex("(?i).*(?:moovit|tranzmate).*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "moovit",
        referenceSha256 = Constants.MOOVIT_INPUT_SHA256,
    ),
    POWERPOINT(
        id = "powerpoint",
        appName = "PowerPoint",
        packageName = Constants.POWERPOINT_PACKAGE_NAME,
        candidateFilenames = listOf(
            "com.microsoft.office.powerpoint_16.0.20527.20034-2005437911_6dpi_24lang_ceed622e984560b84797e53e8db5221e_apkmirror.com.apkm",
            "powerpoint_${Constants.POWERPOINT_TARGET_VERSION}.apkm"
        ),
        filePattern = Regex("(?i).*powerpoint.*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "powerpoint",
        referenceSha256 = Constants.POWERPOINT_INPUT_SHA256,
    ),
    CAPCUT(
        id = "capcut",
        appName = "CapCut",
        packageName = Constants.CAPCUT_PACKAGE_NAME,
        candidateFilenames = listOf(
            "com.lemon.lvoverseas_19.9.0-19900002_minAPI23(arm64-v8a,armeabi-v7a)(nodpi)_apkmirror.com.apk",
            "capcut_${Constants.CAPCUT_TARGET_VERSION}.apk"
        ),
        filePattern = Regex("(?i).*(?:capcut|lemon\\.lvoverseas).*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "capcut",
        referenceSha256 = Constants.CAPCUT_INPUT_SHA256,
    ),
    HEVY(
        id = "hevy",
        appName = "Hevy",
        packageName = Constants.HEVY_PACKAGE_NAME,
        candidateFilenames = listOf(
            "com.hevy_${Constants.HEVY_TARGET_VERSION}.apk",
            "com.hevy_${Constants.HEVY_TARGET_VERSION}.apkm",
        ),
        filePattern = Regex("(?i).*hevy.*\\.(?:apk|apkm)$"),
        patchDirectoryPart = "hevy",
        referenceSha256 = Constants.HEVY_INPUT_SHA256,
    ),
    NOKOPRINT(
        id = "nokoprint",
        appName = "NokoPrint",
        packageName = Constants.NOKOPRINT_PACKAGE_NAME,
        candidateFilenames = listOf(
            "nokoprint_${Constants.NOKOPRINT_TARGET_VERSION}_orig.xapk",
            "NokoPrint+-+Print+from+Phone_${Constants.NOKOPRINT_TARGET_VERSION}_APKPure.xapk",
            "com.nokoprint_${Constants.NOKOPRINT_TARGET_VERSION}.xapk",
            "com.nokoprint_${Constants.NOKOPRINT_TARGET_VERSION}.apk",
            "nokoprint_${Constants.NOKOPRINT_TARGET_VERSION}.apk",
            "nokoprint.xapk",
            "nokoprint.apk",
        ),
        filePattern = Regex("(?i).*nokoprint.*\\.(?:apk|xapk)$"),
        patchDirectoryPart = "nokoprint",
        referenceSha256 = Constants.NOKOPRINT_INPUT_SHA256,
    ),
    XIAOMI_EARBUDS(
        id = "xiaomi_earbuds",
        appName = "Xiaomi Earbuds",
        packageName = Constants.XIAOMI_EARBUDS_PACKAGE_NAME,
        candidateFilenames = listOf(
            "Xiaomi+Earbuds_${Constants.XIAOMI_EARBUDS_TARGET_VERSION}_APKPure.xapk",
            "Xiaomi+Earbuds_${Constants.XIAOMI_EARBUDS_TARGET_VERSION}.xapk",
            "com.mi.earphone_${Constants.XIAOMI_EARBUDS_TARGET_VERSION}.xapk",
            "com.mi.earphone_${Constants.XIAOMI_EARBUDS_TARGET_VERSION}.apkm",
            "com.mi.earphone_${Constants.XIAOMI_EARBUDS_TARGET_VERSION}.apk",
            "xiaomi_earbuds.xapk",
            "xiaomi_earbuds.apkm",
            "xiaomi_earbuds.apk",
            "earphone.xapk",
            "earphone.apkm",
            "earphone.apk",
        ),
        filePattern = Regex("(?i).*(?:earphone|earbuds).*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "xiaomi",
        referenceSha256 = Constants.XIAOMI_EARBUDS_INPUT_SHA256,
    ),
    SUBE(
        id = "sube",
        appName = "SUBE",
        packageName = Constants.SUBE_PACKAGE_NAME,
        candidateFilenames = listOf(
            "sube_${Constants.SUBE_TARGET_VERSION}.xapk",
            "SUBE_${Constants.SUBE_TARGET_VERSION}_APKPure.xapk",
        ),
        filePattern = Regex("(?i).*(?:sube).*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "sube",
        referenceSha256 = Constants.SUBE_INPUT_SHA256,
    ),
    SDMSE(
        id = "sdmse",
        appName = "SD Maid SE",
        packageName = Constants.SDMSE_PACKAGE_NAME,
        candidateFilenames = listOf(
            "eu.darken.sdmse_2.2.2.apk",
            "sdmse_${Constants.SDMSE_TARGET_VERSION}.apk",
        ),
        filePattern = Regex("(?i).*(?:sdmse|sdmaid).*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "sdmse",
        referenceSha256 = Constants.SDMSE_INPUT_SHA256,
    ),
    WORD(
        id = "word",
        appName = "Word",
        packageName = Constants.WORD_PACKAGE_NAME,
        candidateFilenames = listOf(
            "com.microsoft.office.word_${Constants.WORD_TARGET_VERSION}-2005437911_6dpi_24lang_59bd95dc67e5e1aca5e2f10d6a96bda8_apkmirror.com.apkm",
            "word_${Constants.WORD_TARGET_VERSION}.apkm",
        ),
        filePattern = Regex("(?i).*word.*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "word",
        referenceSha256 = Constants.WORD_INPUT_SHA256,
    ),
    IBISPAINT(
        id = "ibispaint",
        appName = "IbisPaint X",
        packageName = Constants.IBIS_PAINT_PACKAGE_NAME,
        candidateFilenames = listOf(
            "ibis-paint-x-${Constants.IBIS_PAINT_TARGET_VERSION.replace('.', '-')}.xapk",
            "ibis-paint-x-${Constants.IBIS_PAINT_TARGET_VERSION.replace('.', '-')} (1).xapk",
            "ibis-paint-x_${Constants.IBIS_PAINT_TARGET_VERSION}.xapk",
            "ibispaint_${Constants.IBIS_PAINT_TARGET_VERSION}.xapk",
            "jp.ne.ibis.ibispaintx.app_${Constants.IBIS_PAINT_TARGET_VERSION}.xapk",
            "ibispaint.xapk",
            "ibispaint.apk",
        ),
        filePattern = Regex("(?i)^(?:jp\\.ne\\.ibis\\.ibispaintx\\.app|ibis[-_ ]paint(?:[-_ ]x)?|ibispaint)[-_0-9. ()]*\\.(?:apk|apkm|xapk)$"),
        patchDirectoryPart = "ibispaint",
        referenceSha256 = Constants.IBIS_PAINT_INPUT_SHA256,
    ),
    ;

    companion object {
        fun fromId(raw: String): TargetApp? {
            val normalized = raw.trim().lowercase().replace("-", "_")
            return entries.firstOrNull { it.id == normalized }
                ?: when (normalized) {
                    "earbuds", "earphone", "xiaomi" -> XIAOMI_EARBUDS
                    else -> null
                }
        }

        fun fromFileName(fileName: String): TargetApp? {
            val lower = fileName.lowercase()
            return when {
                lower.contains("hevy") -> HEVY
                lower.contains("nokoprint") -> NOKOPRINT
                lower.contains("earphone") || lower.contains("earbuds") -> XIAOMI_EARBUDS
                else -> entries.firstOrNull { lower.contains(it.id) || it.filePattern.containsMatchIn(fileName) }
            }
        }
    }
}

// Tuning default for the warning only.
private const val DEFAULT_SLOW_PATCH_SECONDS = 15.0

private fun safeZipEntryName(raw: String, allowedPrefixes: List<String>? = null): String? {
    if (raw.isBlank() || raw.contains('\u0000')) return null
    if (raw.startsWith('/') || raw.startsWith('\\')) return null
    if (raw.length >= 2 && ((raw[0] in 'A'..'Z') || (raw[0] in 'a'..'z')) && raw[1] == ':') return null
    if (raw.endsWith('/') || raw.endsWith('\\')) return null
    val rawSegments = raw.split('/', '\\')
    if (rawSegments.any { it == ".." }) return null
    val segments = rawSegments.filter { it.isNotEmpty() && it != "." }
    if (segments.isEmpty()) return null
    val normalized = segments.joinToString("/")
    if (allowedPrefixes != null) {
        val matchedPrefix = allowedPrefixes.firstOrNull { normalized.startsWith(it) } ?: return null
        val remainder = normalized.substring(matchedPrefix.length)
        if (remainder.isEmpty() || remainder.startsWith('/')) return null
    }
    return normalized
}

private fun getDownloadDirectory(): File? {
    return try {
        val process = ProcessBuilder("xdg-user-dir", "DOWNLOAD").start()
        val dir = process.inputStream.bufferedReader().readText().trim()
        if (dir.isNotEmpty() && File(dir).isDirectory) File(dir) else null
    } catch (_: Exception) {
        null
    }
}

private fun getSearchDirectories(userHome: String): List<File> {
    val dirs = mutableListOf<File>()
    dirs.add(File("candidate_apks"))
    dirs.add(File("../candidate_apks"))
    dirs.add(File("."))
    dirs.add(File(".."))
    getDownloadDirectory()?.let { dirs.add(it) }
    dirs.add(File(userHome, "Downloads"))
    dirs.add(File(userHome, "Descargas"))
    dirs.add(File(userHome, "candidate_apks"))
    return dirs.distinctBy { it.absolutePath }.filter { it.isDirectory }
}

private fun findApkForTarget(target: TargetApp, searchDirs: List<File>): File? {
    for (dir in searchDirs) {
        for (candidateName in target.candidateFilenames) {
            val f = File(dir, candidateName)
            if (f.exists() && f.isFile) return f
        }
    }
    for (dir in searchDirs) {
        // Never fall back to an output of a previous run: re-patching a patched APK hides fingerprint drift.
        val matched = dir.listFiles { f ->
            f.isFile && target.filePattern.containsMatchIn(f.name) && !f.name.contains("patched", ignoreCase = true)
        }
            ?.maxByOrNull { it.lastModified() }
        if (matched != null) return matched
    }
    return null
}

private fun detectTargetFromGit(): TargetApp? {
    return try {
        val process = ProcessBuilder("git", "status", "--porcelain").start()
        val lines = process.inputStream.bufferedReader().readLines()
        val modifiedPatches = lines.mapNotNull { line ->
            val path = line.substring(3).trim()
            if (path.contains("patches/src/main/kotlin/app/morphe/patches/")) path else null
        }
        for (target in TargetApp.entries) {
            if (modifiedPatches.any { it.contains("/${target.patchDirectoryPart}/") }) {
                return target
            }
        }
        null
    } catch (_: Exception) {
        null
    }
}

private fun findAndroidBuildTool(toolName: String): File? {
    System.getenv("PATH")?.split(File.pathSeparator)?.forEach { dir ->
        val file = File(dir, toolName)
        if (file.isFile && file.canExecute()) return file
    }
    val userHome = System.getProperty("user.home") ?: "."
    val sdkRoots = listOfNotNull(
        System.getenv("ANDROID_HOME"),
        System.getenv("ANDROID_SDK_ROOT"),
        File(userHome, "Android/Sdk").takeIf { it.exists() }?.absolutePath,
        File(userHome, "Library/Android/sdk").takeIf { it.exists() }?.absolutePath,
    )
    for (sdk in sdkRoots) {
        val buildToolsDir = File(sdk, "build-tools")
        if (buildToolsDir.isDirectory) {
            val latestTools = buildToolsDir.listFiles()?.filter { it.isDirectory }?.maxByOrNull { dir ->
                val parts = dir.name.split('.').mapNotNull { it.toIntOrNull() }
                parts.getOrElse(0) { 0 } * 10000 + parts.getOrElse(1) { 0 } * 100 + parts.getOrElse(2) { 0 }
            }
            if (latestTools != null) {
                val tool = File(latestTools, toolName)
                if (tool.isFile && tool.canExecute()) return tool
            }
        }
    }
    return null
}

private fun setBinaryXmlVersionCode(data: ByteArray, newVersionCode: Int): ByteArray {
    if (data.size < 40) return data
    val bb = java.nio.ByteBuffer.wrap(data).order(java.nio.ByteOrder.LITTLE_ENDIAN)

    // 1. Parse string pool to find the string pool index of "versionCode"
    var pos = 8
    val spType = bb.getInt(pos)
    val spSize = bb.getInt(pos + 4)
    if (spType != 0x001c0001 || spSize <= 0 || pos + spSize > data.size) return data

    val stringCount = bb.getInt(pos + 8)
    val flags = bb.getInt(pos + 16)
    val stringsStart = pos + bb.getInt(pos + 20)
    val isUtf8 = (flags and (1 shl 8)) != 0

    var versionCodeStringIdx = -1
    for (i in 0 until stringCount) {
        if (pos + 28 + (i + 1) * 4 > data.size) break
        val strOff = bb.getInt(pos + 28 + i * 4)
        val sAddr = stringsStart + strOff
        if (sAddr < 0 || sAddr >= data.size) continue

        val str = if (isUtf8) {
            var p = sAddr
            if (p >= data.size) "" else {
                val len1 = data[p].toInt() and 0xFF
                p += if (len1 and 0x80 != 0) 2 else 1
                if (p >= data.size) "" else {
                    val len2 = data[p].toInt() and 0xFF
                    p += if (len2 and 0x80 != 0) 2 else 1
                    var end = p
                    while (end < data.size && data[end] != 0.toByte()) end++
                    String(data, p, (end - p).coerceAtLeast(0), Charsets.UTF_8)
                }
            }
        } else {
            if (sAddr + 2 > data.size) "" else {
                val u16len = bb.getShort(sAddr).toInt() and 0xFFFF
                val p = if (u16len and 0x8000 != 0) sAddr + 4 else sAddr + 2
                val byteLen = (u16len and 0x7FFF) * 2
                if (p + byteLen <= data.size && byteLen >= 0) {
                    String(data, p, byteLen, Charsets.UTF_16LE)
                } else ""
            }
        }

        if (str == "versionCode") {
            versionCodeStringIdx = i
            break
        }
    }

    // Check optional resource map chunk (0x00080180) following string pool
    pos += spSize
    var versionCodeResIdx = -1
    if (pos + 8 <= data.size) {
        val resMapType = bb.getInt(pos)
        val resMapSize = bb.getInt(pos + 4)
        if (resMapType == 0x00080180 && resMapSize > 8) {
            val resCount = (resMapSize - 8) / 4
            for (i in 0 until resCount) {
                if (pos + 8 + i * 4 + 4 > data.size) break
                if (bb.getInt(pos + 8 + i * 4) == 0x0101021b) { // android.R.attr.versionCode
                    versionCodeResIdx = i
                    break
                }
            }
            pos += resMapSize
        }
    }

    // 2. Scan START_TAG chunks for <manifest> and update the matching attribute
    while (pos + 36 <= data.size) {
        val chunkType = bb.getInt(pos)
        val chunkSize = bb.getInt(pos + 4)
        if (chunkType == 0x00100102) { // START_TAG
            val attrStart = bb.getShort(pos + 24).toInt() and 0xFFFF
            val attrSize = (bb.getShort(pos + 26).toInt() and 0xFFFF).coerceAtLeast(20)
            val attrCount = bb.getShort(pos + 28).toInt() and 0xFFFF
            var attrOffset = pos + 16 + attrStart
            for (i in 0 until attrCount) {
                if (attrOffset + 20 > data.size) break
                val nameIdx = bb.getInt(attrOffset + 4)
                val matchesName = (versionCodeStringIdx != -1 && nameIdx == versionCodeStringIdx) ||
                        (versionCodeResIdx != -1 && nameIdx == versionCodeResIdx)
                val aType = bb.getInt(attrOffset + 12)
                val isIntType = (aType and 0x10000000) != 0 || aType == 0x10000008

                if (matchesName || (versionCodeStringIdx == -1 && versionCodeResIdx == -1 && isIntType)) {
                    bb.putInt(attrOffset + 16, newVersionCode)
                    return data
                }
                attrOffset += attrSize
            }
            break
        }
        if (chunkSize <= 0) break
        pos += chunkSize
    }
    return data
}

private fun persistentKeyStoreFile(): File {
    val xdg = System.getenv("XDG_CONFIG_HOME")?.takeIf { it.isNotBlank() }
    val base = if (xdg != null) File(xdg, "morphe") else File(System.getProperty("user.home") ?: ".", ".config/morphe")
    return File(base, "morphe-device.p12")
}

private fun ensurePkcs12KeyStore(keystoreFile: File) {
    if (keystoreFile.exists() && keystoreFile.length() > 0L) return
    keystoreFile.parentFile?.mkdirs()
    val keytoolBin = File(System.getProperty("java.home"), "bin/keytool").takeIf { it.canExecute() }
        ?: System.getenv("PATH")?.split(File.pathSeparator)?.map { File(it, "keytool") }?.firstOrNull { it.canExecute() }
        ?: File("/usr/bin/keytool").takeIf { it.canExecute() }
    if (keytoolBin != null) {
        val proc = ProcessBuilder(
            keytoolBin.absolutePath,
            "-genkeypair",
            "-keystore", keystoreFile.absolutePath,
            "-storetype", "PKCS12",
            "-alias", "morphe",
            "-keyalg", "RSA",
            "-keysize", "2048",
            "-validity", "10000",
            "-storepass", "morphepassword",
            "-keypass", "morphepassword",
            "-dname", "CN=Morphe",
        ).start()
        val exit = proc.waitFor()
        if (exit != 0) {
            println("[WARN] keytool failed with exit code $exit; keystore may not be valid.")
        }
    }
}

private fun verifyInputVersion(
    patcher: Patcher,
    targetPatches: Set<Patch<*>>,
    targetApp: TargetApp,
    inputFile: File,
) {
    val packageMetadata = patcher.context.packageMetadata
    val versionName = packageMetadata.versionName
    val versionCode = packageMetadata.versionCode

    val expectedVersions = targetPatches
        .flatMap { it.compatibility.orEmpty() }
        .filter { it.packageName == targetApp.packageName }
        .flatMap { it.targets }
        .mapNotNull { it.version }
        .toSet()

    if (expectedVersions.isEmpty()) {
        println("[INFO] Version check skipped: selected patches declare no target version.")
        return
    }

    if (versionName in expectedVersions) {
        println("[INFO] Input version $versionName (versionCode $versionCode) matches target.")
        return
    }

    if (System.getProperty("allowVersionMismatch").toBoolean()) {
        println("[WARN] Version mismatch allowed: input $versionName, expected $expectedVersions.")
        return
    }

    patcher.close()
    error("Input APK ${inputFile.name} version '$versionName' does not match expected target version(s) $expectedVersions. Pass -Papk=<path to the target version> or -PallowVersionMismatch=true for differential runs on other versions.")
}

private fun verifyInputDigest(
    patcher: Patcher,
    targetApp: TargetApp,
    inputFile: File,
) {
    if (targetApp.referenceSha256.isEmpty()) return

    val actualSha256 = sha256Hex(inputFile.readBytes())
    if (actualSha256.equals(targetApp.referenceSha256, ignoreCase = true)) {
        println("[INFO] Input digest matches reference.")
        return
    }

    val mismatchDetail = "Input digest mismatch: expected ${targetApp.referenceSha256} actual $actualSha256 (${inputFile.name}). Pass -Papk=<correct file> or -PallowVersionMismatch=true for differential runs on other versions."
    println("[WARN] $mismatchDetail")

    if (System.getProperty("apkDigestEnforce").toBoolean()) {
        patcher.close()
        error(mismatchDetail)
    }
}

private val RUNNER_PREFIXES = listOf(
    "[PASS]", "[FAIL]", "[WARN]", "[INFO]", "[EXEC]",
    "[BUILD]", "[PACK]", "[DONE]", "Loaded ", "Detected ",
)

private val PATCH_SKIP_PATTERN = Regex("""(?<!\d )\bskipped\b|\bskipping\b|\bnot found\b""", RegexOption.IGNORE_CASE)

private fun isPatchSkipLine(line: String): Boolean {
    val trimmed = line.trim()
    if (RUNNER_PREFIXES.any { trimmed.startsWith(it) }) return false
    val lower = trimmed.lowercase()
    if (lower.contains("fingerprint")) return false
    return PATCH_SKIP_PATTERN.containsMatchIn(line)
}

fun main(args: Array<String>) {
    val userHome = System.getProperty("user.home") ?: "."
    val searchDirs = getSearchDirectories(userHome)

    val explicitApkArg = args.firstOrNull { it.endsWith(".apk") || it.endsWith(".apkm") || File(it).isFile }
        ?: System.getenv("TARGET_APK_PATH")
        ?: System.getProperty("targetApk")
        ?: System.getProperty("apk")

    val explicitTargetArg = args.firstOrNull { TargetApp.fromId(it) != null }
        ?: System.getenv("TARGET_APP")
        ?: System.getProperty("targetApp")
        ?: System.getProperty("app")

    val explicitTarget = explicitTargetArg?.let { raw -> TargetApp.fromId(raw) ?: error("Unknown target app '$raw'. Valid values: ${TargetApp.entries.joinToString { it.id }}.") }

    val explicitApkFile = explicitApkArg?.let { raw ->
        val direct = File(raw)
        if (direct.isFile) direct
        else {
            val fromParent = File("..", raw)
            if (fromParent.isFile) fromParent else direct
        }
    }

    val apkFile: File
    val targetApp: TargetApp

    if (explicitApkFile != null && explicitApkFile.isFile) {
        apkFile = explicitApkFile
        targetApp = explicitTarget
            ?: TargetApp.fromFileName(apkFile.name)
            ?: error("Could not infer target app for APK: ${apkFile.name}. Specify app via -Papp=<target> or args.")
    } else {
        targetApp = explicitTarget
            ?: detectTargetFromGit()
            ?: TargetApp.entries.firstOrNull { findApkForTarget(it, searchDirs) != null }
            ?: error("No target app resolved. Register it in TargetApp and pass -Papp=<id> or -Papk=<path>.")

        apkFile = findApkForTarget(targetApp, searchDirs)
            ?: error("Target APK not found for ${targetApp.appName} in search dirs: ${searchDirs.joinToString { it.absolutePath }}. Set TARGET_APK_PATH or -Papk=...")
    }

    require(apkFile.exists()) { "Target APK not found at: ${apkFile.absolutePath}" }

    fun resolvePatchBundle(): File {
        val libsDir = File("build/libs/")
        if (!libsDir.isDirectory) {
            error("No patch bundle (.mpp) found in build/libs/. Run ./gradlew buildAndroid first, then retry.")
        }
        val candidates = libsDir.listFiles { file ->
            val fileName = file.name
            !fileName.contains("javadoc") &&
                    !fileName.contains("sources") &&
                    fileName.endsWith(".mpp")
        } ?: error("No patch bundle (.mpp) found in build/libs/. Run ./gradlew buildAndroid first, then retry.")

        return candidates.maxByOrNull { it.lastModified() }
            ?: error("No patch bundle (.mpp) found in build/libs/. Run ./gradlew buildAndroid first, then retry.")
    }

    val patchFiles = setOf(resolvePatchBundle())
    val allPatches = loadPatchesFromJar(patchFiles)

    val patchNameFilter = System.getProperty("patchName")?.trim()
    val targetPatches = allPatches.filter { patch ->
        val cp = patch.compatibility
        val matchesApp = if (cp == null) {
            !patchNameFilter.isNullOrEmpty() && patch.name.equals(patchNameFilter, ignoreCase = true)
        } else {
            cp.any { it.packageName == targetApp.packageName }
        }
        val matchesName = patchNameFilter.isNullOrEmpty() || patch.name.equals(patchNameFilter, ignoreCase = true)
        matchesApp && matchesName
    }.toSet()

    require(targetPatches.isNotEmpty()) {
        "No patches found in ${patchFiles.first().name} for target ${targetApp.appName} (${targetApp.packageName})" +
            if (!patchNameFilter.isNullOrEmpty()) " matching '$patchNameFilter'" else ""
    }

    if (System.getProperty("allOptions").toBoolean()) {
        var forced = 0
        targetPatches.forEach { patch ->
            patch.options.values.filter { it.default is Boolean }.forEach { option ->
                patch.options[option.name] = true
                forced++
            }
        }
        println("[INFO] allOptions: forced $forced boolean patch option(s) to true.")
    }

    val patchOptionsProperty = System.getProperty("patchOptions")?.trim()
    if (!patchOptionsProperty.isNullOrEmpty()) {
        var applied = 0
        patchOptionsProperty.split(",").forEach { entry ->
            val separatorIndex = entry.indexOf('=')
            if (separatorIndex <= 0) return@forEach
            val optKey = entry.substring(0, separatorIndex).trim()
            if (optKey.isEmpty()) return@forEach
            val rawValue = entry.substring(separatorIndex + 1)
            val optValue = if ((rawValue.startsWith("\"") && rawValue.endsWith("\"") && rawValue.length >= 2) ||
                (rawValue.startsWith("'") && rawValue.endsWith("'") && rawValue.length >= 2)
            ) {
                rawValue.substring(1, rawValue.length - 1)
            } else {
                rawValue
            }
            targetPatches.forEach { patch ->
                patch.options.values
                    .filter { it.default !is Boolean && (it.default is String || it.type.toString().contains("String")) }
                    .filter { it.name == optKey || it.key == optKey }
                    .forEach { option ->
                        try {
                            patch.options[option.name] = optValue
                            applied++
                        } catch (_: Exception) {
                        }
                    }
            }
        }
        println("[INFO] patchOptions: applied $applied string patch option(s).")
    }

    println("Loaded ${targetPatches.size} patch(es) for ${targetApp.appName} from ${patchFiles.first().name}:")
    targetPatches.sortedBy { it.name }.forEach { println("  • ${it.name}") }

    val tempDir = File("build/tmp/patcher-test-workspace").absoluteFile
    tempDir.deleteRecursively()
    tempDir.mkdirs()

    val effectiveApkFile = if (apkFile.name.endsWith(".apk", ignoreCase = true)) {
        val companionApkm = File("${apkFile.absolutePath}m")
            .takeIf { it.exists() && it.isFile }
            ?: File(apkFile.parentFile, "${apkFile.nameWithoutExtension}.apkm")
                .takeIf { it.exists() && it.isFile }
        if (companionApkm != null) {
            val isPartialSplit = try {
                java.util.zip.ZipFile(apkFile).use { zip ->
                    zip.getEntry("classes2.dex") == null && zip.getEntry("lib/arm64-v8a/libchrome.so") != null
                }
            } catch (_: Exception) {
                false
            }
            if (isPartialSplit) {
                println("[APKM] Detected partial base APK without split DEX. Redirecting to bundle: ${companionApkm.name}")
                companionApkm
            } else {
                apkFile
            }
        } else {
            apkFile
        }
    } else {
        apkFile
    }

    val actualApkFile = if (effectiveApkFile.name.endsWith(".apkm", ignoreCase = true) || effectiveApkFile.name.endsWith(".xapk", ignoreCase = true)) {
        val apkmExtractDir = File("build/tmp/patcher-apkm-source").absoluteFile
        apkmExtractDir.deleteRecursively()
        apkmExtractDir.mkdirs()
        val extractedBase = File(apkmExtractDir, "base.apk")
        java.util.zip.ZipFile(effectiveApkFile).use { apkmZip ->
            val baseEntry = apkmZip.getEntry("base.apk")
                ?: apkmZip.entries().asSequence().firstOrNull { it.name.endsWith(".apk") && (it.name.contains("base") || it.name.startsWith(targetApp.packageName)) }
                ?: apkmZip.entries().asSequence().filter { it.name.endsWith(".apk") }.maxByOrNull { it.size }
                ?: error("No base APK found in bundle: ${effectiveApkFile.name}")
            val splitApkEntries = apkmZip.entries().asSequence()
                .filter { it.name.endsWith(".apk", ignoreCase = true) && it.name != baseEntry.name }
                .sortedBy { it.name }
                .toList()

            val splitDexes = mutableListOf<ByteArray>()
            for (splitEntry in splitApkEntries) {
                apkmZip.getInputStream(splitEntry).use { splitStream ->
                    java.util.zip.ZipInputStream(splitStream).use { splitZip ->
                        val currentSplitDexes = mutableListOf<Pair<String, ByteArray>>()
                        var entry = splitZip.nextEntry
                        while (entry != null) {
                            val safeName = if (!entry.isDirectory) safeZipEntryName(entry.name) else null
                            if (safeName != null && Regex("^classes\\d*\\.dex$").matches(safeName)) {
                                currentSplitDexes.add(safeName to splitZip.readBytes())
                            }
                            entry = splitZip.nextEntry
                        }
                        currentSplitDexes.sortBy { it.first }
                        splitDexes.addAll(currentSplitDexes.map { it.second })
                    }
                }
            }

            apkmZip.getInputStream(baseEntry).use { input ->
                extractedBase.outputStream().buffered().use { output ->
                    input.copyTo(output)
                }
            }

            if (splitDexes.isNotEmpty()) {
                var maxDexIndex = 1
                java.util.zip.ZipFile(extractedBase).use { baseZip ->
                    baseZip.entries().asSequence().forEach { entry ->
                        val m = Regex("^classes(\\d*)\\.dex$").matchEntire(entry.name)
                        if (m != null) {
                            val num = m.groupValues[1]
                            val idx = if (num.isEmpty()) 1 else num.toInt()
                            if (idx > maxDexIndex) maxDexIndex = idx
                        }
                    }
                }

                val uri = java.net.URI.create("jar:" + extractedBase.toURI())
                val env = mapOf("create" to "false")
                java.nio.file.FileSystems.newFileSystem(uri, env).use { fs ->
                    for (dexBytes in splitDexes) {
                        maxDexIndex++
                        val entryPath = fs.getPath("classes$maxDexIndex.dex")
                        java.nio.file.Files.write(entryPath, dexBytes)
                    }
                }
                println("[APKM] Merged ${splitDexes.size} DEX file(s) from split APK(s) into base.apk (total DEX files: $maxDexIndex)")
            }

            val targetAbiPrefixes = listOf("lib/arm64-v8a/", "lib/armeabi-v7a/")
            val existingEntries = mutableSetOf<String>()
            java.util.zip.ZipFile(extractedBase).use { baseZip ->
                baseZip.entries().asSequence().forEach { existingEntries.add(it.name) }
            }

            val splitNativeLibs = mutableListOf<Pair<String, ByteArray>>()
            for (splitEntry in splitApkEntries) {
                apkmZip.getInputStream(splitEntry).use { splitStream ->
                    java.util.zip.ZipInputStream(splitStream).use { splitZip ->
                        var entry = splitZip.nextEntry
                        while (entry != null) {
                            val safeName = if (!entry.isDirectory) safeZipEntryName(entry.name, targetAbiPrefixes) else null
                            if (safeName != null && existingEntries.add(safeName)) {
                                splitNativeLibs.add(safeName to splitZip.readBytes())
                            }
                            entry = splitZip.nextEntry
                        }
                    }
                }
            }

            if (splitNativeLibs.isNotEmpty()) {
                val uri = java.net.URI.create("jar:" + extractedBase.toURI())
                val env = mapOf("create" to "false")
                java.nio.file.FileSystems.newFileSystem(uri, env).use { fs ->
                    for ((libName, libBytes) in splitNativeLibs) {
                        val entryPath = fs.getPath(libName).normalize()
                        val normalizedStr = entryPath.toString().replace('\\', '/')
                        if (!targetAbiPrefixes.any { normalizedStr.startsWith(it) }) {
                            error("Path traversal detected in native library entry: $libName")
                        }
                        entryPath.parent?.let { java.nio.file.Files.createDirectories(it) }
                        java.nio.file.Files.write(entryPath, libBytes)
                    }
                }
                val libWord = if (splitNativeLibs.size == 1) "library" else "libraries"
                println("[APKM] Merged ${splitNativeLibs.size} native $libWord from split APK(s) into base.apk")
            }
        }
        extractedBase
    } else {
        effectiveApkFile
    }

    val config = PatcherConfig(
        apkFile = actualApkFile,
        temporaryFilesPath = tempDir,
        keepArchitectures = setOf(CpuArchitecture.ARM64_V8A, CpuArchitecture.ARMEABI_V7A),
        useBytecodeMode = BytecodeMode.STRIP_FAST,
        verifier = NoOpDexVerifier
    )

    println("\n[INIT] Initializing Morphe Patcher engine...")
    val patcher = Patcher(config)
    verifyInputVersion(patcher, targetPatches, targetApp, effectiveApkFile)
    verifyInputDigest(patcher, targetApp, effectiveApkFile)
    patcher += targetPatches

    println("[EXEC] Executing patch pipeline on ${effectiveApkFile.name} (target: ${targetApp.appName})...")
    var totalPatches = 0
    var successfulPatches = 0
    var failedPatches = 0
    val failures = mutableListOf<String>()

    val originalOut = System.out
    val originalErr = System.err
    val fingerprintErrors = java.util.concurrent.CopyOnWriteArrayList<String>()
    // The inline smali tree walker only reports semantic errors (e.g. "[6,8] Invalid register: v22")
    // to stderr and silently drops the offending instruction, so they must be caught here.
    val smaliErrorPattern = Regex("""^\[\d+,\d+] .+""")
    val pendingSmaliErrors = java.util.concurrent.CopyOnWriteArrayList<String>()
    val pendingSkipLines = java.util.concurrent.CopyOnWriteArrayList<String>()
    val smaliCompileErrors = mutableListOf<String>()
    val malformedDexHeaders = mutableListOf<String>()
    val skipWarnings = mutableListOf<String>()

    class InterceptingOutputStream(val delegate: OutputStream) : OutputStream() {
        private val buffer = ByteArrayOutputStream()

        override fun write(b: Int) {
            delegate.write(b)
            if (b == '\n'.code) {
                checkLine(buffer.toString("UTF-8"))
                buffer.reset()
            } else if (b != '\r'.code) {
                buffer.write(b)
            }
        }

        override fun write(b: ByteArray, off: Int, len: Int) {
            delegate.write(b, off, len)
            for (i in off until off + len) {
                val byte = b[i]
                if (byte == '\n'.code.toByte()) {
                    checkLine(buffer.toString("UTF-8"))
                    buffer.reset()
                } else if (byte != '\r'.code.toByte()) {
                    buffer.write(byte.toInt())
                }
            }
        }

        private fun checkLine(line: String) {
            if (smaliErrorPattern.matches(line.trim())) {
                pendingSmaliErrors.add(line.trim())
                return
            }
            val lower = line.lowercase()
            if (line.startsWith("Detected Fingerprint Failures:") || line.startsWith("[ERROR]") || line.startsWith("FINAL PATCHING RESULT")) return
            if (lower.contains("failed to match the fingerprint") || (lower.contains("fingerprint mismatch") && !line.startsWith("Detected Fingerprint Failures:"))) {
                fingerprintErrors.add(line.trim())
            }
            if (isPatchSkipLine(line)) {
                pendingSkipLines.add(line.trim())
            }
        }

        override fun flush() {
            delegate.flush()
        }

        override fun close() {
            if (buffer.size() > 0) {
                checkLine(buffer.toString("UTF-8"))
                buffer.reset()
            }
            delegate.close()
        }
    }

    val interceptingOut = PrintStream(InterceptingOutputStream(originalOut), true, "UTF-8")
    val interceptingErr = PrintStream(InterceptingOutputStream(originalErr), true, "UTF-8")
    System.setOut(interceptingOut)
    System.setErr(interceptingErr)

    try {
        val patchTimings = mutableListOf<Pair<String, Long>>()
        var lastResultNanos = System.nanoTime()
        runBlocking {
            patcher().collect { result ->
                totalPatches++
                val patchName = result.patch.name ?: "Unknown"
                val now = System.nanoTime()
                // The patcher runs patches sequentially and emits one result per patch,
                // so the gap between results is that patch's execution time (the first entry also includes pipeline startup,
                // and an entry also includes any dependency patch that runs for the first time right before it).
                val elapsedMs = (now - lastResultNanos) / 1_000_000
                lastResultNanos = now
                patchTimings.add(patchName to elapsedMs)
                if (pendingSmaliErrors.isNotEmpty()) {
                    pendingSmaliErrors.forEach { smaliCompileErrors.add("$patchName: $it") }
                    pendingSmaliErrors.clear()
                }
                if (result.exception == null) {
                    successfulPatches++
                    println("[PASS] $patchName")
                    if (pendingSkipLines.isNotEmpty()) {
                        println("[WARN] $patchName passed with skipped steps:")
                        val snapshot = pendingSkipLines.toList()
                        snapshot.forEach { println("    $it") }
                        val suffix = if (snapshot.size > 1) " (+${snapshot.size - 1} more)" else ""
                        skipWarnings.add("$patchName: ${snapshot.first()}$suffix")
                    }
                } else {
                    failedPatches++
                    val err = result.exception?.message ?: "Unknown error"
                    println("[FAIL] $patchName -> $err")
                    result.exception?.printStackTrace()
                    failures.add("$patchName: $err")
                }
                pendingSkipLines.clear()
            }
        }

        println("\n========================================")
        println("FINAL PATCHING RESULT")
        println("========================================")
        println("Target App:    ${targetApp.appName} (${targetApp.packageName})")
        println("APK File:      ${effectiveApkFile.name}")
        println("Total patches: $totalPatches")
        println("Successful:    $successfulPatches")
        println("Failed:        $failedPatches")
        println("Detected Fingerprint Failures: ${fingerprintErrors.size}")
        println("Detected Smali Compile Errors: ${smaliCompileErrors.size}")
        println("Patches with skipped steps: ${skipWarnings.size}")
        if (skipWarnings.isNotEmpty()) {
            skipWarnings.forEach { println("  - $it") }
        }
        printPatchTimings(patchTimings, resolveSlowPatchThreshold(), patchTimings.firstOrNull()?.first)

        if (failedPatches == 0 && fingerprintErrors.isEmpty() && smaliCompileErrors.isEmpty()) {
            println("\n[BUILD] Compiling modified bytecode & assets via patcher.get()...")
            File(tempDir, "patched/dex").mkdirs()
            File(tempDir, "patched/originalDex").mkdirs()
            val patcherResult = patcher.get()
            println("[BUILD] Compiled ${patcherResult.dexFiles.size} DEX files successfully.")
            verifyDexHeaders(File(tempDir, "patched"), malformedDexHeaders)

            val outPath = System.getProperty("outputApk")
            val dexDigestOption = resolveDexDigestOption()
            if (outPath != null) {
                var outFile = resolveOutputPath(outPath)
                if (!outFile.name.endsWith(".apk", ignoreCase = true)) {
                    val normalized = File("${outFile.path}.apk")
                    println("[PACK] Output path missing .apk extension; normalized to: ${normalized.name}")
                    outFile = normalized
                }
                outFile.parentFile?.mkdirs()
                val unsignedApk = File(tempDir, "unsigned-work.apk")
                actualApkFile.copyTo(unsignedApk, overwrite = true)
                println("\n[PACK] Applying patcher result to APK (source: ${unsignedApk.length()} bytes)...")
                val maxVersionCode = System.getProperty("maxVersionCode") == "true" || System.getenv("MAX_VERSION_CODE") == "true"
                var manifestSynced = false
                patcherResult.applyTo(unsignedApk)
                patcherResult.resources.resourcesApk?.let { resApk ->
                    java.util.zip.ZipFile(resApk).use { resZip ->
                        val manifestEntry = resZip.getEntry("AndroidManifest.xml")
                        if (manifestEntry != null) {
                            val rawManifestBytes = resZip.getInputStream(manifestEntry).readBytes()
                            // Apply the versionCode override in the same pass so the APK zip is rewritten only once.
                            val manifestBytes = if (maxVersionCode) setBinaryXmlVersionCode(rawManifestBytes, Int.MAX_VALUE) else rawManifestBytes
                            val uri = java.net.URI.create("jar:" + unsignedApk.toURI())
                            val env = mapOf("create" to "false")
                            java.nio.file.FileSystems.newFileSystem(uri, env).use { fs ->
                                val targetManifest = fs.getPath("AndroidManifest.xml")
                                java.nio.file.Files.write(targetManifest, manifestBytes)
                            }
                            manifestSynced = true
                            println("[PACK] Synchronized patched AndroidManifest.xml from resources.apk (${manifestBytes.size} bytes)")
                            if (maxVersionCode) println("[PACK] Overrode AndroidManifest.xml versionCode -> 2147483647 (Int.MAX_VALUE)")
                        }
                    }
                }
                if (maxVersionCode && !manifestSynced) {
                    val uri = java.net.URI.create("jar:" + unsignedApk.toURI())
                    val env = mapOf("create" to "false")
                    java.nio.file.FileSystems.newFileSystem(uri, env).use { fs ->
                        val targetManifest = fs.getPath("AndroidManifest.xml")
                        if (java.nio.file.Files.exists(targetManifest)) {
                            val rawBytes = java.nio.file.Files.readAllBytes(targetManifest)
                            val patchedBytes = setBinaryXmlVersionCode(rawBytes, Int.MAX_VALUE)
                            java.nio.file.Files.write(targetManifest, patchedBytes)
                            println("[PACK] Overrode AndroidManifest.xml versionCode -> 2147483647 (Int.MAX_VALUE)")
                        }
                    }
                }
                println("[PACK] After applyTo: unsignedApk exists=${unsignedApk.exists()}, size=${unsignedApk.length()} bytes")
                dexDigestOption?.let { printDexDigest(unsignedApk, it) }
                val zipalignBin = findAndroidBuildTool("zipalign")
                val apksignerBin = findAndroidBuildTool("apksigner")
                val buildToolsMajor = zipalignBin?.parentFile?.name?.split('.')?.firstOrNull()?.toIntOrNull() ?: 0
                val supports16k = buildToolsMajor >= 35

                val keystoreFile = persistentKeyStoreFile()
                ensurePkcs12KeyStore(keystoreFile)

                if (zipalignBin != null && apksignerBin != null && keystoreFile.exists() && keystoreFile.length() > 0L) {
                    try {
                        val alignMode = if (supports16k) "16 KB page alignment (-P 16 4)" else "4-byte alignment"
                        println("\n[ALIGN] Running $alignMode via zipalign...")
                        val alignArgs = if (supports16k) {
                            listOf(zipalignBin.absolutePath, "-f", "-P", "16", "4", unsignedApk.absolutePath, outFile.absolutePath)
                        } else {
                            listOf(zipalignBin.absolutePath, "-f", "4", unsignedApk.absolutePath, outFile.absolutePath)
                        }
                        val alignProc = ProcessBuilder(alignArgs).inheritIO().start()
                        val alignExit = alignProc.waitFor()
                        if (alignExit != 0) {
                            error("zipalign failed with exit code $alignExit")
                        }

                        println("[SIGN] Signing APK via apksigner...")
                        val signArgs = mutableListOf(
                            apksignerBin.absolutePath,
                            "sign",
                            "--ks", keystoreFile.absolutePath,
                            "--ks-type", "PKCS12",
                            "--ks-pass", "pass:morphepassword",
                        )
                        if (supports16k) {
                            signArgs.add("--alignment-preserved")
                        }
                        signArgs.add(outFile.absolutePath)

                        val signProc = ProcessBuilder(signArgs).inheritIO().start()
                        val signExit = signProc.waitFor()
                        if (signExit != 0) {
                            error("apksigner failed with exit code $signExit")
                        }
                        println("[DONE] Patched, aligned & signed APK saved at: ${outFile.absolutePath}")
                    } finally {
                        unsignedApk.delete()
                    }
                } else {
                    println("\n[WARN] Android SDK zipalign/apksigner not found; falling back to ApkUtils.signApk...")
                    val ksDetails = ApkUtils.KeyStoreDetails(
                        keyStore = keystoreFile,
                        alias = "morphe",
                        password = "morphepassword",
                    )
                    try {
                        ApkUtils.signApk(
                            inputApkFile = unsignedApk,
                            outputApkFile = outFile,
                            signer = "Morphe",
                            keyStoreDetails = ksDetails,
                        )
                        println("[DONE] Patched & signed APK saved at: ${outFile.absolutePath}")
                    } finally {
                        unsignedApk.delete()
                    }
                }

                if (effectiveApkFile.name.endsWith(".apkm", ignoreCase = true) || effectiveApkFile.name.endsWith(".xapk", ignoreCase = true)) {
                    java.util.zip.ZipFile(effectiveApkFile).use { apkmZip ->
                        val baseEntry = apkmZip.getEntry("base.apk")
                            ?: apkmZip.entries().asSequence().firstOrNull { it.name.endsWith(".apk") && (it.name.contains("base") || it.name.startsWith(targetApp.packageName)) }
                            ?: apkmZip.entries().asSequence().filter { it.name.endsWith(".apk") }.maxByOrNull { it.size }
                        val splitApkEntries = apkmZip.entries().asSequence()
                            .filter { it.name.endsWith(".apk", ignoreCase = true) && it.name != baseEntry?.name }
                            .toList()
                        splitApkEntries.parallelStream().forEach { splitEntry ->
                            val safeSplitName = safeZipEntryName(splitEntry.name)
                                ?: error("Potential path traversal detected in split entry name: ${splitEntry.name}")
                            val splitBasename = File(safeSplitName).name
                            if (splitEntry.name.contains("..") || splitEntry.name.startsWith("/") || splitEntry.name.startsWith("\\") || splitEntry.name != splitBasename) {
                                error("Potential path traversal detected in split entry name: ${splitEntry.name}")
                            }
                            val rawSplitFile = File(tempDir, splitBasename)
                            if (!rawSplitFile.canonicalPath.startsWith(tempDir.canonicalPath + File.separator)) {
                                error("Potential path traversal detected in split entry name: ${splitEntry.name}")
                            }
                            apkmZip.getInputStream(splitEntry).use { input ->
                                rawSplitFile.outputStream().buffered().use { output -> input.copyTo(output) }
                            }

                            if (maxVersionCode) {
                                try {
                                    val uri = java.net.URI.create("jar:" + rawSplitFile.toURI())
                                    java.nio.file.FileSystems.newFileSystem(uri, emptyMap<String, Any>()).use { fs ->
                                        val splitManifest = fs.getPath("AndroidManifest.xml")
                                        if (java.nio.file.Files.exists(splitManifest)) {
                                            val rawBytes = java.nio.file.Files.readAllBytes(splitManifest)
                                            val patchedBytes = setBinaryXmlVersionCode(rawBytes, Int.MAX_VALUE)
                                            java.nio.file.Files.write(splitManifest, patchedBytes)
                                            println("[PACK] Overrode companion split ${splitEntry.name} versionCode -> 2147483647 (Int.MAX_VALUE)")
                                        }
                                    }
                                } catch (e: Exception) {
                                    println("[WARN] Could not override split ${splitEntry.name} versionCode: ${e.message}")
                                }
                            }

                            // Prefix splits with the output name so bundles of different apps never overwrite
                            // each other and `adb install-multiple -r <out-stem>*.apk` installs the whole set.
                            val signedSplitBasename = File(safeSplitName).name
                            val signedSplitFile = File(outFile.parentFile, "${outFile.nameWithoutExtension}.$signedSplitBasename")
                            val outParent = outFile.parentFile
                            if (outParent == null || !signedSplitFile.canonicalPath.startsWith(outParent.canonicalPath + File.separator)) {
                                error("Potential path traversal detected in split entry name: ${splitEntry.name}")
                            }
                            println("[SIGN] Signing companion split -> ${signedSplitFile.name}...")
                            if (zipalignBin != null && apksignerBin != null && keystoreFile.exists() && keystoreFile.length() > 0L) {
                                val splitAlignArgs = if (supports16k) {
                                    listOf(zipalignBin.absolutePath, "-f", "-P", "16", "4", rawSplitFile.absolutePath, signedSplitFile.absolutePath)
                                } else {
                                    listOf(zipalignBin.absolutePath, "-f", "4", rawSplitFile.absolutePath, signedSplitFile.absolutePath)
                                }
                                val splitAlignProc = ProcessBuilder(splitAlignArgs).inheritIO().start()
                                val splitAlignExit = splitAlignProc.waitFor()
                                if (splitAlignExit != 0) {
                                    error("zipalign failed for split ${splitEntry.name} with exit code $splitAlignExit")
                                }

                                val splitSignArgs = mutableListOf(
                                    apksignerBin.absolutePath,
                                    "sign",
                                    "--ks", keystoreFile.absolutePath,
                                    "--ks-type", "PKCS12",
                                    "--ks-pass", "pass:morphepassword",
                                )
                                if (supports16k) {
                                    splitSignArgs.add("--alignment-preserved")
                                }
                                splitSignArgs.add(signedSplitFile.absolutePath)

                                val splitSignProc = ProcessBuilder(splitSignArgs).inheritIO().start()
                                val splitSignExit = splitSignProc.waitFor()
                                if (splitSignExit != 0) {
                                    error("apksigner failed for split ${splitEntry.name} with exit code $splitSignExit")
                                }
                            } else {
                                val ksDetails = ApkUtils.KeyStoreDetails(
                                    keyStore = keystoreFile,
                                    alias = "morphe",
                                    password = "morphepassword",
                                )
                                ApkUtils.signApk(
                                    inputApkFile = rawSplitFile,
                                    outputApkFile = signedSplitFile,
                                    signer = "Morphe",
                                    keyStoreDetails = ksDetails,
                                )
                            }
                            println("[DONE] Signed companion split saved at: ${signedSplitFile.absolutePath}")
                        }
                    }
                }
            } else if (dexDigestOption != null) {
                // Without -Pout an unsigned work APK is still assembled so the digest covers exactly what -Pout would ship.
                val digestApk = File(tempDir, "digest-work.apk")
                actualApkFile.copyTo(digestApk, overwrite = true)
                patcherResult.applyTo(digestApk)
                printDexDigest(digestApk, dexDigestOption)
                digestApk.delete()
            }
        }
    } finally {
        System.setOut(originalOut)
        System.setErr(originalErr)
        patcher.close()
        tempDir.deleteRecursively()
        File("build/tmp/patcher-apkm-source").deleteRecursively()
    }

    if (fingerprintErrors.isNotEmpty()) {
        println("\n[ERROR] Unresolved fingerprint mismatches detected during patch execution (${fingerprintErrors.size}):")
        fingerprintErrors.forEach { println("  • $it") }
        error("Patcher execution failed: ${fingerprintErrors.size} fingerprint mismatch(es) detected! A patch update or creation is NEVER complete until 100% of fingerprints resolve cleanly.")
    }

    if (smaliCompileErrors.isNotEmpty()) {
        println("\n[ERROR] Inline smali compile errors detected; the offending instructions were dropped (${smaliCompileErrors.size}):")
        smaliCompileErrors.forEach { println("  • $it") }
        error("Patcher execution failed: ${smaliCompileErrors.size} inline smali compile error(s) detected! Non-range invokes cannot address registers above v15; use the /range form or move values into low registers.")
    }

    if (malformedDexHeaders.isNotEmpty()) {
        println("\n[ERROR] Malformed DEX headers detected (${malformedDexHeaders.size}):")
        malformedDexHeaders.forEach { println("  - $it") }
        error("Patcher execution failed: ${malformedDexHeaders.size} malformed DEX header(s). ART rejects a DEX with zero class_defs and a non-zero class_defs_off; a patch probably mutated every class of an original DEX (call mutableClassDefBy only on classes that need edits).")
    }

    if (failedPatches > 0) {
        println("\nFailure details:")
        failures.forEach { println("  - $it") }
        error("Patcher finished with $failedPatches failure(s)")
    } else {
        println("\n100% OF ${targetApp.appName.uppercase()} PATCHES APPLIED WITH ZERO ERRORS AND ZERO FINGERPRINT MISMATCHES!")
    }
}

private fun resolveSlowPatchThreshold(): Double {
    val raw = System.getProperty("slowPatchSeconds") ?: return DEFAULT_SLOW_PATCH_SECONDS
    val parsed = raw.toDoubleOrNull()
    if (parsed == null || parsed <= 0.0) {
        println("[WARN] Invalid slowPatchSeconds '$raw'; using default $DEFAULT_SLOW_PATCH_SECONDS s.")
        return DEFAULT_SLOW_PATCH_SECONDS
    }
    return parsed
}

private fun printPatchTimings(
    timings: List<Pair<String, Long>>,
    thresholdSeconds: Double,
    firstPatchName: String? = timings.firstOrNull()?.first,
) {
    if (timings.isEmpty()) return

    val sorted = timings.sortedByDescending { it.second }
    println("Slowest patches:")
    for ((name, elapsedMs) in sorted.take(5)) {
        val seconds = elapsedMs / 1000.0
        val formatted = String.format(java.util.Locale.ROOT, "%.1f", seconds)
        val startupNote = if (name == firstPatchName) " (includes pipeline startup)" else ""
        println("  $formatted s  $name$startupNote")
    }

    val totalSeconds = timings.sumOf { it.second } / 1000.0
    val formattedTotal = String.format(java.util.Locale.ROOT, "%.1f", totalSeconds)
    println("Total patch time: $formattedTotal s")

    val formattedThreshold = String.format(java.util.Locale.ROOT, "%.1f", thresholdSeconds)
    for ((name, elapsedMs) in sorted) {
        val seconds = elapsedMs / 1000.0
        if (seconds > thresholdSeconds) {
            val formattedSeconds = String.format(java.util.Locale.ROOT, "%.1f", seconds)
            val startupNote = if (name == firstPatchName) " (includes pipeline startup)" else ""
            println("[WARN] Slow patch: $name took $formattedSeconds s (threshold $formattedThreshold s)$startupNote")
        }
    }
}

private fun resolveOutputPath(path: String): File {
    val directFile = File(path)
    if (directFile.isAbsolute) return directFile
    val fromParent = File("..", path)
    return if (fromParent.parentFile?.isDirectory == true) {
        fromParent.canonicalFile
    } else {
        directFile.absoluteFile
    }
}

private fun sha256Hex(bytes: ByteArray): String {
    val digest = MessageDigest.getInstance("SHA-256").digest(bytes)
    return digest.joinToString("") { String.format(java.util.Locale.ROOT, "%02x", it) }
}

private fun writeDexDigestFile(file: File, content: String) {
    file.parentFile?.mkdirs()
    file.writeText(content, Charsets.UTF_8)
    println("[DIGEST] Per-file digests written to ${file.absolutePath}")
}

private fun resolveDexDigestOption(): String? {
    val raw = System.getProperty("dexDigest") ?: return null
    if (raw.isBlank()) {
        println("[WARN] -PdexDigest has no value; use true or a file path. Digest skipped.")
        return null
    }
    if (raw.equals("false", ignoreCase = true)) return null
    return raw
}

private fun printDexDigest(apk: File, option: String) {
    val dexPattern = Regex("""^classes\d*\.dex$""")
    val fileDigests = java.util.zip.ZipFile(apk).use { zip ->
        zip.entries().asSequence()
            .filter { !it.isDirectory && dexPattern.matches(it.name) }
            .map { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                entry.name to sha256Hex(bytes)
            }
            .toList()
    }

    val linesText = fileDigests
        .sortedBy { it.first }
        .joinToString("") { "${it.first} ${it.second}\n" }
    val aggregate = sha256Hex(linesText.toByteArray(Charsets.UTF_8))
    println("[DIGEST] Patched DEX set SHA-256: $aggregate (${fileDigests.size} files)")

    if (!option.equals("true", ignoreCase = true)) {
        writeDexDigestFile(resolveOutputPath(option), linesText)
    }
}

// DEX header layout constants defined by the Dalvik Executable (DEX) format specification.
private const val DEX_HEADER_MIN_SIZE = 0x70
private const val DEX_HEADER_CLASS_DEFS_SIZE_OFFSET = 0x60
private const val DEX_HEADER_CLASS_DEFS_OFF_OFFSET = 0x64

private fun isMalformedDexHeader(classDefsSize: Long, classDefsOff: Long): Boolean {
    return classDefsSize == 0L && classDefsOff != 0L
}

private fun readDexHeader(file: File): ByteArray? {
    if (file.length() < DEX_HEADER_MIN_SIZE) return null
    val header = ByteArray(DEX_HEADER_MIN_SIZE)
    val readCount = file.inputStream().use { it.readNBytes(header, 0, DEX_HEADER_MIN_SIZE) }
    if (readCount < DEX_HEADER_MIN_SIZE) return null
    return header
}

private fun checkDexHeader(file: File, root: File): String? {
    val relPath = file.relativeTo(root).invariantSeparatorsPath
    val header = readDexHeader(file)
        ?: return "$relPath (file size ${file.length()} < 0x70 bytes)"
    val buffer = ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN)
    val classDefsSize = buffer.getInt(DEX_HEADER_CLASS_DEFS_SIZE_OFFSET).toLong() and 0xFFFF_FFFFL
    val classDefsOff = buffer.getInt(DEX_HEADER_CLASS_DEFS_OFF_OFFSET).toLong() and 0xFFFF_FFFFL
    if (isMalformedDexHeader(classDefsSize, classDefsOff)) {
        return "$relPath (class_defs_size=$classDefsSize, class_defs_off=$classDefsOff)"
    }
    return null
}

// Raw assets under other/ are excluded because ART never loads them as app DEX.
private fun findDexFiles(root: File): List<File> {
    if (!root.isDirectory) return emptyList()
    val pattern = Regex("""^classes\d*\.dex$""", RegexOption.IGNORE_CASE)
    return listOf(File(root, "dex"), File(root, "originalDex"))
        .mapNotNull { it.listFiles() }
        .flatMap { it.toList() }
        .filter { it.isFile && pattern.matches(it.name) }
        .sortedBy { it.path }
}

private fun findMalformedDexHeaders(root: File, dexFiles: List<File> = findDexFiles(root)): List<String> {
    return dexFiles.mapNotNull { checkDexHeader(it, root) }
}

private fun verifyDexHeaders(patchedDir: File, malformedDexHeaders: MutableList<String>) {
    val dexFiles = findDexFiles(patchedDir)
    if (dexFiles.isEmpty()) {
        println("[WARN] DEX header check skipped: no DEX files found under patched/.")
        return
    }
    val malformed = findMalformedDexHeaders(patchedDir, dexFiles)
    println("[BUILD] DEX header check: ${dexFiles.size} file(s) inspected, ${malformed.size} malformed.")
    if (malformed.isNotEmpty()) {
        malformed.forEach { println("  - $it") }
        malformedDexHeaders.addAll(malformed)
    }
}
