package app.sadmod.client.data.crypto

import app.sadmod.client.data.bridge.SadModBridge
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.security.MessageDigest
import java.util.Base64
import java.util.zip.GZIPInputStream

object HappyModCrypto {

    val appVersion: String
        get() = SadModBridge.current.appVersion.ifBlank { "3.4.5" }

    val aid: String
        get() = SadModBridge.current.aid

    /**
     * Reverses the character-index Vigenere shift on ASCII alphanumeric characters,
     * decodes Base64, and transparently decompresses GZIP payloads when present.
     */
    fun decodeResponse(raw: String): String {
        val trimmed = raw.trim()
        val shiftedChars = CharArray(trimmed.length)
        for (i in trimmed.indices) {
            val ch = trimmed[i]
            val code = ch.code
            val decodedCode = if (code in 48..57 || code in 65..90 || code in 97..122) {
                val shifted = code - (i % 10)
                when {
                    shifted < 48 -> 122 - (48 - shifted) + 1
                    code >= 65 && shifted < 65 -> (57 - (65 - shifted)) + 1
                    code >= 97 && shifted < 97 -> (90 - (97 - shifted)) + 1
                    else -> shifted
                }
            } else {
                code
            }
            shiftedChars[i] = decodedCode.toChar()
        }

        val sb = StringBuilder(String(shiftedChars))
        while (sb.length % 4 != 0) {
            sb.append('=')
        }
        val decodedBytes = Base64.getDecoder().decode(sb.toString())
        val finalBytes = if (
            decodedBytes.size >= 2 &&
            decodedBytes[0] == 0x1f.toByte() &&
            decodedBytes[1] == 0x8b.toByte()
        ) {
            gunzip(decodedBytes)
        } else {
            decodedBytes
        }
        return finalBytes.toString(Charsets.UTF_8)
    }

    private fun gunzip(compressed: ByteArray): ByteArray {
        GZIPInputStream(ByteArrayInputStream(compressed)).use { gis ->
            val out = ByteArrayOutputStream()
            val buf = ByteArray(8192)
            while (true) {
                val read = gis.read(buf)
                if (read <= 0) break
                out.write(buf, 0, read)
            }
            return out.toByteArray()
        }
    }

    fun md5Hex(input: String): String {
        val digest = MessageDigest.getInstance("MD5").digest(input.toByteArray(Charsets.UTF_8))
        return digest.joinToString("") { "%02x".format(it) }
    }

    fun makeStamp(
        uid: String,
        serverTimestampSec: Long,
        stampKey: String = SadModBridge.current.stampKey
    ): String {
        return md5Hex(uid + serverTimestampSec.toString() + stampKey)
    }

    fun generateDownloadHash(
        urlId: String,
        hashSalt: String = SadModBridge.current.hashSalt
    ): String {
        val full = md5Hex(urlId + hashSalt)
        return full.substring(10, 14) +
            full.substring(25, 29) +
            full.substring(18, 22) +
            full.substring(5, 9)
    }

    fun cleanHtml(raw: String): String {
        if (raw.isBlank()) return ""
        return raw
            .replace(Regex("<br\\s*/?>", RegexOption.IGNORE_CASE), "\n")
            .replace(Regex("</p>", RegexOption.IGNORE_CASE), "\n\n")
            .replace(Regex("<[^>]+>"), "")
            .replace("&amp;", "&")
            .replace("&lt;", "<")
            .replace("&gt;", ">")
            .replace("&quot;", "\"")
            .replace("&#39;", "'")
            .replace("&nbsp;", " ")
            .replace(Regex("\n{3,}"), "\n\n")
            .trim()
    }
}
