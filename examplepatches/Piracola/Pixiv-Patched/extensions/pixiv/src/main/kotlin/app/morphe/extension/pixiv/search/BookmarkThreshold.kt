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
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Protocol
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
import kotlin.math.ceil
import kotlin.math.floor
import kotlin.math.max

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
 *
 * A fixed count means something different for every keyword - 500 is most of a popular tag and none
 * of a quiet one - so the floor can also be a share of the counts the search has shown so far.
 */
object BookmarkThreshold {

    /** Offered as one-tap choices in the picker. Any count up to [MAX_FLOOR] can be typed instead. */
    val PRESETS = listOf(
        0,
        100, 200, 300, 400, 500, 600, 700, 800, 900, 1000,
        1200, 1400, 1600, 1800, 2000
    )

    const val MAX_FLOOR = 999_999

    const val MODE_ABSOLUTE = 0
    const val MODE_PERCENTILE = 1

    /** The shares of a search's own counts the picker offers, tightest first. */
    val PERCENTILES = listOf(5, 10, 25, 50)

    private const val DEFAULT_PERCENT = 10

    /** The ends of the share the picker accepts when it is typed rather than tapped. */
    const val MIN_PERCENT = 1
    const val MAX_PERCENT = 90

    /** The fill budgets the picker offers, in milliseconds; 0 filters each page as it arrives. */
    val FILL_BUDGETS = listOf(0, 1000, 2000, 3000, 5000)

    private const val DEFAULT_FILL_BUDGET_MS = 2000

    /** A top-up is typed in whole seconds, between off and this. */
    const val MAX_FILL_SECONDS = 10

    private const val MAX_FILL_BUDGET_MS = MAX_FILL_SECONDS * 1000

    /**
     * Where a share of a search is allowed to settle. The bottom of a list is mostly works without
     * any bookmarks at all, so a share read that far down would keep them.
     */
    private const val LOWER_BOUND = 100

    /**
     * How many counts a share is read off before it is trusted. A page holds thirty, so this is two
     * pages: below it the sample describes the top of the list rather than the list, and the floor
     * would move with every page that lands.
     */
    private const val MIN_SAMPLES = 60

    /** [FilteredWorks] keeps its own cap; stopping here first keeps a wide page off the heap. */
    private const val MAX_RECORDED_DROPS = 200

    /** The endpoints whose items carry a bookmark count, and where those items sit in the payload. */
    private val ITEMS_KEYS = mapOf(
        "/v1/search/illust" to "illusts",
        "/v1/search/novel" to "novels"
    )

    private const val PREFS_NAME = "pixiv_search_ranking_prefs"
    private const val KEY_FLOOR = "bookmark_floor"
    private const val KEY_MODE = "bookmark_floor_mode"
    private const val KEY_PERCENT = "bookmark_floor_percent"
    private const val KEY_FILL_BUDGET = "bookmark_fill_budget_ms"

    private const val API_ORIGIN = "https://app-api.pixiv.net/"

    /** What both search endpoints answer with, and what a page rebuilt from the cache presents. */
    private val JSON_CONTENT_TYPE = "application/json".toMediaType()

    private const val MAX_PARALLEL_PAGES = 4

    private const val MIN_PAGE_BUDGET_MS = 220L

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

    private val warm = AtomicBoolean(false)

    /**
     * The fixed floor, in works; 0 is off. The count and the share answer the same question, so at
     * most one of them is set: choosing a share clears this one, and choosing a count above 0 clears
     * the share.
     */
    @Volatile
    var current: Int = 0
        private set

    /** Whether the share is on. [MODE_ABSOLUTE] means no share, whatever [current] holds. */
    @Volatile
    var mode: Int = MODE_ABSOLUTE
        private set

    @Volatile
    var percentile: Int = DEFAULT_PERCENT
        private set

    /** How long all borrowing may take, counted from the first page; 0 filters pages as they arrive. */
    @Volatile
    var fillBudgetMs: Int = DEFAULT_FILL_BUDGET_MS
        private set

    /**
     * The signature of the search the floor was last resolved for. Only the settings row reads it:
     * the floor itself is resolved from the signature of the request at hand, never from this.
     */
    @Volatile
    private var lastSignature: String? = null

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
     * which is most of the default budget gone before a single page is even asked for. This asks the
     * host for its root, which is a few hundred bytes, and keeps the connection: the answer itself
     * is thrown away.
     */
    private fun warmUp() {
        if (!warm.compareAndSet(false, true)) return
        // A thread of its own rather than one from [pool]: a top-up asks the pool for all
        // [MAX_PARALLEL_PAGES] pages at once, so warming the connection on one of them left the last
        // borrowed page waiting behind the handshake until the whole fill ran out of budget.
        Thread {
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
        }.apply {
            name = "pixiv-bookmark-warm"
            isDaemon = true
        }.start()
    }

