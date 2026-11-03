package app.noam.patches.chesscom.stockfish

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
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
import java.net.URL
import java.security.DigestOutputStream
import java.security.MessageDigest
import java.util.logging.Logger
import java.util.zip.GZIPInputStream

private const val ANALYSIS = "${Constants.EXTENSION_PACKAGE}/stockfish/Analysis;"
private const val BOARD_STATE = "Lcom/chess/chessboard/vm/movesinput/CBViewModelStateImpl;"
/** 4.10.23's board state: position in field a. */
private const val BOARD_STATE_41023 = "Lcom/chess/chessboard/vm/movesinput/y;"
private const val OLD_BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"

/** Stockfish's own Android build, downloaded while patching so the patches don't carry it. */
private const val STOCKFISH_URL =
    "https://github.com/official-stockfish/Stockfish/releases/download/sf_19/stockfish-android-arm64-universal.tar.gz"
private const val STOCKFISH_ARCHIVE_SHA256 = "ebb24051aa4a222b4daaf049b882ecf1163d370c128fe02316602643f4d5e426"
private const val STOCKFISH_MEMBER = "stockfish/stockfish-android-arm64-universal"
private const val STOCKFISH_SHA256 = "ffd8fc2004d3d19f9fdab95d84c92709aea92e8d3af405eda0b281b23cf1daf8"
/** The archive's size: a shorter file is a download that stopped, not a wrong one. */
private const val STOCKFISH_ARCHIVE_SIZE = 80_233_187L

private val stockfishResourcePatch = resourcePatch(
    description = "Adds the official Stockfish 19 to the app's native libraries, downloaded (80 MB) from " +
        "Stockfish's GitHub while patching.",
) {
    execute {
        // A copy downloaded before is used again when it still checks out. The patcher's log then
        // has no progress lines, so say that the download is not happening at all.
        val engine = File(System.getProperty("java.io.tmpdir"), "morphe-stockfish-19-${STOCKFISH_SHA256.take(16)}")
        if (engine.isFile && sha256(engine) == STOCKFISH_SHA256) {
            logger.info("Stockfish 19 is already downloaded; no download is needed")
        } else {
            download(engine)
        }
        // Android extracts native libraries into the one folder an app may run programs from.
        val target = get("lib/arm64-v8a/libstockfish.so")
        target.parentFile.mkdirs()
        engine.copyTo(target, overwrite = true)
    }
}

/** The pauses before the second and third tries: a connection that fails often works the next time. */
private val RETRY_PAUSES_MS = longArrayOf(5_000, 15_000)
private const val CONNECT_TIMEOUT_MS = 45_000
private const val READ_TIMEOUT_MS = 60_000
private const val GITHUB = "github.com"

private val logger = Logger.getLogger("Stockfish analysis")

/** Downloads Stockfish, trying again after a failure; a retry continues the archive where it stopped. */
private fun download(engine: File) {
    val archive = File(engine.parentFile, engine.name + ".tar.gz.part")
    logger.info("Downloading Stockfish 19 (about 80 MB, once)")
    for (attempt in 0..RETRY_PAUSES_MS.size) {
        try {
            downloadOnce(archive, engine)
            return
        } catch (e: IOException) {
            if (attempt == RETRY_PAUSES_MS.size) throw PatchException(failure(e), e)
            val pause = RETRY_PAUSES_MS[attempt]
            logger.warning("Stockfish 19 download failed (${describe(e)}), trying again in ${pause / 1000} s")
            Thread.sleep(pause)
        }
    }
}

/**
 * Downloads the archive to a file, unpacks Stockfish from it and checks the archive and the engine
 * against their published SHA-256. The file stays on disk for a later try: 80 MB on a phone's
 * connection often outlives one connection, and its next try takes only the rest.
 */
private fun downloadOnce(archive: File, engine: File) {
    if (archive.length() > STOCKFISH_ARCHIVE_SIZE) archive.delete()
    if (archive.length() != STOCKFISH_ARCHIVE_SIZE) fetch(archive)
    val got = sha256(archive)
    if (got != STOCKFISH_ARCHIVE_SHA256) {
        // A short file is a download that stopped, and the next try continues it; a whole one is wrong.
        if (archive.length() != STOCKFISH_ARCHIVE_SIZE) {
            throw IOException("The download stopped at ${archive.length()} of $STOCKFISH_ARCHIVE_SIZE bytes")
        }
        archive.delete()
        throw PatchException(
            "The Stockfish 19 download does not match its published SHA-256 ($got instead of " +
                "$STOCKFISH_ARCHIVE_SHA256). Patch again; if it keeps happening, something changed the download.",
        )
    }
    unpack(archive, engine)
    archive.delete()
}

