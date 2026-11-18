/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.codec

import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.rawResourcePatch
import app.mxplayer.patches.menu.settingsRowPatch
import app.mxplayer.patches.integrity.integrityPatch
import app.mxplayer.patches.shared.Constants.CODEC_VERSION
import app.mxplayer.patches.shared.Constants.COMPATIBILITY_MXPLAYER_PRO
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.File
import java.net.URI
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.zip.ZipInputStream

/** How deep a pack inside a pack is followed. mx_aio.zip holds the libraries directly. */
private const val MAX_DEPTH = 2
private const val MAX_ENTRY_BYTES = 64L * 1024 * 1024
private const val MAX_TOTAL_BYTES = 256L * 1024 * 1024

/** The decoder MX Player 1.93.4 loads: replace it and every audio format it knows plays. */
private const val DECODER_ENTRY = "libffmpeg.mx.so"

/** Present in every full custom codec build, absent from the stripped decoder MX ships. */
private val CODEC_MARKERS = listOf("ac3_eac3_probe", "dca_decoder", "truehd_decoder")

private val codecPathOption = filePathOption(
    key = "codecFilePath",
    default = null,
    title = "Codec file",
    description = "Optional. Leave empty and the codec is downloaded while patching from USBhost's MX_FFmpeg " +
        "release and checked against its SHA-256. Pick mx_aio.zip or a libffmpeg.mx.so only to patch offline or " +
        "to use a different pack.",
    required = false,
    allowedExtensions = listOf("zip", "so"),
)

/** Where the pack is looked for when no file was picked: the Download folder first, then shared storage. */
private val CODEC_FOLDERS = listOf(
    "/storage/emulated/0/Download",
    "/sdcard/Download",
    "/storage/emulated/0",
    "/sdcard",
)

/**
 * The public build of codec 1.87.0, USBhost/MX_FFmpeg release 1.90.1v2 (its libraries carry 1.87.0, the
 * interface MX Player Pro 1.93.4 asks for). One zip per architecture, so only what the APK needs is fetched.
 * Both the archive and the library inside are checked against the hashes the release publishes.
 */
private const val RELEASE_URL = "https://github.com/USBhost/MX_FFmpeg/releases/download/1.90.1v2/"

private class OfficialCodec(val archive: String, val archiveSha256: String, val librarySha256: String)

private val OFFICIAL = mapOf(
    "arm64-v8a" to OfficialCodec(
        "mx_neon64.zip",
        "9220d88bed4ae22c43b494da5cee9dd04cf69af0bf8e7a0d6e64dd7565df71d8",
        "c3228cc260158539ade4c66bc92a85dbe5389e8261b2cd9179ccbbd8b056d9cc",
    ),
    "armeabi-v7a" to OfficialCodec(
        "mx_neon.zip",
        "80cd0868502b6eb9fa8fdd2797b13e0f95a90a9e4c15f0693cdfc4c0d10dc8ab",
        "4c39ee8a6321c4df5efbca10d4a82bb4bd4b2337a33e900dd78bc6bb73c9c7d4",
    ),
    "x86_64" to OfficialCodec(
        "mx_x86_64.zip",
        "00bc3190c6b9aa8ebe63db618f07a066e6fe2ec92da34de97920f43f6dc4bd3",
        "d22858a0f53bb8f7b972a5a967f342d2a1686eae8b085e9b95830947f4d6865a",
    ),
    "x86" to OfficialCodec(
        "mx_x86.zip",
        "643544f61dd3f16240b14dd76587b0e1e12b4724b3ec0d2e8a3b71b0c15986f7",
        "d00aa0e4073d15e8988639f98360170d926fcaa0804d9923883f68b97ab2a5b8",
    ),
)

private val ALLOWED_HOSTS = setOf(
    "github.com",
    "objects.githubusercontent.com",
    "release-assets.githubusercontent.com",
    "github-releases.githubusercontent.com",
)
private const val MAX_DOWNLOAD_BYTES = 16 * 1024 * 1024

private fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it.toInt() and 0xff) }

/** One HTTP response: status, headers in lower case, body. */
private class Response(val code: Int, val headers: Map<String, String>, val body: ByteArray)

/**
 * One HTTPS GET over a socket opened to each address of the host in turn. GitHub's download host answers on
 * several addresses and a network can lose one of them; the platform client tries only the first, and a
 * single dead address would fail the patch.
 */
