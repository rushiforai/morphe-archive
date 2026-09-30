package app.morphe.extension.pixiv.viewer

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
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
import java.net.HttpURLConnection
import java.net.URL
import java.util.Collections
import java.util.WeakHashMap
import java.util.concurrent.Executors

object EnhancedViewerHelper {

    private const val TAG = "MorpheEnhancedViewer"
    private const val TAG_LOADING_BADGE = "morphe_hd_loading_badge"

    // In-memory cache for standard-resolution artwork bitmaps (keyed by URL)
    private val placeholderCache = LruCache<String, Bitmap>(50)

    // Direct memory cache from detail view
    @Volatile
    var cachedDetailBitmap: Bitmap? = null
        private set

    @Volatile
    var cachedIllust: Any? = null
        private set

    // Track views where full-res image has finished loading to prevent stale placeholders from overwriting
    private val fullResLoadedViews = Collections.newSetFromMap(WeakHashMap<View, Boolean>())

    private val executor = Executors.newFixedThreadPool(3)
    private val mainHandler = Handler(Looper.getMainLooper())

    @JvmStatic
    fun setCachedDetailBitmap(bitmap: Bitmap?, illust: Any?) {
        if (bitmap != null && !bitmap.isRecycled) {
            cachedDetailBitmap = bitmap
            cachedIllust = illust
            Log.i(TAG, "Captured detail bitmap into cache: ${bitmap.width}x${bitmap.height}")
        }
    }

    @JvmStatic
    fun onDetailImageClicked(holder: Any?, illust: Any?) {
        try {
            Log.i(TAG, "onDetailImageClicked called: holder=$holder, illust=$illust")
            if (holder == null) return
            val iv = getFieldValue(holder, "imageView") as? ImageView
            val d = iv?.drawable
            Log.i(TAG, "onDetailImageClicked: iv=$iv, drawable=$d (${d?.javaClass?.name})")
            val bmp = extractBitmap(d, iv)
            if (bmp != null && !bmp.isRecycled) {
                setCachedDetailBitmap(bmp, illust)
                Log.i(TAG, "Captured detail bitmap on click: ${bmp.width}x${bmp.height}")
            } else {
                Log.w(TAG, "Could not extract bitmap from detail view on click")
            }
        } catch (t: Throwable) {
            Log.e(TAG, "Error in onDetailImageClicked", t)
        }
    }

    private fun extractBitmap(drawable: Drawable?, view: ImageView? = null): Bitmap? {
        if (drawable == null && view == null) return null

        // 1. Direct BitmapDrawable
        if (drawable is BitmapDrawable && drawable.bitmap != null && !drawable.bitmap.isRecycled) {
            return drawable.bitmap
        }

        // 2. LayerDrawable / TransitionDrawable
        if (drawable is LayerDrawable) {
            for (i in drawable.numberOfLayers - 1 downTo 0) {
                val b = extractBitmap(drawable.getDrawable(i))
                if (b != null) return b
            }
        }

        // 3. Wrapped drawable via getDrawable()
        runCatching {
            val getDrawableMethod = drawable?.javaClass?.getMethod("getDrawable")
            val wrapped = getDrawableMethod?.invoke(drawable) as? Drawable
            if (wrapped != null) {
                val b = extractBitmap(wrapped)
                if (b != null) return b
            }
        }

        // 4. Any Bitmap field inside custom drawable (e.g. Coil CrossfadeDrawable)
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

        // 5. Draw the view or drawable into a new Bitmap
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
            Log.w(TAG, "Failed drawing drawable/view to bitmap: ${t.message}")
        }

