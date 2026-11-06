package app.morphe.extension.pixiv.viewer

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.Typeface
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.LayerDrawable
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.LruCache
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView
import java.lang.ref.WeakReference
import java.net.HttpURLConnection
import java.net.URL
import java.util.Collections
import java.util.WeakHashMap
import java.util.concurrent.Executors

object EnhancedViewerHelper {

    private const val TAG = "MorpheEnhancedViewer"
    private const val TAG_LOADING_BADGE = "morphe_hd_loading_badge"

    private const val KEY_ILLUST = "KEY_ILLUST"

    /** Captured by a caller that cannot tell which page the bitmap belongs to. */
    private const val UNKNOWN_PAGE = -1

    /** 64 MB of decoded placeholders; a 600x1200 preview decodes to ~2.9 MB. */
    private const val PLACEHOLDER_CACHE_SIZE = 64 * 1024 * 1024

    /** A full resolution image that never arrives (offline, slow network) must not spin forever. */
    private const val BADGE_TIMEOUT_MS = 8_000L

    /** A snapshot outlives its detail screen only long enough to survive the tap and the first layout. */
    private const val SNAPSHOT_TTL_NANOS = 30_000_000_000L

    /**
     * The bitmap the user is looking at when tapping the artwork, tagged with the page it shows.
     * It is consumed by the first fullscreen page that matches, so it can never be re-used for a
     * different page or a different work.
     */
    private class DetailSnapshot(
        val illust: Any?,
        /** Weak, so the snapshot never keeps Glide's bitmap alive just to recognise it again. */
        val sourceRef: WeakReference<Bitmap>?,
        val bitmap: Bitmap,
        val pageIndex: Int,
        val createdAtNanos: Long
    )

    @Volatile
    private var detailSnapshot: DetailSnapshot? = null

    /** Standard resolution previews keyed by URL, bounded by decoded size instead of entry count. */
    private val placeholderCache = object : LruCache<String, Bitmap>(PLACEHOLDER_CACHE_SIZE) {
        override fun sizeOf(key: String, value: Bitmap): Int = value.byteCount
    }

    /**
     * Items whose full resolution image already arrived: placeholders must never overwrite them.
     * Written by the onFullResLoaded hook and read by the placeholder path on another thread, so every
     * access goes through the synchronized wrapper. The keys must stay weak, or every visited page
     * would pin its own view tree for the lifetime of the process.
     */
    private val fullResLoadedViews: MutableSet<View> =
        Collections.synchronizedSet(Collections.newSetFromMap(WeakHashMap<View, Boolean>()))

    /** Pending badge timeouts by page, main thread only. */
    private class BadgeTimeout(val token: Long, val runnable: Runnable)

    private val badgeTimeouts = WeakHashMap<View, BadgeTimeout>()
    private var badgeToken = 0L

    private val executor = Executors.newFixedThreadPool(2)
    private val mainHandler = Handler(Looper.getMainLooper())

    // ------------------------------------------------------------------------
    // Detail view -> fullscreen hand-off
    // ------------------------------------------------------------------------

    /**
     * Hook: DetailImageViewHolder.bind$lambda$0(illust, holder, pageIndex, view).
     * The page index is the one the app itself forwards to the viewer as "KEY_POSITION".
     */
    @JvmStatic
    fun onDetailImageClicked(holder: Any?, illust: Any?, pageIndex: Int) {
        try {
            val imageView = getFieldValue(holder, "imageView") as? ImageView ?: return
            val bitmap = extractBitmap(imageView.drawable, imageView) ?: return
            if (bitmap.isRecycled) return
            val copy = copySnapshot(bitmap) ?: return
            detailSnapshot = DetailSnapshot(illust, null, copy, pageIndex, System.nanoTime())
            Log.i(TAG, "Captured ${copy.width}x${copy.height} for page $pageIndex")
        } catch (t: Throwable) {
            Log.e(TAG, "onDetailImageClicked failed", t)
        }
    }

