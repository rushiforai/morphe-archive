package app.noam.patches.chesscom.stockfish

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import java.io.BufferedInputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.net.HttpURLConnection
import java.net.InetAddress
import java.net.InetSocketAddress
import java.net.Socket
import java.net.URI
import java.net.URL
import java.net.URLEncoder
import java.net.UnknownHostException
import java.security.DigestOutputStream
import java.security.MessageDigest
import java.util.logging.Logger
import java.util.zip.GZIPInputStream
import javax.net.ssl.SSLSocket
import javax.net.ssl.SSLSocketFactory

private const val ANALYSIS = "${Constants.EXTENSION_PACKAGE}/stockfish/Analysis;"
private const val BOARD_STATE = "Lcom/chess/chessboard/vm/movesinput/CBViewModelStateImpl;"
/** 4.10.23's board state: position in field a. */
private const val BOARD_STATE_41023 = "Lcom/chess/chessboard/vm/movesinput/y;"
private const val OLD_BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"

/**
 * One of Stockfish's own Android builds, downloaded while patching so the patches don't carry it.
 * Android extracts the lib/ folder of the app's own ABI and nothing else, so the engine goes into the
 * folder the APK already uses: adding the other one would change the app's ABI and hide its libraries.
 */
private class Build(
    /** The app's native library folder the engine goes into. */
    val abi: String,
    /** The engine as the log and the error messages name it. */
    val name: String,
    val url: String,
    /** The archive's size: a shorter file is a download that stopped, not a wrong one. */
    val archiveSize: Long,
    val archiveSha256: String,
    /** The engine's path inside the archive. */
    val member: String,
    val engineSha256: String,
) {
    /** The engine kept between patch runs; the name carries its hash, so a changed one is a new file. */
    val cachedFile: String get() = "morphe-stockfish-19-${engineSha256.take(16)}"
}

private const val STOCKFISH_RELEASE = "https://github.com/official-stockfish/Stockfish/releases/download/sf_19/"

/** 64-bit ARM, the engine of every phone whose Android is 64-bit. */
private val ARM64 = Build(
    abi = "arm64-v8a",
    name = "Stockfish 19 for 64-bit ARM",
    url = STOCKFISH_RELEASE + "stockfish-android-arm64-universal.tar.gz",
    archiveSize = 80_233_187L,
    archiveSha256 = "ebb24051aa4a222b4daaf049b882ecf1163d370c128fe02316602643f4d5e426",
    member = "stockfish/stockfish-android-arm64-universal",
    engineSha256 = "ffd8fc2004d3d19f9fdab95d84c92709aea92e8d3af405eda0b281b23cf1daf8",
)

/** 32-bit ARM with NEON, for the phones whose Android is 32-bit (the Galaxy A10, for one). */
private val ARM32 = Build(
    abi = "armeabi-v7a",
    name = "Stockfish 19 for 32-bit ARM",
    url = STOCKFISH_RELEASE + "stockfish-android-armv7-neon.tar.gz",
    archiveSize = 80_008_700L,
    archiveSha256 = "47c34963f1cdf4a6af34c1b5294f7a4e2679b3eb52698c324855af2c6486024b",
    member = "stockfish/stockfish-android-armv7-neon",
    engineSha256 = "993a3e8bce85a503abc900056019691057a83e13ae92c1a2cbb089b9680593f3",
)

private val BUILDS = listOf(ARM64, ARM32)

/**
 * GitHub mirrors that hand the same release file on, asked in turn when github.com or its download
 * server doesn't answer: a DNS filter, an ad blocker's DNS or a blocked Cloudflare hop often leaves
 * them reachable. The archive and the engine are checked against their SHA-256, so a mirror can't
 * change what ends up in the app.
 */
private val STOCKFISH_MIRRORS = listOf(
    "https://gh-proxy.com/",
    "https://gh-proxy.org/",
    "https://ghproxy.net/",
    "https://ghfast.top/",
)
private const val CACHE_FOLDER = ".morphe"
private const val STOCKFISH_FOLDER = "stockfish"

/**
 * The options the resource patch below reads, which the manager fills in before any patch starts, so
 * by the time the engine is copied their values are there.
 */
private var stockfishArchive: Option<String>? = null
private var stockfish32Bit: Option<Boolean>? = null

