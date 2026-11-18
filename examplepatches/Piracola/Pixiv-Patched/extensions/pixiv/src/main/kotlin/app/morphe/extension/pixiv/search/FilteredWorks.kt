package app.morphe.extension.pixiv.search

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.Rect
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.text.TextUtils
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import app.morphe.extension.pixiv.aiflag.AiDetectionHelper
import app.morphe.extension.pixiv.ui.PageHost
import app.morphe.extension.pixiv.ui.Strings
import java.lang.ref.WeakReference
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.Executors
import org.json.JSONObject

/**
 * Keeps the works the bookmark floor threw away and lists them behind a small button on the screen
 * that lost them.
 *
 * A filter is only useful while the user can see what it took out: a count of the works under a
 * threshold is the difference between "this tag is quiet" and "this tag is quiet at 500+". Nothing
 * here is persisted - the list belongs to the search that is on screen, and a list left over from
 * another keyword would describe something the heading above it no longer says.
 */
internal object FilteredWorks {

    /** Five search pages worth, which is more than a session of paging ever shows at once. */
    private const val MAX_WORKS = 200

    /** The button answers "what did I just miss?" while the grid is live, then gets out of the way. */
    private const val VISIBLE_MILLIS = 30_000L
    private const val FADE_MILLIS = 160L

    private const val FAB_SIZE_DP = 48f
    private const val FAB_LEFT_DP = 16f

    /** Clears the bottom bar without sitting on the last row of the grid. */
    private const val FAB_BOTTOM_DP = 96f

    private const val ROW_THUMB_DP = 48f

    private const val TAG_COUNT = "morphe_filtered_count"

    private const val ILLUST_DETAIL_ACTIVITY =
        "jp.pxv.android.feature.illustviewer.detail.IllustDetailSingleActivity"

    private const val NOVEL_DETAIL_ACTIVITY =
        "jp.pxv.android.feature.novelviewer.noveltext.NovelTextActivity"

    private class Work(
        val id: Long,
        val novel: Boolean,
        val title: String,
        val author: String,
        val thumbnail: String,
        val bookmarks: Int
    )

    private class Snapshot(
        val word: String,
        val floor: Int,
        val groupKey: String,
        val works: List<Work>
    )

    private class Row(val view: View, val thumbnail: ImageView)

    /** A thumbnail that is fetched once its row has been on screen, not when the page is built. */
    private class Thumb(val row: View, val target: ImageView, val url: String) {
        var requested = false
    }

    private val lock = Any()

    @Volatile
    private var snapshot = Snapshot("", 0, "", emptyList())

    private val main = Handler(Looper.getMainLooper())

    private val autoReveal = Runnable { reveal() }
    private val autoHide = Runnable { hide() }
    private val autoBadge = Runnable { button?.get()?.let { bindCount(it) } }

    /** Weak, so a dismissed activity is not kept alive by the button that was last shown over it. */
    private var button: WeakReference<View>? = null
    private var buttonActivity: WeakReference<Activity>? = null

    /** The activity the app reported as resumed; only the lifecycle callbacks below write it. */
    private var rememberedActivity: WeakReference<Activity>? = null

    private val lifecycleLock = Any()
    private var followingLifecycle = false

    /** Main-thread clock of the last reveal: tells an abandoned fade from one that was overtaken. */
    private var revealedAt = 0L

    private val imagePool = Executors.newFixedThreadPool(3) { runnable ->
        Thread(runnable, "pixiv-filtered-thumbs").apply { isDaemon = true }
    }