    /**
     * Entry point used by the AI banner patch, which only sees the detail screen's first image view.
     * The page is therefore unknown and the bitmap is only trusted for single page works.
     */
    @JvmStatic
    fun setCachedDetailBitmap(bitmap: Bitmap?, illust: Any?, pageIndex: Int = UNKNOWN_PAGE) {
        if (bitmap == null || bitmap.isRecycled) return
        val existing = detailSnapshot
        // The caller re-runs this on every layout pass of the same drawable; re-copying it there
        // would allocate megabytes per pass.
        if (existing != null && existing.sourceRef?.get() === bitmap && existing.pageIndex == pageIndex &&
            !isSnapshotExpired(existing) && sameIllust(existing.illust, illust)
        ) {
            return
        }
        val copy = copySnapshot(bitmap) ?: return
        detailSnapshot = DetailSnapshot(illust, WeakReference(bitmap), copy, pageIndex, System.nanoTime())
    }

    private fun isSnapshotExpired(snapshot: DetailSnapshot): Boolean =
        System.nanoTime() - snapshot.createdAtNanos > SNAPSHOT_TTL_NANOS

    /**
     * The drawable's bitmap belongs to Glide: clearing the target can recycle it while the snapshot
     * still points at it, which surfaces as "Canvas: trying to use a recycled bitmap". Keep a copy
     * instead and let the original reference die with this call.
     */
    private fun copySnapshot(bitmap: Bitmap): Bitmap? {
        if (bitmap.isRecycled) return null
        return try {
            bitmap.copy(Bitmap.Config.ARGB_8888, false)
        } catch (t: Throwable) {
            Log.w(TAG, "Snapshot copy failed: ${t.message}")
            null
        }
    }

    private fun extractBitmap(drawable: Drawable?, view: ImageView? = null): Bitmap? {
        if (drawable == null && view == null) return null

        if (drawable is BitmapDrawable && drawable.bitmap != null && !drawable.bitmap.isRecycled) {
            return drawable.bitmap
        }

        if (drawable is LayerDrawable) {
            for (i in drawable.numberOfLayers - 1 downTo 0) {
                val b = extractBitmap(drawable.getDrawable(i))
                if (b != null) return b
            }
        }

        runCatching {
            val getDrawableMethod = drawable?.javaClass?.getMethod("getDrawable")
            val wrapped = getDrawableMethod?.invoke(drawable) as? Drawable
            if (wrapped != null) {
                val b = extractBitmap(wrapped)
                if (b != null) return b
            }
        }

        if (drawable != null) {
            runCatching {
                var c: Class<*>? = drawable.javaClass
                while (c != null && c != Any::class.java) {
                    for (f in c.declaredFields) {
                        if (Bitmap::class.java.isAssignableFrom(f.type)) {
                            f.isAccessible = true
                            val b = f.get(drawable) as? Bitmap
                            if (b != null && !b.isRecycled) return b
                        }
                    }
                    c = c.superclass
                }
            }
        }

        try {
            val w = if (view != null && view.width > 0) view.width else drawable?.intrinsicWidth ?: 0
            val h = if (view != null && view.height > 0) view.height else drawable?.intrinsicHeight ?: 0
            if (w > 0 && h > 0) {
                val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
                val canvas = Canvas(bmp)
                if (view != null && view.width > 0 && view.height > 0) {
                    view.draw(canvas)
                } else if (drawable != null) {
                    drawable.setBounds(0, 0, w, h)
                    drawable.draw(canvas)
                }
                return bmp
            }
        } catch (t: Throwable) {
            Log.w(TAG, "Failed drawing view to bitmap: ${t.message}")
        }

        return null
    }

    // ------------------------------------------------------------------------
    // Fullscreen page: placeholder + discreet loading badge
    // ------------------------------------------------------------------------

    /**
     * Hook: Lea4.instantiateItem(), after addView() and before the layout is returned.
     * The page index is the tag the adapter assigns to the photo view (setImageViewTag).
     */
    @JvmStatic
    fun onFullScreenItemCreated(layout: Any?, photoAttacher: Any?) {
        try {
            val itemView = layout as? ViewGroup ?: return
            val imageView = findPhotoView(itemView) ?: return
            val pageIndex = (imageView.tag as? Int) ?: 0
            val progressBar = findProgressBar(itemView)
            setupDiscreetLoadingBadge(itemView, itemView.context)

            val illust = currentIllust(itemView)

            // 1. The page the user is looking at: no network, no latency.
            val detailBitmap = takeDetailBitmap(illust, pageIndex)
            if (detailBitmap != null) {
                applyPlaceholder(itemView, imageView, photoAttacher, detailBitmap, progressBar)
                return
            }

            // 2. Any other page: its own standard resolution preview, never another page's bitmap.
            val url = standardResolutionUrl(illust, pageIndex)
            if (url == null) return

            val cached = placeholderCache.get(url)
            if (cached != null && !cached.isRecycled) {
                applyPlaceholder(itemView, imageView, photoAttacher, cached, progressBar)
            } else {
                fetchPlaceholder(itemView, imageView, photoAttacher, url, progressBar)
            }
        } catch (t: Throwable) {
            Log.e(TAG, "onFullScreenItemCreated failed", t)
        }
    }