private val stockfishResourcePatch = patch(
    description = "Adds the official Stockfish 19 to the app's native libraries, downloaded (80 MB) from " +
        "Stockfish's GitHub while patching (mirrors, and DNS over HTTPS when the phone can't find github.com), " +
        "or taken from an archive picked in this patch's option. The engine goes into the ABI folder the app's own " +
        "libraries already use (64-bit ARM, or 32-bit ARM for a 32-bit APK), so adding it can't switch the " +
        "app to another ABI; the \"32-bit engine\" option covers an APK that carries no libraries of its " +
        "own. The download is kept between patch runs.",
) {
    execute {
        // A copy downloaded before is used again when it still checks out, so patching the same app
        // again does not download the 80 MB again.
        val directory = cacheDirectory()
        val build = targetBuild()
        val picked = pickedArchive(stockfishArchive?.value)
        val cached = cachedEngine(directory, build)
        val engine = when {
            picked != null -> fromPicked(picked, build, directory)
            cached != null -> {
                val kept = keep(cached, directory)
                logger.info("${build.name} is already downloaded at ${kept.path}; no download is needed")
                kept
            }
            else -> File(directory, build.cachedFile).also { download(it, build) }
        }
        // Android extracts native libraries into the one folder an app may run programs from, and only
        // the folder of the app's own ABI: the 64-bit engine in a 32-bit app is never extracted.
        val target = resourceFile("lib/${build.abi}/libstockfish.so", false)
        target.parentFile.mkdirs()
        engine.copyTo(target, overwrite = true)
        logger.info("${build.name} is in lib/${build.abi}")
    }
}

/**
 * The engine for the app, not just for the phone: Android picks the app's ABI from the lib/ folders
 * inside the APK and extracts only that one folder's libraries. A 64-bit engine in a 32-bit APK would
 * therefore switch the app to arm64 and leave its own libraries - chess.com's libcee_driver.so among
 * them - unused, which is how "cee-driver binary not found" happens. So the APK's own folders decide;
 * the phone and the option only matter when the APK has no lib/ of its own, as a base APK from a
 * split install has none. A patch run on the phone itself asks the platform which ABIs it has; on a
 * computer that is unknown, so the 64-bit engine is used unless the "32-bit engine" option says
 * otherwise.
 */
private fun targetBuild(): Build {
    val abis = apkAbis()
    val arm64 = ARM64.abi in abis
    val arm32 = ARM32.abi in abis
    val picked32 = stockfish32Bit?.value == true

    if (arm32 && !arm64 && phoneSupports32BitArm() == false) {
        throw PatchException(
            "This APK is 32-bit only (lib/armeabi-v7a and no arm64-v8a), and this phone runs 64-bit " +
                "apps only, so the patched app would not start. Get the 64-bit APK of chess.com (the one " +
                "with lib/arm64-v8a), or patch the app installed from the store. Adding the 64-bit engine " +
                "to this APK is not a fix: it would switch the app to arm64 and leave its own libraries " +
                "(libcee_driver.so and the rest) unused.",
        )
    }
    if (arm64 || arm32) {
        // Both folders work when the app has both; it picks one at install time, so follow the phone
        // when it is known, then the option.
        val build = when {
            arm64 && arm32 -> if (picked32 || phoneHas64BitArm() == false) ARM32 else ARM64
            arm64 -> ARM64
            else -> ARM32
        }
        when {
            build === ARM64 && picked32 ->
                logger.warning(
                    "The APK carries arm64-v8a libraries, so the 64-bit engine is used: this app would " +
                        "never load a 32-bit one. Switch \"32-bit engine\" off.",
                )
            build === ARM32 && arm64 ->
                logger.info("The APK carries both arm64-v8a and armeabi-v7a libraries; the 32-bit engine goes into ${ARM32.abi}")
            build === ARM32 ->
                logger.info(
                    "The APK carries only armeabi-v7a libraries, so the 32-bit engine is used: a 64-bit " +
                        "one would switch the app to arm64 and its own libraries would not be used",
                )
        }
        return build
    }

    logger.warning(
        "The APK has no lib/ folder. chess.com keeps its native libraries (libcee_driver.so and the " +
            "rest) in the ABI split, config.arm64_v8a.apk or config.armeabi_v7a.apk, so a base APK " +
            "alone has none of them: bots, Play Coach and the app's other native parts can crash with " +
            "\"cee-driver binary not found\". Patch the full app bundle, or the app installed from the " +
            "store, rather than a single base APK.",
    )
    if (picked32) {
        logger.info("The 32-bit engine is picked in the patch options")
        return ARM32
    }
    if (phoneHas64BitArm() == false) {
        logger.info("This phone's Android has no 64-bit ARM, so the 32-bit engine is used")
        return ARM32
    }
    return ARM64
}

/** The ABI folders the APK itself carries, e.g. arm64-v8a. Empty for a base APK with no lib/ at all. */
private fun apkAbis(): Set<String> = listApkEntries("lib/")
    .mapNotNull { entry -> entry.split('/').getOrNull(1)?.takeIf { it.isNotEmpty() } }
    .toSet()

/**
 * Whether the phone the patcher runs on supports 64-bit ARM, or null on a computer, where the
 * platform's class is not there. An empty platform list is a real answer: a 32-bit phone has no
 * 64-bit ABIs, which is how a phone is told apart from a computer.
 */
private fun phoneHas64BitArm(): Boolean? = phoneAbis("SUPPORTED_64_BIT_ABIS")?.any { it == "arm64-v8a" }

/** Whether the phone the patcher runs on can run 32-bit ARM, or null on a computer. */
private fun phoneSupports32BitArm(): Boolean? = phoneAbis("SUPPORTED_32_BIT_ABIS")?.any { it == "armeabi-v7a" }

