package app.xiondigital.tandemstudy.data

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.net.Uri
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext

enum class WordSort(val label: String) {
    Frequency("Most used"),
    Recent("Newest"),
    Alphabetical("A-Z"),
    Due("Due first"),
}

class StudyRepository(context: Context) {

    private val db = Db(context)
    private val resolver = context.contentResolver

    private val _dataVersion = MutableStateFlow(0L)

    /** Bumped after every write so the screens know to requery. */
    val dataVersion: StateFlow<Long> = _dataVersion.asStateFlow()

    // --- import ----------------------------------------------------------------------------

    suspend fun import(uri: Uri): ImportSummary = withContext(Dispatchers.IO) {
        val parsed = ExportImporter(resolver).parse(uri)
        if (parsed.messages.isEmpty()) {
            return@withContext ImportSummary(
                conversations = 0,
                messages = 0,
                newWords = 0,
                files = parsed.files,
                language = parsed.language,
                note = "Read ${parsed.files} file(s) but found no messages. " +
                    "The importer looks for objects carrying text plus a timestamp; " +
                    "see companion/README.md for the keys it recognises.",
            )
        }

        val language = parsed.language ?: "und"
        val database = db.writableDatabase
        var inserted = 0
        val conversations = HashMap<String, Long>()
        val counts = HashMap<String, Int>()

        database.beginTransaction()
        try {
            for (message in parsed.messages) {
                val conversationId = conversations.getOrPut(message.conversation) {
                    ensureConversation(database, message.conversation)
                }
                val values = ContentValues().apply {
                    put("conversation_id", conversationId)
                    put("msg_key", message.key)
                    put("sender", message.sender)
                    put("is_mine", if (message.isMine) 1 else 0)
                    put("body", message.body)
                    put("at", message.at)
                }
                val rowId = database.insertWithOnConflict(
                    "messages", null, values, SQLiteDatabase.CONFLICT_IGNORE,
                )
                if (rowId != -1L) {
                    inserted++
                    for (word in Tokenizer.tokens(message.body, language)) {
                        counts[word] = (counts[word] ?: 0) + 1
                    }
                }
            }
            bumpVocabulary(database, counts, language)
            putMeta(database, "language", language)
            putMeta(database, "last_import", System.currentTimeMillis().toString())
            database.setTransactionSuccessful()
        } finally {
            database.endTransaction()
        }

        _dataVersion.value = System.currentTimeMillis()

        ImportSummary(
            conversations = conversations.size,
            messages = inserted,
            newWords = counts.size,
            files = parsed.files,
            language = language,
            note = when {
                parsed.skipped.isNotEmpty() ->
                    "${parsed.skipped.size} file(s) were skipped as too large or unreadable."

                inserted == 0 -> "Nothing new: this export was already imported."
                else -> null
            },
        )
    }

    private fun ensureConversation(database: SQLiteDatabase, key: String): Long {
        database.rawQuery("SELECT id FROM conversations WHERE remote_key = ?", arrayOf(key)).use { cursor ->
            if (cursor.moveToFirst()) return cursor.getLong(0)
        }
        val values = ContentValues().apply {
            put("remote_key", key)
            put("partner", label(key))
            put("last_at", System.currentTimeMillis())
        }
        return database.insertOrThrow("conversations", null, values)
    }

    private fun label(key: String): String {
        val trimmed = key.trim()
        return when {
            trimmed.isEmpty() -> "Conversation"
            trimmed.length > 40 -> trimmed.take(40) + "\u2026"
            else -> trimmed
        }
    }

    private fun bumpVocabulary(database: SQLiteDatabase, counts: Map<String, Int>, lang: String) {
        val now = System.currentTimeMillis()
        for ((word, added) in counts) {
            database.rawQuery(
                "SELECT id FROM vocabulary WHERE word = ? AND lang = ?", arrayOf(word, lang),
            ).use { cursor ->
                if (cursor.moveToFirst()) {
                    database.execSQL(
                        "UPDATE vocabulary SET hits = hits + ?, last_seen = ? WHERE id = ?",
                        arrayOf<Any>(added, now, cursor.getLong(0)),
                    )
                } else {
                    database.execSQL(
                        "INSERT INTO vocabulary (word, lang, hits, first_seen, last_seen, due_at, interval_days, ease, known) " +
                            "VALUES (?, ?, ?, ?, ?, ?, 0, 2.5, 0)",
                        arrayOf<Any>(word, lang, added, now, now, now),
                    )
                }
            }
        }
    }

