package app.morphe.extension.pixiv.downloader

import android.app.Activity
import android.app.AlertDialog
import android.content.ContentValues
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.Typeface
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore
import android.util.Log
import android.util.LruCache
import android.util.TypedValue
import android.view.Gravity
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.view.ViewParent
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.RelativeLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
import java.lang.reflect.Field
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.Executors

object DownloaderHelper {

    private const val TAG = "MorpheDownloader"

    private const val TAG_DOWNLOAD_BUTTON = "morphe_download_button"
    private const val DOWNLOAD_MENU_ID = 0x7f099990

    private const val PXIMG_REFERER = "https://www.pixiv.net/"
    private const val PXIMG_HOST = "https://i.pximg.net"
    private const val USER_AGENT = "PixivAndroidApp/6.202.1 (Android; Mobile)"

    private const val THUMB_CACHE_BYTES = 8 * 1024 * 1024
    private const val THUMB_ATTEMPT_LIMIT = 2
    private const val THUMB_PREFETCH_ROWS = 2

    /**
     * Obfuscated member names of Pixiv 6.202.1. Every list is ordered newest-first and always
     * carries the pre-obfuscation name as a fallback so a single re-obfuscation cannot break it.
     *
     * Le97 (PixivIllust): a=id(J) b=title c=imageUrls(Lra4) d=user(Lud7) l=pageCount
     *                     t=metaSinglePage(Lya7) u=metaPages(List<Lva7>)
     * Lva7 (PixivMetaPage): a=imageUrls(Lii5)
     * Lii5 (MetaPageImageUrls): a=medium b=large c=squareMedium d=original
     * Lra4 (ImageUrls): a=medium b=large c=squareMedium   (no original)
     * Lya7 (PixivMetaPageUrl): a=originalImageUrl
     * Lud7 (PixivUser): a=id(J) b=name c=account d=comment
     */
    private val ILLUST_IMAGE_URLS_FIELDS = listOf("c", "imageUrls")
    private val META_PAGES_FIELDS = listOf("u", "metaPages")
    private val META_SINGLE_PAGE_FIELDS = listOf("t", "metaSinglePage")
    private val PAGE_COUNT_FIELDS = listOf("l", "pageCount")
    private val USER_FIELDS = listOf("d", "user")
    private val PAGE_IMAGE_URLS_FIELDS = listOf("a", "imageUrls")
    private val ORIGINAL_FIELDS = listOf("d", "original")
    private val SINGLE_PAGE_ORIGINAL_FIELDS = listOf("a", "originalImageUrl")
    private val LARGE_FIELDS = listOf("b", "large")
    private val MEDIUM_FIELDS = listOf("a", "medium")
    private val SQUARE_FIELDS = listOf("c", "squareMedium")
    private val PAGE_SUFFIX_REGEX = Regex("_p\\d+(?=[._])")

    // Thumbnails get their own pool: a picker with 40 pages queues 40 thumbnail jobs (each with
    // an 8s/12s timeout) that would otherwise run ahead of and starve the real download.
    private val executor = Executors.newFixedThreadPool(2)
    private val thumbnailExecutor = Executors.newFixedThreadPool(3)
    private val mainHandler = Handler(Looper.getMainLooper())

    // Sized in bytes instead of entries: decoded thumbnails differ wildly in size.
    private val thumbnailCache = object : LruCache<String, Bitmap>(THUMB_CACHE_BYTES) {
        override fun sizeOf(key: String, value: Bitmap): Int = value.byteCount
    }

    private data class ThumbCell(
        val row: Int,
        val url: String?,
        val view: ImageView
    ) {
        var loadStarted = false
        var attempts = 0
    }

    data class PageItem(
        val pageIndex: Int,
        val originalUrl: String,
        val thumbnailUrl: String?,
        var isSelected: Boolean = true
    )

    data class WorkMetadata(
        val id: String,
        val title: String,
        val artist: String
    )

    private data class SavedFile(
        val filename: String,
        val location: String
    )

    @Volatile
    private var currentBindingToken: Any? = null

    @JvmStatic
    fun onDetailBottomBarBound(view: View?, work: Any?) {
        try {
            if (view == null || work == null) return

            if (!isIllust(work)) {
                Log.i(TAG, "Skipping non-illust work: ${work.javaClass.name}")
                return
            }

            // Identifies this binding. Postponed callbacks compare against it so a callback queued
            // by a previous work can never re-bind the bar to that stale work.
            val bindingToken = Any()
            currentBindingToken = bindingToken

            cleanupBrokenBottomBarButton(view)

            view.post {
                try {
                    injectToolbarDownloadButton(view, work, bindingToken)
                } catch (t: Throwable) {
                    Log.w(TAG, "Toolbar injection failed, using bottom bar", t)
                    fallbackInjectBottomBar(view, work)
                }
            }
        } catch (t: Throwable) {
            Log.e(TAG, "onDetailBottomBarBound failed", t)
        }
    }

    private fun cleanupBrokenBottomBarButton(view: View) {
        try {
            val oldBtn = view.findViewWithTag<View>(TAG_DOWNLOAD_BUTTON)
            if (oldBtn != null && oldBtn.parent is ViewGroup) {
                (oldBtn.parent as ViewGroup).removeView(oldBtn)
            }
        } catch (t: Throwable) {
            Log.w(TAG, "cleanupBrokenBottomBarButton failed", t)
        }
    }