/** One of the platform's ABI lists, or null where there is no Android platform (a computer). */
private fun phoneAbis(field: String): Array<*>? = try {
    Class.forName("android.os.Build").getField(field).get(null) as? Array<*>
} catch (e: Throwable) {
    null
}

/**
 * The folder the downloaded engine is kept in between patch runs. The system's temp folder is
 * cleared by cleaners and updates, so on a computer the cache lives in the user's home folder and
 * on a phone next to the patcher's own cache folder, in its app data.
 */
private fun cacheDirectory(): File {
    val temp = File(System.getProperty("java.io.tmpdir"))
    val candidates = ArrayList<File>()
    val home = System.getProperty("user.home")
    if (!home.isNullOrBlank() && home != "/") {
        candidates.add(File(File(home, CACHE_FOLDER), STOCKFISH_FOLDER))
    }
    // On Android the temp folder is the app's cache folder; its parent is the app's data folder,
    // which cleaners and updates leave alone.
    val data = temp.parentFile
    if (data != null && data.parentFile != null) {
        candidates.add(File(File(data, CACHE_FOLDER), STOCKFISH_FOLDER))
    }
    candidates.add(temp)
    return candidates.firstOrNull(::usable) ?: temp
}

private fun usable(directory: File): Boolean = try {
    (directory.isDirectory || directory.mkdirs()) && directory.canWrite()
} catch (e: SecurityException) {
    false
}

/** A cached engine that still matches its published SHA-256, in [directory] or the old temp folder. */
private fun cachedEngine(directory: File, build: Build): File? {
    val folders = listOf(directory, File(System.getProperty("java.io.tmpdir")))
    for (folder in folders.distinctBy { it.absolutePath }) {
        val file = File(folder, build.cachedFile)
        if (!file.isFile) continue
        if (sha256(file) == build.engineSha256) return file
        // A damaged copy would only be checked again next time.
        file.delete()
    }
    return null
}

/** Moves a copy found in the old temp folder into the cache folder, when it is a different one. */
private fun keep(cached: File, directory: File): File {
    if (cached.parentFile == directory) return cached
    val target = File(directory, cached.name)
    try {
        directory.mkdirs()
        if (cached.renameTo(target)) return target
        // Temp and home can be on different disks, where a rename is refused.
        cached.copyTo(target, overwrite = true)
        cached.delete()
        return target
    } catch (e: IOException) {
        logger.warning("Could not move the downloaded Stockfish 19 to ${target.path}: ${e.message}")
        return cached
    }
}

/** The file picked in the patch's archive option, when it is there and readable. */
private fun pickedArchive(value: String?): File? {
    if (value.isNullOrBlank()) return null
    val file = File(value)
    if (file.isFile && file.canRead()) return file
    logger.warning(
        "The file picked as the Stockfish 19 archive, \"$value\", can't be read; the engine is downloaded instead",
    )
    return null
}

/**
 * The engine out of the archive picked in the patch's option, or the engine itself when that is what
 * was picked. A copy stays in the cache, so a later patch run needs neither the file nor a download.
 */
private fun fromPicked(picked: File, build: Build, directory: File): File {
    val engine = File(directory, build.cachedFile)
    if (engine.isFile && sha256(engine) == build.engineSha256) {
        logger.info("${build.name} is already unpacked at ${engine.path}; the picked file is not needed")
        return engine
    }
    val digest = sha256(picked)
    directory.mkdirs()
    if (digest == build.engineSha256) {
        logger.info("Using the engine picked at ${picked.path}")
        picked.copyTo(engine, overwrite = true)
        return engine
    }
    if (picked.length() != build.archiveSize || digest != build.archiveSha256) {
        // The other ABI's archive is the likeliest mistake, and its message can say what to change.
        val other = BUILDS.firstOrNull { it !== build && picked.length() == it.archiveSize && digest == it.archiveSha256 }
        if (other != null) {
            val fix = if (build === ARM64) {
                "If the phone's Android is 32-bit, switch on \"32-bit engine\" in this patch's options and patch again."
            } else {
                "Switch \"32-bit engine\" off in this patch's options to use the 64-bit engine."
            }
            throw PatchException(
                "The file picked as the Stockfish 19 archive is ${other.name}, but this patch is adding " +
                    "${build.name}. $fix",
            )
        }
        throw PatchException(
            "The file picked as the Stockfish 19 archive is not the official one: it is ${picked.length()} " +
                "bytes and its SHA-256 is $digest, not ${build.archiveSha256}. Download " +
                "${build.url} again, or clear the \"Stockfish 19 archive\" option to let it download.",
        )
    }
    logger.info("Unpacking the Stockfish 19 archive picked at ${picked.path}")
    unpack(picked, engine, build)
    return engine
}

/** The pauses before the next round: a connection that fails often works the next time. */
private val RETRY_PAUSES_MS = longArrayOf(5_000)
private const val CONNECT_TIMEOUT_MS = 45_000
/**
 * A mirror that stalls is dropped sooner than a slow but working download would be: the archive keeps
 * what it has and the next source continues from there, so no progress is lost.
 */
