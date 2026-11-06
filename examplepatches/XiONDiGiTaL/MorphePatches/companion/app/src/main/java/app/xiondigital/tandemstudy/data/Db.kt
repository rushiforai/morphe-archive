package app.xiondigital.tandemstudy.data

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

/**
 * Plain SQLite rather than Room: the schema is four tables and the build stays free of
 * annotation processing, which keeps the project buildable with nothing but AGP and Kotlin.
 */
internal class Db(context: Context) : SQLiteOpenHelper(context, NAME, null, VERSION) {

    override fun onCreate(db: SQLiteDatabase) {
        db.execSQL(
            """
            CREATE TABLE conversations (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                remote_key TEXT NOT NULL UNIQUE,
                partner TEXT,
                last_at INTEGER NOT NULL DEFAULT 0
            )
            """.trimIndent(),
        )
        db.execSQL(
            """
            CREATE TABLE messages (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                conversation_id INTEGER NOT NULL,
                msg_key TEXT NOT NULL UNIQUE,
                sender TEXT,
                is_mine INTEGER NOT NULL DEFAULT 0,
                body TEXT NOT NULL,
                at INTEGER NOT NULL DEFAULT 0
            )
            """.trimIndent(),
        )
        db.execSQL("CREATE INDEX idx_messages_conv ON messages(conversation_id, at)")
        db.execSQL("CREATE INDEX idx_messages_at ON messages(at)")
        db.execSQL(
            """
            CREATE TABLE vocabulary (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                word TEXT NOT NULL,
                lang TEXT NOT NULL,
                hits INTEGER NOT NULL DEFAULT 0,
                first_seen INTEGER NOT NULL DEFAULT 0,
                last_seen INTEGER NOT NULL DEFAULT 0,
                due_at INTEGER NOT NULL DEFAULT 0,
                interval_days INTEGER NOT NULL DEFAULT 0,
                ease REAL NOT NULL DEFAULT 2.5,
                known INTEGER NOT NULL DEFAULT 0,
                UNIQUE(word, lang)
            )
            """.trimIndent(),
        )
        db.execSQL("CREATE INDEX idx_vocab_due ON vocabulary(known, due_at)")
        db.execSQL("CREATE TABLE meta (key TEXT PRIMARY KEY, value TEXT)")
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        // Everything here is derived from the export, so a schema bump re-imports instead of migrating.
        db.execSQL("DROP TABLE IF EXISTS messages")
        db.execSQL("DROP TABLE IF EXISTS vocabulary")
        db.execSQL("DROP TABLE IF EXISTS conversations")
        db.execSQL("DROP TABLE IF EXISTS meta")
        onCreate(db)
    }

    companion object {
        private const val NAME = "tandem-study.db"
        private const val VERSION = 1
    }
}
