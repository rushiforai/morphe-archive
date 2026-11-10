package app.modprod.patches.app

import java.io.ByteArrayOutputStream
import java.net.HttpURLConnection
import java.net.URI
import java.util.logging.Logger

private val logger = Logger.getLogger("WebIcon")

private const val MAX_PAGE = 2 * 1024 * 1024
private const val MAX_ICON = 5 * 1024 * 1024
private const val MIN_SIZE = 48

/** Une icône candidate : adresse, taille déclarée (0 = inconnue), priorité de la source. */
private data class Candidate(val url: String, val size: Int, val rank: Int)

/**
 * Récupère l'icône PNG d'un site : manifest web (icône « any » la plus grande), puis
 * apple-touch-icon, puis <link rel="icon">, puis /apple-touch-icon.png.
 * Renvoie les octets du PNG, ou null si aucune icône PNG utilisable n'est trouvée.
 */
internal fun fetchWebIcon(pageUrl: String): ByteArray? = try {
    val (finalUrl, html) = download(pageUrl, MAX_PAGE)?.let { it.first to String(it.second, Charsets.UTF_8) }
        ?: return null
    val candidates = mutableListOf<Candidate>()

    val links = Regex("<link\\b[^>]*>", RegexOption.IGNORE_CASE).findAll(html).map { it.value }.toList()
    for (tag in links) {
        val rel = attr(tag, "rel")?.lowercase() ?: continue
        val href = attr(tag, "href")?.let { resolve(finalUrl, it) } ?: continue
        when {
            rel.split(Regex("\\s+")).contains("manifest") -> candidates += manifestIcons(href)
            rel.contains("apple-touch-icon") -> candidates += Candidate(href, sizeOf(attr(tag, "sizes")).takeIf { it > 0 } ?: 180, 2)
            rel.split(Regex("\\s+")).contains("icon") -> candidates += Candidate(href, sizeOf(attr(tag, "sizes")), 3)
        }
    }
    candidates += Candidate(resolve(finalUrl, "/apple-touch-icon.png"), 180, 4)

    candidates
        .distinctBy { it.url }
        .sortedWith(compareBy<Candidate>({ it.rank }, { -it.size }))
        .firstNotNullOfOrNull { candidate ->
            download(candidate.url, MAX_ICON)?.second?.takeIf { isUsablePng(it) }?.also {
                logger.info("Icône récupérée : ${candidate.url} (${pngWidth(it)} px)")
            }
        }
} catch (e: Exception) {
    logger.warning("Icône du site non récupérée : ${e.message}")
    null
}

/** Icônes du manifest web : « any » d'abord (rang 0), « maskable » ensuite (rang 1), plus grande d'abord. */
private fun manifestIcons(manifestUrl: String): List<Candidate> {
    val json = download(manifestUrl, MAX_PAGE)?.let { String(it.second, Charsets.UTF_8) } ?: return emptyList()
    val iconsBlock = Regex("\"icons\"\\s*:\\s*\\[(.*?)]", RegexOption.DOT_MATCHES_ALL).find(json)?.groupValues?.get(1)
        ?: return emptyList()
    return Regex("\\{[^{}]*}").findAll(iconsBlock).mapNotNull { match ->
        val obj = match.value
        val src = jsonString(obj, "src") ?: return@mapNotNull null
        val type = jsonString(obj, "type")
        if (type != null && !type.contains("png", ignoreCase = true)) return@mapNotNull null
        val purpose = jsonString(obj, "purpose") ?: "any"
        val rank = if (purpose.split(" ").contains("any")) 0 else 1
        Candidate(resolve(manifestUrl, src), sizeOf(jsonString(obj, "sizes")), rank)
    }.toList()
}

private fun jsonString(obj: String, key: String) =
    Regex("\"$key\"\\s*:\\s*\"([^\"]*)\"").find(obj)?.groupValues?.get(1)

private fun attr(tag: String, name: String) =
    Regex("\\b$name\\s*=\\s*(\"([^\"]*)\"|'([^']*)'|([^\\s>]+))", RegexOption.IGNORE_CASE).find(tag)
        ?.groupValues?.let { it[2].ifEmpty { it[3] }.ifEmpty { it[4] } }
        ?.replace("&amp;", "&")

/** "192x192 512x512" → 512 ; "any" ou absent → 0. */
private fun sizeOf(sizes: String?) =
    Regex("(\\d+)x(\\d+)", RegexOption.IGNORE_CASE).findAll(sizes ?: "")
        .maxOfOrNull { it.groupValues[1].toInt() } ?: 0

private fun resolve(base: String, href: String) = URI(base).resolve(href.trim()).toString()

/** PNG valide et d'au moins 48 px. */
internal fun isUsablePng(bytes: ByteArray): Boolean {
    val signature = byteArrayOf(0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A)
    if (bytes.size < 24 || !bytes.copyOfRange(0, 8).contentEquals(signature)) return false
    return pngWidth(bytes) >= MIN_SIZE
}

private fun pngWidth(bytes: ByteArray) =
    ((bytes[16].toInt() and 0xFF) shl 24) or ((bytes[17].toInt() and 0xFF) shl 16) or
        ((bytes[18].toInt() and 0xFF) shl 8) or (bytes[19].toInt() and 0xFF)

/** Télécharge une adresse (redirections suivies, taille limitée). Renvoie l'adresse finale et les octets. */
private fun download(url: String, maxBytes: Int): Pair<String, ByteArray>? {
    var current = url
    repeat(5) {
        val connection = (URI(current).toURL().openConnection() as HttpURLConnection).apply {
            connectTimeout = 10_000
            readTimeout = 15_000
            instanceFollowRedirects = false
            setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14) ModProdApkCreator")
        }
        try {
            when (val code = connection.responseCode) {
                in 300..399 -> {
                    current = resolve(current, connection.getHeaderField("Location") ?: return null)
                    if (!current.startsWith("https://")) return null
                }
                in 200..299 -> {
                    val out = ByteArrayOutputStream()
                    connection.inputStream.use { input ->
                        val buffer = ByteArray(16 * 1024)
                        while (true) {
                            val n = input.read(buffer)
                            if (n < 0) break
                            out.write(buffer, 0, n)
                            if (out.size() > maxBytes) return null
                        }
                    }
                    return current to out.toByteArray()
                }
                else -> {
                    logger.fine("HTTP $code : $current")
                    return null
                }
            }
        } finally {
            connection.disconnect()
        }
    }
    return null
}
