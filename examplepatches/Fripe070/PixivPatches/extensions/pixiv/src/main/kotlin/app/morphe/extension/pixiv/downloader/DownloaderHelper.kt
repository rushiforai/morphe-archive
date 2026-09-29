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
import android.util.LruCache
import android.util.TypedValue
import android.view.Gravity
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.view.ViewParent
import android.widget.CheckBox
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
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.Executors

object DownloaderHelper {

    private const val TAG_DOWNLOAD_BUTTON = "morphe_download_button"
    private const val DOWNLOAD_MENU_ID = 0x7f099990

    private val executor = Executors.newFixedThreadPool(2)
    private val mainHandler = Handler(Looper.getMainLooper())
    private val thumbnailCache = LruCache<String, Bitmap>(50)

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

    @JvmStatic
    fun onDetailBottomBarBound(view: View?, illust: Any?) {
        try {
            if (view == null || illust == null) return

            // 1. Clean up any broken button previously injected into title_container
            cleanupBrokenBottomBarButton(view)

            // 2. Inject download button into top toolbar (or fallback to bottom bar right edge)
            view.post {
                try {
                    injectToolbarDownloadButton(view, illust)
                } catch (_: Throwable) {
                    fallbackInjectBottomBar(view, illust)
                }
            }
        } catch (_: Throwable) {
        }
    }

    private fun cleanupBrokenBottomBarButton(view: View) {
        try {
            val oldBtn = view.findViewWithTag<View>(TAG_DOWNLOAD_BUTTON)
            if (oldBtn != null && oldBtn.parent is ViewGroup) {
                (oldBtn.parent as ViewGroup).removeView(oldBtn)
            }
        } catch (_: Throwable) {
        }
    }