private fun get(uri: URI): Response {
    val host = uri.host
    val addresses = java.net.InetAddress.getAllByName(host).toList()
    var last: Exception? = null
    for (address in addresses) {
        try {
            val plain = java.net.Socket()
            plain.connect(java.net.InetSocketAddress(address, 443), 8_000)
            plain.soTimeout = 60_000
            val factory = javax.net.ssl.SSLSocketFactory.getDefault() as javax.net.ssl.SSLSocketFactory
            (factory.createSocket(plain, host, 443, true) as javax.net.ssl.SSLSocket).use { socket ->
                val parameters = socket.sslParameters
                parameters.endpointIdentificationAlgorithm = "HTTPS"
                socket.sslParameters = parameters
                socket.startHandshake()
                val path = (uri.rawPath ?: "/") + (uri.rawQuery?.let { "?$it" } ?: "")
                val request = "GET $path HTTP/1.1\r\nHost: $host\r\nUser-Agent: LokiPatches-MXCodec/1\r\n" +
                    "Accept-Encoding: identity\r\nConnection: close\r\n\r\n"
                socket.outputStream.write(request.toByteArray(Charsets.US_ASCII))
                socket.outputStream.flush()
                return readResponse(socket.inputStream)
            }
        } catch (error: Exception) {
            last = error
        }
    }
    throw last ?: java.io.IOException("$host has no address")
}

private fun readResponse(input: java.io.InputStream): Response {
    val raw = ByteArrayOutputStream()
    val buffer = ByteArray(32 * 1024)
    while (true) {
        val read = input.read(buffer)
        if (read < 0) break
        if (raw.size() + read > MAX_DOWNLOAD_BYTES + 64 * 1024) throw PatchException("The codec download is too large.")
        raw.write(buffer, 0, read)
    }
    val bytes = raw.toByteArray()
    var split = -1
    for (i in 0 until bytes.size - 3) {
        if (bytes[i] == '\r'.code.toByte() && bytes[i + 1] == '\n'.code.toByte() &&
            bytes[i + 2] == '\r'.code.toByte() && bytes[i + 3] == '\n'.code.toByte()
        ) { split = i; break }
    }
    if (split < 0) throw java.io.IOException("Incomplete HTTP response")
    val lines = String(bytes, 0, split, Charsets.ISO_8859_1).split("\r\n")
    val code = lines.first().split(' ').getOrNull(1)?.toIntOrNull() ?: throw java.io.IOException("Bad HTTP status")
    val headers = lines.drop(1).mapNotNull { line ->
        val colon = line.indexOf(':')
        if (colon <= 0) null else line.substring(0, colon).trim().lowercase() to line.substring(colon + 1).trim()
    }.toMap()
    var body = bytes.copyOfRange(split + 4, bytes.size)
    if (headers["transfer-encoding"]?.contains("chunked", ignoreCase = true) == true) body = unchunk(body)
    return Response(code, headers, body)
}

private fun unchunk(data: ByteArray): ByteArray {
    val out = ByteArrayOutputStream()
    var at = 0
    while (at < data.size) {
        var end = at
        while (end + 1 < data.size && !(data[end] == '\r'.code.toByte() && data[end + 1] == '\n'.code.toByte())) end++
        val size = String(data, at, end - at, Charsets.US_ASCII).substringBefore(';').trim().toInt(16)
        if (size == 0) break
        out.write(data, end + 2, size)
        at = end + 2 + size + 2
    }
    return out.toByteArray()
}

/** Fetches [name] from the pinned release, following GitHub's redirects to its own storage only. */
private fun download(name: String): ByteArray {
    var uri = URI(RELEASE_URL + name)
    repeat(6) {
        if (uri.scheme != "https" || uri.host?.lowercase() !in ALLOWED_HOSTS) {
            throw PatchException("The codec download was redirected to ${uri.host}, which is not GitHub.")
        }
        val response = get(uri)
        when (response.code) {
            301, 302, 303, 307, 308 -> {
                val location = response.headers["location"]
                    ?: throw PatchException("The codec download redirect has no target.")
                uri = uri.resolve(location)
            }
            200 -> return response.body
            else -> throw PatchException("The codec download failed (HTTP ${response.code}).")
        }
    }
    throw PatchException("The codec download redirected too many times.")
}