private const val READ_TIMEOUT_MS = 30_000

private val logger = Logger.getLogger("Stockfish analysis")

/** github.com first, then the mirrors: same release file, each with the whole URL after the mirror. */
private fun downloadSources(build: Build): List<String> =
    listOf(build.url) + STOCKFISH_MIRRORS.map { it + build.url }

/**
 * Downloads Stockfish, asking github.com and then every mirror; a round that fails everywhere waits
 * and starts again. A retry continues the archive where it stopped. Each source's last error is kept
 * for the message the manager shows, so a name the phone's DNS blocks can be told from a proxy that
 * answered something else.
 */
private fun download(engine: File, build: Build) {
    val archive = File(engine.parentFile, engine.name + ".tar.gz.part")
    val sources = downloadSources(build)
    val failures = LinkedHashMap<String, IOException>()
    logger.info("Downloading ${build.name} (about 80 MB, once)")
    for (round in 0..RETRY_PAUSES_MS.size) {
        for (source in sources) {
            try {
                downloadOnce(archive, engine, source, build)
                return
            } catch (e: IOException) {
                failures[host(source)] = e
                logger.warning("${build.name} download from ${host(source)} failed (${describe(e)})")
            }
        }
        if (round < RETRY_PAUSES_MS.size) {
            val pause = RETRY_PAUSES_MS[round]
            logger.info("No source answered; trying ${build.name} again in ${pause / 1000} s")
            Thread.sleep(pause)
        }
    }
    throw PatchException(failure(failures, build), failures.values.lastOrNull())
}

private fun host(url: String) = try {
    URI.create(url).host ?: url
} catch (e: IllegalArgumentException) {
    url
}

/**
 * Downloads the archive to a file, unpacks Stockfish from it and checks the archive and the engine
 * against their published SHA-256. The file stays on disk for a later try: 80 MB on a phone's
 * connection often outlives one connection, and its next try takes only the rest.
 */
private fun downloadOnce(archive: File, engine: File, source: String, build: Build) {
    if (archive.length() > build.archiveSize) archive.delete()
    if (archive.length() != build.archiveSize) fetch(archive, source, build)
    val got = sha256(archive)
    if (got != build.archiveSha256) {
        // A short file is a download that stopped, and the next try continues it; a whole one is wrong.
        if (archive.length() != build.archiveSize) {
            throw IOException("The download stopped at ${archive.length()} of ${build.archiveSize} bytes")
        }
        archive.delete()
        throw PatchException(
            "The ${build.name} download does not match its published SHA-256 ($got instead of " +
                "${build.archiveSha256}). Patch again; if it keeps happening, something changed the download.",
        )
    }
    unpack(archive, engine, build)
    archive.delete()
}

/** Takes the archive's missing bytes, continuing the file it already has with a Range request. */
private fun fetch(archive: File, source: String, build: Build) {
    val from = archive.length().coerceIn(0L, build.archiveSize)
    val download = open(from, source)
    try {
        val offset = download.offset
        if (offset == 0L) {
            archive.delete()
        } else {
            logger.info("Continuing the ${build.name} download at ${percent(offset, build)}%")
        }
        var written = offset
        var next = percent(written, build) / 10 * 10 + 10
        FileOutputStream(archive, offset > 0L).use { out ->
            BufferedInputStream(download.body, BUFFER).use { input ->
                val buffer = ByteArray(BUFFER)
                while (true) {
                    val n = input.read(buffer)
                    if (n < 0) break
                    out.write(buffer, 0, n)
                    written += n
                    val done = percent(written, build)
                    while (done >= next && next <= 90) {
                        logger.info("Downloading ${build.name}: $next%")
                        next += 10
                    }
                }
            }
        }
        if (written < build.archiveSize) {
            throw IOException("The download stopped at $written of ${build.archiveSize} bytes")
        }
    } finally {
        download.close()
    }
}

private fun percent(bytes: Long, build: Build) = (bytes * 100 / build.archiveSize).toInt()

/** Unpacks Stockfish from the checked archive and checks it against its published SHA-256 too. */
private fun unpack(archive: File, engine: File, build: Build) {
    val partial = File(engine.path + ".part")
    try {
        val engineDigest = MessageDigest.getInstance("SHA-256")
        val found = BufferedInputStream(archive.inputStream(), BUFFER).use { raw ->
            val gzip = GZIPInputStream(raw, BUFFER)
            Tar(gzip).copy(build.member) { member ->
                DigestOutputStream(partial.outputStream().buffered(BUFFER), engineDigest).use { member.copyTo(it, BUFFER) }
            }
        }
        if (!found) throw PatchException("The official ${build.name} archive has no ${build.member}.")
        val unpacked = hex(engineDigest.digest())
        if (unpacked != build.engineSha256) {
            throw PatchException("${build.name} from the archive does not match its SHA-256 ($unpacked instead of ${build.engineSha256}).")
        }
        if (!partial.renameTo(engine)) partial.copyTo(engine, overwrite = true)
    } finally {
        partial.delete()
    }
}