    private val thumbCache = object : LinkedHashMap<String, Bitmap>(24, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, Bitmap>?) = size > 48
    }

    /**
     * Takes the works one search page lost. Called from the interceptor's thread, once per page.
     *
     * [groupKey] is what tells two pages of one search apart from two searches: a share of the
     * search's own counts is re-read from every page and drifts by a count or two as pages land, so
     * a batch keyed on the floor would look like a new search on each page. [floor] is then only the
     * number the subtitle shows.
     *
     * [show] is false for a page handed over from the cache. Such a page adds nothing the list does
     * not already hold, and restarting the button's countdown on it would keep the button on screen
     * for as long as the user kept scrolling back.
     *
     * Safe to call from any thread: the batch is published under a lock and everything that touches
     * a view is posted to the main looper.
     */
    @JvmStatic
    fun record(
        word: String?,
        floor: Int,
        novel: Boolean,
        groupKey: String,
        dropped: List<JSONObject>,
        show: Boolean = true
    ) {
        if (dropped.isEmpty()) return
        val keyword = word.orEmpty().trim()
        val incoming = ArrayList<Work>(dropped.size)
        for (item in dropped) {
            val work = parse(item, novel)
            if (work.id != 0L) incoming.add(work)
        }
        if (incoming.isEmpty()) return

        synchronized(lock) {
            val previous = snapshot
            val merged = LinkedHashMap<Long, Work>(incoming.size * 2)
            for (work in incoming) merged[work.id] = work
            // Pages of the same search add up to one list; a new keyword or a new batch starts over,
            // or the works under the heading would no longer be the ones that heading describes.
            if (previous.word == keyword && previous.groupKey == groupKey) {
                for (work in previous.works) if (!merged.containsKey(work.id)) merged[work.id] = work
            }
            snapshot = Snapshot(keyword, floor, groupKey, merged.values.take(MAX_WORKS))
        }
        main.post(if (show) autoReveal else autoBadge)
    }

    /**
     * The shortest payload of the two search endpoints, read without throwing: a work that arrives
     * without an id is dropped further up, because there is no screen to open for it.
     */
    private fun parse(item: JSONObject, novel: Boolean): Work {
        val images = item.optJSONObject("image_urls")
        val user = item.optJSONObject("user")
        val square = images?.optString("square_medium").orEmpty()
        return Work(
            id = item.optLong("id", 0L),
            novel = novel,
            title = item.optString("title"),
            author = user?.optString("name").orEmpty(),
            thumbnail = square.ifBlank { images?.optString("medium").orEmpty() },
            bookmarks = item.optInt("total_bookmarks", 0)
        )
    }

    private fun reveal() {
        val activity = currentActivity() ?: return
        val fab = attach(activity) ?: return
        bindCount(fab)
        revealedAt = SystemClock.uptimeMillis()
        fab.animate().alpha(1f).setDuration(FADE_MILLIS).start()
        main.removeCallbacks(autoHide)
        main.postDelayed(autoHide, VISIBLE_MILLIS)
    }

    private fun attach(activity: Activity): View? {
        val existing = button?.get()
        if (existing != null && buttonActivity?.get() === activity && existing.parent != null) {
            return existing
        }
        detach()
        val decor = activity.window?.decorView as? ViewGroup ?: return null
        val fab = buildButton(activity)
        fab.alpha = 0f
        decor.addView(
            fab,
            FrameLayout.LayoutParams(dp(activity, FAB_SIZE_DP), dp(activity, FAB_SIZE_DP)).apply {
                gravity = Gravity.BOTTOM or Gravity.START
                leftMargin = dp(activity, FAB_LEFT_DP)
                marginStart = leftMargin
                bottomMargin = dp(activity, FAB_BOTTOM_DP)
            }
        )
        button = WeakReference(fab)
        buttonActivity = WeakReference(activity)
        return fab
    }

    private fun hide() {
        val at = revealedAt
        val fab = button?.get() ?: return
        fab.animate().alpha(0f).setDuration(FADE_MILLIS).withEndAction {
            // A page that arrived while the button faded has re-shown it already: the same view now
            // carries a newer result, and taking it off the screen would hide a current count.
            if (revealedAt != at) return@withEndAction
            (fab.parent as? ViewGroup)?.removeView(fab)
        }.start()
    }

    private fun detach() {
        main.removeCallbacks(autoHide)
        val fab = button?.get()
        button = null
        buttonActivity = null
        (fab?.parent as? ViewGroup)?.removeView(fab)
    }

    private fun bindCount(fab: View) {
        val badge = fab.findViewWithTag<TextView>(TAG_COUNT) ?: return
        badge.text = countLabel(snapshot.works.size)
    }

    /**
     * The count as the badge and the subtitle both show it. A list that has reached [MAX_WORKS] no
     * longer grows, so its size would claim the search lost exactly that many and no more.
     */
    private fun countLabel(size: Int): String = if (size >= MAX_WORKS) "$MAX_WORKS+" else size.toString()

    private fun buildButton(context: Context): View {
        val size = dp(context, FAB_SIZE_DP)
        val fab = FrameLayout(context).apply {
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(0xA6000000.toInt())
                setStroke(Math.max(1, dp(context, 1f)), 0x33FFFFFF)
            }
            elevation = dp(context, 6f).toFloat()
            contentDescription = Strings.filteredWorksTitle
        }
        fab.addView(
            FunnelIcon(context),
            FrameLayout.LayoutParams(size / 2, size / 2).apply { gravity = Gravity.CENTER }
        )
        fab.addView(
            TextView(context).apply {
                tag = TAG_COUNT
                textSize = 10f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(Color.WHITE)
                gravity = Gravity.CENTER
                includeFontPadding = false
                maxLines = 1
                minWidth = dp(context, 18f)
                setPadding(dp(context, 4f), 0, dp(context, 4f), 0)
                background = GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    setColor(0xFFDC2626.toInt())
                    cornerRadius = dp(context, 9f).toFloat()
                }
                layoutParams = FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    dp(context, 18f)
                ).apply { gravity = Gravity.BOTTOM or Gravity.END }
            }
        )
        fab.setOnClickListener { openPage(fab) }
        return fab
    }

    private fun openPage(anchor: View) {
        hide()
        // The page is built by whoever ends up owning it: from the search grid there is no host yet,
        // and the host that opens here builds its first page itself, so a page built before that
        // call would be a second copy of the whole list, thrown away before it was ever shown.
        var hosted = false
        PageHost.open(anchor) { activity ->
            hosted = true
            buildPage(activity)
        }
        if (!hosted) PageHost.push(buildPage(anchor.context))
    }

    private fun buildPage(context: Context): View {
        val palette = Palette(context)
        val shown = snapshot
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(palette.background)
            layoutParams = FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
            )
        }
        root.addView(buildToolbar(context, palette, shown))
        root.addView(buildList(context, palette, shown))
        return root
    }

    private fun buildToolbar(context: Context, palette: Palette, shown: Snapshot): View =
        LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setBackgroundColor(palette.card)
            val horizontal = dp(context, 16f)
            setPadding(horizontal, 0, horizontal, 0)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                dp(context, 56f)
            )
            addView(
                TextView(context).apply {
                    text = "←"
                    textSize = 24f
                    setTextColor(palette.primary)
                    setPadding(0, 0, dp(context, 14f), 0)
                    setOnClickListener { PageHost.pop() }
                }
            )
            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    addView(
                        TextView(context).apply {
                            text = Strings.filteredWorksTitle
                            textSize = 18f
                            typeface = Typeface.DEFAULT_BOLD
                            setTextColor(palette.primary)
                        }
                    )
                    addView(
                        TextView(context).apply {
                            text = subtitle(shown)
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                            maxLines = 1
                            ellipsize = TextUtils.TruncateAt.END
                        }
                    )
                }
            )
        }

    private fun subtitle(shown: Snapshot): String {
        val parts = ArrayList<String>(3)
        if (shown.word.isNotBlank()) parts.add("「${shown.word}」")
        parts.add(Strings.filteredWorksFloor(shown.floor))
        parts.add(Strings.filteredWorksCount(countLabel(shown.works.size)))
        return parts.joinToString(" · ")
    }

    private fun buildList(context: Context, palette: Palette, shown: Snapshot): View {
        val column = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(context, 16f), dp(context, 8f), dp(context, 16f), dp(context, 24f))
        }
        val pending = ArrayList<Thumb>(shown.works.size)

        if (shown.works.isNotEmpty()) {
            val card = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                background = GradientDrawable().apply {
                    setColor(palette.card)
                    cornerRadius = dp(context, 10f).toFloat()
                }
                // The rows and the dividers between them are square, so they are clipped to the radius.
                clipToOutline = true
                setPadding(0, dp(context, 4f), 0, dp(context, 4f))
            }
            shown.works.forEachIndexed { index, work ->
                if (index > 0) card.addView(divider(context, palette))
                val row = workRow(context, palette, work)
                card.addView(row.view)
                pending.add(Thumb(row.view, row.thumbnail, work.thumbnail))
            }
            column.addView(card)
        } else {
            column.addView(
                TextView(context).apply {
                    text = Strings.filteredWorksEmpty
                    textSize = 13f
                    setTextColor(palette.secondary)
                    setPadding(dp(context, 4f), dp(context, 8f), dp(context, 4f), dp(context, 12f))
                }
            )
        }

        val list = ScrollView(context).apply {
            setBackgroundColor(palette.background)
            addView(column)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                0,
                1f
            )
        }

        // The row's own size, not a multiple of it: the sampler steps in powers of two, so asking for
        // twice the row would still decode the full file and keep four times the pixels on the heap.
        val side = dp(context, ROW_THUMB_DP)
        val visible = Rect()
        fun loadVisible() {
            for (thumb in pending) {
                if (thumb.requested || thumb.url.isBlank()) continue
                if (!thumb.row.getLocalVisibleRect(visible)) continue
                thumb.requested = true
                loadThumb(thumb.url, thumb.target, side)
            }
        }
        // Every row exists from the first frame, but a page of two hundred rows would ask for two
        // hundred thumbnails at once, most of them for rows nobody scrolls to.
        list.viewTreeObserver.addOnScrollChangedListener { loadVisible() }
        list.post { loadVisible() }
        return list
    }

    private fun workRow(context: Context, palette: Palette, work: Work): Row {
        val thumbnail = ImageView(context).apply {
            val side = dp(context, ROW_THUMB_DP)
            layoutParams = LinearLayout.LayoutParams(side, side)
            scaleType = ImageView.ScaleType.CENTER_CROP
            background = GradientDrawable().apply {
                cornerRadius = dp(context, 6f).toFloat()
                setColor(palette.divider)
            }
        }
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(context, 16f), dp(context, 10f), dp(context, 16f), dp(context, 10f))
            setOnClickListener { openDetail(context, work) }
            addView(thumbnail)
            addView(
                LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    setPadding(dp(context, 12f), 0, dp(context, 8f), 0)
                    layoutParams = LinearLayout.LayoutParams(
                        0,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        1f
                    )
                    addView(
                        TextView(context).apply {
                            text = work.title.ifBlank { "#${work.id}" }
                            textSize = 14f
                            setTextColor(palette.primary)
                            maxLines = 1
                            ellipsize = TextUtils.TruncateAt.END
                        }
                    )
                    addView(
                        TextView(context).apply {
                            text = "${work.author.ifBlank { "—" }} · ♡ ${work.bookmarks}"
                            textSize = 11f
                            setTextColor(palette.secondary)
                            setPadding(0, dp(context, 2f), 0, 0)
                            maxLines = 1
                            ellipsize = TextUtils.TruncateAt.END
                        }
                    )
                }
            )
        }
        return Row(row, thumbnail)
    }

    private fun divider(context: Context, palette: Palette): View =
        View(context).apply {
            setBackgroundColor(palette.divider)
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(context, 0.5f))
            )
        }

    private fun loadThumb(url: String, target: ImageView, side: Int) {
        synchronized(thumbCache) { thumbCache[url] }?.let {
            target.setImageBitmap(it)
            return
        }
        imagePool.execute {
            val bitmap = download(url, side) ?: return@execute
            synchronized(thumbCache) { thumbCache[url] = bitmap }
            target.post { target.setImageBitmap(bitmap) }
        }
    }

    /**
     * i.pximg.net only serves a thumbnail to a request that comes from the site, and a row is a
     * fraction of the size the file decodes to, so the bitmap is sampled down on the way in rather
     * than kept at the size the endpoint happens to offer.
     */
    private fun download(url: String, side: Int): Bitmap? = runCatching {
        val connection = (URL(url).openConnection() as HttpURLConnection).apply {
            connectTimeout = 8000
            readTimeout = 8000
            setRequestProperty("Referer", "https://www.pixiv.net/")
        }
        val bytes = connection.inputStream.use { it.readBytes() }
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeByteArray(bytes, 0, bytes.size, bounds)
        var sample = 1
        while (bounds.outWidth / (sample * 2) >= side) sample *= 2
        BitmapFactory.decodeByteArray(
            bytes,
            0,
            bytes.size,
            BitmapFactory.Options().apply { inSampleSize = sample }
        )
    }.getOrNull()

    /**
     * The detail screens take a work id of their own, so a row opens the work straight away. The
     * router is left out on purpose: it resolves the link on the launch screen, which is a
     * full-screen flash of the splash artwork on the way to every work.
     */
    private fun openDetail(context: Context, work: Work) {
        val intent = Intent().apply {
            setClassName(
                context.packageName,
                if (work.novel) NOVEL_DETAIL_ACTIVITY else ILLUST_DETAIL_ACTIVITY
            )
            if (work.novel) putExtra("NOVEL_ID", work.id) else putExtra("ILLUST_ID", work.id)
            if (context !is Activity) addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        runCatching { context.startActivity(intent) }
    }

    /**
     * The activity the search is drawn in.
     *
     * The app's own lifecycle is the reliable source: this code arrives from the interceptor's thread
     * with nothing but JSON, has no activity of its own, and no hook on the search screen hands it a
     * view to climb up from - but the application context is enough to follow which activity is
     * resumed. The platform only reports transitions from the moment a handler is registered, so an
     * activity that was already on screen when the first filtered page arrived is invisible to it;
     * for that first page, and for a context that turns out not to be an [Application], the running
     * activities `ActivityThread` records are read instead.
     */
    private fun currentActivity(): Activity? {
        followLifecycle()
        rememberedActivity?.get()?.let { if (alive(it)) return it }
        return resumedActivity()
    }

    private fun alive(activity: Activity): Boolean =
        !activity.isFinishing && !activity.isDestroyed && activity.window != null

    private fun followLifecycle() {
        if (followingLifecycle) return
        synchronized(lifecycleLock) {
            if (followingLifecycle) return
            val application = AiDetectionHelper.getContext() as? Application ?: return
            application.registerActivityLifecycleCallbacks(object :
                Application.ActivityLifecycleCallbacks {
                override fun onActivityResumed(activity: Activity) {
                    rememberedActivity = WeakReference(activity)
                }

                override fun onActivityPaused(activity: Activity) {
                    if (rememberedActivity?.get() === activity) rememberedActivity = null
                }

                override fun onActivityCreated(activity: Activity, state: Bundle?) = Unit
                override fun onActivityStarted(activity: Activity) = Unit
                override fun onActivityStopped(activity: Activity) = Unit
                override fun onActivitySaveInstanceState(activity: Activity, state: Bundle) = Unit
                override fun onActivityDestroyed(activity: Activity) = Unit
            })
            followingLifecycle = true
        }
    }

    /** The fallback: unsupported, and silent when a build refuses it. */
    private fun resumedActivity(): Activity? {
        val access = threads ?: return null
        val records = runCatching { access.records.get(access.thread) as? Map<*, *> }.getOrNull() ?: return null
        var found: Activity? = null
        for (record in records.values) {
            if (record == null) continue
            val activity = runCatching { access.activity.get(record) as? Activity }.getOrNull() ?: continue
            val paused = runCatching { access.paused.getBoolean(record) }.getOrDefault(true)
            // The topmost one wins: records sit in the order the activities were created.
            if (!paused && alive(activity)) found = activity
        }
        return found
    }

    private class ThreadAccess(
        val thread: Any,
        val records: java.lang.reflect.Field,
        val activity: java.lang.reflect.Field,
        val paused: java.lang.reflect.Field
    )

    private val threads: ThreadAccess? by lazy {
        val threadClass = runCatching { Class.forName("android.app.ActivityThread") }.getOrNull()
            ?: return@lazy null
        val recordClass =
            runCatching { Class.forName("android.app.ActivityThread\$ActivityClientRecord") }
                .getOrNull() ?: return@lazy null
        val thread = runCatching { threadClass.getMethod("currentActivityThread").invoke(null) }
            .getOrNull() ?: return@lazy null
        fun field(type: Class<*>, name: String) = runCatching {
            type.getDeclaredField(name).apply { isAccessible = true }
        }.getOrNull()

        ThreadAccess(
            thread,
            field(threadClass, "mActivities") ?: return@lazy null,
            field(recordClass, "activity") ?: return@lazy null,
            field(recordClass, "paused") ?: return@lazy null
        )
    }

    /** The colours PatchedSettings draws its own page with; its palette is private, so they're repeated. */
    private class Palette(context: Context) {
        val dark = (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        val background = if (dark) 0xFF121212.toInt() else 0xFFF5F5F7.toInt()
        val card = if (dark) 0xFF1E1E1E.toInt() else 0xFFFFFFFF.toInt()
        val primary = if (dark) 0xFFEEEEEE.toInt() else 0xFF1F2937.toInt()
        val secondary = if (dark) 0xFF9E9E9E.toInt() else 0xFF6B7280.toInt()
        val divider = if (dark) 0xFF2D2D2D.toInt() else 0xFFE5E7EB.toInt()
    }

    private fun dp(context: Context, value: Float): Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP,
        value,
        context.resources.displayMetrics
    ).toInt()
}

/**
 * A funnel drawn from a 24x24 path, the shape the button stands for: everything that went through
 * the floor and did not come out.
 */
private class FunnelIcon(context: Context) : View(context) {

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL_AND_STROKE
        strokeWidth = 0.9f
        strokeJoin = Paint.Join.ROUND
        color = Color.WHITE
    }

    private val path = Path().apply {
        moveTo(3.5f, 4.5f)
        lineTo(20.5f, 4.5f)
        lineTo(14f, 12.5f)
        lineTo(14f, 19.5f)
        lineTo(10f, 17f)
        lineTo(10f, 12.5f)
        close()
    }

    override fun onDraw(canvas: Canvas) {
        val side = minOf(width, height).toFloat()
        if (side <= 0f) return
        val scale = side / VIEW_BOX
        canvas.save()
        canvas.translate((width - VIEW_BOX * scale) / 2f, (height - VIEW_BOX * scale) / 2f)
        canvas.scale(scale, scale)
        canvas.drawPath(path, paint)
        canvas.restore()
    }

    private companion object {
        const val VIEW_BOX = 24f
    }
}
