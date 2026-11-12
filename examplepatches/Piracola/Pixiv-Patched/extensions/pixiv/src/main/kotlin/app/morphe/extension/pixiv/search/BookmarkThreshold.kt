package app.morphe.extension.pixiv.search

import android.content.Context
import android.graphics.Color
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.TypedValue
import android.view.Gravity
import android.widget.TextView
import android.widget.Toast
import app.morphe.extension.pixiv.aiflag.AiDetectionHelper
import app.morphe.extension.pixiv.ui.Strings
import okhttp3.HttpUrl.Companion.toHttpUrl
import okhttp3.HttpUrl.Companion.toHttpUrlOrNull
import okhttp3.Call
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONArray
import org.json.JSONObject
import java.util.concurrent.Callable
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.Future
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Puts a bookmark-count floor on search results.
 *
 * Pixiv's own search accepts `bookmark_num_min`, but only honours it for a premium account - a free
 * account gets the same works whether the filter is there or not. The same holds for the web
 * search's `blt`/`bgt`, and for the web payload, which carries no bookmark count at all. The keyword
 * Pixiv's suggestion bar offers (`500users入り`) does work, because it is an ordinary search word,
 * but it is a tag Japanese artists write by hand: searching with it quietly leaves out every work
 * whose artist writes in Chinese or English.
 *
 * The search payload already carries `total_bookmarks` for each work, so the floor is applied here
 * instead. Only the response is rewritten - the request itself never changes, which is what makes
 * the filter independent of the language the search is written in.
 *
 * A page holds thirty works and the search endpoint ignores `size`, so a strict floor on a quiet tag
 * leaves the page nearly empty. When that happens the following pages are pulled in and merged, so
 * the page still looks like a page.
 */
object BookmarkThreshold {

    /** Offered as one-tap choices in the picker. Any count up to [MAX_FLOOR] can be typed instead. */
    val PRESETS = listOf(
        0,
        100, 200, 300, 400, 500, 600, 700, 800, 900, 1000,
        1200, 1400, 1600, 1800, 2000
    )

    /** Zero turns the filter off; anything above this is treated as this. */
    const val MAX_FLOOR = 999_999

    /** The endpoints whose items carry a bookmark count, and where those items sit in the payload. */
    private val ITEMS_KEYS = mapOf(
        "/v1/search/illust" to "illusts",
        "/v1/search/novel" to "novels"
    )

    private const val PREFS_NAME = "pixiv_search_ranking_prefs"
    private const val KEY_FLOOR = "bookmark_floor"

    /** Only the connection matters for the warm-up, so it asks for the host root, not for a page. */
    private const val API_ORIGIN = "https://app-api.pixiv.net/"

    /** How long all borrowing may take, counted from the moment the first page arrives. */
    private const val FILL_BUDGET_MS = 1000L

    /** How many borrowed pages may be in flight at once. */
    private const val MAX_PARALLEL_PAGES = 4

    /** Below this there is no point starting another request. */
    private const val MIN_PAGE_BUDGET_MS = 220L

    /** How often the batch is checked for a page that has come back. */
    private const val POLL_MILLIS = 20L

    /** Keeps the empty-page toast from repeating while the app pages through a barren search. */
    private const val EMPTY_TOAST_INTERVAL_MS = 10_000L

    /** The stride a first page comes back with; what the prefetch of the second page assumes. */
    private const val PAGE_STRIDE = 30

    /**
     * The second page of the search that is currently being asked for, already on its way; see
     * [prefetchNextPage]. One slot is enough: the app asks for one search at a time.
     */
    @Volatile
    private var prefetched: Fill? = null

    /**
     * Marks the thread that is reading a borrowed page. The fill client is built through the same
     * patched `OkHttpClient` constructor as every other client, so it carries this interceptor too;
     * without the mark a borrowed page would be filtered - and itself topped up - forever.
     */
    private val topUpCall = ThreadLocal<Boolean>()