/**
 * The archive's connection, starting at [from] bytes. A mirror or GitHub may answer with a redirect
 * to its download server; it is followed here rather than by the connection, so the Range request is
 * sent to the download server it leads to and a redirect to plain http is refused. A failure keeps
 * the source's own name in the caller's list, so the message says which source failed, not the
 * server it was redirected to.
 */
private fun open(from: Long, source: String): Download {
    var url = URL(source)
    repeat(5) {
        val answer = fetch(url, from)
        if (answer.code == HttpURLConnection.HTTP_OK || answer.code == HttpURLConnection.HTTP_PARTIAL) {
            val body = answer.body ?: throw IOException("${url.host} answered ${answer.code} without a body")
            // The server took the Range request: it is sending the rest of the archive.
            return Download(body, if (answer.code == HttpURLConnection.HTTP_PARTIAL) from else 0L, answer::close)
        }
        val location = answer.location
        answer.close()
        if (answer.code !in 300..399 || location == null) throw IOException("${url.host} answered ${answer.code}")
        url = URL(url, location)
        if (url.protocol != "https") throw IOException("${url.host} sent the download to ${url.protocol}")
    }
    throw IOException("Too many redirects from $source")
}

/**
 * Asks [url]'s server. When the device can't look the server up (Morphe Manager patches with a
 * Java runtime whose DNS doesn't work on Android), it is looked up over DNS over HTTPS instead.
 */
private fun fetch(url: URL, from: Long): Answer {
    val connection = url.openConnection() as HttpURLConnection
    connection.instanceFollowRedirects = false
    connection.connectTimeout = CONNECT_TIMEOUT_MS
    connection.readTimeout = READ_TIMEOUT_MS
    if (from > 0L) connection.setRequestProperty("Range", "bytes=$from-")
    val code = try {
        connection.responseCode
    } catch (e: UnknownHostException) {
        connection.disconnect()
        return try {
            fetchOverResolvedAddress(url, from).also {
                logger.info("${url.host} couldn't be looked up on this device, so it was looked up over DNS over HTTPS")
            }
        } catch (fallback: IOException) {
            throw Unanswered(url.host, IOException("${describe(e)}, and DNS over HTTPS failed too (${describe(fallback)})", e))
        }
    } catch (e: IOException) {
        connection.disconnect()
        throw Unanswered(url.host, e)
    }
    val body = if (code == HttpURLConnection.HTTP_OK || code == HttpURLConnection.HTTP_PARTIAL) connection.inputStream else null
    return Answer(code, connection.getHeaderField("Location"), body) { connection.disconnect() }
}

/** One answer from a server: its status, where a redirect points, and the body of a 200 or 206. */
private class Answer(val code: Int, val location: String?, val body: InputStream?, private val closeConnection: () -> Unit) {
    fun close() = closeConnection()
}

/** A connection and where in the archive it starts: 0 when the server ignored the Range request. */
private class Download(val body: InputStream, val offset: Long, private val closeConnection: () -> Unit) {
    fun close() = closeConnection()
}

/** Cloudflare's and Google's DNS over HTTPS, reached by IP address, so using them needs no lookup. */
private val DNS_OVER_HTTPS = listOf(
    "https://1.1.1.1/dns-query?type=A&name=",
    "https://1.0.0.1/dns-query?type=A&name=",
    "https://8.8.8.8/resolve?type=A&name=",
    "https://8.8.4.4/resolve?type=A&name=",
)

/** The IPv4 addresses of [host], from DNS over HTTPS. */
private fun lookUpOverHttps(host: String): List<InetAddress> {
    var failure: IOException = UnknownHostException(host)
    for (server in DNS_OVER_HTTPS) {
        try {
            val connection = URL(server + URLEncoder.encode(host, "UTF-8")).openConnection() as HttpURLConnection
            connection.connectTimeout = CONNECT_TIMEOUT_MS
            connection.readTimeout = READ_TIMEOUT_MS
            connection.setRequestProperty("Accept", "application/dns-json")
            val answer = try {
                connection.inputStream.use { it.readBytes().toString(Charsets.UTF_8) }
            } finally {
                connection.disconnect()
            }
            val addresses = ipv4Data(answer).map { InetAddress.getByAddress(host, it) }
            if (addresses.isNotEmpty()) return addresses
            failure = UnknownHostException("$host has no address at $server")
        } catch (e: IOException) {
            failure = e
        }
    }
    throw failure
}

/** The IPv4 addresses among a DNS JSON answer's "data" values (the others name aliases). */
private fun ipv4Data(answer: String): List<ByteArray> {
    val key = "\"data\":\""
    val found = mutableListOf<ByteArray>()
    var at = answer.indexOf(key)
    while (at >= 0) {
        val start = at + key.length
        val end = answer.indexOf('"', start)
        if (end < 0) break
        val parts = answer.substring(start, end).split('.')
        val bytes = parts.mapNotNull { part -> part.toIntOrNull()?.takeIf { it in 0..255 && part.isNotEmpty() } }
        if (parts.size == 4 && bytes.size == 4) found += ByteArray(4) { bytes[it].toByte() }
        at = answer.indexOf(key, end)
    }
    return found
}

