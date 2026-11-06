package app.morphe.extension.pixiv.history

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject

/**
 * Browsing history kept on the device. Pixiv only serves its own history list to premium
 * accounts, so the works opened in this app are recorded locally instead of being fetched.
 */
object HistoryStore {

    const val KIND_ILLUST = "illust"
    const val KIND_NOVEL = "novel"

    private const val PREFS_NAME = "pixiv_patched_history"
    private const val KEY_ENTRIES = "entries"
    private const val MAX_ENTRIES = 200

    class Entry(
        val id: Long,
        val kind: String,
        val title: String,
        val author: String,
        val thumb: String,
        val time: Long
    )

    private val lock = Any()

    @JvmStatic
    fun record(context: Context?, id: Long, kind: String, title: String?, author: String?, thumb: String?) {
        if (context == null || id <= 0L) return
        try {
            synchronized(lock) {
                val entries = load(context).filterNot { it.id == id && it.kind == kind }.toMutableList()
                entries.add(0, Entry(id, kind, title.orEmpty().trim(), author.orEmpty().trim(), thumb.orEmpty(), System.currentTimeMillis()))
                save(context, if (entries.size > MAX_ENTRIES) entries.subList(0, MAX_ENTRIES).toList() else entries)
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun entries(context: Context?): List<Entry> {
        if (context == null) return emptyList()
        return try {
            synchronized(lock) { load(context) }
        } catch (_: Throwable) {
            emptyList()
        }
    }

    @JvmStatic
    fun count(context: Context?): Int = entries(context).size

    @JvmStatic
    fun contains(context: Context?, id: Long, kind: String): Boolean {
        if (context == null) return false
        return try {
            synchronized(lock) { load(context).any { it.id == id && it.kind == kind } }
        } catch (_: Throwable) {
            false
        }
    }

    @JvmStatic
    fun clear(context: Context?) {
        if (context == null) return
        try {
            synchronized(lock) { prefs(context).edit().remove(KEY_ENTRIES).apply() }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun clearKind(context: Context?, kind: String) {
        if (context == null) return
        try {
            synchronized(lock) {
                save(context, load(context).filterNot { it.kind == kind })
            }
        } catch (_: Throwable) {
        }
    }

    private fun prefs(context: Context) =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    private fun load(context: Context): List<Entry> {
        val raw = prefs(context).getString(KEY_ENTRIES, null) ?: return emptyList()
        val array = runCatching { JSONArray(raw) }.getOrNull() ?: return emptyList()
        val entries = ArrayList<Entry>(array.length())
        for (index in 0 until array.length()) {
            val item = array.optJSONObject(index) ?: continue
            val id = item.optLong("id", 0L)
            if (id <= 0L) continue
            entries.add(
                Entry(
                    id = id,
                    kind = item.optString("kind", KIND_ILLUST),
                    title = item.optString("title", ""),
                    author = item.optString("author", ""),
                    thumb = item.optString("thumb", ""),
                    time = item.optLong("time", 0L)
                )
            )
        }
        return entries
    }

    private fun save(context: Context, entries: List<Entry>) {
        val array = JSONArray()
        for (entry in entries) {
            array.put(
                JSONObject().apply {
                    put("id", entry.id)
                    put("kind", entry.kind)
                    put("title", entry.title)
                    put("author", entry.author)
                    put("thumb", entry.thumb)
                    put("time", entry.time)
                }
            )
        }
        prefs(context).edit().putString(KEY_ENTRIES, array.toString()).apply()
    }
}