    private val pool: ExecutorService by lazy {
        Executors.newFixedThreadPool(MAX_PARALLEL_PAGES) { runnable ->
            Thread(runnable, "pixiv-bookmark-fill").apply { isDaemon = true }
        }
    }

    /** Whether the fill connection has been opened; see [warmUp]. */
    private val warm = AtomicBoolean(false)

    @Volatile
    var current: Int = 0
        private set

    @Volatile
    private var loaded = false

    @Volatile
    private var lastEmptyWord: String? = null

    @Volatile
    private var lastEmptyAt = 0L

    /**
     * The client used for the borrowed pages. Every client is built through the patched
     * `OkHttpClient` constructor, so this one carries the interceptor below as well; [topUpCall] is
     * what keeps a borrowed page from being filtered - and topped up - again. The original request's
     * headers, and with them the bearer token, are copied onto every borrowed request.
     */
    private val fillClient: OkHttpClient by lazy {
        OkHttpClient.Builder()
            .connectTimeout(1500, TimeUnit.MILLISECONDS)
            .readTimeout(2500, TimeUnit.MILLISECONDS)
            .build()
    }

    /**
     * Opens the connection the borrowed pages will use, once per process.
     *
     * The borrowed pages come from a client of their own, and the first request on a fresh client
     * pays for the DNS lookup and the TLS handshake - measured at about a second and a half here,
     * which is most of [FILL_BUDGET_MS] gone before a single page is even asked for. This asks the
     * host for its root, which is a few hundred bytes, and keeps the connection: the answer itself
     * is thrown away.
     */
    private fun warmUp() {
        if (!warm.compareAndSet(false, true)) return
        runCatching {
            pool.execute {
                topUpCall.set(true)
                try {
                    fillClient.newCall(Request.Builder().url(API_ORIGIN.toHttpUrl()).build())
                        .execute()
                        .use { response ->
                            // Read to the end: a body dropped half-read takes the connection with it,
                            // and the connection is the whole point here.
                            response.body?.string()
                        }
                } catch (_: Throwable) {
                } finally {
                    topUpCall.remove()
                }
            }
        }
    }

    fun ensureLoaded() {
        if (loaded) return
        val context = AiDetectionHelper.getContext() ?: return
        synchronized(BookmarkThreshold) {
            if (loaded) return
            val prefs = prefs(context)
            current = prefs.getInt(KEY_FLOOR, 0).coerceIn(0, MAX_FLOOR)
            loaded = true
        }
    }

    fun setFloor(context: Context?, floor: Int) {
        current = floor.coerceIn(0, MAX_FLOOR)
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching {
            prefs(target).edit().putInt(KEY_FLOOR, current).apply()
        }
    }

    @JvmStatic
    fun install(builder: OkHttpClient.Builder) {
        try {
            val alreadyInstalled = runCatching {
                val method = OkHttpClient.Builder::class.java.getMethod("interceptors")
                (method.invoke(builder) as? List<*>)?.any { it is BookmarkThresholdInterceptor } == true
            }.getOrDefault(false)
            if (alreadyInstalled) return
            builder.addInterceptor(BookmarkThresholdInterceptor())
        } catch (_: Throwable) {
        }
    }

    private class Page(val items: List<JSONObject>, val next: String?)

    /** One borrowed page in flight, with the call that can be dropped when nobody wants it. */
    private class Fill(val call: Call, val future: Future<Page?>, val offset: Int?, val search: String)

    private class BookmarkThresholdInterceptor : Interceptor {