    private fun injectToolbarDownloadButton(view: View, illust: Any) {
        val toolbar = findToolbarInHierarchy(view)
        if (toolbar == null) {
            fallbackInjectBottomBar(view, illust)
            return
        }

        val getMenuMethod = runCatching { toolbar.javaClass.getMethod("getMenu") }.getOrNull()
        val menu = getMenuMethod?.invoke(toolbar) as? Menu
        if (menu == null) {
            fallbackInjectBottomBar(view, illust)
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
                handleDownloadAction(view.context, illust)
            } catch (t: Throwable) {
                showToast(view.context, "Download error: ${t.message}")
            }
            true
        }
    }

    private fun fallbackInjectBottomBar(view: View, illust: Any) {
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
                        setColor(0xFF0096FA.toInt()) // Pixiv Blue
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
                handleDownloadAction(context, illust)
            }
            downloadBtn.visibility = View.VISIBLE
        } catch (_: Throwable) {
        }
    }

    private fun findToolbarInHierarchy(view: View): ViewGroup? {
        val context = view.context
        val toolbarResId = context.resources.getIdentifier("tool_bar", "id", context.packageName)
        if (toolbarResId == 0) return null

        // 1. Walk up view parent hierarchy
        var current: ViewParent? = view.parent
        while (current != null) {
            if (current is ViewGroup) {
                val tb = current.findViewById<ViewGroup>(toolbarResId)
                if (tb != null) return tb
            }
            current = current.parent
        }

        // 2. Fallback to rootView
        val rootTb = view.rootView?.findViewById<ViewGroup>(toolbarResId)
        if (rootTb != null) return rootTb

        // 3. Fallback to unwrapped Activity
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

    private fun handleDownloadAction(context: Context, illust: Any) {
        val pages = extractAllPages(illust)
        if (pages.isEmpty()) {
            showToast(context, "No downloadable artwork found")
            return
        }

        val metadata = extractMetadata(illust)

        if (pages.size == 1) {
            // Single-image work: direct download without prompt
            downloadSingleImageDirectly(context, metadata, pages[0])
        } else {
            // Multi-image work: open page picker dialog
            showPagePickerDialog(context, metadata, pages)
        }
    }

    private class SquareFrameLayout(context: Context) : FrameLayout(context) {
        override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
            super.onMeasure(widthMeasureSpec, widthMeasureSpec)
        }
    }

    private fun showPagePickerDialog(context: Context, metadata: WorkMetadata, pages: List<PageItem>) {
        val act = getActivity(context) ?: return

        // Reset all selections to true by default
        pages.forEach { it.isSelected = true }

        val checkedBadge = createCheckBadgeDrawable(act, isChecked = true)
        val uncheckedBadge = createCheckBadgeDrawable(act, isChecked = false)

        val root = LinearLayout(act).apply {
            orientation = LinearLayout.VERTICAL
            val padH = dpToPx(act, 12f).toInt()
            val padTop = dpToPx(act, 12f).toInt()
            setPadding(padH, padTop, padH, 0)
        }

        // Top control bar
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

        // Divider
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

        // Scrollable photo grid
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

        for (rowPages in rows) {
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

                // Thumbnail ImageView
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
                loadThumbnailAsync(page.thumbnailUrl, thumbView)
                cell.addView(thumbView)

                // Selection Border & Blue Tint Overlay
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

                // Checkmark Badge in top-right corner
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

            // Fill remaining columns in incomplete rows with invisible dummy views
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
                    downloadSelectedPages(act, metadata, selected)
                }
            }
            .setNegativeButton("Cancel", null)
            .create()

        dialogRef = dialog
        dialog.show()
        updateUI()
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


    private fun loadThumbnailAsync(url: String?, imageView: ImageView) {
        if (url.isNullOrBlank()) return

        val cached = thumbnailCache.get(url)
        if (cached != null) {
            imageView.setImageBitmap(cached)
            return
        }

        imageView.tag = url
        executor.execute {
            try {
                val conn = (URL(url).openConnection() as HttpURLConnection).apply {
                    setRequestProperty("Referer", "https://app-api.pixiv.net/")
                    setRequestProperty("User-Agent", "PixivAndroidApp/6.196.0 (Android 15; Pixel 8)")
                    connectTimeout = 8000
                    readTimeout = 12000
                }
                if (conn.responseCode in 200..299) {
                    val bmp = BitmapFactory.decodeStream(conn.inputStream)
                    conn.disconnect()
                    if (bmp != null) {
                        thumbnailCache.put(url, bmp)
                        mainHandler.post {
                            if (imageView.tag == url) {
                                imageView.setImageBitmap(bmp)
                            }
                        }
                    }
                } else {
                    conn.disconnect()
                }
            } catch (_: Throwable) {
            }
        }
    }

    private fun downloadSingleImageDirectly(context: Context, metadata: WorkMetadata, page: PageItem) {
        executor.execute {
            try {
                showToast(context, "Downloading original artwork...")
                val ext = if (page.originalUrl.contains(".png", ignoreCase = true)) "png" else "jpg"
                val sanitizedTitle = metadata.title.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(40)
                val sanitizedArtist = metadata.artist.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(30)
                val filename = "${metadata.id}_${sanitizedTitle}_${sanitizedArtist}.$ext"
                val mimeType = if (ext == "png") "image/png" else "image/jpeg"

                val success = downloadAndSaveFile(context, page.originalUrl, filename, mimeType)
                if (success) {
                    showToast(context, "Saved to Photos: $filename")
                } else {
                    showToast(context, "Failed to download artwork")
                }
            } catch (e: Throwable) {
                showToast(context, "Download failed: ${e.message}")
            }
        }
    }

    private fun downloadSelectedPages(context: Context, metadata: WorkMetadata, selected: List<PageItem>) {
        executor.execute {
            try {
                val total = selected.size
                showToast(context, if (total == 1) "Downloading 1 image..." else "Downloading $total images...")

                var successCount = 0
                var failCount = 0

                val sanitizedTitle = metadata.title.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(40)
                val sanitizedArtist = metadata.artist.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(30)

                for ((index, page) in selected.withIndex()) {
                    val ext = if (page.originalUrl.contains(".png", ignoreCase = true)) "png" else "jpg"
                    val filename = "${metadata.id}_p${page.pageIndex}_${sanitizedTitle}_${sanitizedArtist}.$ext"
                    val mimeType = if (ext == "png") "image/png" else "image/jpeg"

                    val success = downloadAndSaveFile(context, page.originalUrl, filename, mimeType)
                    if (success) {
                        successCount++
                    } else {
                        failCount++
                    }

                    if (total >= 5 && (index + 1) % 5 == 0 && (index + 1) < total) {
                        showToast(context, "Downloaded ${index + 1}/$total images...")
                    }
                }

                if (failCount == 0) {
                    showToast(context, "Saved all $successCount images to Photos")
                } else if (successCount > 0) {
                    showToast(context, "Saved $successCount images ($failCount failed)")
                } else {
                    showToast(context, "Failed to download images")
                }
            } catch (e: Throwable) {
                showToast(context, "Download failed: ${e.message}")
            }
        }
    }

    private fun downloadAndSaveFile(context: Context, urlStr: String, filename: String, mimeType: String): Boolean {
        return try {
            val url = URL(urlStr)
            val conn = (url.openConnection() as HttpURLConnection).apply {
                setRequestProperty("Referer", "https://app-api.pixiv.net/")
                setRequestProperty("User-Agent", "PixivAndroidApp/6.196.0 (Android 15; Pixel 8)")
                connectTimeout = 15000
                readTimeout = 30000
            }

            if (conn.responseCode !in 200..299) {
                conn.disconnect()
                return false
            }

            val input = conn.inputStream
            val uri = saveToMediaStore(context, input, filename, mimeType)
            input.close()
            conn.disconnect()
            uri != null
        } catch (_: Throwable) {
            false
        }
    }

    private fun extractMetadata(illust: Any): WorkMetadata {
        val illustClass = illust.javaClass
        val idField = runCatching { illustClass.getField("id") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("id").apply { isAccessible = true } }.getOrNull()
        val id = idField?.get(illust)?.toString() ?: "illust"

        val titleField = runCatching { illustClass.getField("title") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("title").apply { isAccessible = true } }.getOrNull()
        val title = (titleField?.get(illust) as? String) ?: "pixiv"

        val userField = runCatching { illustClass.getField("user") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("user").apply { isAccessible = true } }.getOrNull()
        val userObj = userField?.get(illust)

        val userName = if (userObj != null) {
            val nameField = runCatching { userObj.javaClass.getField("name") }.getOrNull()
                ?: runCatching { userObj.javaClass.getDeclaredField("name").apply { isAccessible = true } }.getOrNull()
            (nameField?.get(userObj) as? String) ?: "artist"
        } else {
            "artist"
        }

        return WorkMetadata(id = id, title = title, artist = userName)
    }

    private fun extractAllPages(illust: Any): List<PageItem> {
        val illustClass = illust.javaClass

        // 1. Check metaPages (for multi-page works)
        val metaPagesField = runCatching { illustClass.getField("metaPages") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("metaPages").apply { isAccessible = true } }.getOrNull()
        val metaPagesList = metaPagesField?.get(illust) as? List<*>
        if (!metaPagesList.isNullOrEmpty()) {
            val result = mutableListOf<PageItem>()
            for ((index, page) in metaPagesList.withIndex()) {
                if (page == null) continue
                val origUrl = resolveOriginalFromPage(page)
                val thumbUrl = resolveThumbFromPage(page)
                if (!origUrl.isNullOrBlank()) {
                    result.add(PageItem(pageIndex = index, originalUrl = origUrl, thumbnailUrl = thumbUrl))
                }
            }
            if (result.isNotEmpty()) return result
        }

        // 2. Check metaSinglePage (for 1-page works)
        val singlePageField = runCatching { illustClass.getField("metaSinglePage") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("metaSinglePage").apply { isAccessible = true } }.getOrNull()
        val singlePage = singlePageField?.get(illust)
        if (singlePage != null) {
            val origUrl = resolveOriginalFromSinglePage(singlePage)
            val thumbUrl = resolveThumbFromIllust(illust)
            if (!origUrl.isNullOrBlank()) {
                return listOf(PageItem(pageIndex = 0, originalUrl = origUrl, thumbnailUrl = thumbUrl))
            }
        }

        // 3. Fallback to imageUrls
        val imageUrlsField = runCatching { illustClass.getField("imageUrls") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("imageUrls").apply { isAccessible = true } }.getOrNull()
        val imageUrls = imageUrlsField?.get(illust)
        if (imageUrls != null) {
            val origUrl = runCatching { imageUrls.javaClass.getMethod("getOriginal").invoke(imageUrls) as? String }.getOrNull()
                ?: runCatching { imageUrls.javaClass.getMethod("d").invoke(imageUrls) as? String }.getOrNull()
            val thumbUrl = runCatching { imageUrls.javaClass.getMethod("getMedium").invoke(imageUrls) as? String }.getOrNull()
                ?: runCatching { imageUrls.javaClass.getMethod("g").invoke(imageUrls) as? String }.getOrNull()
            if (!origUrl.isNullOrBlank()) {
                return listOf(PageItem(pageIndex = 0, originalUrl = origUrl, thumbnailUrl = thumbUrl))
            }
        }

        return emptyList()
    }

    private fun resolveOriginalFromPage(page: Any): String? {
        val urlsObj = runCatching { page.javaClass.getMethod("getImageUrls").invoke(page) }.getOrNull()
            ?: runCatching { page.javaClass.getMethod("d").invoke(page) }.getOrNull()
            ?: runCatching { page.javaClass.getDeclaredField("imageUrls").apply { isAccessible = true }.get(page) }.getOrNull()
            ?: return null

        return runCatching { urlsObj.javaClass.getMethod("getOriginal").invoke(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getMethod("h").invoke(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getDeclaredField("original").apply { isAccessible = true }.get(urlsObj) as? String }.getOrNull()
    }

    private fun resolveThumbFromPage(page: Any): String? {
        val urlsObj = runCatching { page.javaClass.getMethod("getImageUrls").invoke(page) }.getOrNull()
            ?: runCatching { page.javaClass.getMethod("d").invoke(page) }.getOrNull()
            ?: runCatching { page.javaClass.getDeclaredField("imageUrls").apply { isAccessible = true }.get(page) }.getOrNull()
            ?: return null

        return runCatching { urlsObj.javaClass.getMethod("getSquareMedium").invoke(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getMethod("getMedium").invoke(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getMethod("g").invoke(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getDeclaredField("squareMedium").apply { isAccessible = true }.get(urlsObj) as? String }.getOrNull()
            ?: runCatching { urlsObj.javaClass.getDeclaredField("medium").apply { isAccessible = true }.get(urlsObj) as? String }.getOrNull()
    }

    private fun resolveOriginalFromSinglePage(singlePage: Any): String? {
        val origField = runCatching { singlePage.javaClass.getField("originalImageUrl") }.getOrNull()
            ?: runCatching { singlePage.javaClass.getDeclaredField("originalImageUrl").apply { isAccessible = true } }.getOrNull()
        val origUrl = origField?.get(singlePage) as? String
        if (!origUrl.isNullOrBlank()) return origUrl

        val dMethod = runCatching { singlePage.javaClass.getMethod("d") }.getOrNull()
        return dMethod?.invoke(singlePage) as? String
    }

    private fun resolveThumbFromIllust(illust: Any): String? {
        val illustClass = illust.javaClass
        val imageUrlsField = runCatching { illustClass.getField("imageUrls") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("imageUrls").apply { isAccessible = true } }.getOrNull()
        val imageUrls = imageUrlsField?.get(illust) ?: return null

        return runCatching { imageUrls.javaClass.getMethod("getSquareMedium").invoke(imageUrls) as? String }.getOrNull()
            ?: runCatching { imageUrls.javaClass.getMethod("getMedium").invoke(imageUrls) as? String }.getOrNull()
            ?: runCatching { imageUrls.javaClass.getMethod("g").invoke(imageUrls) as? String }.getOrNull()
            ?: runCatching { imageUrls.javaClass.getDeclaredField("squareMedium").apply { isAccessible = true }.get(imageUrls) as? String }.getOrNull()
            ?: runCatching { imageUrls.javaClass.getDeclaredField("medium").apply { isAccessible = true }.get(imageUrls) as? String }.getOrNull()
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

        // Downward arrow stem
        canvas.drawLine(cx, arrowTop, cx, arrowBottom, paint)

        // Arrowhead chevron
        val arrowPath = Path().apply {
            moveTo(cx - wingOffset, arrowBottom - wingH)
            lineTo(cx, arrowBottom)
            lineTo(cx + wingOffset, arrowBottom - wingH)
        }
        canvas.drawPath(arrowPath, paint)

        // Bottom tray bracket
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

    private fun saveToMediaStore(context: Context, input: InputStream, filename: String, mimeType: String): Uri? {
        val resolver = context.contentResolver
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val contentValues = ContentValues().apply {
                put(MediaStore.MediaColumns.DISPLAY_NAME, filename)
                put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
                put(MediaStore.MediaColumns.RELATIVE_PATH, "${Environment.DIRECTORY_PICTURES}/Pixiv")
                put(MediaStore.MediaColumns.IS_PENDING, 1)
            }
            val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues) ?: return null
            try {
                resolver.openOutputStream(uri)?.use { out ->
                    input.copyTo(out)
                }
                contentValues.clear()
                contentValues.put(MediaStore.MediaColumns.IS_PENDING, 0)
                resolver.update(uri, contentValues, null, null)
                uri
            } catch (t: Throwable) {
                resolver.delete(uri, null, null)
                throw t
            }
        } else {
            val dir = File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), "Pixiv")
            if (!dir.exists()) dir.mkdirs()
            val file = File(dir, filename)
            FileOutputStream(file).use { out ->
                input.copyTo(out)
            }
            Uri.fromFile(file)
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
