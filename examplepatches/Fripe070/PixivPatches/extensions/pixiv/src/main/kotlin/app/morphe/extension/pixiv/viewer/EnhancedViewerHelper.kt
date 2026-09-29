package app.morphe.extension.pixiv.viewer

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.Typeface
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
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
import java.util.concurrent.Executors

object EnhancedViewerHelper {

    private const val TAG_LOADING_BADGE = "morphe_hd_loading_badge"

    // Memory cache for standard-resolution artwork bitmaps (keyed by URL)
    private val placeholderCache = LruCache<String, Bitmap>(50)

    private val executor = Executors.newFixedThreadPool(2)
    private val mainHandler = Handler(Looper.getMainLooper())

    // ------------------------------------------------------------------------
    // 1. Fullscreen Instant Placeholder & Discreet Loading Badge
    // ------------------------------------------------------------------------

    @JvmStatic
    fun onFullScreenItemCreated(mm5View: Any?, photoAttacher: Any?) {
        try {
            val itemView = mm5View as? ViewGroup ?: return
            val context = itemView.context ?: return
            val activity = getActivity(context) ?: return

            val photoViewResId = context.resources.getIdentifier("photo_view", "id", context.packageName)
            val imageView = (if (photoViewResId != 0) itemView.findViewById<ImageView>(photoViewResId) else null)
                ?: getChildImageView(itemView) ?: return

            val progressResId = context.resources.getIdentifier("progress_bar", "id", context.packageName)
            val defaultProgressBar = if (progressResId != 0) itemView.findViewById<View>(progressResId) else null

            // Hide the default center spinner
            defaultProgressBar?.visibility = View.GONE

            // Inject the discreet corner loading badge
            setupDiscreetLoadingBadge(itemView, context)

            val pageIndex = (imageView.tag as? Int) ?: 0
            val intent = activity.intent
            val illust = intent?.getParcelableExtra<android.os.Parcelable>("KEY_ILLUST")
                ?: intent?.extras?.get("KEY_ILLUST")

            val placeholderUrl = if (illust != null) getStandardImageUrl(illust, pageIndex) else null

            // Check memory cache for a previously-loaded standard-res bitmap
            val cachedBmp: Bitmap? = if (placeholderUrl != null) placeholderCache.get(placeholderUrl) else null

            if (cachedBmp != null && !cachedBmp.isRecycled) {
                applyPlaceholder(imageView, photoAttacher, cachedBmp)
            } else if (!placeholderUrl.isNullOrEmpty()) {
                fetchPlaceholderAsync(placeholderUrl, imageView, photoAttacher)
            }
        } catch (_: Throwable) {
        }
    }

    private fun applyPlaceholder(imageView: ImageView, photoAttacher: Any?, bitmap: Bitmap) {
        mainHandler.post {
            try {
                if (imageView.drawable == null) {
                    imageView.setImageBitmap(bitmap)
                    updatePhotoAttacher(photoAttacher, imageView.drawable)
                }
            } catch (_: Throwable) {
            }
        }
    }

    private fun updatePhotoAttacher(photoAttacher: Any?, drawable: Drawable?) {
        if (photoAttacher == null || drawable == null) return
        try {
            val fMethod = photoAttacher.javaClass.getMethod("f", Drawable::class.java)
            fMethod.invoke(photoAttacher, drawable)
        } catch (_: Throwable) {
        }
    }

    private fun setupDiscreetLoadingBadge(container: ViewGroup, context: Context) {
        if (container.findViewWithTag<View>(TAG_LOADING_BADGE) != null) return

        val badge = LinearLayout(context).apply {
            tag = TAG_LOADING_BADGE
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
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

    private fun fetchPlaceholderAsync(url: String, imageView: ImageView, photoAttacher: Any?) {
        executor.execute {
            try {
                val conn = (URL(url).openConnection() as HttpURLConnection).apply {
                    setRequestProperty("Referer", "https://app-api.pixiv.net/")
                    setRequestProperty("User-Agent", "PixivAndroidApp/6.196.0 (Android 15; Pixel 8)")
                    connectTimeout = 5000
                    readTimeout = 8000
                }
                if (conn.responseCode in 200..299) {
                    val bmp = BitmapFactory.decodeStream(conn.inputStream)
                    conn.disconnect()
                    if (bmp != null) {
                        placeholderCache.put(url, bmp)
                        applyPlaceholder(imageView, photoAttacher, bmp)
                    }
                } else {
                    conn.disconnect()
                }
            } catch (_: Throwable) {
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
                    // 1. Fade out the HD loading badge
                    if (mm5Layout != null) {
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
                            val aMethod = attacher.javaClass.getDeclaredMethod("a").apply { isAccessible = true }
                            aMethod.invoke(attacher)

                            val imageView = getFieldValue(attacher, "h") as? ImageView
                            val cMethod = attacher.javaClass.getDeclaredMethod("c").apply { isAccessible = true }
                            val displayMatrix = cMethod.invoke(attacher) as? Matrix
                            if (imageView != null && displayMatrix != null) {
                                imageView.imageMatrix = displayMatrix
                            }
                        }
                    }
                } catch (_: Throwable) {
                }
            }
        } catch (_: Throwable) {
        }
    }

    // ------------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------------

    private fun getStandardImageUrl(illust: Any, pageIndex: Int): String? {
        try {
            val pageCount = runCatching {
                illust.javaClass.getField("pageCount").getInt(illust)
            }.getOrDefault(1)

            if (pageCount <= 1 || pageIndex == 0) {
                val imageUrlsObj = runCatching {
                    illust.javaClass.getMethod("getImageUrls").invoke(illust)
                }.getOrNull() ?: runCatching {
                    illust.javaClass.getField("imageUrls").get(illust)
                }.getOrNull()

                if (imageUrlsObj != null) {
                    val large = runCatching { imageUrlsObj.javaClass.getMethod("getLarge").invoke(imageUrlsObj) as? String }.getOrNull()
                    if (!large.isNullOrEmpty()) return large
                    val medium = runCatching { imageUrlsObj.javaClass.getMethod("getMedium").invoke(imageUrlsObj) as? String }.getOrNull()
                    if (!medium.isNullOrEmpty()) return medium
                }
            }

            val metaPages = runCatching {
                val field = illust.javaClass.getField("metaPages")
                field.get(illust) as? List<*>
            }.getOrNull()

            if (metaPages != null && pageIndex in metaPages.indices) {
                val page = metaPages[pageIndex]
                if (page != null) {
                    val urls = runCatching { page.javaClass.getMethod("getImageUrls").invoke(page) }.getOrNull()
                    if (urls != null) {
                        val large = runCatching { urls.javaClass.getMethod("getLarge").invoke(urls) as? String }.getOrNull()
                        if (!large.isNullOrEmpty()) return large
                        val medium = runCatching { urls.javaClass.getMethod("getMedium").invoke(urls) as? String }.getOrNull()
                        if (!medium.isNullOrEmpty()) return medium
                    }
                }
            }
        } catch (_: Throwable) {
        }
        return null
    }

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

    private fun getFieldValue(target: Any, fieldName: String): Any? {
        var clazz: Class<*>? = target.javaClass
        while (clazz != null) {
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