    fun ensureLoaded() {
        if (loaded) return
        val context = AiDetectionHelper.getContext() ?: return
        synchronized(BookmarkThreshold) {
            if (loaded) return
            val store = prefs(context)
            current = store.getInt(KEY_FLOOR, 0).coerceIn(0, MAX_FLOOR)
            // An install that predates the share mode has no mode stored, and absolute is what such
            // an install already does: the default is what keeps an upgrade from changing anything.
            mode = if (store.getInt(KEY_MODE, MODE_ABSOLUTE) == MODE_PERCENTILE) {
                MODE_PERCENTILE
            } else {
                MODE_ABSOLUTE
            }
            percentile = store.getInt(KEY_PERCENT, DEFAULT_PERCENT)
                .takeIf { it in MIN_PERCENT..MAX_PERCENT } ?: DEFAULT_PERCENT
            fillBudgetMs = store.getInt(KEY_FILL_BUDGET, DEFAULT_FILL_BUDGET_MS)
                .takeIf { it in 0..MAX_FILL_BUDGET_MS } ?: DEFAULT_FILL_BUDGET_MS
            // The count and the share used to share one store, so an install from before the split
            // can hold both. The share was the one in use, and dropping the count keeps the two rows
            // from claiming a value at the same time.
            if (mode == MODE_PERCENTILE) current = 0
            loaded = true
        }
    }

    /**
     * Picks a fixed count. Choosing a count turns the share off, because the two describe the same
     * shelf. Picking 0 only clears this row: it is not a request to start filtering by the share.
     */
    fun setFloor(context: Context?, floor: Int) {
        current = floor.coerceIn(0, MAX_FLOOR)
        if (current > 0) mode = MODE_ABSOLUTE
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching {
            prefs(target).edit().putInt(KEY_FLOOR, current).putInt(KEY_MODE, mode).apply()
        }
    }

    /** Picks a share. The count is cleared with it, so the two rows never both show a value. */
    fun setPercentile(context: Context?, percent: Int) {
        percentile = if (percent in MIN_PERCENT..MAX_PERCENT) percent else DEFAULT_PERCENT
        mode = MODE_PERCENTILE
        current = 0
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching {
            prefs(target).edit()
                .putInt(KEY_PERCENT, percentile)
                .putInt(KEY_MODE, mode)
                .putInt(KEY_FLOOR, current)
                .apply()
        }
    }

    /** Turns the share off. The count is left as it is, so the other row keeps what it showed. */
    fun clearPercentile(context: Context?) {
        mode = MODE_ABSOLUTE
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching {
            // The count is written back too, and it is 0 whenever the share was on: an install from
            // before the split can still hold the count it had under the share, and leaving it in
            // the prefs would let that count reappear after the next start.
            prefs(target).edit().putInt(KEY_MODE, mode).putInt(KEY_FLOOR, current).apply()
        }
    }

    /** How long a top-up may take; 0 leaves the page as far as the filter left it. */
    fun setFillBudget(context: Context?, milliseconds: Int) {
        fillBudgetMs = if (milliseconds in 0..MAX_FILL_BUDGET_MS) {
            milliseconds
        } else {
            DEFAULT_FILL_BUDGET_MS
        }
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching {
            prefs(target).edit().putInt(KEY_FILL_BUDGET, fillBudgetMs).apply()
        }
    }