/** The official library for [abi], downloaded and checked twice: archive hash, then library hash. */
private fun downloadOfficial(abi: String): ByteArray {
    val official = OFFICIAL[abi] ?: throw PatchException("No public codec build exists for $abi.")
    val archive = try {
        download(official.archive)
    } catch (error: PatchException) {
        throw error
    } catch (error: Exception) {
        throw PatchException(
            "Could not download the codec (${error.javaClass.simpleName}). Check the internet connection, or " +
                "pick mx_aio.zip in the 'Codec file' option to patch offline.",
            error,
        )
    }
    if (archive.sha256() != official.archiveSha256) {
        throw PatchException("The downloaded ${official.archive} does not match the published SHA-256.")
    }
    val found = LinkedHashMap<String, ByteArray>()
    collectCodecs(official.archive, archive, 0, found, Budget())
    val library = found[abi] ?: throw PatchException("${official.archive} holds no $abi library.")
    if (library.sha256() != official.librarySha256) {
        throw PatchException("The $abi library in ${official.archive} does not match the published SHA-256.")
    }
    println("Loki Patches: downloaded ${official.archive}, SHA-256 verified")
    return library
}

/** The pack in the Download folder: mx_aio.zip by name, else the newest zip that looks like a codec pack. */
private fun findPackOnDevice(): File? {
    for (folder in CODEC_FOLDERS) {
        val files = File(folder).listFiles() ?: continue
        val named = files.filter { it.isFile && it.name.equals("mx_aio.zip", ignoreCase = true) }
        if (named.isNotEmpty()) return named.maxByOrNull { it.lastModified() }
        val likely = files.filter {
            it.isFile && it.name.endsWith(".zip", ignoreCase = true) &&
                listOf("mx_aio", "mx-aio", "codec", "ffmpeg").any { word -> it.name.contains(word, ignoreCase = true) }
        }
        if (likely.isNotEmpty()) return likely.maxByOrNull { it.lastModified() }
    }
    return null
}

private class Budget {
    var entries = 0
    var bytes = 0L
}

/** The codec libraries found in [bytes], keyed by the ABI the ELF header names. */
private fun collectCodecs(
    name: String,
    bytes: ByteArray,
    depth: Int,
    out: MutableMap<String, ByteArray>,
    budget: Budget,
) {
    if (bytes.isElf()) {
        val abi = bytes.codecAbi(name)
        val previous = out[abi]
        if (previous != null && !previous.contentEquals(bytes)) {
            throw PatchException("Two different $abi codecs were given, in '$name'.")
        }
        out[abi] = bytes
        return
    }
    if (depth > MAX_DEPTH || !bytes.isZip()) return
    ZipInputStream(ByteArrayInputStream(bytes)).use { zip ->
        while (true) {
            val entry = zip.nextEntry ?: break
            if (!entry.isDirectory) {
                if (++budget.entries > 256) throw PatchException("The codec pack holds too many entries.")
                val data = zip.readBounded(budget)
                if (data.isElf() || data.isZip()) collectCodecs(entry.name, data, depth + 1, out, budget)
            }
            zip.closeEntry()
        }
    }
}

private fun ZipInputStream.readBounded(budget: Budget): ByteArray {
    val out = ByteArrayOutputStream()
    val buffer = ByteArray(32 * 1024)
    while (true) {
        val read = read(buffer)
        if (read < 0) break
        if (read == 0) continue
        budget.bytes += read
        if (out.size() + read > MAX_ENTRY_BYTES || budget.bytes > MAX_TOTAL_BYTES) {
            throw PatchException("The codec pack unpacks to more than the safe limit.")
        }
        out.write(buffer, 0, read)
    }
    return out.toByteArray()
}

private fun ByteArray.isElf() = size > 4 && this[0] == 0x7F.toByte() && this[1] == 'E'.code.toByte() &&
    this[2] == 'L'.code.toByte() && this[3] == 'F'.code.toByte()

private fun ByteArray.isZip() = size > 4 && this[0] == 'P'.code.toByte() && this[1] == 'K'.code.toByte()

