package app.morphe.extension.pixiv.search

import okhttp3.HttpUrl
import org.json.JSONArray
import org.json.JSONObject

/**
 * Keeps the search pages that have already been read, so reading one again costs nothing.
 *
 * The app asks for a page it has seen before more often than the grid makes it look: coming back to
 * a search, changing the floor, a screen that re-requests the first page while the works on it are
 * still the same works. Each of those used to cost a round trip. What is kept is the page exactly as
 * Pixiv sent it - before the floor touches it - so a floor chosen later re-filters this page instead
 * of buying it a second time.
 *
 * Search results move as works are uploaded, so nothing here stays an answer for long; see [TTL_MS].
 * Everything is held in this process' memory and nothing outlives it.
 */
internal object PageCache {

    /** A page read a while ago no longer describes the search, and the app would show an old list. */
    private const val TTL_MS = 5 * 60 * 1000L

    /** Room for a few searches that each ran through a batch of filled pages. */
    private const val MAX_PAGES = 30

    /** A distribution read off one or two pages is mostly noise; this is how far back it reaches. */
    private const val MAX_SAMPLE_PAGES = 10

    /**
     * The parameters that decide which works a page holds. The rest of a search URL carries values
     * the app passes around without meaning anything to Pixiv (`include_potential_violation_works`
     * and the like); keying on the whole URL would file the same page under a fresh key every time
     * one of them changed.
     *
     * The path is part of the signature on top of these: the illustration and the novel search take
     * the same query and answer with entirely different works, so a key made of the parameters alone
     * would hand one of them a page belonging to the other.
     */
    private val SIGNATURE_PARAMS = listOf("word", "search_target", "search_ai_type", "sort")

    private const val SEPARATOR = '\u0000'

    /**
     * One page as Pixiv sent it.
     *
     * The works are handed out as the objects that were parsed off the wire: nothing in this package
     * writes to them, so several threads reading the same page at once only ever read.
     */
    class Page internal constructor(
        val items: List<JSONObject>,
        val next: String?,
        private val envelope: String,
        private val itemsKey: String
    ) {

        /** Taken once, when the page is stored, so a reader never walks the payload a second time. */
        val bookmarks: List<Int> = items.mapNotNull { (it.opt("total_bookmarks") as? Number)?.toInt() }

        /**
         * The payload Pixiv answered with. The works go back inside the envelope they arrived in:
         * the app reads them out of `body` and would find nothing in a bare list.
         */
        fun payload(): String {
            val root = JSONObject(envelope)
            val container = root.optJSONObject("body") ?: root
            container.put(itemsKey, JSONArray(items))
            return root.toString()
        }
    }

    private data class Key(val signature: String, val offset: Int)

    private class Entry(val storedAt: Long, val page: Page)

    /** Access order, so the map is its own queue of what to evict and needs no second bookkeeping. */
    private val pages = object : LinkedHashMap<Key, Entry>(MAX_PAGES, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<Key, Entry>?) = size > MAX_PAGES
    }

    /**
     * The search a page belongs to. Two searches that differ in what they ask Pixiv for never share
     * a page, and two that differ only in a parameter Pixiv ignores always do.
     */
    fun signature(url: HttpUrl): String =
        (listOf(url.encodedPath) + SIGNATURE_PARAMS.map { url.queryParameter(it).orEmpty() })
            .joinToString(SEPARATOR.toString())

    /** The page held for [url], or null when none is held or the one held is past [TTL_MS]. */
    fun load(url: HttpUrl): Page? = synchronized(pages) {
        val key = keyOf(url)
        val entry = pages[key] ?: return null
        if (isStale(entry)) {
            pages.remove(key)
            return null
        }
        entry.page
    }

    /**
     * Keeps a page that just came off the wire and hands it back, so the caller filters the parse it
     * already has instead of reading the payload a second time.
     */
    fun store(
        url: HttpUrl,
        root: JSONObject,
        itemsKey: String,
        items: List<JSONObject>,
        next: String?
    ): Page {
        val page = Page(items, next, envelopeOf(root, itemsKey), itemsKey)
        synchronized(pages) { pages[keyOf(url)] = Entry(System.currentTimeMillis(), page) }
        return page
    }

    /**
     * Every bookmark count held for [signature], in page order.
     *
     * A threshold that follows the search's own numbers needs the pages that have already been read;
     * buying them for that purpose is the one thing this cache exists to avoid.
     */
    fun samples(signature: String): List<Int> = synchronized(pages) {
        pages.entries.removeAll { isStale(it.value) }
        // Access order runs oldest first, so the tail is the stretch of pages the user is on now.
        pages.entries
            .filter { it.key.signature == signature }
            .takeLast(MAX_SAMPLE_PAGES)
            .sortedBy { it.key.offset }
            .flatMap { it.value.page.bookmarks }
    }

    private fun keyOf(url: HttpUrl) =
        Key(signature(url), url.queryParameter("offset")?.toIntOrNull() ?: 0)

    /**
     * The response with the works taken out. Copying is the cheapest way to drop the list without
     * writing to the payload the caller is about to filter.
     */
    private fun envelopeOf(root: JSONObject, itemsKey: String): String {
        val copy = JSONObject(root.toString())
        (copy.optJSONObject("body") ?: copy).remove(itemsKey)
        return copy.toString()
    }

    private fun isStale(entry: Entry) = System.currentTimeMillis() - entry.storedAt > TTL_MS
}