/** Takes the archive's missing bytes, continuing the file it already has with a Range request. */
private fun fetch(archive: File) {
    val from = archive.length().coerceIn(0L, STOCKFISH_ARCHIVE_SIZE)
    val download = open(from)
    try {
        val offset = download.offset
        if (offset == 0L) {
            archive.delete()
        } else {
            logger.info("Continuing the Stockfish 19 download at ${percent(offset)}%")
        }
        var written = offset
        var next = percent(written) / 10 * 10 + 10
        FileOutputStream(archive, offset > 0L).use { out ->
            BufferedInputStream(download.connection.inputStream, BUFFER).use { input ->
                val buffer = ByteArray(BUFFER)
                while (true) {
                    val n = input.read(buffer)
                    if (n < 0) break
                    out.write(buffer, 0, n)
                    written += n
                    val done = percent(written)
                    while (done >= next && next <= 90) {
                        logger.info("Downloading Stockfish 19: $next%")
                        next += 10
                    }
                }
            }
        }
        if (written < STOCKFISH_ARCHIVE_SIZE) {
            throw IOException("The download stopped at $written of $STOCKFISH_ARCHIVE_SIZE bytes")
        }
    } finally {
        download.connection.disconnect()
    }
}

private fun percent(bytes: Long) = (bytes * 100 / STOCKFISH_ARCHIVE_SIZE).toInt()

/** Unpacks Stockfish from the checked archive and checks it against its published SHA-256 too. */
private fun unpack(archive: File, engine: File) {
    val partial = File(engine.path + ".part")
    try {
        val engineDigest = MessageDigest.getInstance("SHA-256")
        val found = BufferedInputStream(archive.inputStream(), BUFFER).use { raw ->
            val gzip = GZIPInputStream(raw, BUFFER)
            Tar(gzip).copy(STOCKFISH_MEMBER) { member ->
                DigestOutputStream(partial.outputStream().buffered(BUFFER), engineDigest).use { member.copyTo(it, BUFFER) }
            }
        }
        if (!found) throw PatchException("The official Stockfish 19 archive has no $STOCKFISH_MEMBER.")
        val unpacked = hex(engineDigest.digest())
        if (unpacked != STOCKFISH_SHA256) {
            throw PatchException("Stockfish 19 from the archive does not match its SHA-256 ($unpacked instead of $STOCKFISH_SHA256).")
        }
        if (!partial.renameTo(engine)) partial.copyTo(engine, overwrite = true)
    } finally {
        partial.delete()
    }
}

/**
 * The archive's connection, starting at [from] bytes. GitHub answers with a redirect to its
 * download server; it is followed here rather than by the connection, so a failure can say which
 * of the two didn't answer, and the Range request is sent to the download server it leads to.
 */
private fun open(from: Long): Download {
    var url = URL(STOCKFISH_URL)
    repeat(5) {
        val connection = url.openConnection() as HttpURLConnection
        connection.instanceFollowRedirects = false
        connection.connectTimeout = CONNECT_TIMEOUT_MS
        connection.readTimeout = READ_TIMEOUT_MS
        if (from > 0L) connection.setRequestProperty("Range", "bytes=$from-")
        val code = try {
            connection.responseCode
        } catch (e: IOException) {
            connection.disconnect()
            throw Unanswered(url.host, e)
        }
        if (code == HttpURLConnection.HTTP_OK) return Download(connection, 0L)
        // The server took the Range request: it is sending the rest of the archive.
        if (code == HttpURLConnection.HTTP_PARTIAL) return Download(connection, from)
        val location = connection.getHeaderField("Location")
        connection.disconnect()
        if (code !in 300..399 || location == null) throw IOException("${url.host} answered $code")
        url = URL(url, location)
        if (url.protocol != "https") throw IOException("${url.host} sent the download to ${url.protocol}")
    }
    throw IOException("Too many redirects from $STOCKFISH_URL")
}

/** A connection and where in the archive it starts: 0 when the server ignored the Range request. */
private class Download(val connection: HttpURLConnection, val offset: Long)

/** A server that couldn't be reached. */
private class Unanswered(val host: String, cause: IOException) : IOException(cause.message, cause)

/** "SocketTimeoutException: Connect timed out": an exception's message alone can be just a host. */
private fun describe(e: IOException): String {
    val cause = if (e is Unanswered) e.cause ?: e else e
    return "${cause.javaClass.simpleName}: ${cause.message}"
}

private fun failure(e: IOException): String {
    val start = "Couldn't download Stockfish 19 (${RETRY_PAUSES_MS.size + 1} tries)"
    val end = "then patch again, or leave out Stockfish analysis."
    return when (val host = (e as? Unanswered)?.host) {
        null -> "$start: ${describe(e)}. Check the internet connection, $end"
        GITHUB -> "$start: $GITHUB didn't answer (${describe(e)}). Check the internet connection and that no " +
            "VPN, DNS or ad blocker or firewall blocks $GITHUB, $end"
        else -> "$start: $GITHUB answered, but its download server $host didn't (${describe(e)}). Something on " +
            "this device or network is likely blocking that server, such as a VPN, a DNS or ad blocker or a " +
            "firewall. Check that $STOCKFISH_URL downloads in the browser, $end"
    }
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
    description = "Stockfish 19 on your phone, offline (arm64): best-move arrows on finished games, the " +
        "analysis boards, the game explorer and Game Review (in a Lichess review, on the moves Lichess " +
        "didn't mark), and an eval bar where chess.com has none of its own. It never shows while a game " +
        "is being played or in puzzles. Patching downloads the official Stockfish 19 (80 MB) from " +
        "Stockfish's GitHub, so it needs internet.",
) {
    compatibleWith(Constants.COMPATIBILITY)

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