/** Reads the ELF header: which CPU it was built for, and whether it is a full codec build. */
private fun ByteArray.codecAbi(name: String): String {
    fun invalid(why: String): Nothing = throw PatchException("'$name' is not a usable MX codec: $why")
    if (size < 64 || this[5].toInt() != 1 || this[6].toInt() != 1) invalid("not a little-endian ELF file")
    val elf = ByteBuffer.wrap(this).order(ByteOrder.LITTLE_ENDIAN)
    val elfClass = this[4].toInt() and 0xff
    if (elfClass != 1 && elfClass != 2) invalid("unknown ELF class")
    if (elf.getShort(16).toInt() != 3) invalid("not a shared library")
    val abi = when (elf.getShort(18).toInt() and 0xffff) {
        183 -> "arm64-v8a"
        40 -> "armeabi-v7a"
        62 -> "x86_64"
        3 -> "x86"
        else -> invalid("built for an unknown CPU")
    }
    if (elfClass == 2 && abi != "arm64-v8a" && abi != "x86_64") invalid("ELF class does not match the CPU")
    if (elfClass == 1 && (abi == "arm64-v8a" || abi == "x86_64")) invalid("ELF class does not match the CPU")
    if (!contains(DECODER_ENTRY.toByteArray())) invalid("its name is not $DECODER_ENTRY")
    val missing = CODEC_MARKERS.filterNot { contains(it.toByteArray()) }
    if (missing.isNotEmpty()) {
        invalid("it is a stripped MX decoder without the audio codecs (missing ${missing.joinToString()})")
    }
    return abi
}

private fun ByteArray.contains(needle: ByteArray): Boolean {
    if (needle.isEmpty() || size < needle.size) return false
    val last = size - needle.size
    outer@ for (i in 0..last) {
        if (this[i] != needle[0]) continue
        for (j in 1 until needle.size) if (this[i + j] != needle[j]) continue@outer
        return true
    }
    return false
}

/**
 * Puts a full decoder in place of the stripped one MX Player ships, so AC3, E-AC3, DTS, DTS-HD, TrueHD
 * and MLP audio play. MX loads it as its own library: nothing to set up at runtime, nothing to keep on
 * the device afterwards.
 */
@Suppress("unused")
private val codecPatch = rawResourcePatch {
    execute {
        val path = codecPathOption.value?.trim()
        val file = if (!path.isNullOrEmpty()) File(path) else findPackOnDevice()
        val codecs = LinkedHashMap<String, ByteArray>()
        if (file != null) {
            if (!file.isFile || !file.canRead()) throw PatchException("The codec file cannot be read: ${file.path}")
            if (file.length() > 128L * 1024 * 1024) throw PatchException("The codec file is larger than 128 MB.")
            println("Loki Patches: using codec pack ${file.path}")
            collectCodecs(file.name, file.readBytes(), 0, codecs, Budget())
            if (codecs.isEmpty()) {
                throw PatchException("No libffmpeg.mx.so was found in '${file.name}'. Pick mx_aio.zip or the .so itself.")
            }
        }

        val entries = listApkEntries("lib/").toSet()
        val apkAbis = entries.mapNotNull { entry ->
            val parts = entry.split('/')
            if (parts.size == 3 && parts[0] == "lib" && parts[2].endsWith(".so")) parts[1] else null
        }.toSet()
        if (apkAbis.isEmpty()) throw PatchException("This APK has no native libraries to replace.")
        val missingOrders = apkAbis.filterNot { "lib/$it/$DECODER_ENTRY" in entries }
        if (missingOrders.isNotEmpty()) {
            throw PatchException("The app has no $DECODER_ENTRY for: ${missingOrders.sorted().joinToString()}")
        }

        // Whatever the picked or found pack does not cover is fetched from the pinned public release.
        for (abi in (apkAbis - codecs.keys).sorted()) {
            codecs[abi] = downloadOfficial(abi)
        }

        for (abi in apkAbis.sorted()) {
            val official = OFFICIAL[abi]?.librarySha256 == codecs.getValue(abi).sha256()
            println("Loki Patches: $abi codec is ${if (official) "the official 1.87.0 build" else "a custom build"}")
        }

        for (abi in apkAbis.sorted()) {
            val codec = codecs.getValue(abi)
            get("lib/$abi/$DECODER_ENTRY", copy = false).writeBytes(codec)
            println("Loki Patches: $DECODER_ENTRY $CODEC_VERSION for $abi, ${codec.size / 1024 / 1024} MB")
        }
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.codec") }
    }
}

@Suppress("unused")
val allCodecsPatch = bytecodePatch(
    name = "All codecs",
    description = "Replaces MX Player's stripped decoder with the custom codec $CODEC_VERSION, so AC3, E-AC3, DTS, " +
        "DTS-HD, TrueHD and MLP audio play. The codec is downloaded while patching from USBhost's public MX_FFmpeg " +
        "release and checked against its SHA-256, then written into the app: nothing to set up afterwards.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MXPLAYER_PRO)
    codecPathOption()
    dependsOn(codecPatch)
    dependsOn(integrityPatch)
    dependsOn(menuPatch)
    dependsOn(settingsRowPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Nothing to run in the app: MX loads the replacement as its own decoder.
    }
}