    private fun takeDetailBitmap(illust: Any?, pageIndex: Int): Bitmap? {
        val snapshot = detailSnapshot ?: return null
        // A snapshot that outlived its detail screen keeps a full size bitmap alive for nothing.
        if (isSnapshotExpired(snapshot)) {
            detailSnapshot = null
            return null
        }
        if (illust != null && !sameIllust(snapshot.illust, illust)) {
            // Another work: it can never match this viewer, and holding it would pin the bitmap.
            detailSnapshot = null
            return null
        }
        val pageMatches =
            if (snapshot.pageIndex >= 0) snapshot.pageIndex == pageIndex
            else isSinglePageWork(illust)
        if (!pageMatches) return null
        detailSnapshot = null
        return snapshot.bitmap.takeUnless { it.isRecycled }
    }

    private fun sameIllust(a: Any?, b: Any?): Boolean {
        if (a == null || b == null) return false
        if (a === b) return true
        val idA = getFieldValue(a, "a")
        return idA != null && idA == getFieldValue(b, "a")
    }

    /** Le97;->l is the page count the viewer uses to separate single page works. */
    private fun isSinglePageWork(illust: Any?): Boolean = (getFieldValue(illust, "l") as? Int) == 1

    /**
     * master1200 ("large") address of one page. Multi page works carry it per page in
     * metaPages[i].imageUrls.large, single page works only in the illust level imageUrls.large.
     */
    private fun standardResolutionUrl(illust: Any?, pageIndex: Int): String? {
        if (illust == null) return null
        val pages = getFieldValue(illust, "u") as? List<*>
        val perPage = getFieldValue(getFieldValue(pages?.getOrNull(pageIndex), "a"), "b") as? String
        if (!perPage.isNullOrBlank()) return perPage
        if (pageIndex != 0) return null
        val singlePage = getFieldValue(getFieldValue(illust, "c"), "b") as? String
        return singlePage?.takeIf { it.isNotBlank() }
    }

    private fun currentIllust(itemView: View): Any? {
        val fromIntent = getActivity(itemView.context)?.intent?.extras?.get(KEY_ILLUST)
        return fromIntent ?: detailSnapshot?.illust
    }

    private fun applyPlaceholder(
        container: ViewGroup,
        imageView: ImageView,
        photoAttacher: Any?,
        bitmap: Bitmap,
        progressBar: View?
    ) {
        runOnMain(Runnable {
            try {
                if (isFullResLoaded(container) || isFullResLoaded(imageView)) return@Runnable
                if (bitmap.isRecycled) return@Runnable

                imageView.setImageBitmap(bitmap)
                progressBar?.visibility = View.GONE
                updateBaseMatrix(imageView, photoAttacher)
                showLoadingBadge(container)
                scheduleBadgeTimeout(container)
            } catch (t: Throwable) {
                Log.e(TAG, "applyPlaceholder failed", t)
            }
        })
    }

    /**
     * PhotoViewAttacher.f(Drawable) rebuilds the base matrix from the drawable's intrinsic size and the
     * current view bounds, then re-applies it. Setting the drawable and calling a() instead would keep
     * the previous base matrix and paint the image at 1:1, cropped on the right.
     * While the view is still unlaid out the attacher's own OnLayoutChangeListener does the work.
     */
    private fun updateBaseMatrix(imageView: ImageView, photoAttacher: Any?) {
        if (photoAttacher == null) return
        if (imageView.width <= 0 || imageView.height <= 0) return
        val drawable = imageView.drawable ?: return
        // f() resets the user matrix, so a placeholder arriving late would throw away the zoom the
        // user already made on the previous drawable. Snapshot it first and put it back afterwards.
        val userMatrix = currentUserMatrix(photoAttacher)
        runCatching {
            photoAttacher.javaClass.getMethod("f", Drawable::class.java).invoke(photoAttacher, drawable)
        }.onFailure { Log.w(TAG, "updateBaseMatrix failed: ${it.message}") }
        if (userMatrix != null) restoreZoom(photoAttacher, userMatrix)
    }

