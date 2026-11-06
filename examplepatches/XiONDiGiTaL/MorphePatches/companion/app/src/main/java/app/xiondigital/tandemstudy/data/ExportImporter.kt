package app.xiondigital.tandemstudy.data

import android.content.ContentResolver
import android.net.Uri
import org.json.JSONArray
import org.json.JSONObject
import java.io.InputStream
import java.time.Instant
import java.time.LocalDateTime
import java.time.OffsetDateTime
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter
import java.util.Locale
import java.util.zip.ZipInputStream

/**
 * Reads a Tandem "Download my data" export (zip of JSON, or a single JSON file).
 *
 * The archive's exact layout is not published, so this walks the whole JSON tree and recognises a
 * message by the fields it carries instead of by path or key name. Anything it recognises is kept;
 * anything it does not is ignored without failing the import. Re-importing the same archive is
 * safe because messages are keyed by conversation + timestamp + text hash.
 */
internal class ExportImporter(private val resolver: ContentResolver) {

    data class RawMessage(
        val key: String,
        val conversation: String,
        val sender: String?,
        val isMine: Boolean,
        val body: String,
        val at: Long,
    )

    data class Parsed(
        val messages: List<RawMessage>,
        val files: Int,
        val language: String?,
        val skipped: List<String>,
    )

    fun parse(uri: Uri): Parsed {
        val messages = ArrayList<RawMessage>()
        val skipped = ArrayList<String>()
        val language = arrayOfNulls<String>(1)
        var files = 0

        if (isZip(uri)) {
            val stream = resolver.openInputStream(uri)?.buffered()
                ?: throw IllegalStateException("The selected file could not be opened")
            stream.use { raw ->
                ZipInputStream(raw).use { zip ->
                    while (true) {
                        val entry = zip.nextEntry ?: break
                        if (entry.isDirectory) continue
                        val name = entry.name ?: continue
                        if (!isJson(name)) continue
                        val text = readText(zip)
                        if (text == null) {
                            skipped += name
                            continue
                        }
                        files++
                        consume(text, name, messages, language)
                    }
                }
            }
        } else {
            val text = resolver.openInputStream(uri)?.buffered()?.use { readText(it) }
                ?: throw IllegalStateException("The selected file could not be opened")
            files = 1
            consume(text, uri.lastPathSegment ?: "selected file", messages, language)
        }

        return Parsed(messages, files, language[0], skipped)
    }

    // --- input helpers ---------------------------------------------------------------------

    private fun isZip(uri: Uri): Boolean {
        val head = ByteArray(4)
        val read = resolver.openInputStream(uri)?.use { it.read(head) } ?: 0
        return read == 4 && head[0] == 'P'.code.toByte() && head[1] == 'K'.code.toByte()
    }

    private fun isJson(name: String): Boolean {
        val lower = name.lowercase(Locale.ROOT)
        return lower.endsWith(".json") || lower.endsWith(".jsonl")
    }

    /** Reads at most [MAX_BYTES]; returns null for entries too large to be a text payload. */
    private fun readText(stream: InputStream): String? {
        val buffer = java.io.ByteArrayOutputStream()
        val chunk = ByteArray(64 * 1024)
        var total = 0
        while (true) {
            val read = stream.read(chunk)
            if (read <= 0) break
            total += read
            if (total > MAX_BYTES) return null
            buffer.write(chunk, 0, read)
        }
        return buffer.toString(Charsets.UTF_8.name())
    }

    // --- json walking ----------------------------------------------------------------------

    private fun consume(text: String, name: String, out: MutableList<RawMessage>, language: Array<String?>) {
        if (name.lowercase(Locale.ROOT).endsWith(".jsonl")) {
            for (line in text.lineSequence()) {
                val trimmed = line.trim()
                if (trimmed.length < 2) continue
                val obj = runCatching { JSONObject(trimmed) }.getOrNull() ?: continue
                walk(obj, 0, out, language)
            }
            return
        }
        val first = text.firstOrNull { !it.isWhitespace() } ?: return
        val root: Any? = runCatching {
            if (first == '[') JSONArray(text) else JSONObject(text)
        }.getOrNull()
        walk(root, 0, out, language)
    }

    private fun walk(node: Any?, depth: Int, out: MutableList<RawMessage>, language: Array<String?>) {
        if (node == null || depth > MAX_DEPTH) return
        when (node) {
            is JSONObject -> {
                if (language[0] == null) language[0] = pickLanguage(node)
                messageFrom(node)?.let { out += it }
                for (key in node.keys()) walk(node.opt(key), depth + 1, out, language)
            }

            is JSONArray -> for (index in 0 until node.length()) {
                walk(node.opt(index), depth + 1, out, language)
            }
        }
    }