/**
 * Plain HTTP/1.1 over TLS to an address found over DNS over HTTPS. The TLS session still names and
 * checks the real server, and the archive's SHA-256 is checked as always.
 */
private fun fetchOverResolvedAddress(url: URL, from: Long): Answer {
    val port = if (url.port == -1) 443 else url.port
    var failure: IOException = UnknownHostException(url.host)
    for (address in lookUpOverHttps(url.host)) {
        val raw = Socket()
        try {
            raw.connect(InetSocketAddress(address, port), CONNECT_TIMEOUT_MS)
            raw.soTimeout = READ_TIMEOUT_MS
            val socket = (SSLSocketFactory.getDefault() as SSLSocketFactory).createSocket(raw, url.host, port, true) as SSLSocket
            socket.sslParameters = socket.sslParameters.apply { endpointIdentificationAlgorithm = "HTTPS" }
            socket.startHandshake()
            val path = (url.path.ifEmpty { "/" }) + (url.query?.let { "?$it" } ?: "")
            val range = if (from > 0L) "Range: bytes=$from-\r\n" else ""
            socket.outputStream.write(
                ("GET $path HTTP/1.1\r\nHost: ${url.host}\r\nUser-Agent: Quwi's Chess Patches\r\n" +
                    "Accept: */*\r\n$range" + "Connection: close\r\n\r\n").toByteArray(Charsets.US_ASCII),
            )
            socket.outputStream.flush()
            return readAnswer(socket)
        } catch (e: IOException) {
            raw.close()
            failure = e
        }
    }
    throw failure
}

/** Reads the status and headers, and hands over the body of a 200 or 206 as it arrives. */
private fun readAnswer(socket: SSLSocket): Answer {
    val input = BufferedInputStream(socket.inputStream, BUFFER)
    val status = readLine(input) ?: throw IOException("${socket.inetAddress.hostAddress} closed the connection")
    val code = status.split(' ').getOrNull(1)?.toIntOrNull() ?: throw IOException("Unexpected answer: $status")
    val headers = mutableMapOf<String, String>()
    while (true) {
        val line = readLine(input) ?: break
        if (line.isEmpty()) break
        val colon = line.indexOf(':')
        if (colon > 0) headers[line.substring(0, colon).trim().lowercase()] = line.substring(colon + 1).trim()
    }
    val body = when {
        code != HttpURLConnection.HTTP_OK && code != HttpURLConnection.HTTP_PARTIAL -> null
        headers["transfer-encoding"]?.lowercase()?.contains("chunked") == true -> Chunked(input)
        else -> headers["content-length"]?.toLongOrNull()?.let { LengthLimited(input, it) } ?: input
    }
    return Answer(code, headers["location"], body) { socket.close() }
}

/** One CRLF-ended header line, or null at the end of the stream. */
private fun readLine(input: InputStream): String? {
    val line = StringBuilder()
    while (true) {
        val b = input.read()
        if (b < 0) return if (line.isEmpty()) null else line.toString()
        if (b == '\n'.code) return line.toString().trimEnd('\r')
        line.append(b.toChar())
    }
}

/** A body sent in chunks, read as one stream. */
private class Chunked(private val input: InputStream) : InputStream() {
    private var left = 0L
    private var ended = false

    private fun nextChunk(): Boolean {
        if (ended) return false
        if (left == 0L) {
            val size = readLine(input)?.substringBefore(';')?.trim()?.toLongOrNull(16) ?: throw IOException("Bad chunk")
            if (size == 0L) {
                ended = true
                return false
            }
            left = size
        }
        return true
    }

    private fun chunkDone() {
        if (left == 0L) readLine(input)
    }

    override fun read(): Int {
        if (!nextChunk()) return -1
        val b = input.read()
        if (b < 0) throw IOException("The download ended early")
        left--
        chunkDone()
        return b
    }

    override fun read(buffer: ByteArray, offset: Int, length: Int): Int {
        if (length == 0) return 0
        if (!nextChunk()) return -1
        val n = input.read(buffer, offset, minOf(length.toLong(), left).toInt())
        if (n < 0) throw IOException("The download ended early")
        left -= n
        chunkDone()
        return n
    }
}

/** A body of a known length. */
private class LengthLimited(private val input: InputStream, private var left: Long) : InputStream() {
    override fun read(): Int {
        if (left <= 0) return -1
        val b = input.read()
        if (b >= 0) left--
        return b
    }

    override fun read(buffer: ByteArray, offset: Int, length: Int): Int {
        if (left <= 0) return -1
        val n = input.read(buffer, offset, minOf(length.toLong(), left).toInt())
        if (n > 0) left -= n
        return n
    }
}