    private fun injectToolbarDownloadButton(view: View, work: Any, bindingToken: Any) {
        val toolbar = findToolbarInHierarchy(view)
        if (toolbar == null) {
            fallbackInjectBottomBar(view, work)
            return
        }

        val getMenuMethod = runCatching { toolbar.javaClass.getMethod("getMenu") }.getOrNull()
        val menu = getMenuMethod?.invoke(toolbar) as? Menu
        if (menu == null) {
            fallbackInjectBottomBar(view, work)
            return
        }

        var item = menu.findItem(DOWNLOAD_MENU_ID)
        if (item == null) {
            item = menu.add(Menu.NONE, DOWNLOAD_MENU_ID, 1, "Download")
            item.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS)
            item.icon = createDownloadIconDrawable(view.context)
        }

        item.setOnMenuItemClickListener {
            try {
                handleDownloadAction(view.context, work)
            } catch (t: Throwable) {
                Log.e(TAG, "Download action failed", t)
                showToast(view.context, "Download error: ${t.message}")
            }
            true
        }

        // The host activity may rebuild its menu (invalidateOptionsMenu) right after binding,
        // which silently drops our item. Verify once the menu settled and fall back if it is gone.
        view.postDelayed({
            if (currentBindingToken !== bindingToken) {
                Log.i(TAG, "Dropping stale menu check for a previous work")
            } else {
                try {
                    if (runCatching { menu.findItem(DOWNLOAD_MENU_ID) }.getOrNull() == null) {
                        Log.w(TAG, "Toolbar menu dropped the item, using bottom bar button")
                        fallbackInjectBottomBar(view, work)
                    }
                } catch (t: Throwable) {
                    Log.w(TAG, "Menu verification failed", t)
                }
            }
        }, 600L)
    }

    private fun fallbackInjectBottomBar(view: View, work: Any) {
        try {
            val context = view.context
            val layoutId = context.resources.getIdentifier("title_detail_layout", "id", context.packageName)
            val parentLayout = if (layoutId != 0) {
                view.findViewById<ViewGroup>(layoutId)
            } else {
                view as? ViewGroup
            } ?: return

            var downloadBtn = parentLayout.findViewWithTag<TextView>(TAG_DOWNLOAD_BUTTON)
            if (downloadBtn == null) {
                downloadBtn = TextView(context).apply {
                    tag = TAG_DOWNLOAD_BUTTON
                    text = "Save"
                    textSize = 12f
                    typeface = Typeface.DEFAULT_BOLD
                    setTextColor(Color.WHITE)

                    val radius = dpToPx(context, 6f)
                    val bg = GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        setColor(0xFF0096FA.toInt())
                        cornerRadius = radius
                    }
                    background = bg

                    val pxH = dpToPx(context, 10f).toInt()
                    val pxV = dpToPx(context, 4f).toInt()
                    setPadding(pxH, pxV, pxH, pxV)

                    val margin = dpToPx(context, 12f).toInt()
                    if (parentLayout is RelativeLayout) {
                        val lp = RelativeLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                        ).apply {
                            addRule(RelativeLayout.ALIGN_PARENT_END)
                            addRule(RelativeLayout.CENTER_VERTICAL)
                            marginEnd = margin
                            rightMargin = margin
                        }
                        layoutParams = lp
                    } else if (parentLayout is LinearLayout) {
                        val lp = LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                        ).apply {
                            gravity = Gravity.CENTER_VERTICAL or Gravity.END
                            marginEnd = margin
                            rightMargin = margin
                        }
                        layoutParams = lp
                    }
                }
                parentLayout.addView(downloadBtn)
            }

            downloadBtn.setOnClickListener {
                try {
                    handleDownloadAction(context, work)
                } catch (t: Throwable) {
                    Log.e(TAG, "Download action failed", t)
                    showToast(context, "Download error: ${t.message}")
                }
            }
            downloadBtn.visibility = View.VISIBLE
        } catch (t: Throwable) {
            Log.e(TAG, "fallbackInjectBottomBar failed", t)
        }
    }

    private fun findToolbarInHierarchy(view: View): ViewGroup? {
        val context = view.context
        val toolbarResId = context.resources.getIdentifier("tool_bar", "id", context.packageName)
        if (toolbarResId == 0) return null

        var current: ViewParent? = view.parent
        while (current != null) {
            if (current is ViewGroup) {
                val tb = current.findViewById<ViewGroup>(toolbarResId)
                if (tb != null) return tb
            }
            current = current.parent
        }

        val rootTb = view.rootView?.findViewById<ViewGroup>(toolbarResId)
        if (rootTb != null) return rootTb

        val act = getActivity(context)
        return act?.findViewById(toolbarResId)
    }

    private fun getActivity(context: Context?): Activity? {
        var ctx = context
        while (ctx is ContextWrapper) {
            if (ctx is Activity) return ctx
            ctx = ctx.baseContext
        }
        return null
    }

    private fun handleDownloadAction(context: Context, work: Any) {
        val pages = extractAllPages(work)
        if (pages.isEmpty()) {
            Log.w(TAG, "No downloadable page for ${work.javaClass.name}")
            showToast(context, "No original image URL found (restricted or unsupported work)")
            return
        }

        val metadata = extractMetadata(work)

        if (pages.size == 1) {
            downloadSingleImageDirectly(context, metadata, pages[0])
        } else {
            showPagePickerDialog(context, metadata, pages)
        }
    }

    private class SquareFrameLayout(context: Context) : FrameLayout(context) {
        override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
            super.onMeasure(widthMeasureSpec, widthMeasureSpec)
        }
    }

    private fun showPagePickerDialog(context: Context, metadata: WorkMetadata, pages: List<PageItem>) {
        val act = getActivity(context)
        if (act == null) {
            showToast(context, "Cannot open page picker outside of the app")
            return
        }

        pages.forEach { it.isSelected = true }

        val checkedBadge = createCheckBadgeDrawable(act, isChecked = true)
        val uncheckedBadge = createCheckBadgeDrawable(act, isChecked = false)

        val root = LinearLayout(act).apply {
            orientation = LinearLayout.VERTICAL
            val padH = dpToPx(act, 12f).toInt()
            val padTop = dpToPx(act, 12f).toInt()
            setPadding(padH, padTop, padH, 0)
        }

        val controlRow = LinearLayout(act).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            val lp = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            )
            lp.bottomMargin = dpToPx(act, 8f).toInt()
            layoutParams = lp
        }

        val selectAllBtn = TextView(act).apply {
            text = "Deselect All"
            textSize = 13f
            typeface = Typeface.DEFAULT_BOLD
            setTextColor(0xFF0096FA.toInt())
            setPadding(
                dpToPx(act, 4f).toInt(),
                dpToPx(act, 4f).toInt(),
                dpToPx(act, 12f).toInt(),
                dpToPx(act, 4f).toInt()
            )
        }

        val countText = TextView(act).apply {
            text = "${pages.size} / ${pages.size} selected"
            textSize = 13f
            setTextColor(0xAA888888.toInt())
            gravity = Gravity.END
            layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        }

        controlRow.addView(selectAllBtn)
        controlRow.addView(countText)
        root.addView(controlRow)

        val divider = View(act).apply {
            setBackgroundColor(0x33888888.toInt())
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dpToPx(act, 1f).toInt()
            ).apply {
                bottomMargin = dpToPx(act, 8f).toInt()
            }
        }
        root.addView(divider)

        val displayMetrics = act.resources.displayMetrics
        val maxGridHeight = (displayMetrics.heightPixels * 0.52f).toInt()
        val scrollView = ScrollView(act).apply {
            isFillViewport = true
            isVerticalScrollBarEnabled = true
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                maxGridHeight
            )
        }

        val gridContainer = LinearLayout(act).apply {
            orientation = LinearLayout.VERTICAL
        }

        val cellUpdaters = mutableListOf<() -> Unit>()
        var dialogRef: AlertDialog? = null

        fun updateUI() {
            val selectedCount = pages.count { it.isSelected }
            countText.text = "$selectedCount / ${pages.size} selected"
            selectAllBtn.text = if (selectedCount == pages.size) "Deselect All" else "Select All"
            dialogRef?.getButton(AlertDialog.BUTTON_POSITIVE)?.let { btn ->
                btn.text = if (selectedCount > 0) "Download ($selectedCount)" else "Download"
                btn.isEnabled = selectedCount > 0
            }
        }

        val numColumns = 3
        val gap = dpToPx(act, 3f).toInt()
        val rows = pages.chunked(numColumns)

        // Rough cell side, used as the downsampling target. Thumbnails are decoded to at most twice
        // this edge, so keeping one image per visible cell stays affordable even for 100 pages.
        val cellPx = ((displayMetrics.widthPixels - dpToPx(act, 24f).toInt()) / numColumns)
            .coerceAtLeast(dpToPx(act, 48f).toInt())

        val thumbCells = ArrayList<ThumbCell>(pages.size)
        var lastRowWindow: IntRange? = null

        fun currentRowHeight(): Int {
            val measured = gridContainer.getChildAt(0)?.height ?: 0
            return if (measured > 0) measured + gap * 2 else cellPx + gap * 2
        }

        fun ensureThumb(cell: ThumbCell) {
            if (cell.view.drawable != null || cell.loadStarted) return
            if (cell.attempts >= THUMB_ATTEMPT_LIMIT) return
            val url = cell.url ?: return
            cell.loadStarted = true
            cell.attempts++
            loadThumbnailAsync(url, cell.view, cellPx, onFinished = {
                cell.loadStarted = false
                // Only failed loads consume the attempt budget, released cells may load again.
                if (cell.view.drawable != null) cell.attempts = 0
            })
        }

        fun releaseThumb(cell: ThumbCell) {
            if (cell.view.drawable == null) return
            cell.view.setImageDrawable(null)
            cell.loadStarted = false
        }

        // Loads only the rows around the viewport and drops the bitmaps of far away rows, so the
        // grid never pins one full size bitmap per page.
        fun refreshThumbWindow() {
            if (thumbCells.isEmpty()) return
            val viewport = scrollView.height
            val rowHeight = currentRowHeight().coerceAtLeast(1)
            val firstRow: Int
            val lastRow: Int
            if (viewport <= 0) {
                firstRow = 0
                lastRow = 1
            } else {
                firstRow = scrollView.scrollY / rowHeight
                lastRow = (scrollView.scrollY + viewport) / rowHeight
            }
            val window = firstRow..lastRow
            if (window == lastRowWindow) return
            lastRowWindow = window

            for (cell in thumbCells) {
                when {
                    cell.row in window -> ensureThumb(cell)
                    cell.row < firstRow - THUMB_PREFETCH_ROWS ||
                        cell.row > lastRow + THUMB_PREFETCH_ROWS -> releaseThumb(cell)
                }
            }
        }

        for ((rowIndex, rowPages) in rows.withIndex()) {
            val rowLayout = LinearLayout(act).apply {
                orientation = LinearLayout.HORIZONTAL
                layoutParams = LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                ).apply {
                    bottomMargin = gap * 2
                }
            }

            for (page in rowPages) {
                val cell = SquareFrameLayout(act).apply {
                    val lp = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply {
                        setMargins(gap, 0, gap, 0)
                    }
                    layoutParams = lp
                    isClickable = true
                    isFocusable = true
                }

                val thumbView = ImageView(act).apply {
                    layoutParams = FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                    )
                    scaleType = ImageView.ScaleType.CENTER_CROP
                    val bg = GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        setColor(0x22888888.toInt())
                        cornerRadius = dpToPx(act, 6f)
                    }
                    background = bg
                    clipToOutline = true
                }
                cell.addView(thumbView)
                thumbCells.add(ThumbCell(rowIndex, page.thumbnailUrl, thumbView))

                val borderOverlay = View(act).apply {
                    layoutParams = FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                    )
                    val borderDrawable = GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        setStroke(dpToPx(act, 2.5f).toInt(), 0xFF0096FA.toInt())
                        cornerRadius = dpToPx(act, 6f)
                        setColor(0x180096FA.toInt())
                    }
                    background = borderDrawable
                    visibility = if (page.isSelected) View.VISIBLE else View.GONE
                }
                cell.addView(borderOverlay)

                val badgeView = ImageView(act).apply {
                    val bSize = dpToPx(act, 26f).toInt()
                    val bMargin = dpToPx(act, 5f).toInt()
                    layoutParams = FrameLayout.LayoutParams(bSize, bSize, Gravity.TOP or Gravity.END).apply {
                        setMargins(0, bMargin, bMargin, 0)
                    }
                    setImageDrawable(if (page.isSelected) checkedBadge else uncheckedBadge)
                }
                cell.addView(badgeView)

                fun updateCell() {
                    badgeView.setImageDrawable(if (page.isSelected) checkedBadge else uncheckedBadge)
                    borderOverlay.visibility = if (page.isSelected) View.VISIBLE else View.GONE
                }
                cellUpdaters.add(::updateCell)

                cell.setOnClickListener {
                    page.isSelected = !page.isSelected
                    updateCell()
                    updateUI()
                }

                rowLayout.addView(cell)
            }

            val remaining = numColumns - rowPages.size
            for (i in 0 until remaining) {
                val dummy = View(act).apply {
                    layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply {
                        setMargins(gap, 0, gap, 0)
                    }
                    visibility = View.INVISIBLE
                }
                rowLayout.addView(dummy)
            }

            gridContainer.addView(rowLayout)
        }

        scrollView.addView(gridContainer)
        root.addView(scrollView)

        scrollView.viewTreeObserver.addOnScrollChangedListener { refreshThumbWindow() }
        scrollView.viewTreeObserver.addOnGlobalLayoutListener { scrollView.post { refreshThumbWindow() } }

        selectAllBtn.setOnClickListener {
            val allSelected = pages.all { it.isSelected }
            val newState = !allSelected
            pages.forEach { it.isSelected = newState }
            cellUpdaters.forEach { it() }
            updateUI()
        }

        val dialog = AlertDialog.Builder(act)
            .setTitle("Select Images to Download")
            .setView(root)
            .setPositiveButton("Download (${pages.size})") { _, _ ->
                val selected = pages.filter { it.isSelected }
                if (selected.isNotEmpty()) {
                    downloadSelectedPages(act, metadata, selected, pages.size)
                }
            }
            .setNegativeButton("Cancel", null)
            .create()

        dialogRef = dialog
        dialog.show()
        updateUI()
        refreshThumbWindow()
        scrollView.post { refreshThumbWindow() }
    }

    private fun createCheckBadgeDrawable(context: Context, isChecked: Boolean): Drawable {
        val sizePx = dpToPx(context, 26f).toInt().coerceAtLeast(52)
        val bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        val radius = sizePx / 2f
        val padding = sizePx * 0.08f
        val badgeRadius = radius - padding

        if (isChecked) {
            val bgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xFF0096FA.toInt()
                style = Paint.Style.FILL
                setShadowLayer(sizePx * 0.10f, 0f, sizePx * 0.04f, 0x88000000.toInt())
            }
            canvas.drawCircle(radius, radius, badgeRadius, bgPaint)

            val checkPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = Color.WHITE
                style = Paint.Style.STROKE
                strokeWidth = sizePx * 0.11f
                strokeCap = Paint.Cap.ROUND
                strokeJoin = Paint.Join.ROUND
            }
            val path = Path().apply {
                moveTo(radius - sizePx * 0.20f, radius + sizePx * 0.01f)
                lineTo(radius - sizePx * 0.05f, radius + sizePx * 0.16f)
                lineTo(radius + sizePx * 0.22f, radius - sizePx * 0.13f)
            }
            canvas.drawPath(path, checkPaint)
        } else {
            val bgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0x55000000.toInt()
                style = Paint.Style.FILL
                setShadowLayer(sizePx * 0.10f, 0f, sizePx * 0.04f, 0x88000000.toInt())
            }
            val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xEEFFFFFF.toInt()
                style = Paint.Style.STROKE
                strokeWidth = sizePx * 0.08f
            }
            canvas.drawCircle(radius, radius, badgeRadius, bgPaint)
            canvas.drawCircle(radius, radius, badgeRadius, strokePaint)
        }

        return BitmapDrawable(context.resources, bitmap)
    }

    private fun loadThumbnailAsync(
        url: String?,
        imageView: ImageView,
        targetPx: Int,
        onFinished: (() -> Unit)? = null
    ) {
        if (url.isNullOrBlank()) {
            onFinished?.invoke()
            return
        }

        val cached = thumbnailCache.get(url)
        if (cached != null) {
            imageView.setImageBitmap(cached)
            onFinished?.invoke()
            return
        }

        val context = imageView.context
        val cacheDir = File(context.cacheDir, "morphe_thumbs").apply { if (!exists()) mkdirs() }
        val diskFile = File(cacheDir, "${url.hashCode()}.bin")

        imageView.tag = url
        thumbnailExecutor.execute {
            val bmp = try {
                obtainThumbnail(url, diskFile, targetPx)
            } catch (t: Throwable) {
                Log.w(TAG, "Thumbnail load failed for $url: ${t.message}")
                null
            }
            mainHandler.post {
                if (bmp != null && imageView.tag == url) {
                    imageView.setImageBitmap(bmp)
                }
                onFinished?.invoke()
            }
        }
    }

    private fun obtainThumbnail(url: String, diskFile: File, targetPx: Int): Bitmap? {
        if (diskFile.exists() && diskFile.length() > 0) {
            val fromDisk = decodeSampledFile(diskFile, targetPx)
            if (fromDisk != null) {
                thumbnailCache.put(url, fromDisk)
                return fromDisk
            }
        }

        val conn = (URL(url).openConnection() as HttpURLConnection).apply {
            setRequestProperty("Referer", PXIMG_REFERER)
            setRequestProperty("User-Agent", USER_AGENT)
            connectTimeout = 8000
            readTimeout = 12000
        }
        try {
            val code = conn.responseCode
            if (code !in 200..299) {
                Log.w(TAG, "Thumbnail HTTP $code for $url")
                return null
            }
            val bytes = conn.inputStream.use { it.readBytes() }
            runCatching { FileOutputStream(diskFile).use { it.write(bytes) } }
            val bmp = decodeSampled(bytes, targetPx) ?: return null
            thumbnailCache.put(url, bmp)
            return bmp
        } finally {
            conn.disconnect()
        }
    }

    private fun decodeSampledFile(file: File, targetPx: Int): Bitmap? {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(file.absolutePath, bounds)
        val options = BitmapFactory.Options().apply {
            inSampleSize = sampleSizeFor(bounds.outWidth, bounds.outHeight, targetPx)
        }
        return runCatching { BitmapFactory.decodeFile(file.absolutePath, options) }.getOrNull()
    }

    private fun decodeSampled(bytes: ByteArray, targetPx: Int): Bitmap? {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeByteArray(bytes, 0, bytes.size, bounds)
        val options = BitmapFactory.Options().apply {
            inSampleSize = sampleSizeFor(bounds.outWidth, bounds.outHeight, targetPx)
        }
        return runCatching { BitmapFactory.decodeByteArray(bytes, 0, bytes.size, options) }.getOrNull()
    }

    /** Keeps the decoded edge in [targetPx, 2 * targetPx). */
    private fun sampleSizeFor(width: Int, height: Int, targetPx: Int): Int {
        if (width <= 0 || height <= 0 || targetPx <= 0) return 1
        val longest = maxOf(width, height)
        var sample = 1
        while (longest / (sample * 2) >= targetPx) {
            sample *= 2
        }
        return sample
    }

    private fun downloadSingleImageDirectly(context: Context, metadata: WorkMetadata, page: PageItem) {
        executor.execute {
            try {
                showToast(context, "Downloading original artwork...")
                val saved = downloadOne(context, metadata, page, totalPages = 1)
                if (saved != null) {
                    showToast(context, "Saved: ${saved.location}")
                } else {
                    showToast(context, "Download failed: could not fetch or save the image")
                }
            } catch (t: Throwable) {
                Log.e(TAG, "Single image download failed", t)
                showToast(context, "Download failed: ${t.message}")
            }
        }
    }

    private fun downloadSelectedPages(
        context: Context,
        metadata: WorkMetadata,
        selected: List<PageItem>,
        totalPages: Int
    ) {
        executor.execute {
            try {
                val total = selected.size
                showToast(context, if (total == 1) "Downloading 1 image..." else "Downloading $total images...")

                var successCount = 0
                var failCount = 0
                var lastLocation: String? = null

                for ((index, page) in selected.withIndex()) {
                    val saved = downloadOne(context, metadata, page, totalPages)
                    if (saved != null) {
                        successCount++
                        lastLocation = saved.location
                    } else {
                        failCount++
                        Log.w(TAG, "Failed to download page ${page.pageIndex}: ${page.originalUrl}")
                    }

                    if (total >= 5 && (index + 1) % 5 == 0 && (index + 1) < total) {
                        showToast(context, "Downloaded ${index + 1}/$total images...")
                    }
                }

                when {
                    failCount == 0 -> showToast(context, "Saved $successCount image(s) to $lastLocation")
                    successCount > 0 -> showToast(context, "Saved $successCount image(s), $failCount failed")
                    else -> showToast(context, "Download failed for all images")
                }
            } catch (t: Throwable) {
                Log.e(TAG, "Multi image download failed", t)
                showToast(context, "Download failed: ${t.message}")
            }
        }
    }

    /**
     * Downloads [page] and stores it. Tries the URL as-is first, then flips the file extension
     * (Pixiv originals come as either .jpg or .png and the URL never tells which).
     * Only a non-2xx response means "wrong extension"; a failed write or a broken transfer ends
     * the attempt instead of being retried as another extension.
     * Returns null when the page could not be stored.
     */
    private fun downloadOne(
        context: Context,
        metadata: WorkMetadata,
        page: PageItem,
        totalPages: Int
    ): SavedFile? {
        for (candidate in extensionCandidates(page.originalUrl)) {
            var conn: HttpURLConnection? = null
            try {
                conn = (URL(candidate).openConnection() as HttpURLConnection).apply {
                    setRequestProperty("Referer", PXIMG_REFERER)
                    setRequestProperty("User-Agent", USER_AGENT)
                    connectTimeout = 15000
                    readTimeout = 30000
                }

                val code = conn.responseCode
                if (code !in 200..299) {
                    Log.w(TAG, "HTTP $code for $candidate")
                    continue
                }

                val mimeType = conn.contentType?.lowercase()
                val ext = extensionFor(mimeType, candidate)
                val filename = buildFilename(metadata, page.pageIndex, totalPages, ext)
                val location = conn.inputStream.use { saveToStorage(context, it, filename, mimeFor(ext)) }
                if (location == null) {
                    Log.e(TAG, "Storage write failed for $filename, not retrying other extensions")
                    return null
                }
                Log.i(TAG, "Saved $filename -> $location")
                return SavedFile(filename, location)
            } catch (t: Throwable) {
                Log.w(TAG, "Download transfer failed for $candidate: ${t.message}")
                return null
            } finally {
                conn?.disconnect()
            }
        }
        return null
    }

    private fun extensionCandidates(url: String): List<String> {
        val dot = url.lastIndexOf('.')
        val slash = url.lastIndexOf('/')
        if (dot <= slash) return listOf("$url.jpg", "$url.png")
        return when (url.substring(dot + 1).lowercase()) {
            "jpg", "jpeg" -> listOf(url, url.substring(0, dot + 1) + "png")
            "png" -> listOf(url, url.substring(0, dot + 1) + "jpg")
            else -> listOf(url)
        }
    }

    private fun extensionFor(mimeType: String?, url: String): String {
        if (mimeType != null) {
            when {
                mimeType.contains("png") -> return "png"
                mimeType.contains("jpeg") || mimeType.contains("jpg") -> return "jpg"
                mimeType.contains("webp") -> return "webp"
                mimeType.contains("gif") -> return "gif"
            }
        }
        val dot = url.lastIndexOf('.')
        val slash = url.lastIndexOf('/')
        return if (dot > slash) url.substring(dot + 1).lowercase() else "jpg"
    }

    private fun mimeFor(ext: String): String = when (ext) {
        "png" -> "image/png"
        "webp" -> "image/webp"
        "gif" -> "image/gif"
        else -> "image/jpeg"
    }

    private fun buildFilename(metadata: WorkMetadata, pageIndex: Int, totalPages: Int, ext: String): String {
        val title = sanitize(metadata.title, 40, "pixiv")
        val artist = sanitize(metadata.artist, 30, "artist")
        val id = sanitize(metadata.id, 24, "illust")
        return if (totalPages <= 1) {
            "${id}_${title}_${artist}.$ext"
        } else {
            "${id}_p${pageIndex}_${title}_${artist}.$ext"
        }
    }

    private fun sanitize(value: String, maxLength: Int, fallback: String): String {
        val cleaned = value
            .replace(Regex("[\\\\/:*?\"<>|\\u0000-\\u001F]"), "_")
            .trim()
            .trim('.', '_')
            .take(maxLength)
        return cleaned.ifBlank { fallback }
    }

    /**
     * Lce7 is the shared interface of Le97 (illust) and Lmb7 (novel). The novel type stores an
     * `Lad7` object in field `u` while the illust stores a `List` there, so the field type is a
     * reliable discriminator.
     */
    private fun isIllust(work: Any): Boolean {
        val metaPagesField = findField(work.javaClass, META_PAGES_FIELDS)
        if (metaPagesField != null) {
            return List::class.java.isAssignableFrom(metaPagesField.type)
        }
        val singlePageField = findField(work.javaClass, META_SINGLE_PAGE_FIELDS) ?: return false
        return singlePageField.type != String::class.java
    }

    private fun extractMetadata(work: Any): WorkMetadata {
        val id = runCatching {
            (work.javaClass.getMethod("getId").invoke(work) as? Number)?.toLong()
        }.getOrNull()?.toString()
            ?: readField(work, listOf("a", "id"))?.let { (it as? Number)?.toString() }
            ?: "illust"

        val title = runCatching {
            work.javaClass.getMethod("getTitle").invoke(work) as? String
        }.getOrNull()?.takeIf { it.isNotBlank() }
            ?: readString(work, listOf("b", "title"))
            ?: "pixiv"

        val user = runCatching { work.javaClass.getMethod("f0").invoke(work) }.getOrNull()
            ?: readField(work, USER_FIELDS)
        val artist = readString(user, listOf("b", "name")) ?: "artist"

        return WorkMetadata(id = id, title = title, artist = artist)
    }

    private fun extractAllPages(work: Any): List<PageItem> {
        try {
            // 1. metaPages: List<PixivMetaPage(imageUrls = MetaPageImageUrls(medium, large, squareMedium, original)>
            val metaPages = readField(work, META_PAGES_FIELDS) as? List<*>
            if (!metaPages.isNullOrEmpty()) {
                val result = ArrayList<PageItem>(metaPages.size)
                for ((index, entry) in metaPages.withIndex()) {
                    if (entry == null) continue
                    // Lva7 has a single field `a` holding Lii5; older builds stored the url string
                    // as the page itself, which has no fields to reflect on.
                    val urls = readField(entry, PAGE_IMAGE_URLS_FIELDS) ?: entry
                    val legacyUrl = asHttpUrl(urls as? String)
                    val original = legacyUrl?.let { toOriginalUrl(it) ?: it }
                        ?: readUrl(urls, ORIGINAL_FIELDS)
                        ?: toOriginalUrl(readUrl(urls, LARGE_FIELDS))
                        ?: toOriginalUrl(readUrl(urls, MEDIUM_FIELDS))
                    if (original == null) {
                        Log.w(TAG, "Page $index has no original/large/medium url")
                        continue
                    }
                    val thumb = if (legacyUrl != null) {
                        null
                    } else {
                        readUrl(urls, SQUARE_FIELDS) ?: readUrl(urls, MEDIUM_FIELDS)
                    }
                    result.add(PageItem(pageIndex = index, originalUrl = original, thumbnailUrl = thumb))
                }
                if (result.isNotEmpty()) {
                    Log.i(TAG, "extractAllPages: ${result.size} page(s) from metaPages")
                    return result
                }
            }

            // 2. metaSinglePage: Lya7(originalImageUrl)
            val singlePage = readField(work, META_SINGLE_PAGE_FIELDS)
            val singleOriginal = readUrl(singlePage, SINGLE_PAGE_ORIGINAL_FIELDS)
            if (singleOriginal != null) {
                Log.i(TAG, "extractAllPages: 1 page from metaSinglePage")
                return listOf(
                    PageItem(
                        pageIndex = 0,
                        originalUrl = singleOriginal,
                        thumbnailUrl = illustThumbnail(work)
                    )
                )
            }

            // 3. Last resort: rebuild the original URL from the resampled ImageUrls object.
            val illustUrls = readField(work, ILLUST_IMAGE_URLS_FIELDS)
            if (illustUrls != null) {
                val base = toOriginalUrl(readUrl(illustUrls, LARGE_FIELDS))
                    ?: toOriginalUrl(readUrl(illustUrls, MEDIUM_FIELDS))
                if (base != null) {
                    // Only synthesise page URLs when the sample carries a `_p{n}` suffix,
                    // otherwise every page would resolve to the same first image.
                    val pageCount = if (PAGE_SUFFIX_REGEX.containsMatchIn(base)) {
                        (readField(work, PAGE_COUNT_FIELDS) as? Number)?.toInt()?.coerceIn(1, 200) ?: 1
                    } else {
                        1
                    }
                    val square = readUrl(illustUrls, SQUARE_FIELDS)
                    Log.i(TAG, "extractAllPages: derived $pageCount page(s) from imageUrls")
                    return (0 until pageCount).map { index ->
                        PageItem(
                            pageIndex = index,
                            originalUrl = withPageIndex(base, index),
                            thumbnailUrl = square?.let { withPageIndex(it, index) }
                        )
                    }
                }
            }
        } catch (t: Throwable) {
            Log.e(TAG, "extractAllPages failed", t)
        }
        return emptyList()
    }

    private fun illustThumbnail(work: Any): String? {
        val illustUrls = readField(work, ILLUST_IMAGE_URLS_FIELDS) ?: return null
        return readUrl(illustUrls, SQUARE_FIELDS) ?: readUrl(illustUrls, MEDIUM_FIELDS)
    }

    /**
     * Converts a resampled URL (`https://i.pximg.net/c/540x540_70/img-master/img/.../123_p0_master1200.jpg`)
     * into the original one (`https://i.pximg.net/img-original/img/.../123_p0.jpg`). The file
     * extension is kept as-is; callers retry with the flipped extension when it 404s.
     */
    private fun toOriginalUrl(raw: String?): String? {
        if (raw.isNullOrBlank()) return null
        var url = raw.trim()

        val marker = "/img-original/"
        if (!url.contains(marker)) {
            val masterIndex = url.indexOf("/img-master/")
            if (masterIndex < 0) return null
            url = PXIMG_HOST + marker + url.substring(masterIndex + "/img-master/".length)
        }

        val slash = url.lastIndexOf('/')
        if (slash < 0) return null
        val dir = url.substring(0, slash + 1)
        val name = url.substring(slash + 1)
        val dot = name.lastIndexOf('.')
        val ext = if (dot > 0) name.substring(dot) else ".jpg"
        var base = if (dot > 0) name.substring(0, dot) else name
        base = base.replace(Regex("_(master1200|square1200|thumb|small|medium|large)$"), "")
        if (base.isBlank()) return null
        return dir + base + ext
    }

    private fun withPageIndex(url: String, pageIndex: Int): String =
        url.replace(PAGE_SUFFIX_REGEX, "_p$pageIndex")

    private fun findField(cls: Class<*>, names: List<String>): Field? {
        var current: Class<*>? = cls
        while (current != null && current != Any::class.java) {
            for (name in names) {
                val field = runCatching { current!!.getDeclaredField(name) }.getOrNull() ?: continue
                runCatching { field.isAccessible = true }
                return field
            }
            current = current.superclass
        }
        return null
    }

    private fun readField(target: Any?, names: List<String>): Any? {
        if (target == null) return null
        val field = findField(target.javaClass, names) ?: return null
        return runCatching { field.get(target) }.getOrElse {
            Log.w(TAG, "readField(${names.first()}) failed: ${it.message}")
            null
        }
    }

    private fun readString(target: Any?, names: List<String>): String? =
        (readField(target, names) as? String)?.takeIf { it.isNotBlank() }

    private fun readUrl(target: Any?, names: List<String>): String? {
        val value = readString(target, names) ?: return null
        val url = asHttpUrl(value)
        if (url == null) {
            Log.w(TAG, "field ${names.first()} is not a url: $value")
        }
        return url
    }

    private fun asHttpUrl(value: String?): String? {
        if (value.isNullOrBlank()) return null
        return value.takeIf {
            it.startsWith("http://", ignoreCase = true) || it.startsWith("https://", ignoreCase = true)
        }
    }

    private fun createDownloadIconDrawable(context: Context): Drawable {
        val sizePx = dpToPx(context, 24f).toInt().coerceAtLeast(48)
        val bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)

        val strokeW = sizePx * 0.08f
        val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.WHITE
            style = Paint.Style.STROKE
            strokeWidth = strokeW
            strokeCap = Paint.Cap.ROUND
            strokeJoin = Paint.Join.ROUND
            setShadowLayer(sizePx * 0.08f, 0f, sizePx * 0.03f, 0x90000000.toInt())
        }

        val cx = sizePx / 2f
        val arrowTop = sizePx * 0.16f
        val arrowBottom = sizePx * 0.58f
        val wingOffset = sizePx * 0.18f
        val wingH = sizePx * 0.15f

        canvas.drawLine(cx, arrowTop, cx, arrowBottom, paint)

        val arrowPath = Path().apply {
            moveTo(cx - wingOffset, arrowBottom - wingH)
            lineTo(cx, arrowBottom)
            lineTo(cx + wingOffset, arrowBottom - wingH)
        }
        canvas.drawPath(arrowPath, paint)

        val trayLeft = sizePx * 0.20f
        val trayRight = sizePx * 0.80f
        val trayBottom = sizePx * 0.80f
        val trayWing = sizePx * 0.10f

        val trayPath = Path().apply {
            moveTo(trayLeft, trayBottom - trayWing)
            lineTo(trayLeft, trayBottom)
            lineTo(trayRight, trayBottom)
            lineTo(trayRight, trayBottom - trayWing)
        }
        canvas.drawPath(trayPath, paint)

        return BitmapDrawable(context.resources, bitmap)
    }

    /**
     * Returns a human readable location on success, null on failure.
     *
     * API >= 29 goes through MediaStore (no permission needed). Below that the public Pictures
     * directory needs WRITE_EXTERNAL_STORAGE, which this app never requests on the detail screen,
     * so the app-specific external directory is used instead - no dialog, no SecurityException.
     */
    private fun saveToStorage(context: Context, input: InputStream, filename: String, mimeType: String): String? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            saveToMediaStore(context, input, filename, mimeType)
        } else {
            saveToAppPictures(context, input, filename)
        }
    }

    private fun saveToMediaStore(context: Context, input: InputStream, filename: String, mimeType: String): String? {
        val resolver = context.contentResolver
        val contentValues = ContentValues().apply {
            put(MediaStore.MediaColumns.DISPLAY_NAME, filename)
            put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
            put(MediaStore.MediaColumns.RELATIVE_PATH, "${Environment.DIRECTORY_PICTURES}/Pixiv")
            put(MediaStore.MediaColumns.IS_PENDING, 1)
        }

        val uri: Uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
            ?: run {
                Log.e(TAG, "MediaStore insert returned null for $filename")
                return null
            }

        try {
            resolver.openOutputStream(uri)?.use { out ->
                input.copyTo(out)
            } ?: throw IllegalStateException("openOutputStream returned null")
            contentValues.clear()
            contentValues.put(MediaStore.MediaColumns.IS_PENDING, 0)
            resolver.update(uri, contentValues, null, null)
            return "Pictures/Pixiv/$filename"
        } catch (t: Throwable) {
            Log.e(TAG, "MediaStore write failed for $filename", t)
            runCatching { resolver.delete(uri, null, null) }
            return null
        }
    }

    private fun saveToAppPictures(context: Context, input: InputStream, filename: String): String? {
        val base = context.getExternalFilesDir(Environment.DIRECTORY_PICTURES)
            ?: File(context.filesDir, Environment.DIRECTORY_PICTURES)
        val dir = File(base, "Pixiv")
        if (!dir.exists() && !dir.mkdirs()) {
            Log.e(TAG, "Cannot create directory $dir")
            return null
        }

        val file = File(dir, filename)
        return try {
            FileOutputStream(file).use { out -> input.copyTo(out) }
            file.absolutePath
        } catch (t: Throwable) {
            Log.e(TAG, "File write failed for $file", t)
            runCatching { file.delete() }
            null
        }
    }

    private fun showToast(context: Context, message: String) {
        mainHandler.post {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        }
    }

    private fun dpToPx(context: Context, dp: Float): Float {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            dp,
            context.resources.displayMetrics
        )
    }
}