    private fun putMeta(database: SQLiteDatabase, key: String, value: String) {
        database.execSQL("INSERT OR REPLACE INTO meta (key, value) VALUES (?, ?)", arrayOf(key, value))
    }

    // --- reads -----------------------------------------------------------------------------

    suspend fun words(sort: WordSort, limit: Int): List<WordItem> = withContext(Dispatchers.IO) {
        val order = when (sort) {
            WordSort.Frequency -> "hits DESC, word ASC"
            WordSort.Recent -> "last_seen DESC, hits DESC"
            WordSort.Alphabetical -> "word ASC"
            WordSort.Due -> "due_at ASC, hits DESC"
        }
        readWords(
            db.readableDatabase,
            "SELECT word, lang, hits, last_seen, due_at, known FROM vocabulary ORDER BY $order LIMIT ?",
            arrayOf(limit.toString()),
        )
    }

    suspend fun dueCards(limit: Int): List<WordItem> = withContext(Dispatchers.IO) {
        val now = System.currentTimeMillis()
        readWords(
            db.readableDatabase,
            "SELECT word, lang, hits, last_seen, due_at, known FROM vocabulary " +
                "WHERE known = 0 AND due_at <= ? ORDER BY hits DESC, last_seen ASC LIMIT ?",
            arrayOf(now.toString(), limit.toString()),
        )
    }

    suspend fun dueCount(): Int = withContext(Dispatchers.IO) {
        scalar(
            db.readableDatabase,
            "SELECT COUNT(*) FROM vocabulary WHERE known = 0 AND due_at <= ?",
            arrayOf(System.currentTimeMillis().toString()),
        )
    }

    suspend fun grade(word: String, lang: String, good: Boolean): Unit = withContext(Dispatchers.IO) {
        val database = db.writableDatabase
        database.rawQuery(
            "SELECT interval_days, ease FROM vocabulary WHERE word = ? AND lang = ?", arrayOf(word, lang),
        ).use { cursor ->
            if (!cursor.moveToFirst()) return@withContext
            var interval = cursor.getInt(0)
            var ease = cursor.getDouble(1)
            if (good) {
                interval = if (interval < 1) 1 else (interval * ease).toInt().coerceAtLeast(interval + 1)
                ease = (ease + 0.05).coerceAtMost(3.0)
            } else {
                interval = 1
                ease = (ease - 0.2).coerceAtLeast(1.3)
            }
            val due = System.currentTimeMillis() + interval * 86_400_000L
            database.execSQL(
                "UPDATE vocabulary SET interval_days = ?, ease = ?, due_at = ?, known = ? WHERE word = ? AND lang = ?",
                arrayOf<Any>(interval, ease, due, if (good && interval >= 16) 1 else 0, word, lang),
            )
        }
        _dataVersion.value = System.currentTimeMillis()
    }

    suspend fun search(text: String, limit: Int = 300): List<SearchHit> = withContext(Dispatchers.IO) {
        val query = text.trim()
        if (query.isEmpty()) return@withContext emptyList()
        val escaped = query
            .replace("\\", "\\\\")
            .replace("%", "\\%")
            .replace("_", "\\_")
        val hits = ArrayList<SearchHit>()
        db.readableDatabase.rawQuery(
            "SELECT m.id, IFNULL(c.partner, ''), m.body, m.at, m.is_mine " +
                "FROM messages m LEFT JOIN conversations c ON c.id = m.conversation_id " +
                "WHERE m.body LIKE ? ESCAPE '\\' ORDER BY m.at DESC LIMIT ?",
            arrayOf("%$escaped%", limit.toString()),
        ).use { cursor ->
            while (cursor.moveToNext()) {
                hits += SearchHit(
                    id = cursor.getLong(0),
                    partner = cursor.getString(1),
                    body = cursor.getString(2),
                    at = cursor.getLong(3),
                    isMine = cursor.getInt(4) == 1,
                )
            }
        }
        hits
    }