    /**
     * The floor the share mode would apply to the search read last, for the settings row.
     *
     * Answered from the cache, so opening the settings page asks Pixiv for nothing. Null when the
     * mode is absolute, when no filtered search has run in this process, or when none of that
     * search is still held: the row then shows the share alone rather than a number that describes
     * nothing.
     */
    fun resolvedFloorPreview(): Int? {
        if (mode != MODE_PERCENTILE) return null
        val signature = lastSignature ?: return null
        val samples = PageCache.samples(signature)
        // Below the sample floor the share is not being computed at all, and showing the fallback
        // would dress a constant up as a measurement.
        if (samples.size < MIN_SAMPLES) return null
        return floorOf(samples, percentile)
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

    /** One borrowed page in flight, with the call that can be dropped when nobody wants it. */
    private class Fill(
        val call: Call,
        val future: Future<PageCache.Page?>,
        val offset: Int?,
        val search: String
    )

    private class BookmarkThresholdInterceptor : Interceptor {

        override fun intercept(chain: Interceptor.Chain): Response {
            val request = chain.request()
            if (topUpCall.get() == true) return chain.proceed(request)
            ensureLoaded()
            val itemsKey = ITEMS_KEYS[request.url.encodedPath] ?: return chain.proceed(request)
            val floor = floorFor(request.url) ?: return chain.proceed(request)
            warmUp()

            // A page read a few minutes ago is still the same page, and answering from it saves the
            // round trip the fill would otherwise spend before it can borrow anything. The first page
            // is the exception: it is what a pull to refresh asks for again, and handing back a copy
            // of the list the screen already shows is indistinguishable from a refresh that failed.
            if (!isFirstPage(request.url)) {
                val remembered = PageCache.load(request.url)
                if (remembered != null) {
                    val cached = runCatching { cachedResponse(request, remembered) }.getOrNull()
                    if (cached != null) {
                        return cached.filterByBookmarks(request, itemsKey, floor, fromNetwork = false)
                    }
                }
            }

            prefetchNextPage(request, itemsKey)
            return chain.proceed(request).filterByBookmarks(request, itemsKey, floor, fromNetwork = true)
        }

        /**
         * The floor this request is filtered by, or null when it goes through untouched.
         *
         * Resolved per request instead of held: a share is read off the pages read so far, so the
         * deeper the user is in the search, the more of it the floor describes. Pages already sent
         * keep the floor they were filtered with.
         */
        private fun floorFor(url: okhttp3.HttpUrl): Int? {
            val absolute = current
            val share = mode == MODE_PERCENTILE
            if (!share && absolute <= 0) return null
            val signature = PageCache.signature(url)
            // The settings row reads this back to show what the share resolves to on the search the
            // user is on; a search that was not filtered at all has no such number to show.
            lastSignature = signature
            return if (share) floorOf(PageCache.samples(signature), percentile) else absolute
        }

        /** The page a pull to refresh asks for again; see [intercept]. */
        private fun isFirstPage(url: okhttp3.HttpUrl): Boolean =
            (url.queryParameter("offset")?.toIntOrNull() ?: 0) <= 0

        /**
         * Which run of dropped works a page belongs to.
         *
         * A share cannot serve as that marker itself: it is re-read from the pages seen so far and
         * drifts a little with every page, so two pages of one search would look like two searches
         * and the list behind the button would be emptied as the user paged on.
         */
        private fun batchKey(floor: Int): String =
            if (mode == MODE_PERCENTILE) "pct:$percentile" else "abs:$floor"

        /**
         * A page that came out of the cache instead of off the wire.
         *
         * The app parses the body and the content type that says how; the connection bookkeeping
         * OkHttp fills in for a real exchange has no counterpart here, so the timestamps are the
         * moment the page was handed over.
         */
        private fun cachedResponse(request: Request, page: PageCache.Page): Response {
            val now = System.currentTimeMillis()
            return Response.Builder()
                .request(request)
                .protocol(Protocol.HTTP_1_1)
                .code(200)
                .message("OK")
                // The body's media type alone is not a header, and the app reads the header.
                .header("Content-Type", "application/json")
                .sentRequestAtMillis(now)
                .receivedResponseAtMillis(now)
                .body(page.payload().toResponseBody(JSON_CONTENT_TYPE))
                .build()
        }

        /**
         * Drops the works below [floor] from a search page.
         *
         * Pixiv answers the two search endpoints with thirty works per page and ignores their `size`
         * parameter, so a strict floor can leave a page with one work or none. Once the kept works
         * fall below half the page, the following pages are fetched and merged in until the page is
         * half full again, the list ends, or the fill budget runs out. The page's `next_url` then
         * points past everything merged in, so scrolling continues where the rewritten page ends.
         * A budget of 0 is the settings row's off: only the page that arrived is filtered.
         *
         * A work without a bookmark count is kept: only the two search endpoints reach this, both
         * always send `total_bookmarks`, so a missing one means an unexpected payload rather than a
         * work worth hiding.
         *
         * [fromNetwork] marks a page that just arrived from Pixiv rather than one rebuilt from the
         * cache: only a fresh page is worth keeping, because storing a cached one again would keep
         * refreshing the age of a list that is only getting older.
         */
        private fun Response.filterByBookmarks(
            request: Request,
            itemsKey: String,
            floor: Int,
            fromNetwork: Boolean
        ): Response {
            val contentType = body?.contentType()
            val text = body?.string() ?: return this

            val root = runCatching { JSONObject(text) }.getOrNull() ?: return withBody(text, contentType)
            val container = root.optJSONObject("body") ?: root
            val items = container.optJSONArray(itemsKey) ?: return withBody(text, contentType)
            val raw = ArrayList<JSONObject>(items.length())
            items.forEachObject { raw.add(it) }

            // Kept before the floor is applied: what is stored is what Pixiv sent, so a floor chosen
            // later re-filters this page instead of buying it again.
            if (fromNetwork) {
                PageCache.store(request.url, root, itemsKey, raw, container.opt("next_url") as? String)
            }

            val dropped = ArrayList<JSONObject>()
            val kept = raw.filterTo(ArrayList(raw.size)) { item ->
                val bookmarks = item.opt("total_bookmarks")
                if (bookmarks !is Number || bookmarks.toInt() >= floor) {
                    true
                } else {
                    if (dropped.size < MAX_RECORDED_DROPS) dropped.add(item)
                    false
                }
            }
            if (kept.size == raw.size) {
                dropPrefetched()
                return withBody(text, contentType)
            }
            if (kept.size * 2 < raw.size) {
                val filled = topUp(request, itemsKey, floor, container, kept, raw.size / 2, raw.size, dropped)
                if (filled != null) container.put("next_url", filled)
            } else {
                dropPrefetched()
            }
            if (kept.isEmpty()) notifyEmptyPage(request.url.queryParameter("word"))
            // What this page turned away is the only way the user can tell a quiet search from a
            // strict floor; the response itself is unchanged.
            if (dropped.isNotEmpty()) {
                FilteredWorks.record(
                    word = request.url.queryParameter("word"),
                    floor = floor,
                    novel = itemsKey == "novels",
                    groupKey = batchKey(floor),
                    dropped = dropped,
                    // A page from the cache is the same page the list already holds: it may add to
                    // the list, but it is not news, and re-timing the button on it kept that button
                    // on screen for as long as the user kept scrolling back over pages already read.
                    show = fromNetwork
                )
            }

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
         *
         * Whatever a borrowed page loses to the floor joins [dropped]: a page borrowed because the
         * asked-for one came back nearly empty is exactly the page whose works the user wants to
         * know about.
         */
        private fun topUp(
            request: Request,
            itemsKey: String,
            floor: Int,
            container: JSONObject,
            kept: MutableList<JSONObject>,
            target: Int,
            pageSize: Int,
            dropped: MutableList<JSONObject>
        ): Any? {
            // Read once: the budget can change on the settings page while a fill is in flight.
            val budget = fillBudgetMs
            if (budget <= 0) return null
            val firstNext = container.opt("next_url") as? String ?: return null
            val seen = kept.mapNotNullTo(HashSet()) { it.opt("id")?.toString() }
            val deadline = System.currentTimeMillis() + budget
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
                val arrived = arrayOfNulls<PageCache.Page>(fills.size)
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
                        if (bookmarks is Number && bookmarks.toInt() < floor) {
                            if (dropped.size < MAX_RECORDED_DROPS) dropped.add(item)
                            return@forEach
                        }
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
            dropPrefetched()
            // With the fill off nothing ever borrows this page, so asking for it would be a request
            // the user pays for and never sees.
            if (fillBudgetMs <= 0) return
            val url = request.url
            if (url.queryParameter("offset") != null) return
            val next = url.newBuilder().setQueryParameter("offset", PAGE_STRIDE.toString()).build()
            prefetched = startFill(request, next.toString(), itemsKey, searchKey(url))
        }

        private fun dropPrefetched() {
            val fill = prefetched ?: return
            prefetched = null
            runCatching { fill.call.cancel() }
        }

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

        private fun readPage(call: Call, itemsKey: String): PageCache.Page? {
            val url = call.request().url
            // A page borrowed before - by the prefetch of this one, by an earlier fill of the same
            // search - is already here, and a borrowed page is only wanted quickly.
            PageCache.load(url)?.let { return it }
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
                    return PageCache.store(url, root, itemsKey, list, body.opt("next_url") as? String)
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

    /**
     * The floor a share of the search resolves to.
     *
     * Pixiv sends no "top 10% of this search" and refuses to filter by one, so the cut has to be
     * read off the counts of the works already read. Below [MIN_SAMPLES] there is not enough of a
     * distribution to read, and the floor stays at [LOWER_BOUND] - not off, because a share the user
     * asked for should still be doing something.
     *
     * Interpolated between the neighbouring counts and rounded down, so that one more work at the
     * boundary moves the floor by less than a whole work.
     */
    private fun floorOf(samples: List<Int>, percent: Int): Int {
        if (samples.size < MIN_SAMPLES) return LOWER_BOUND
        val sorted = samples.sorted()
        val position = (sorted.size - 1) * (100 - percent) / 100.0
        val lower = floor(position).toInt().coerceIn(0, sorted.lastIndex)
        val upper = ceil(position).toInt().coerceIn(0, sorted.lastIndex)
        val low = sorted[lower]
        val value = low + (sorted[upper] - low) * (position - lower)
        return max(LOWER_BOUND, floor(value).toInt())
    }

    private fun prefs(context: Context) =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
}
