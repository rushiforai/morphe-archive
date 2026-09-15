package app.morphe.extension.pixiv.downloader

import android.content.ContentValues
import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
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
    private val executor = Executors.newSingleThreadExecutor()
    private val mainHandler = Handler(Looper.getMainLooper())

    @JvmStatic
    fun onDetailBottomBarBound(view: View?, illust: Any?) {
        try {
            if (view == null || illust == null) return

            val context = view.context
            // Locate user_name_text_view or title_text_view layout
            val resId = context.resources.getIdentifier("title_text_view", "id", context.packageName)
            val titleView = if (resId != 0) {
                view.findViewById<TextView>(resId)
            } else {
                view as? TextView
            } ?: return

            val parentLayout = titleView.parent as? ViewGroup ?: return

            var downloadBtn = parentLayout.findViewWithTag<TextView>(TAG_DOWNLOAD_BUTTON)
            if (downloadBtn == null) {
                downloadBtn = TextView(context).apply {
                    tag = TAG_DOWNLOAD_BUTTON
                    text = "Save"
                    textSize = 11f
                    typeface = Typeface.DEFAULT_BOLD
                    setTextColor(Color.WHITE)

                    val radius = dpToPx(context, 4f)
                    val bg = GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        setColor(0xFF0096FA.toInt()) // Pixiv Blue
                        cornerRadius = radius
                    }
                    background = bg

                    val pxH = dpToPx(context, 8f).toInt()
                    val pxV = dpToPx(context, 3f).toInt()
                    setPadding(pxH, pxV, pxH, pxV)

                    val margin = dpToPx(context, 8f).toInt()
                    val lp = if (parentLayout is LinearLayout) {
                        LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                        ).apply {
                            gravity = Gravity.CENTER_VERTICAL
                            leftMargin = margin
                            marginStart = margin
                        }
                    } else {
                        ViewGroup.MarginLayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                        ).apply {
                            leftMargin = margin
                            marginStart = margin
                        }
                    }
                    layoutParams = lp
                }

                val titleIndex = parentLayout.indexOfChild(titleView)
                if (titleIndex >= 0) {
                    parentLayout.addView(downloadBtn, titleIndex + 1)
                } else {
                    parentLayout.addView(downloadBtn)
                }
            }

            downloadBtn.setOnClickListener {
                downloadOriginalArtwork(context, illust)
            }
            downloadBtn.visibility = View.VISIBLE
        } catch (_: Throwable) {
        }
    }

    private fun downloadOriginalArtwork(context: Context, illust: Any) {
        executor.execute {
            try {
                // Extract metadata via reflection
                val illustClass = illust.javaClass
                val idField = runCatching { illustClass.getField("id") }.getOrNull()
                    ?: runCatching { illustClass.getDeclaredField("id").apply { isAccessible = true } }.getOrNull()
                val id = idField?.get(illust) ?: "illust"

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

                // Extract original URL
                val originalUrl = resolveOriginalUrl(illust)
                if (originalUrl.isNullOrBlank()) {
                    showToast(context, "Original artwork URL not found")
                    return@execute
                }

                showToast(context, "Downloading original artwork...")

                // Determine extension (.png / .jpg)
                val ext = if (originalUrl.contains(".png", ignoreCase = true)) "png" else "jpg"
                val sanitizedTitle = title.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(40)
                val sanitizedArtist = userName.replace(Regex("[\\\\/:*?\"<>|]"), "_").take(30)
                val filename = "${id}_${sanitizedTitle}_${sanitizedArtist}.$ext"

                // Download using HttpURLConnection with Pixiv Referer
                val url = URL(originalUrl)
                val conn = (url.openConnection() as HttpURLConnection).apply {
                    setRequestProperty("Referer", "https://app-api.pixiv.net/")
                    setRequestProperty("User-Agent", "PixivAndroidApp/6.196.0 (Android 15; Pixel 8)")
                    connectTimeout = 15000
                    readTimeout = 30000
                }

                if (conn.responseCode !in 200..299) {
                    showToast(context, "Download failed (HTTP ${conn.responseCode})")
                    return@execute
                }

                val inputStream = conn.inputStream
                val savedUri = saveToMediaStore(context, inputStream, filename, if (ext == "png") "image/png" else "image/jpeg")
                inputStream.close()
                conn.disconnect()

                if (savedUri != null) {
                    showToast(context, "Saved to Photos: $filename")
                } else {
                    showToast(context, "Failed to save image to Photos")
                }
            } catch (e: Throwable) {
                showToast(context, "Download failed: ${e.message}")
            }
        }
    }

    private fun resolveOriginalUrl(illust: Any): String? {
        val illustClass = illust.javaClass

        // 1. Check metaSinglePage
        val singlePageField = runCatching { illustClass.getField("metaSinglePage") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("metaSinglePage").apply { isAccessible = true } }.getOrNull()
        val singlePage = singlePageField?.get(illust)
        if (singlePage != null) {
            val origField = runCatching { singlePage.javaClass.getField("originalImageUrl") }.getOrNull()
                ?: runCatching { singlePage.javaClass.getDeclaredField("originalImageUrl").apply { isAccessible = true } }.getOrNull()
            val origUrl = origField?.get(singlePage) as? String
            if (!origUrl.isNullOrBlank()) return origUrl

            val dMethod = runCatching { singlePage.javaClass.getMethod("d") }.getOrNull()
            val dUrl = dMethod?.invoke(singlePage) as? String
            if (!dUrl.isNullOrBlank()) return dUrl
        }

        // 2. Check metaPages (for multi-page works, take page 0)
        val metaPagesField = runCatching { illustClass.getField("metaPages") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("metaPages").apply { isAccessible = true } }.getOrNull()
        val metaPagesList = metaPagesField?.get(illust) as? List<*>
        if (!metaPagesList.isNullOrEmpty()) {
            val firstPage = metaPagesList[0]
            if (firstPage != null) {
                val dMethod = runCatching { firstPage.javaClass.getMethod("d") }.getOrNull()
                val metaUrls = dMethod?.invoke(firstPage)
                if (metaUrls != null) {
                    val hMethod = runCatching { metaUrls.javaClass.getMethod("h") }.getOrNull()
                    val origUrl = hMethod?.invoke(metaUrls) as? String
                    if (!origUrl.isNullOrBlank()) return origUrl
                }
            }
        }

        // 3. Fallback to imageUrls (large)
        val imageUrlsField = runCatching { illustClass.getField("imageUrls") }.getOrNull()
            ?: runCatching { illustClass.getDeclaredField("imageUrls").apply { isAccessible = true } }.getOrNull()
        val imageUrls = imageUrlsField?.get(illust)
        if (imageUrls != null) {
            val dMethod = runCatching { imageUrls.javaClass.getMethod("d") }.getOrNull()
            return dMethod?.invoke(imageUrls) as? String
        }

        return null
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
            resolver.openOutputStream(uri)?.use { out ->
                input.copyTo(out)
            }
            contentValues.clear()
            contentValues.put(MediaStore.MediaColumns.IS_PENDING, 0)
            resolver.update(uri, contentValues, null, null)
            uri
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