    private fun messageFrom(obj: JSONObject): RawMessage? {
        val body = firstString(obj, TEXT_KEYS)?.takeIf { it.isNotBlank() } ?: return null
        if (body.length > MAX_BODY) return null
        val at = firstTime(obj) ?: return null
        val conversation = firstValue(obj, CONVERSATION_KEYS) ?: "conversation"
        val id = firstValue(obj, ID_KEYS)
        val key = if (id != null) "id:$id" else "$conversation|$at|${body.hashCode()}"
        return RawMessage(
            key = key,
            conversation = conversation,
            sender = firstValue(obj, SENDER_KEYS),
            isMine = firstBool(obj, MINE_KEYS) ?: false,
            body = body,
            at = at,
        )
    }

    private fun pickLanguage(obj: JSONObject): String? {
        for (key in LANGUAGE_KEYS) {
            if (!obj.has(key) || obj.isNull(key)) continue
            val value = obj.optString(key, "").trim().lowercase(Locale.ROOT)
            if (value.length in 2..8 && value.all { it.isLetter() || it == '-' || it == '_' }) {
                return value.substringBefore('-').substringBefore('_').take(2)
            }
        }
        return null
    }

    private fun firstString(obj: JSONObject, keys: List<String>): String? {
        for (key in keys) {
            if (!obj.has(key) || obj.isNull(key)) continue
            val value = obj.opt(key)
            if (value is String) return value
        }
        return null
    }

    private fun firstValue(obj: JSONObject, keys: List<String>): String? {
        for (key in keys) {
            if (!obj.has(key) || obj.isNull(key)) continue
            when (val value = obj.opt(key)) {
                is String -> if (value.isNotBlank()) return value
                is Number -> return value.toString()
            }
        }
        return null
    }

    private fun firstBool(obj: JSONObject, keys: List<String>): Boolean? {
        for (key in keys) {
            if (!obj.has(key) || obj.isNull(key)) continue
            when (val value = obj.opt(key)) {
                is Boolean -> return value
                is Number -> return value.toInt() != 0
                is String -> when (value.lowercase(Locale.ROOT)) {
                    "true", "1", "yes" -> return true
                    "false", "0", "no" -> return false
                }
            }
        }
        return null
    }

    private fun firstTime(obj: JSONObject): Long? {
        for (key in TIME_KEYS) {
            if (!obj.has(key) || obj.isNull(key)) continue
            val value = obj.opt(key)
            val parsed = when (value) {
                is Number -> normaliseEpoch(value.toLong())
                is String -> parseTimeString(value)
                else -> null
            }
            if (parsed != null && parsed > 0L) return parsed
        }
        return null
    }

    private fun normaliseEpoch(raw: Long): Long = when {
        raw <= 0L -> 0L
        raw > 100_000_000_000_000L -> raw / 1000
        raw > 100_000_000_000L -> raw
        else -> raw * 1000
    }

    private fun parseTimeString(raw: String): Long? {
        val text = raw.trim()
        if (text.isEmpty()) return null
        text.toLongOrNull()?.let { return normaliseEpoch(it) }
        runCatching { return Instant.parse(text).toEpochMilli() }
        runCatching { return OffsetDateTime.parse(text).toInstant().toEpochMilli() }
        for (pattern in LOCAL_PATTERNS) {
            runCatching {
                val parsed = LocalDateTime.parse(text, DateTimeFormatter.ofPattern(pattern))
                return parsed.toInstant(ZoneOffset.UTC).toEpochMilli()
            }
        }
        return null
    }

    private companion object {
        const val MAX_BYTES = 48 * 1024 * 1024
        const val MAX_BODY = 20_000
        const val MAX_DEPTH = 48

        val TEXT_KEYS = listOf("text", "body", "message", "content", "messageText", "message_text", "msg")
        val TIME_KEYS = listOf(
            "created_at", "createdAt", "timestamp", "sentAt", "sent_at", "date", "time", "ts", "created",
        )
        val SENDER_KEYS = listOf("senderId", "sender_id", "sender", "fromUserId", "from_user_id", "from", "userId", "author")
        val CONVERSATION_KEYS = listOf(
            "conversationId", "conversation_id", "chatId", "chat_id", "threadId", "thread_id",
            "partnerId", "partner_id", "withUserId",
        )
        val MINE_KEYS = listOf("is_mine", "isMine", "fromMe", "from_me", "sentByMe", "outgoing", "isOutgoing")
        val ID_KEYS = listOf("messageId", "message_id", "id")
        val LANGUAGE_KEYS = listOf(
            "learningLanguage", "learning_language", "targetLanguage", "languageCode", "language_code", "language",
        )
        val LOCAL_PATTERNS = listOf(
            "yyyy-MM-dd'T'HH:mm:ss",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-MM-dd",
        )
    }
}