/** A server that couldn't be reached. */
private class Unanswered(val host: String, cause: IOException) : IOException(cause.message, cause)

/** "SocketTimeoutException: Connect timed out": an exception's message alone can be just a host. */
private fun describe(e: IOException): String {
    val cause = if (e is Unanswered) e.cause ?: e else e
    return "${cause.javaClass.simpleName}: ${cause.message}"
}

/** Whether [e] is a name that couldn't be looked up, possibly behind an [Unanswered]. */
private fun isDnsFailure(e: IOException): Boolean {
    var cause: Throwable? = e
    while (cause != null) {
        if (cause is UnknownHostException) return true
        cause = cause.cause
    }
    return false
}

/**
 * What the log and the manager show when no source answered: every source with the error it gave, so
 * a name the phone's DNS doesn't find can be told from a proxy that answered with an error. A phone
 * whose DNS blocks github.com still has a browser that can reach it, so the message points at the
 * archive option before it gives up.
 */
private fun failure(failures: Map<String, IOException>, build: Build): String {
    val start = "Couldn't download ${build.name} (github.com and ${STOCKFISH_MIRRORS.size} mirrors, " +
        "${RETRY_PAUSES_MS.size + 1} rounds)"
    val each = failures.entries.joinToString("; ") { "${it.key}: ${describe(it.value)}" }
    val unknown = failures.values.filter(::isDnsFailure)
    val why = when {
        failures.isNotEmpty() && unknown.size == failures.size ->
            "None of those names could be found in DNS, so something on this phone or network is " +
                "filtering DNS: Private DNS, an ad blocker's DNS or a VPN."
        unknown.isNotEmpty() ->
            "Some of those names could not be found in DNS and the rest did not answer; something on " +
                "this device or network is likely blocking them, such as a VPN, a DNS or ad blocker or a firewall."
        else ->
            "Something on this device or network is likely blocking those servers, such as a VPN, " +
                "a DNS or ad blocker or a firewall."
    }
    val details = if (each.isEmpty()) "" else " Each source said: $each."
    val picked = "A browser often downloads the file even when the patcher can't: open ${build.url} " +
        "there, save the .tar.gz, and pick it in \"Stockfish 19 archive\" (Simple mode: Settings > Patch " +
        "options; Expert mode: the patch's own options when choosing patches)."
    val end = "Then patch again, or leave out Stockfish analysis."
    return "$start.$details $why $picked $end"
}

private const val BUFFER = 64 * 1024

private fun sha256(file: File): String {
    val digest = MessageDigest.getInstance("SHA-256")
    file.inputStream().use { input ->
        val buffer = ByteArray(BUFFER)
        while (true) {
            val n = input.read(buffer)
            if (n < 0) break
            digest.update(buffer, 0, n)
        }
    }
    return hex(digest.digest())
}

private fun hex(bytes: ByteArray): String {
    val digits = "0123456789abcdef"
    val out = StringBuilder(bytes.size * 2)
    for (byte in bytes) {
        val value = byte.toInt() and 0xFF
        out.append(digits[value shr 4]).append(digits[value and 0xF])
    }
    return out.toString()
}

/** Just enough of the tar format (ustar headers, GNU long names) to stream one file out of an archive. */
private class Tar(private val input: InputStream) {
    private val header = ByteArray(BLOCK)

    /** Hands [name]'s contents to [write]; false when the archive ends without it. */
    fun copy(name: String, write: (InputStream) -> Unit): Boolean {
        var longName: String? = null
        while (readFully(header)) {
            if (header.all { it == 0.toByte() }) return false
            val size = size()
            val type = header[156].toInt().toChar()
            val entry = longName ?: name()
            longName = null
            when {
                type == 'L' -> {
                    val bytes = ByteArray(size.toInt())
                    if (!readFully(bytes)) return false
                    longName = String(bytes, Charsets.UTF_8).trimEnd('\u0000')
                    skip(padding(size))
                }
                (type == '0' || type == '\u0000') && entry == name -> {
                    val member = Bounded(input, size)
                    write(member)
                    skip(member.left + padding(size))
                    return true
                }
                else -> skip(size + padding(size))
            }
        }
        return false
    }

    private fun name(): String {
        val name = text(0, 100)
        val prefix = if (String(header, 257, 5, Charsets.US_ASCII) == "ustar") text(345, 155) else ""
        return if (prefix.isEmpty()) name else "$prefix/$name"
    }

    private fun text(offset: Int, length: Int): String {
        var end = offset
        while (end < offset + length && header[end] != 0.toByte()) end++
        return String(header, offset, end - offset, Charsets.UTF_8)
    }

    /** The size field: octal digits, or big-endian binary when its top bit is set. */
    private fun size(): Long {
        if (header[124].toInt() and 0x80 != 0) {
            var value = 0L
            for (i in 125 until 136) value = (value shl 8) or (header[i].toLong() and 0xFF)
            return value
        }
        return text(124, 12).trim().ifEmpty { "0" }.toLong(8)
    }