        override fun intercept(chain: Interceptor.Chain): Response {
            val request = chain.request()
            if (topUpCall.get() == true) return chain.proceed(request)
            ensureLoaded()
            val floor = current
            val path = request.url.encodedPath
            if (ITEMS_KEYS.containsKey(path)) {
                android.util.Log.i(
                    "PixivDbg",
                    "BT req path=$path sort=${request.url.queryParameter("sort")} " +
                        "word=${request.url.queryParameter("word")} " +
                        "offset=${request.url.queryParameter("offset")} floor=$floor"
                )
            }
            if (floor <= 0) return chain.proceed(request)
            val itemsKey = ITEMS_KEYS[request.url.encodedPath] ?: return chain.proceed(request)
            warmUp()
            prefetchNextPage(request, itemsKey)

            return chain.proceed(request).filterByBookmarks(request, itemsKey, floor)
        }

        /**
         * Drops the works below [floor] from a search page.
         *
         * Pixiv answers the two search endpoints with thirty works per page and ignores their `size`
         * parameter, so a strict floor can leave a page with one work or none. Once the kept works
         * fall below half the page, the following pages are fetched and merged in until the page is
         * half full again, the list ends, or [FILL_BUDGET_MS] runs out. The page's `next_url` then
         * points past everything merged in, so scrolling continues where the rewritten page ends.
         *
         * A work without a bookmark count is kept: only the two search endpoints reach this, both
         * always send `total_bookmarks`, so a missing one means an unexpected payload rather than a
         * work worth hiding.
         */
        private fun Response.filterByBookmarks(
            request: Request,
            itemsKey: String,
            floor: Int
        ): Response {
            val contentType = body?.contentType()
            val text = body?.string() ?: return this

            val root = runCatching { JSONObject(text) }.getOrNull() ?: return withBody(text, contentType)
            val container = root.optJSONObject("body") ?: root
            val items = container.optJSONArray(itemsKey) ?: return withBody(text, contentType)

            val kept = ArrayList<JSONObject>(items.length())
            items.forEachObject { item ->
                val bookmarks = item.opt("total_bookmarks")
                if (bookmarks !is Number || bookmarks.toInt() >= floor) kept.add(item)
            }
            android.util.Log.i(
                "PixivDbg",
                "BT filtered itemsKey=$itemsKey in=${items.length()} kept=${kept.size} " +
                    "next=${container.opt("next_url")}"
            )
            if (kept.size == items.length()) {
                dropPrefetched()
                return withBody(text, contentType)
            }

            if (kept.size * 2 < items.length()) {
                val filled = topUp(request, itemsKey, floor, container, kept, items.length() / 2, items.length())
                if (filled != null) container.put("next_url", filled)
            } else {
                dropPrefetched()
            }
            if (kept.isEmpty()) notifyEmptyPage(request.url.queryParameter("word"))

            container.put(itemsKey, JSONArray(kept))
            return withBody(root.toString(), contentType)
        }