    suspend fun stats(): Stats = withContext(Dispatchers.IO) {
        val database = db.readableDatabase
        val messages = scalar(database, "SELECT COUNT(*) FROM messages", null)
        val conversations = scalar(database, "SELECT COUNT(*) FROM conversations", null)
        val words = scalar(database, "SELECT COUNT(*) FROM vocabulary", null)
        val wordHits = scalar(database, "SELECT IFNULL(SUM(hits), 0) FROM vocabulary", null)
        val mine = scalar(database, "SELECT COUNT(*) FROM messages WHERE is_mine = 1", null)

        val days = ArrayList<Pair<Long, Int>>()
        database.rawQuery(
            "SELECT (at / 86400000) * 86400000 AS day, COUNT(*) FROM messages " +
                "WHERE at > 0 GROUP BY day ORDER BY day DESC LIMIT 30",
            null,
        ).use { cursor ->
            while (cursor.moveToNext()) days += cursor.getLong(0) to cursor.getInt(1)
        }
        days.reverse()

        val top = readWords(
            database,
            "SELECT word, lang, hits, last_seen, due_at, known FROM vocabulary ORDER BY hits DESC LIMIT 15",
            null,
        )

        Stats(
            messages = messages,
            conversations = conversations,
            words = words,
            wordHits = wordHits,
            mineShare = if (messages == 0) 0.0 else mine.toDouble() / messages,
            days = days,
            topWords = top,
            perConversation = conversationStats(database),
            hasDirection = mine > 0,
        )
    }

    suspend fun language(): String? = withContext(Dispatchers.IO) {
        var value: String? = null
        db.readableDatabase.rawQuery("SELECT value FROM meta WHERE key = 'language'", null).use { cursor ->
            if (cursor.moveToFirst()) value = cursor.getString(0)
        }
        value
    }

    suspend fun clearAll() = withContext(Dispatchers.IO) {
        val database = db.writableDatabase
        database.beginTransaction()
        try {
            database.execSQL("DELETE FROM messages")
            database.execSQL("DELETE FROM vocabulary")
            database.execSQL("DELETE FROM conversations")
            database.execSQL("DELETE FROM meta")
            database.setTransactionSuccessful()
        } finally {
            database.endTransaction()
        }
        _dataVersion.value = System.currentTimeMillis()
    }

    // --- helpers ---------------------------------------------------------------------------

    private fun readWords(database: SQLiteDatabase, sql: String, args: Array<String>?): List<WordItem> {
        val out = ArrayList<WordItem>()
        database.rawQuery(sql, args).use { cursor ->
            while (cursor.moveToNext()) {
                out += WordItem(
                    word = cursor.getString(0),
                    lang = cursor.getString(1),
                    hits = cursor.getInt(2),
                    lastSeen = cursor.getLong(3),
                    dueAt = cursor.getLong(4),
                    known = cursor.getInt(5) == 1,
                )
            }
        }
        return out
    }

    private fun scalar(database: SQLiteDatabase, sql: String, args: Array<String>?): Int {
        database.rawQuery(sql, args).use { cursor ->
            return if (cursor.moveToFirst()) cursor.getInt(0) else 0
        }
    }

    private fun conversationStats(database: SQLiteDatabase): List<ConversationStat> {
        val out = ArrayList<ConversationStat>()
        database.rawQuery(
            "SELECT c.id, IFNULL(c.partner, 'Conversation'), " +
                "(SELECT COUNT(*) FROM messages m WHERE m.conversation_id = c.id), " +
                "(SELECT COUNT(*) FROM messages m WHERE m.conversation_id = c.id AND m.is_mine = 1) " +
                "FROM conversations c ORDER BY 3 DESC LIMIT 25",
            null,
        ).use { cursor ->
            while (cursor.moveToNext()) {
                val id = cursor.getLong(0)
                out += ConversationStat(
                    partner = cursor.getString(1),
                    messages = cursor.getInt(2),
                    mine = cursor.getInt(3),
                    medianReplyMs = medianReply(database, id),
                )
            }
        }
        return out
    }

    /**
     * Median gap between an incoming message and the next outgoing one (and the reverse), which is
     * only meaningful when the export marks direction. Returns null when it does not.
     */
    private fun medianReply(database: SQLiteDatabase, conversationId: Long): Long? {
        val gaps = ArrayList<Long>()
        var pendingTheirs = -1L
        var pendingMine = -1L
        database.rawQuery(
            "SELECT is_mine, at FROM messages WHERE conversation_id = ? AND at > 0 ORDER BY at ASC",
            arrayOf(conversationId.toString()),
        ).use { cursor ->
            while (cursor.moveToNext()) {
                val mine = cursor.getInt(0) == 1
                val at = cursor.getLong(1)
                if (mine) {
                    if (pendingTheirs > 0) {
                        gaps += at - pendingTheirs
                        pendingTheirs = -1L
                    }
                    pendingMine = at
                } else {
                    if (pendingMine > 0) {
                        gaps += at - pendingMine
                        pendingMine = -1L
                    }
                    pendingTheirs = at
                }
            }
        }
        if (gaps.isEmpty()) return null
        gaps.sort()
        return gaps[gaps.size / 2]
    }
}