    /** The attacher's user matrix, but only when the user actually zoomed in past the base scale. */
    private fun currentUserMatrix(photoAttacher: Any): Matrix? = runCatching {
        val scale = photoAttacher.javaClass.getMethod("d").invoke(photoAttacher) as? Float
        if (scale != null && scale > 1.05f) {
            (getFieldValue(photoAttacher, "m") as? Matrix)?.let { Matrix(it) }
        } else {
            null
        }
    }.getOrNull()

    private fun isFullResLoaded(view: View): Boolean = fullResLoadedViews.contains(view)

    private fun findPhotoView(container: ViewGroup): ImageView? {
        val id = container.context.resources.getIdentifier("photo_view", "id", container.context.packageName)
        if (id != 0) {
            (container.findViewById<View>(id) as? ImageView)?.let { return it }
        }
        return getChildImageView(container)
    }

    private fun findProgressBar(container: ViewGroup): View? {
        val id = container.context.resources.getIdentifier("progress_bar", "id", container.context.packageName)
        return if (id != 0) container.findViewById<View>(id) else null
    }

    private fun showLoadingBadge(container: ViewGroup) {
        val badge = container.findViewWithTag<View>(TAG_LOADING_BADGE) ?: return
        badge.visibility = View.VISIBLE
        badge.alpha = 1f
    }

    private fun dismissLoadingBadge(container: ViewGroup?) {
        val badge = container?.findViewWithTag<View>(TAG_LOADING_BADGE) ?: return
        if (badge.visibility != View.VISIBLE) return
        badge.animate()
            .alpha(0f)
            .setDuration(250)
            .withEndAction { badge.visibility = View.GONE }
            .start()
    }

    /**
     * The loader target (da4) only exposes c(), so a failed or aborted full resolution load never
     * reports back and the badge would spin forever. Fall back to the clock.
     */
    private fun scheduleBadgeTimeout(container: ViewGroup) {
        runOnMain(Runnable {
            cancelBadgeTimeout(container)
            val token = ++badgeToken
            val runnable = Runnable {
                val pending = badgeTimeouts[container]
                if (pending != null && pending.token == token) {
                    badgeTimeouts.remove(container)
                    dismissLoadingBadge(container)
                }
            }
            badgeTimeouts[container] = BadgeTimeout(token, runnable)
            mainHandler.postDelayed(runnable, BADGE_TIMEOUT_MS)
        })
    }

    /** Called when the load really finished, so the page's own timeout never fires on it. */
    private fun cancelBadgeTimeout(container: ViewGroup?) {
        if (container == null) return
        badgeTimeouts.remove(container)?.let { mainHandler.removeCallbacks(it.runnable) }
    }

    private fun setupDiscreetLoadingBadge(container: ViewGroup, context: Context) {
        if (container.findViewWithTag<View>(TAG_LOADING_BADGE) != null) return

        val badge = LinearLayout(context).apply {
            tag = TAG_LOADING_BADGE
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            visibility = View.GONE
            setPadding(
                dpToPx(context, 10f).toInt(),
                dpToPx(context, 6f).toInt(),
                dpToPx(context, 10f).toInt(),
                dpToPx(context, 6f).toInt()
            )
            background = GradientDrawable().apply {
                setColor(Color.argb(175, 20, 20, 20))
                cornerRadius = dpToPx(context, 16f)
                setStroke(dpToPx(context, 1f).toInt(), Color.argb(80, 255, 255, 255))
            }
            elevation = dpToPx(context, 8f)

            val spinner = ProgressBar(context, null, android.R.attr.progressBarStyleSmall).apply {
                val size = dpToPx(context, 14f).toInt()
                layoutParams = LinearLayout.LayoutParams(size, size).apply {
                    rightMargin = dpToPx(context, 6f).toInt()
                }
            }

            val label = TextView(context).apply {
                text = "HD"
                textSize = 11f
                typeface = Typeface.DEFAULT_BOLD
                setTextColor(Color.WHITE)
            }

            addView(spinner)
            addView(label)

            layoutParams = FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            ).apply {
                gravity = Gravity.TOP or Gravity.END
                topMargin = dpToPx(context, 56f).toInt()
                rightMargin = dpToPx(context, 16f).toInt()
            }
        }