        /**
         * Merges the following pages into [kept] until it holds [target] works or the budget is
         * spent. Returns the `next_url` of the last page that was actually read, or null when no
         * page came back - in which case the caller leaves the original `next_url` alone.
         *
         * The pages are addressed by the `offset` their `next_url` carries, so a whole batch of
         * [MAX_PARALLEL_PAGES] can be asked for at once. A batch is merged strictly in page order
         * and stops at the first page that did not arrive, so the merged works stay in the order
         * Pixiv gave them and a hole never shifts later works up into it. Every failure - a timeout,
         * a refused request, a malformed payload - ends the fill and keeps whatever the earlier
         * pages already contributed: a short page is still better than an exception thrown at the
         * caller.
         */
        private fun topUp(
            request: Request,
            itemsKey: String,
            floor: Int,
            container: JSONObject,
            kept: MutableList<JSONObject>,
            target: Int,
            pageSize: Int
        ): Any? {
            val firstNext = container.opt("next_url") as? String ?: return null
            val seen = kept.mapNotNullTo(HashSet()) { it.opt("id")?.toString() }
            val deadline = System.currentTimeMillis() + FILL_BUDGET_MS
            val pageStride = pageSize.coerceAtLeast(1)
            var offset = firstNext.toHttpUrlOrNull()?.queryParameter("offset")?.toIntOrNull()
            var chained = firstNext
            var lastNext: Any? = null

            while (kept.size < target) {
                val remaining = deadline - System.currentTimeMillis()
                if (remaining < MIN_PAGE_BUDGET_MS) break

                val urls = ArrayList<String>(MAX_PARALLEL_PAGES)
                if (offset != null) {
                    val base = firstNext.toHttpUrlOrNull() ?: break
                    for (index in 0 until MAX_PARALLEL_PAGES) {
                        val next = offset + index * pageStride
                        urls.add(base.newBuilder().setQueryParameter("offset", next.toString()).build().toString())
                    }
                } else {
                    urls.add(chained)
                }

                val ready = prefetched.also { prefetched = null }
                // The slot is one page wide and shared by every search, so a page is only taken over
                // when it belongs to the search being filtered; a page left over from a search the
                // user has since abandoned is dropped, not merged into this one's results.
                val mine = ready?.takeIf { it.search == searchKey(request.url) }
                if (ready != null && mine == null) runCatching { ready.call.cancel() }
                // A page that cannot be asked for ends the batch right here: merging the pages after
                // it would leave a hole and shift later works up into it.
                val fills = ArrayList<Fill>(urls.size)
                for ((index, url) in urls.withIndex()) {
                    val fill = if (index == 0 && mine != null && mine.offset == offset) mine
                    else startFill(request, url, itemsKey, searchKey(request.url))
                    if (fill == null) break
                    fills.add(fill)
                }
                val arrived = arrayOfNulls<Page>(fills.size)
                val settled = BooleanArray(fills.size)
                var pending = fills.size

                // The pages are collected in whatever order they finish - waiting on them one after
                // another in page order would let a slow first page idle the whole batch - and are
                // merged in page order afterwards.
                while (pending > 0 && System.currentTimeMillis() < deadline) {
                    for (index in fills.indices) {
                        if (settled[index] || !fills[index].future.isDone) continue
                        settled[index] = true
                        pending--
                        arrived[index] = runCatching { fills[index].future.get() }.getOrNull()
                    }
                    if (pending > 0) runCatching { Thread.sleep(POLL_MILLIS) }
                }

                var merged = 0
                var drained = false
                for (index in fills.indices) {
                    if (kept.size >= target) break
                    val page = arrived[index]
                    if (page == null) {
                        drained = true
                        break
                    }
                    page.items.forEach { item ->
                        val bookmarks = item.opt("total_bookmarks")
                        if (bookmarks is Number && bookmarks.toInt() < floor) return@forEach
                        val id = item.opt("id")?.toString()
                        if (id == null || seen.add(id)) kept.add(item)
                    }
                    lastNext = page.next ?: JSONObject.NULL
                    merged++
                    if (page.items.size < pageStride) {
                        drained = true
                        break
                    }
                }
                // A cancelled call that has already finished is a no-op, so this is safe for the
                // pages just merged and frees the sockets of the ones nobody is waiting for.
                fills.forEach { fill -> runCatching { fill.call.cancel() } }

                if (merged == 0 || drained) break
                if (offset != null) {
                    offset = offset + merged * pageStride
                } else {
                    chained = lastNext as? String ?: break
                }
            }

            return lastNext
        }

        /**
         * Asks for the page after the one the app is asking for, at the same moment the app asks.
         *
         * The fill only starts once the first page is in, and by then there is not enough of the
         * budget left to read a page and still hand the app something: on a slow connection the
         * fill comes back empty. Asking for the following page up front moves it a whole round
         * trip earlier, so [topUp] usually finds it already here. If the first page turns out to
         * be full enough, the prefetched page is simply cancelled.
         */
        private fun prefetchNextPage(request: Request, itemsKey: String) {
            val url = request.url
            if (url.queryParameter("offset") != null) return
            val next = url.newBuilder().setQueryParameter("offset", PAGE_STRIDE.toString()).build()
            dropPrefetched()
            prefetched = startFill(request, next.toString(), itemsKey, searchKey(url))
        }