    private fun padding(size: Long) = (BLOCK - size % BLOCK) % BLOCK

    private fun readFully(buffer: ByteArray): Boolean {
        var read = 0
        while (read < buffer.size) {
            val n = input.read(buffer, read, buffer.size - read)
            if (n < 0) return false
            read += n
        }
        return true
    }

    private fun skip(count: Long) {
        var left = count
        val buffer = ByteArray(BLOCK)
        while (left > 0) {
            val n = input.read(buffer, 0, minOf(left, BLOCK.toLong()).toInt())
            if (n < 0) throw IOException("The Stockfish archive ends early")
            left -= n
        }
    }

    /** [size] bytes of the archive, then the end. */
    private class Bounded(private val input: InputStream, size: Long) : InputStream() {
        var left = size
            private set

        override fun read(): Int {
            if (left <= 0) return -1
            val b = input.read()
            if (b >= 0) left--
            return b
        }

        override fun read(buffer: ByteArray, offset: Int, length: Int): Int {
            if (left <= 0) return -1
            val n = input.read(buffer, offset, minOf(length.toLong(), left).toInt())
            if (n > 0) left -= n
            return n
        }
    }

    private companion object {
        const val BLOCK = 512
    }
}

@Suppress("unused")
val stockfishPatch = bytecodePatch(
    name = "Stockfish analysis",
    description = "Stockfish 19 on your phone, offline (64-bit and 32-bit ARM): best-move arrows on finished games, the " +
        "analysis boards, the game explorer and Game Review (in a Lichess review, on the moves Lichess " +
        "didn't mark), and an eval bar where chess.com has none of its own. It never shows while a game " +
        "is being played or in puzzles. Patching downloads the official Stockfish 19 (80 MB) from " +
        "Stockfish's GitHub or a mirror (DNS over HTTPS when the phone can't find github.com), or uses " +
        "the archive picked in this patch's option, so it needs internet or that file.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    // For a network that can't reach github.com at all: the archive downloaded in a browser is used
    // instead of the download. Its SHA-256 is checked, so it is the same engine.
    stockfishArchive = filePathOption(
        key = "stockfishArchive",
        default = "",
        title = "Stockfish 19 archive",
        description = "Optional: a stockfish-android-arm64-universal.tar.gz or " +
            "stockfish-android-armv7-neon.tar.gz downloaded earlier, used instead of the download. The " +
            "file is checked against Stockfish's published SHA-256.",
        required = false,
        allowedExtensions = listOf("tar.gz", "gz", "tgz"),
    )

    // The APK's own lib/ folders decide the engine; this option covers an APK that carries none of
    // its own, or both, and an APK with both on a phone that is 32-bit.
    stockfish32Bit = booleanOption(
        key = "stockfish32Bit",
        default = false,
        title = "32-bit engine",
        description = "Use Stockfish's 32-bit ARM build (armeabi-v7a) instead of the 64-bit one. Needed " +
            "only for an APK that carries no native libraries of its own, or both: otherwise the ABI " +
            "folders in the APK decide, so that adding the engine can't switch the app to another ABI.",
    )

    dependsOn(settingsPatch, stockfishResourcePatch)

    execute {
        markFeaturePatched("stockfishPatched")

        val state = mutableClassDefByOrNull(BOARD_STATE)
        val positionType = (state
            ?: mutableClassDefBy(V2_BOARD)).methods.single {
            it.name == "getPosition" && it.parameterTypes.isEmpty()
        }.returnType

        // The position's FEN: the one no-argument String method of its (obfuscated) interface.
        val position = classDefByOrNull { it.type == positionType }
            ?: throw PatchException("The position type $positionType was not found")
        val fen = position.methods.filter {
            it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" && it.name != "toString"
        }.singleOrNull() ?: throw PatchException("The position's FEN getter was not found")
        mutableClassDefBy(ANALYSIS).methods.first { it.name == "fenMethod" }.returnString(fen.name)

        // Every new position reaches the analysis: through the older board's view state, and the
        // newer v2 board's own setter (archived games).
        if (state != null) {
            state.methods.single {
                it.name != "<init>" && it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf(positionType)
            }.addInstructions(0, "invoke-static/range { p1 .. p1 }, $ANALYSIS->onPosition(Ljava/lang/Object;)V")
        } else {
            // 4.10.23: the board's state is a plain data class, so hook the board that shows it.
            mutableClassDefBy(OLD_BOARD).methods.single {
                it.name == "setPosition" && it.returnType == "V" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf(BOARD_STATE_41023)
            }.addInstructions(0, "invoke-static/range { p1 .. p1 }, $ANALYSIS->onBoardState(Ljava/lang/Object;)V")
        }
        mutableClassDefBy(V2_BOARD).methods.single {
            it.name == "setPosition" && it.parameterTypes.map { type -> type.toString() } == listOf(positionType)
        }.addInstructions(0, "invoke-static/range { p1 .. p1 }, $ANALYSIS->onPosition(Ljava/lang/Object;)V")
    }
}