        container.addView(badge)
    }

    private fun fetchPlaceholder(
        container: ViewGroup,
        imageView: ImageView,
        photoAttacher: Any?,
        url: String,
        progressBar: View?
    ) {
        executor.execute {
            try {
                val bitmap = download(url) ?: return@execute
                placeholderCache.put(url, bitmap)
                applyPlaceholder(container, imageView, photoAttacher, bitmap, progressBar)
            } catch (t: Throwable) {
                Log.w(TAG, "Placeholder download failed: ${t.message}")
            }
        }
    }

    private fun download(url: String): Bitmap? {
        val connection = (URL(url).openConnection() as HttpURLConnection).apply {
            // i.pximg.net rejects requests without the API referer; this mirrors the app's own
            // image interceptor.
            setRequestProperty("Referer", "https://app-api.pixiv.net/")
            setRequestProperty("User-Agent", "PixivAndroidApp (Android ${Build.VERSION.RELEASE})")
            connectTimeout = 6000
            readTimeout = 10000
        }
        try {
            if (connection.responseCode !in 200..299) return null
            val bytes = connection.inputStream.use { it.readBytes() }
            if (bytes.isEmpty()) return null
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
        } finally {
            connection.disconnect()
        }
    }

    // ------------------------------------------------------------------------
    // Full resolution arrived: dismiss badge, keep the user's zoom
    // ------------------------------------------------------------------------

    /** Hook: da4.c(Object, qca), inserted before the drawable is installed. */
    @JvmStatic
    fun onFullResLoaded(fullResTarget: Any?) {
        try {
            if (fullResTarget == null) return
            val photoAttacher = getFieldValue(fullResTarget, "f")
            val itemView = getFieldValue(fullResTarget, "e") as? ViewGroup
            if (itemView != null) {
                fullResLoadedViews.add(itemView)
                findPhotoView(itemView)?.let { fullResLoadedViews.add(it) }
            }

            val zoomedMatrix = photoAttacher?.let { currentUserMatrix(it) }

            // da4.c installs the drawable and calls f() (resetting the user matrix) synchronously,
            // so the zoom can only be put back afterwards.
            mainHandler.post {
                try {
                    cancelBadgeTimeout(itemView)
                    dismissLoadingBadge(itemView)
                    if (photoAttacher != null && zoomedMatrix != null) {
                        restoreZoom(photoAttacher, zoomedMatrix)
                    }
                } catch (t: Throwable) {
                    Log.e(TAG, "onFullResLoaded post-handler failed", t)
                }
            }
        } catch (t: Throwable) {
            Log.e(TAG, "onFullResLoaded failed", t)
        }
    }

    private fun restoreZoom(photoAttacher: Any, matrix: Matrix) {
        try {
            val userMatrix = getFieldValue(photoAttacher, "m") as? Matrix ?: return
            userMatrix.set(matrix)
            photoAttacher.javaClass.getMethod("a").invoke(photoAttacher)
        } catch (t: Throwable) {
            Log.w(TAG, "restoreZoom failed: ${t.message}")
        }
    }

    // ------------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------------

    private fun getChildImageView(viewGroup: ViewGroup?): ImageView? {
        if (viewGroup == null) return null
        for (i in 0 until viewGroup.childCount) {
            val child = viewGroup.getChildAt(i)
            if (child is ImageView) return child
            if (child is ViewGroup) {
                val nested = getChildImageView(child)
                if (nested != null) return nested
            }
        }
        return null
    }

    fun getFieldValue(target: Any?, fieldName: String): Any? {
        if (target == null) return null
        var clazz: Class<*>? = target.javaClass
        while (clazz != null && clazz != Any::class.java) {
            try {
                val f = clazz.getDeclaredField(fieldName)
                f.isAccessible = true
                return f.get(target)
            } catch (_: NoSuchFieldException) {
                clazz = clazz.superclass
            }
        }
        return null
    }

    private fun getActivity(context: Context?): Activity? {
        var ctx = context
        while (ctx is ContextWrapper) {
            if (ctx is Activity) return ctx
            ctx = ctx.baseContext
        }
        return null
    }

    private fun runOnMain(block: Runnable) {
        if (Looper.myLooper() == Looper.getMainLooper()) block.run() else mainHandler.post(block)
    }

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }
}