        /** Drops a prefetch that the page turned out not to need. */
        private fun dropPrefetched() {
            val fill = prefetched ?: return
            prefetched = null
            runCatching { fill.call.cancel() }
        }

        /** Everything that says which search a page belongs to; only the offset varies between pages. */
        private fun searchKey(url: okhttp3.HttpUrl): String =
            url.newBuilder().removeAllQueryParameters("offset").build().toString()

        /**
         * Starts reading one page of search results in the background. The caller waits on the
         * returned future and cancels the call when the page is no longer wanted, so a page that
         * arrives after the budget is spent cannot hold the caller past the budget.
         */
        private fun startFill(request: Request, url: String, itemsKey: String, search: String): Fill? {
            val target = url.toHttpUrlOrNull() ?: return null
            val call = runCatching { fillClient.newCall(request.newBuilder().url(target).build()) }
                .getOrNull() ?: return null
            val future = pool.submit(Callable { readPage(call, itemsKey) })
            return Fill(call, future, target.queryParameter("offset")?.toIntOrNull(), search)
        }

        /** Reads one page, or gives up: a refused request or a foreign payload is not an error. */
        private fun readPage(call: Call, itemsKey: String): Page? {
            topUpCall.set(true)
            try {
                call.execute().use { response ->
                    if (!response.isSuccessful) return null
                    val payload = response.body?.string() ?: return null
                    val root = JSONObject(payload)
                    val body = root.optJSONObject("body") ?: root
                    val items = body.optJSONArray(itemsKey) ?: return null
                    val list = ArrayList<JSONObject>(items.length())
                    items.forEachObject { list.add(it) }
                    return Page(list, body.opt("next_url") as? String)
                }
            } catch (_: Throwable) {
                return null
            } finally {
                topUpCall.remove()
            }
        }

        private fun notifyEmptyPage(word: String?) {
            val now = System.currentTimeMillis()
            synchronized(BookmarkThreshold) {
                if (word != null && word == lastEmptyWord && now - lastEmptyAt < EMPTY_TOAST_INTERVAL_MS) {
                    return
                }
                lastEmptyWord = word
                lastEmptyAt = now
            }
            val context = AiDetectionHelper.getContext() ?: return
            Handler(Looper.getMainLooper()).post { runCatching { showEmptyToast(context) } }
        }

        /**
         * The platform toast clips a long line to whatever the system's own layout allows, which is
         * what left the hint cut off mid-sentence. This one carries its own view: centred, capped at
         * two lines, and no wider than most of the screen.
         */
        @Suppress("DEPRECATION")
        private fun showEmptyToast(context: Context) {
            val density = context.resources.displayMetrics.density
            fun dp(value: Float) = (value * density).toInt()
            val view = TextView(context).apply {
                text = Strings.bookmarkThresholdEmpty
                setTextColor(Color.WHITE)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f)
                gravity = Gravity.CENTER
                maxLines = 2
                maxWidth = (context.resources.displayMetrics.widthPixels * 0.78f).toInt()
                setPadding(dp(20f), dp(14f), dp(20f), dp(14f))
                background = GradientDrawable().apply {
                    cornerRadius = dp(16f).toFloat()
                    setColor(0xF0202124.toInt())
                }
            }
            Toast(context.applicationContext).apply {
                duration = Toast.LENGTH_LONG
                this.view = view
            }.show()
        }

        private inline fun JSONArray.forEachObject(action: (JSONObject) -> Unit) {
            for (index in 0 until length()) {
                optJSONObject(index)?.let(action)
            }
        }

        private fun Response.withBody(text: String, contentType: okhttp3.MediaType?): Response =
            newBuilder()
                .removeHeader("Content-Length")
                .removeHeader("Content-Encoding")
                .body(text.toResponseBody(contentType))
                .build()
    }

    private fun prefs(context: Context) =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
}