        return null
    }

    // ------------------------------------------------------------------------
    // 1. Fullscreen Instant Placeholder & Discreet Loading Badge
    // ------------------------------------------------------------------------

    @JvmStatic
    @JvmOverloads
    fun onFullScreenItemCreated(
        mm5View: Any?,
        photoAttacher: Any?,
        pagerAdapter: Any? = null,
        explicitPageIndex: Int = -1
    ) {
        try {
            val itemView = mm5View as? ViewGroup ?: return
            val context = itemView.context ?: return
            val activity = getActivity(context) ?: return

            val photoViewResId = context.resources.getIdentifier("photo_view", "id", context.packageName)
            val imageView = (if (photoViewResId != 0) itemView.findViewById<ImageView>(photoViewResId) else null)
                ?: getChildImageView(itemView) ?: return

            val progressResId = context.resources.getIdentifier("progress_bar", "id", context.packageName)
            val defaultProgressBar = if (progressResId != 0) itemView.findViewById<View>(progressResId) else null

            // Setup discreet loading badge (starts hidden until placeholder is active)
            setupDiscreetLoadingBadge(itemView, context)

            val pageIndex = if (explicitPageIndex >= 0) explicitPageIndex else ((imageView.tag as? Int) ?: 0)
            Log.i(TAG, "onFullScreenItemCreated: pageIndex=$pageIndex")

            // 1. Instant Fast-Path: Use detail page bitmap for page 0 if available
            val directDetailBmp = cachedDetailBitmap
            if (pageIndex == 0 && directDetailBmp != null && !directDetailBmp.isRecycled) {
                Log.i(TAG, "Instant applying cached detail bitmap for page 0")
                applyPlaceholder(itemView, imageView, photoAttacher, directDetailBmp, defaultProgressBar)
                return
            }

            // 2. Resolve standard-resolution URL
            val illust = cachedIllust ?: findIllust(activity)
            var placeholderUrl = if (illust != null) resolveStandardImageUrl(illust, pageIndex) else null

            // Fallback: derive from full-res URL in pagerAdapter (zr4.a) if available
            if (placeholderUrl.isNullOrEmpty() && pagerAdapter != null) {
                placeholderUrl = deriveStandardUrlFromAdapter(pagerAdapter, pageIndex)
            }

            Log.i(TAG, "Resolved placeholder URL for page $pageIndex: $placeholderUrl")

            // 3. Check memory LRU cache
            val cachedBmp: Bitmap? = if (!placeholderUrl.isNullOrEmpty()) placeholderCache.get(placeholderUrl) else null
            if (cachedBmp != null && !cachedBmp.isRecycled) {
                Log.i(TAG, "Applying memory-cached placeholder bitmap")
                applyPlaceholder(itemView, imageView, photoAttacher, cachedBmp, defaultProgressBar)
                return
            }

            // 4. Asynchronously fetch standard-resolution image over network
            if (!placeholderUrl.isNullOrEmpty()) {
                fetchPlaceholderAsync(itemView, placeholderUrl, imageView, photoAttacher, defaultProgressBar)
            } else if (directDetailBmp != null && !directDetailBmp.isRecycled) {
                // If resolving page URL failed, still use the detail bitmap
                Log.i(TAG, "Fallback applying detail bitmap for page $pageIndex")
                applyPlaceholder(itemView, imageView, photoAttacher, directDetailBmp, defaultProgressBar)
            }
        } catch (t: Throwable) {
            Log.e(TAG, "Error in onFullScreenItemCreated", t)
        }
    }

    private fun findIllust(activity: Activity): Any? {
        // 1. Try activity.j() -> my3.d (PixivIllust)
        runCatching {
            val jMethod = activity.javaClass.getDeclaredMethod("j").apply { isAccessible = true }
            val vm = jMethod.invoke(activity)
            if (vm != null) {
                val d = getFieldValue(vm, "d")
                if (d != null) {
                    Log.i(TAG, "Found illust via activity.j().d: $d")
                    return d
                }
            }
        }.onFailure { Log.w(TAG, "Failed finding illust via j(): ${it.message}") }

        // 2. Try activity.f (ViewModelLazy)
        runCatching {
            val lazyObj = getFieldValue(activity, "f")
            if (lazyObj != null) {
                val getValueMethod = lazyObj.javaClass.getMethod("getValue")
                val vm = getValueMethod.invoke(lazyObj)
                if (vm != null) {
                    val d = getFieldValue(vm, "d")
                    if (d != null) {
                        Log.i(TAG, "Found illust via activity.f.getValue().d: $d")
                        return d
                    }
                }
            }
        }.onFailure { Log.w(TAG, "Failed finding illust via field f: ${it.message}") }

        // 3. Fallback: inspect intent
        val intent = activity.intent
        val fromIntent = intent?.getParcelableExtra<android.os.Parcelable>("KEY_ILLUST")
            ?: intent?.extras?.get("KEY_ILLUST")
        if (fromIntent != null) return fromIntent

        return null
    }

    private fun deriveStandardUrlFromAdapter(pagerAdapter: Any, pageIndex: Int): String? {
        return runCatching {
            val urlsList = getFieldValue(pagerAdapter, "a") as? List<*>
            if (urlsList != null && pageIndex in urlsList.indices) {
                val origUrl = urlsList[pageIndex] as? String
                if (!origUrl.isNullOrEmpty()) {
                    return@runCatching origUrl
                        .replace("/img-original/", "/c/600x1200_90/img-master/")
                        .replace(Regex("\\.(png|jpg|jpeg|gif)$", RegexOption.IGNORE_CASE), "_master1200.jpg")
                }
            }
            null
        }.getOrNull()
    }

    private fun resolveStandardImageUrl(illust: Any, pageIndex: Int): String? {
        try {
            // 1. If pageIndex == 0, check illust.imageUrls
            if (pageIndex == 0) {
                val url = extractUrlFromImageUrlsObj(getImageUrlsObj(illust))
                if (!url.isNullOrBlank()) return url
            }

            // 2. Check metaPages (List<PixivMetaPageApiModel>)
            val metaPages = getFieldValue(illust, "metaPages") as? List<*>
            if (!metaPages.isNullOrEmpty() && pageIndex in metaPages.indices) {
                val page = metaPages[pageIndex]
                if (page != null) {
                    val url = extractUrlFromImageUrlsObj(getImageUrlsObj(page))
                    if (!url.isNullOrBlank()) return url
                }
            }

            // 3. Check metaSinglePage
            val metaSingle = getFieldValue(illust, "metaSinglePage")
            if (metaSingle != null) {
                val url = extractUrlFromImageUrlsObj(getImageUrlsObj(illust))
                if (!url.isNullOrBlank()) return url
            }
        } catch (e: Throwable) {
            Log.e(TAG, "Error resolving standard image URL", e)
        }
        return null
    }

    private fun getImageUrlsObj(target: Any): Any? {
        return getFieldValue(target, "imageUrls")
            ?: runCatching { target.javaClass.getMethod("getImageUrls").invoke(target) }.getOrNull()
    }

    private fun extractUrlFromImageUrlsObj(imageUrlsObj: Any?): String? {
        if (imageUrlsObj == null) return null
        val candidates = listOf("large", "regular", "medium", "original")
        for (name in candidates) {
            val u = getFieldValue(imageUrlsObj, name) as? String
                ?: runCatching {
                    val getter = "get" + name.replaceFirstChar { it.uppercase() }
                    imageUrlsObj.javaClass.getMethod(getter).invoke(imageUrlsObj) as? String
                }.getOrNull()
            if (!u.isNullOrBlank()) return u
        }
        return null
    }

    private fun applyPlaceholder(
        container: ViewGroup,
        imageView: ImageView,
        photoAttacher: Any?,
        bitmap: Bitmap,
        defaultProgressBar: View?
    ) {
        val action = Runnable {
            try {
                if (fullResLoadedViews.contains(container) || fullResLoadedViews.contains(imageView)) {
                    Log.i(TAG, "Skipping applyPlaceholder: full-res already loaded for this item")
                    return@Runnable
                }

                imageView.setImageBitmap(bitmap)
                updatePhotoAttacher(photoAttacher, imageView)

                // Hide crude center spinner
                defaultProgressBar?.visibility = View.GONE

                // Reveal discreet corner HD loading badge
                val badge = container.findViewWithTag<View>(TAG_LOADING_BADGE)
                if (badge != null) {
                    badge.visibility = View.VISIBLE
                    badge.alpha = 1f
                }
                Log.i(TAG, "Placeholder applied (${bitmap.width}x${bitmap.height}), HD loading badge displayed")
            } catch (t: Throwable) {
                Log.e(TAG, "Error applying placeholder bitmap", t)
            }
        }

        if (Looper.myLooper() == Looper.getMainLooper()) {
            action.run()
        } else {
            mainHandler.post(action)
        }
    }

    private fun updatePhotoAttacher(photoAttacher: Any?, imageView: ImageView) {
        if (photoAttacher == null) return
        try {
            // PhotoViewAttacher (et7) update method is a()
            val aMethod = photoAttacher.javaClass.getMethod("a")
            aMethod.invoke(photoAttacher)

            // Update display matrix on ImageView via c()
            val cMethod = photoAttacher.javaClass.getMethod("c")
            val matrix = cMethod.invoke(photoAttacher) as? Matrix
            if (matrix != null) {
                imageView.imageMatrix = matrix
            }
            Log.i(TAG, "PhotoAttacher updated and display matrix applied")
        } catch (t: Throwable) {
            Log.e(TAG, "Error updating PhotoAttacher", t)
        }
    }

    private fun setupDiscreetLoadingBadge(container: ViewGroup, context: Context) {
        if (container.findViewWithTag<View>(TAG_LOADING_BADGE) != null) return

        val badge = LinearLayout(context).apply {
            tag = TAG_LOADING_BADGE
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            visibility = View.GONE // Hidden initially until placeholder displays
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

    private fun fetchPlaceholderAsync(
        container: ViewGroup,
        url: String,
        imageView: ImageView,
        photoAttacher: Any?,
        defaultProgressBar: View?
    ) {
        executor.execute {
            try {
                val conn = (URL(url).openConnection() as HttpURLConnection).apply {
                    setRequestProperty("Referer", "https://app-api.pixiv.net/")
                    setRequestProperty("User-Agent", "PixivAndroidApp/6.196.0 (Android 15; Pixel 8)")
                    connectTimeout = 6000
                    readTimeout = 10000
                }
                if (conn.responseCode in 200..299) {
                    val bytes = conn.inputStream.use { it.readBytes() }
                    conn.disconnect()
                    val bmp = BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                    if (bmp != null) {
                        placeholderCache.put(url, bmp)
                        applyPlaceholder(container, imageView, photoAttacher, bmp, defaultProgressBar)
                    }
                } else {
                    conn.disconnect()
                }
            } catch (t: Throwable) {
                Log.e(TAG, "fetchPlaceholderAsync error for $url: ${t.message}")
            }
        }
    }

    // ------------------------------------------------------------------------
    // 2. Full-Res Swap & Matrix Preservation
    // ------------------------------------------------------------------------

    @JvmStatic
    fun onFullResLoaded(yr4Target: Any?) {
        try {
            if (yr4Target == null) return
            val attacher = getFieldValue(yr4Target, "f")
            val mm5Layout = getFieldValue(yr4Target, "e") as? ViewGroup

            if (mm5Layout != null) {
                fullResLoadedViews.add(mm5Layout)
                val photoViewResId = mm5Layout.context.resources.getIdentifier("photo_view", "id", mm5Layout.context.packageName)
                val iv = (if (photoViewResId != 0) mm5Layout.findViewById<ImageView>(photoViewResId) else null)
                    ?: getChildImageView(mm5Layout)
                if (iv != null) {
                    fullResLoadedViews.add(iv)
                }
            }

            // Capture current user zoom scale and matrix BEFORE Glide sets the new full-res drawable
            var savedMatrix: Matrix? = null
            if (attacher != null) {
                val currentScale = runCatching {
                    attacher.javaClass.getMethod("d").invoke(attacher) as? Float
                }.getOrNull() ?: 1.0f

                val userMatrix = getFieldValue(attacher, "m") as? Matrix
                if (userMatrix != null && currentScale > 1.05f) {
                    savedMatrix = Matrix(userMatrix)
                }
            }

            // Post to mainHandler so it executes right after yr4.d finishes setting the full-res drawable
            mainHandler.post {
                try {
                    // 1. Fade out the HD loading badge and hide any center progress spinner
                    if (mm5Layout != null) {
                        val progressResId = mm5Layout.context.resources.getIdentifier("progress_bar", "id", mm5Layout.context.packageName)
                        if (progressResId != 0) {
                            mm5Layout.findViewById<View>(progressResId)?.visibility = View.GONE
                        }

                        val badge = mm5Layout.findViewWithTag<View>(TAG_LOADING_BADGE)
                        if (badge != null && badge.visibility == View.VISIBLE) {
                            badge.animate()
                                .alpha(0f)
                                .setDuration(250)
                                .withEndAction { badge.visibility = View.GONE }
                                .start()
                        }
                    }

                    // 2. Restore user's zoom matrix seamlessly
                    if (attacher != null && savedMatrix != null) {
                        val mField = attacher.javaClass.getDeclaredField("m").apply { isAccessible = true }
                        val currentM = mField.get(attacher) as? Matrix
                        if (currentM != null) {
                            currentM.set(savedMatrix)
                            val aMethod = attacher.javaClass.getMethod("a")
                            aMethod.invoke(attacher)

                            val imageView = getFieldValue(attacher, "h") as? ImageView
                            val cMethod = attacher.javaClass.getMethod("c")
                            val displayMatrix = cMethod.invoke(attacher) as? Matrix
                            if (imageView != null && displayMatrix != null) {
                                imageView.imageMatrix = displayMatrix
                            }
                        }
                    }
                    Log.i(TAG, "Full-res loaded, HD badge dismissed, matrix restored: ${savedMatrix != null}")
                } catch (t: Throwable) {
                    Log.e(TAG, "Error in onFullResLoaded post-handler", t)
                }
            }
        } catch (t: Throwable) {
            Log.e(TAG, "Error in onFullResLoaded", t)
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

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }
}
