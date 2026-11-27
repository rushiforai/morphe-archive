package dev.jkcarino.extension.reddit.frontpage

import android.app.Activity
import android.app.AlertDialog
import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.content.res.ColorStateList
import android.content.res.Configuration
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.Log
import android.util.TypedValue
import android.widget.CheckBox
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStream
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.nio.charset.StandardCharsets
import java.util.ArrayList
import java.util.Collections
import java.util.HashMap
import java.util.HashSet
import java.util.LinkedHashMap
import java.util.LinkedHashSet
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.locks.ReentrantLock
import java.util.regex.Pattern

object MediaDownloadHelper {

    private const val TAG = "MediaDownloadHelper"
    private const val PREFS_NAME = "morphe_media_downloader"
    private const val KEY_DEFAULT_ALL = "default_download_all"
    private const val KEY_DEFAULT_MODE = "default_download_mode"
    private const val MODE_ASK = "ASK"
    private const val MODE_ALL = "ALL"
    private const val MODE_SINGLE = "SINGLE"
    private const val USER_AGENT = "Mozilla/5.0 (Linux; Android 14; Mobile)"
    private const val MAX_RESPONSE_CHARS = 1024 * 1024
    private const val REDGIFS_DEADLINE_MS = 15_000L
    private const val BATCH_DEDUPE_WINDOW_MS = 1500L
    private const val MAX_RECENT_BATCHES = 64

    private val CLEAN_REDDIT_FILE_PATTERN = Pattern.compile("^[a-zA-Z0-9]+\\.(jpg|jpeg|png|gif|webp|avif|heic|bmp)$", Pattern.CASE_INSENSITIVE)
    private val REDGIFS_PATTERN = Pattern.compile("/(?:watch|ifr|i|gifs/detail)/([a-zA-Z0-9]+)", Pattern.CASE_INSENSITIVE)
    private val REDGIFS_CDN_PATTERN = Pattern.compile("/([a-zA-Z0-9]+)(?:-(?:mobile|silent))?\\.mp4", Pattern.CASE_INSENSITIVE)
    private val VREDDIT_VIDEO_ONLY_DASH = Pattern.compile("/dash_\\d+\\.mp4$", Pattern.CASE_INSENSITIVE)

    private val MAIN_HANDLER = Handler(Looper.getMainLooper())
    private val REDGIFS_EXECUTOR = Executors.newFixedThreadPool(3)
    private val FILE_COUNTER = AtomicInteger(0)
    private val TOKEN_LOCK = ReentrantLock()
    private val IN_FLIGHT_LOCK = ReentrantLock()
    private val IN_FLIGHT_REDGIFS = HashSet<String>()
    private val BATCH_LOCK = ReentrantLock()
    private val RECENT_BATCHES = LinkedHashMap<String, Long>(32, 0.75f, true)
    private val TRACKER_LOCK = ReentrantLock()
    private val ACTIVE_DOWNLOAD_IDS = HashSet<Long>()
    private var sDownloadReceiver: BroadcastReceiver? = null
    private var sReceiverAppContext: Context? = null
    private val UNREGISTER_RUNNABLE = Runnable { unregisterDownloadReceiverIfIdle(force = true) }

    private class TokenEntry(val value: String, val expiryElapsedMs: Long)
    @Volatile private var sRedGifsTokenEntry: TokenEntry? = null

    private fun isBlank(s: String?): Boolean = ExtensionStrUtils.isBlank(s)
    private fun lower(s: String): String = ExtensionStrUtils.lower(s)
    private fun containsIgnoreCase(s: String?, needle: String): Boolean = ExtensionStrUtils.containsIgnoreCase(s, needle)
    private fun replaceAllLiteral(s: String, target: String, replacement: String): String = ExtensionStrUtils.replace(s, target, replacement)

    // Uses Java Runnable (void run()) so zero kotlin.Unit.INSTANCE references are emitted under R8
    private fun runOnMain(block: Runnable) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            block.run()
        } else {
            MAIN_HANDLER.post(block)
        }
    }

    private fun showToast(context: Context, message: String) {
        val appCtx = context.applicationContext ?: context
        runOnMain(Runnable {
            try {
                Toast.makeText(appCtx, message, Toast.LENGTH_SHORT).show()
            } catch (_: Throwable) {}
        })
    }

    private fun jsonStringOrNull(obj: JSONObject, key: String): String? {
        if (obj.isNull(key)) return null
        val v = obj.optString(key, "")
        return if (isBlank(v) || v == "null") null else v
    }

    private fun isHttpsUrl(url: String?): Boolean {
        if (isBlank(url)) return false
        val l = lower(url!!)
        return ExtensionStrUtils.startsWith(l, "https://")
    }

    private fun extractHostLower(url: String): String {
        return try {
            lower(Uri.parse(url).host ?: "")
        } catch (_: Throwable) {
            ""
        }
    }

    private fun extractPathLower(url: String): String {
        return try {
            lower(Uri.parse(url).path ?: "")
        } catch (_: Throwable) {
            ""
        }
    }

    private fun isStreamingManifest(url: String): Boolean {
        val path = extractPathLower(url)
        return ExtensionStrUtils.endsWith(path, ".mpd") || ExtensionStrUtils.endsWith(path, ".m3u8")
    }

    private fun isBareVRedditUrl(url: String): Boolean {
        val host = extractHostLower(url)
        if (host != "v.redd.it") return false
        val path = extractPathLower(url)
        return !ExtensionStrUtils.endsWith(path, ".mp4") &&
            !ExtensionStrUtils.endsWith(path, ".webm") &&
            !ExtensionStrUtils.endsWith(path, ".gif") &&
            !ExtensionStrUtils.endsWith(path, ".jpg") &&
            !ExtensionStrUtils.endsWith(path, ".jpeg") &&
            !ExtensionStrUtils.endsWith(path, ".png") &&
            !ExtensionStrUtils.endsWith(path, ".webp") &&
            !ExtensionStrUtils.endsWith(path, ".avif") &&
            !ExtensionStrUtils.endsWith(path, ".heic") &&
            !ExtensionStrUtils.endsWith(path, ".bmp")
    }

    private fun isVideoOnlyVRedditFallback(url: String): Boolean {
        val host = extractHostLower(url)
        if (host != "v.redd.it") return false
        val path = extractPathLower(url)
        return VREDDIT_VIDEO_ONLY_DASH.matcher(path).find()
    }

    private fun drainStreamQuietly(stream: InputStream?) {
        if (stream == null) return
        try {
            val buf = ByteArray(1024)
            var total = 0
            while (total < 65536) {
                val r = stream.read(buf)
                if (r <= 0) break
                total += r
            }
        } catch (_: Throwable) {
        } finally {
            try { stream.close() } catch (_: Throwable) {}
        }
    }

    private fun readStreamText(conn: HttpURLConnection): String {
        val reader = BufferedReader(InputStreamReader(conn.inputStream, StandardCharsets.UTF_8))
        try {
            val sb = StringBuilder()
            val buf = CharArray(4096)
            var total = 0
            while (total < MAX_RESPONSE_CHARS) {
                val n = reader.read(buf, 0, Math.min(buf.size, MAX_RESPONSE_CHARS - total))
                if (n <= 0) break
                sb.append(buf, 0, n)
                total += n
            }
            return sb.toString()
        } finally {
            try { reader.close() } catch (_: Throwable) {}
        }
    }

    @JvmStatic
    fun getDefaultDownloadMode(context: Context): String {
        val appCtx = context.applicationContext ?: context
        val prefs = appCtx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val stored = prefs.getString(KEY_DEFAULT_MODE, null)
        if (stored == MODE_ALL || stored == MODE_SINGLE || stored == MODE_ASK) {
            return stored
        }
        return if (prefs.getBoolean(KEY_DEFAULT_ALL, false)) MODE_ALL else MODE_ASK
    }

    @JvmStatic
    fun setDefaultDownloadMode(context: Context, mode: String) {
        val appCtx = context.applicationContext ?: context
        val safeMode = if (mode == MODE_ALL || mode == MODE_SINGLE) mode else MODE_ASK
        appCtx
            .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .edit()
            .putString(KEY_DEFAULT_MODE, safeMode)
            .putBoolean(KEY_DEFAULT_ALL, safeMode == MODE_ALL)
            .apply()
    }

    @JvmStatic
    fun isDefaultDownloadAll(context: Context): Boolean {
        return getDefaultDownloadMode(context) == MODE_ALL
    }

    @JvmStatic
    fun setDefaultDownloadAll(context: Context, enabled: Boolean) {
        setDefaultDownloadMode(context, if (enabled) MODE_ALL else MODE_ASK)
    }

    @JvmStatic
    fun isRedGifsUrl(url: String): Boolean {
        val host = extractHostLower(url)
        return host == "redgifs.com" || ExtensionStrUtils.endsWith(host, ".redgifs.com")
    }

    private fun isRedGifsMp4Path(url: String): Boolean {
        if (!isRedGifsUrl(url)) return false
        return ExtensionStrUtils.endsWith(extractPathLower(url), ".mp4")
    }

    private fun isDirectRedGifsCdnMp4(url: String): Boolean {
        if (!isRedGifsMp4Path(url)) return false
        val path = extractPathLower(url)
        if (ExtensionStrUtils.contains(path, "-mobile.mp4") || ExtensionStrUtils.contains(path, "-silent.mp4")) return false
        if (containsIgnoreCase(url, "expires=")) return false
        return true
    }

    @JvmStatic
    fun extractRedGifsId(url: String): String? {
        if (!isRedGifsUrl(url)) return null
        val path = try {
            Uri.parse(url).path ?: ""
        } catch (_: Throwable) {
            ""
        }
        val matcher = REDGIFS_PATTERN.matcher(path)
        if (matcher.find()) {
            val group = matcher.group(1)
            if (group != null) return lower(group)
        }
        val cdnMatcher = REDGIFS_CDN_PATTERN.matcher(path)
        if (cdnMatcher.find()) {
            val group = cdnMatcher.group(1)
            if (group != null) return lower(group)
        }
        return null
    }

    private fun getOrFetchRedGifsToken(forceRefresh: Boolean, deadlineElapsedMs: Long): String? {
        val now = SystemClock.elapsedRealtime()
        if (now >= deadlineElapsedMs) return null
        if (!forceRefresh) {
            val cached = sRedGifsTokenEntry
            if (cached != null && now < cached.expiryElapsedMs) {
                return cached.value
            }
        }
        TOKEN_LOCK.lock()
        try {
            val againNow = SystemClock.elapsedRealtime()
            if (againNow >= deadlineElapsedMs) return null
            if (!forceRefresh) {
                val cached = sRedGifsTokenEntry
                if (cached != null && againNow < cached.expiryElapsedMs) {
                    return cached.value
                }
            }
            var tokenConn: HttpURLConnection? = null
            return try {
                val remaining = (deadlineElapsedMs - againNow).toInt().coerceIn(1000, 8000)
                val tokenUrl = URL("https://api.redgifs.com/v2/auth/temporary")
                tokenConn = tokenUrl.openConnection() as HttpURLConnection
                tokenConn.connectTimeout = remaining
                tokenConn.readTimeout = remaining
                tokenConn.setRequestProperty("User-Agent", USER_AGENT)
                val code = tokenConn.responseCode
                if (code !in 200..299) {
                    drainStreamQuietly(tokenConn.errorStream)
                    return null
                }
                val tokenJson = readStreamText(tokenConn)
                val token = jsonStringOrNull(JSONObject(tokenJson), "token") ?: return null
                sRedGifsTokenEntry = TokenEntry(token, againNow + 10 * 60 * 1000L)
                token
            } catch (t: Throwable) {
                Log.e(TAG, "Failed to fetch RedGifs token: ${t.message}")
                null
            } finally {
                try { tokenConn?.disconnect() } catch (_: Throwable) {}
            }
        } finally {
            TOKEN_LOCK.unlock()
        }
    }

    @JvmStatic
    fun resolveRedGifsDirectUrl(redgifsUrl: String): String? {
        if (isDirectRedGifsCdnMp4(redgifsUrl)) return redgifsUrl
        val id = extractRedGifsId(redgifsUrl) ?: return if (isRedGifsMp4Path(redgifsUrl)) redgifsUrl else null
        val deadline = SystemClock.elapsedRealtime() + REDGIFS_DEADLINE_MS
        for (attempt in 0..1) {
            val now = SystemClock.elapsedRealtime()
            if (now >= deadline) break
            var gifConn: HttpURLConnection? = null
            try {
                val token = getOrFetchRedGifsToken(forceRefresh = attempt == 1, deadlineElapsedMs = deadline) ?: break
                val remaining = (deadline - SystemClock.elapsedRealtime()).toInt().coerceIn(1000, 8000)
                val gifUrl = URL("https://api.redgifs.com/v2/gifs/$id")
                gifConn = gifUrl.openConnection() as HttpURLConnection
                gifConn.connectTimeout = remaining
                gifConn.readTimeout = remaining
                gifConn.setRequestProperty("Authorization", "Bearer $token")
                gifConn.setRequestProperty("User-Agent", USER_AGENT)
                val code = gifConn.responseCode
                if (code == 401 && attempt == 0) {
                    drainStreamQuietly(gifConn.errorStream)
                    sRedGifsTokenEntry = null
                    continue
                }
                if (code !in 200..299) {
                    drainStreamQuietly(gifConn.errorStream)
                    break
                }
                val gifJson = readStreamText(gifConn)
                val gifObj = JSONObject(gifJson).optJSONObject("gif") ?: break
                val urlsObj = gifObj.optJSONObject("urls") ?: break
                val hd = jsonStringOrNull(urlsObj, "hd")
                if (isHttpsUrl(hd)) return hd
                val sd = jsonStringOrNull(urlsObj, "sd")
                if (isHttpsUrl(sd)) return sd
                break
            } catch (t: Throwable) {
                Log.e(TAG, "Failed to resolve RedGifs direct URL for $redgifsUrl: ${t.message}")
                break
            } finally {
                try { gifConn?.disconnect() } catch (_: Throwable) {}
            }
        }
        return if (isRedGifsMp4Path(redgifsUrl)) redgifsUrl else null
    }

    @JvmStatic
    fun normalizeUrl(rawUrl: String): String {
        var trimmed = ExtensionStrUtils.trim(ExtensionStrUtils.unescapeAmp(rawUrl))
        if (trimmed.isEmpty()) return ""
        return try {
            val uri = Uri.parse(trimmed)
            val hostRaw = uri.host ?: return trimmed
            val host = lower(hostRaw)
            val segments = uri.pathSegments
            val segment = uri.lastPathSegment
            if (host == "preview.redd.it" &&
                segments != null &&
                segments.size == 1 &&
                segment != null &&
                uri.getQueryParameter("format") == null &&
                CLEAN_REDDIT_FILE_PATTERN.matcher(segment).matches()
            ) {
                "https://i.redd.it/$segment"
            } else {
                trimmed
            }
        } catch (_: Throwable) {
            trimmed
        }
    }

    @JvmStatic
    fun sanitizeUrls(urls: List<String>?): List<String> {
        if (urls == null || urls.isEmpty()) return ArrayList()
        val seenKeys = HashSet<String>()
        val result = ArrayList<String>(urls.size)
        for (u in urls) {
            val norm = normalizeUrl(u)
            if (isHttpsUrl(norm) && !isStreamingManifest(norm) && !isBareVRedditUrl(norm)) {
                val key = ExtensionStrUtils.canonicalMediaKey(norm)
                if (seenKeys.add(key)) {
                    result.add(norm)
                }
            }
        }
        return result
    }

    private fun mergeCurrentIntoAll(cleanCurrent: String?, cleanAll: List<String>): List<String> {
        if (cleanCurrent == null) return cleanAll
        val currentKey = ExtensionStrUtils.canonicalMediaKey(cleanCurrent)
        val merged = ArrayList<String>(cleanAll.size + 1)
        merged.add(cleanCurrent)
        for (u in cleanAll) {
            if (ExtensionStrUtils.canonicalMediaKey(u) != currentKey) {
                merged.add(u)
            }
        }
        return merged
    }

    private fun buildBatchKey(urls: List<String>): String {
        val keys = ArrayList<String>(urls.size)
        for (u in urls) {
            keys.add(ExtensionStrUtils.canonicalMediaKey(u))
        }
        Collections.sort(keys)
        val sb = StringBuilder()
        for (i in 0 until keys.size) {
            if (i > 0) sb.append('|')
            sb.append(keys[i])
        }
        return sb.toString()
    }

    private fun tryAcquireBatch(batchKey: String): Boolean {
        val now = SystemClock.elapsedRealtime()
        BATCH_LOCK.lock()
        try {
            val prev = RECENT_BATCHES[batchKey]
            if (prev != null && (now - prev) in 0L until BATCH_DEDUPE_WINDOW_MS) {
                return false
            }
            RECENT_BATCHES[batchKey] = now
            while (RECENT_BATCHES.size > MAX_RECENT_BATCHES) {
                val it = RECENT_BATCHES.entries.iterator()
                if (it.hasNext()) {
                    it.next()
                    it.remove()
                } else {
                    break
                }
            }
            return true
        } finally {
            BATCH_LOCK.unlock()
        }
    }

    private fun releaseBatch(batchKey: String) {
        BATCH_LOCK.lock()
        try {
            RECENT_BATCHES.remove(batchKey)
        } finally {
            BATCH_LOCK.unlock()
        }
    }

    @JvmStatic
    fun onTap(
        context: Context,
        currentUrl: String?,
        allUrls: List<String>?,
        postTitle: String?
    ) {
        runOnMain(Runnable {
            val cleanCurrent = if (currentUrl != null) {
                val n = normalizeUrl(currentUrl)
                if (isHttpsUrl(n) && !isStreamingManifest(n) && !isBareVRedditUrl(n)) n else null
            } else null
            val cleanAll = mergeCurrentIntoAll(cleanCurrent, sanitizeUrls(allUrls))

            if (cleanAll.isEmpty()) {
                showToast(context, "No downloadable media found")
                return@Runnable
            }

            if (cleanAll.size == 1) {
                downloadUrls(context, cleanAll, postTitle)
                return@Runnable
            }

            when (getDefaultDownloadMode(context)) {
                MODE_ALL -> {
                    downloadUrls(context, cleanAll, postTitle)
                }
                MODE_SINGLE -> {
                    val single = cleanCurrent ?: cleanAll[0]
                    val singleList = ArrayList<String>(1)
                    singleList.add(single)
                    downloadUrls(context, singleList, postTitle)
                }
                else -> {
                    showOptionsDialog(context, cleanCurrent, cleanAll, postTitle, preferSingleFallback = true)
                }
            }
        })
    }

    @JvmStatic
    fun onLongPress(
        context: Context,
        currentUrl: String?,
        allUrls: List<String>?,
        postTitle: String?
    ) {
        runOnMain(Runnable {
            val cleanCurrent = if (currentUrl != null) {
                val n = normalizeUrl(currentUrl)
                if (isHttpsUrl(n) && !isStreamingManifest(n) && !isBareVRedditUrl(n)) n else null
            } else null
            val cleanAll = mergeCurrentIntoAll(cleanCurrent, sanitizeUrls(allUrls))
            if (cleanAll.isEmpty()) {
                showToast(context, "No downloadable media found")
                return@Runnable
            }
            if (cleanAll.size == 1) {
                downloadUrls(context, cleanAll, postTitle)
                return@Runnable
            }
            showOptionsDialog(context, cleanCurrent, cleanAll, postTitle, preferSingleFallback = false)
        })
    }

    private fun showOptionsDialog(
        context: Context,
        cleanCurrent: String?,
        cleanAll: List<String>,
        postTitle: String?,
        preferSingleFallback: Boolean
    ) {
        if (cleanAll.isEmpty()) {
            showToast(context, "No downloadable media found")
            return
        }

        val effectiveCurrent = cleanCurrent ?: cleanAll[0]
        val activity = findActivity(context)
        if (activity == null || activity.isFinishing || activity.isDestroyed) {
            if (preferSingleFallback) {
                val singleList = ArrayList<String>(1)
                singleList.add(effectiveCurrent)
                downloadUrls(context, singleList, postTitle)
            } else {
                downloadUrls(context, cleanAll, postTitle)
            }
            return
        }

        try {
            val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES
            val dialogTheme = if (isDark) {
                android.R.style.Theme_DeviceDefault_Dialog_Alert
            } else {
                android.R.style.Theme_DeviceDefault_Light_Dialog_Alert
            }
            val primaryTextColor = if (isDark) Color.parseColor("#F2F4F5") else Color.parseColor("#181C1F")
            val uncheckedBoxColor = if (isDark) Color.parseColor("#D7DADC") else Color.parseColor("#576F76")
            val checkedBoxColor = Color.parseColor("#FF4500")

            val padH = dp(activity, 22)
            val padV = dp(activity, 12)

            val container = LinearLayout(activity)
            container.orientation = LinearLayout.VERTICAL
            container.setPadding(padH, padV, padH, dp(activity, 4))

            val countText = TextView(activity)
            countText.text = "${cleanAll.size} media items found in this post."
            countText.setTextColor(primaryTextColor)
            countText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f)
            countText.setPadding(0, 0, 0, dp(activity, 12))

            val currentMode = getDefaultDownloadMode(activity)
            val defaultCheckBox = CheckBox(activity)
            defaultCheckBox.text = "Remember my choice"
            defaultCheckBox.isChecked = currentMode != MODE_ASK
            defaultCheckBox.setTextColor(primaryTextColor)
            defaultCheckBox.buttonTintList = ColorStateList(
                arrayOf(
                    intArrayOf(android.R.attr.state_checked),
                    intArrayOf()
                ),
                intArrayOf(checkedBoxColor, uncheckedBoxColor)
            )
            defaultCheckBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f)
            defaultCheckBox.setPadding(dp(activity, 8), dp(activity, 4), dp(activity, 4), dp(activity, 8))

            container.addView(countText)
            container.addView(defaultCheckBox)

            AlertDialog.Builder(activity, dialogTheme)
                .setTitle("Download Media")
                .setView(container)
                .setPositiveButton("Download all (${cleanAll.size})") { _, _ ->
                    setDefaultDownloadMode(activity, if (defaultCheckBox.isChecked) MODE_ALL else MODE_ASK)
                    downloadUrls(activity, cleanAll, postTitle)
                }
                .setNeutralButton("Download single") { _, _ ->
                    setDefaultDownloadMode(activity, if (defaultCheckBox.isChecked) MODE_SINGLE else MODE_ASK)
                    val singleList = ArrayList<String>(1)
                    singleList.add(effectiveCurrent)
                    downloadUrls(activity, singleList, postTitle)
                }
                .setNegativeButton("Cancel", null)
                .show()
        } catch (t: Throwable) {
            Log.e(TAG, "Dialog error, falling back to direct download", t)
            if (preferSingleFallback) {
                val singleList = ArrayList<String>(1)
                singleList.add(effectiveCurrent)
                downloadUrls(context, singleList, postTitle)
            } else {
                downloadUrls(context, cleanAll, postTitle)
            }
        }
    }

    private class IndexedUrl(val index: Int, val url: String)

    @JvmStatic
    fun downloadUrls(context: Context, urls: List<String>, postTitle: String?) {
        val appContext = context.applicationContext ?: context
        val cleanUrls = sanitizeUrls(urls)
        if (cleanUrls.isEmpty()) {
            showToast(appContext, "No downloadable media found")
            return
        }

        val batchKey = buildBatchKey(cleanUrls)
        if (!tryAcquireBatch(batchKey)) {
            showToast(appContext, "Already downloading")
            return
        }

        val totalCount = cleanUrls.size
        val baseName = ExtensionStrUtils.sanitizeFileName(postTitle)
        val stamp = "${System.currentTimeMillis()}_${FILE_COUNTER.incrementAndGet() and 0xFFFF}"

        val directItems = ArrayList<IndexedUrl>()
        val redGifsItems = ArrayList<IndexedUrl>()
        for (i in 0 until cleanUrls.size) {
            val u = cleanUrls[i]
            if (isRedGifsUrl(u) && !isDirectRedGifsCdnMp4(u)) {
                redGifsItems.add(IndexedUrl(i, u))
            } else {
                directItems.add(IndexedUrl(i, u))
            }
        }

        // Enqueue non-RedGifs items immediately so in-flight RedGifs never drop ordinary images
        if (directItems.isNotEmpty()) {
            runOnMain(Runnable {
                enqueueIndexedDownload(appContext, directItems, totalCount, baseName, stamp, 0)
            })
        }

        if (redGifsItems.isNotEmpty()) {
            val acquired = ArrayList<IndexedUrl>()
            var skippedInFlight = 0
            IN_FLIGHT_LOCK.lock()
            try {
                for (item in redGifsItems) {
                    val key = ExtensionStrUtils.canonicalMediaKey(item.url)
                    if (IN_FLIGHT_REDGIFS.add(key)) {
                        acquired.add(item)
                    } else {
                        skippedInFlight++
                    }
                }
            } finally {
                IN_FLIGHT_LOCK.unlock()
            }

            if (acquired.isEmpty()) {
                if (directItems.isEmpty()) {
                    showToast(appContext, "Already downloading")
                }
                return
            }

            if (skippedInFlight > 0 && directItems.isEmpty()) {
                showToast(appContext, "Resolving ${acquired.size} RedGifs video(s)...")
            } else {
                showToast(appContext, "Resolving RedGifs video...")
            }

            REDGIFS_EXECUTOR.execute {
                try {
                    val resolvedItems = ArrayList<IndexedUrl>(acquired.size)
                    var failedCount = 0
                    for (item in acquired) {
                        val direct = resolveRedGifsDirectUrl(item.url)
                        if (direct != null && isHttpsUrl(direct)) {
                            resolvedItems.add(IndexedUrl(item.index, direct))
                        } else {
                            failedCount++
                        }
                    }
                    runOnMain(Runnable {
                        if (resolvedItems.isEmpty()) {
                            releaseBatch(batchKey)
                            if (directItems.isEmpty()) {
                                showToast(appContext, "Failed to resolve RedGifs video")
                            }
                        } else {
                            enqueueIndexedDownload(appContext, resolvedItems, totalCount, baseName, stamp, failedCount)
                        }
                    })
                } finally {
                    IN_FLIGHT_LOCK.lock()
                    try {
                        for (item in acquired) {
                            IN_FLIGHT_REDGIFS.remove(ExtensionStrUtils.canonicalMediaKey(item.url))
                        }
                    } finally {
                        IN_FLIGHT_LOCK.unlock()
                    }
                }
            }
        }
    }

    private fun extractExtension(uri: Uri, rawUrl: String): String {
        val formatParam = uri.getQueryParameter("format")
        if (!isBlank(formatParam)) {
            when (lower(formatParam!!)) {
                "mp4" -> return "mp4"
                "webm" -> return "webm"
                "pjpg", "jpg", "jpeg" -> return "jpg"
                "png8", "png" -> return "png"
                "gif" -> return "gif"
                "webp" -> return "webp"
                "avif" -> return "avif"
                "heic" -> return "heic"
                "bmp" -> return "bmp"
            }
        }
        val seg = uri.lastPathSegment
        if (seg != null) {
            val dot = ExtensionStrUtils.lastIndexOf(seg, '.')
            if (dot >= 0 && dot < seg.length - 1) {
                val ext = lower(seg.substring(dot + 1))
                if (ext == "jpg" || ext == "jpeg" || ext == "png" || ext == "gif" ||
                    ext == "webp" || ext == "mp4" || ext == "webm" ||
                    ext == "avif" || ext == "heic" || ext == "bmp"
                ) {
                    return ext
                }
            }
        }
        val host = extractHostLower(rawUrl)
        val path = extractPathLower(rawUrl)
        return if (isRedGifsUrl(rawUrl) ||
            ExtensionStrUtils.endsWith(path, ".mp4") ||
            host == "packaged-media.redd.it"
        ) {
            "mp4"
        } else if (ExtensionStrUtils.endsWith(path, ".webm")) {
            "webm"
        } else {
            "jpg"
        }
    }

    private fun registerDownloadCompletionTracker(appContext: Context, enqueuedIds: List<Long>) {
        if (enqueuedIds.isEmpty()) return
        TRACKER_LOCK.lock()
        try {
            ACTIVE_DOWNLOAD_IDS.addAll(enqueuedIds)
            if (sDownloadReceiver == null) {
                val receiver = object : BroadcastReceiver() {
                    override fun onReceive(ctx: Context?, intent: Intent?) {
                        if (intent == null || DownloadManager.ACTION_DOWNLOAD_COMPLETE != intent.action) return
                        val id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1L)
                        if (id == -1L) return
                        val tracked: Boolean
                        TRACKER_LOCK.lock()
                        try {
                            tracked = ACTIVE_DOWNLOAD_IDS.remove(id)
                        } finally {
                            TRACKER_LOCK.unlock()
                        }
                        if (!tracked) return
                        try {
                            val dm = (ctx ?: appContext).getSystemService(Context.DOWNLOAD_SERVICE) as? DownloadManager
                            if (dm != null) {
                                val cursor = dm.query(DownloadManager.Query().setFilterById(id))
                                if (cursor != null) {
                                    try {
                                        if (cursor.moveToFirst()) {
                                            val statusIdx = cursor.getColumnIndex(DownloadManager.COLUMN_STATUS)
                                            val reasonIdx = cursor.getColumnIndex(DownloadManager.COLUMN_REASON)
                                            val status = if (statusIdx >= 0) cursor.getInt(statusIdx) else -1
                                            if (status == DownloadManager.STATUS_FAILED) {
                                                val reason = if (reasonIdx >= 0) cursor.getInt(reasonIdx) else -1
                                                Log.w(TAG, "DownloadManager failed id=$id reason=$reason")
                                                showToast(appContext, "Download failed (code $reason)")
                                            }
                                        }
                                    } finally {
                                        cursor.close()
                                    }
                                }
                            }
                        } catch (t: Throwable) {
                            Log.w(TAG, "Error querying download completion status: ${t.message}")
                        }
                        unregisterDownloadReceiverIfIdle(force = false)
                    }
                }
                val filter = IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE)
                if (Build.VERSION.SDK_INT >= 33) {
                    appContext.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED)
                } else {
                    @Suppress("UnspecifiedRegisterReceiverFlag")
                    appContext.registerReceiver(receiver, filter)
                }
                sDownloadReceiver = receiver
                sReceiverAppContext = appContext
            }
            MAIN_HANDLER.removeCallbacks(UNREGISTER_RUNNABLE)
            MAIN_HANDLER.postDelayed(UNREGISTER_RUNNABLE, 120_000L)
        } catch (t: Throwable) {
            Log.w(TAG, "Failed to register download completion receiver: ${t.message}")
        } finally {
            TRACKER_LOCK.unlock()
        }
    }

    private fun unregisterDownloadReceiverIfIdle(force: Boolean) {
        TRACKER_LOCK.lock()
        try {
            if (!force && ACTIVE_DOWNLOAD_IDS.isNotEmpty()) return
            if (force) ACTIVE_DOWNLOAD_IDS.clear()
            val r = sDownloadReceiver
            val ctx = sReceiverAppContext
            sDownloadReceiver = null
            sReceiverAppContext = null
            if (r != null && ctx != null) {
                try {
                    ctx.unregisterReceiver(r)
                } catch (_: Throwable) {}
            }
        } finally {
            TRACKER_LOCK.unlock()
        }
    }

    private fun enqueueIndexedDownload(
        context: Context,
        items: List<IndexedUrl>,
        totalBatchSize: Int,
        baseName: String,
        stamp: String,
        priorFailures: Int
    ) {
        if (items.isEmpty()) {
            showToast(context, "No downloadable media found")
            return
        }

        val dm = context.getSystemService(Context.DOWNLOAD_SERVICE) as? DownloadManager
        if (dm == null) {
            showToast(context, "DownloadManager unavailable")
            return
        }

        var enqueued = 0
        var failed = priorFailures
        var firstExt = "jpg"
        var hasVideoOnlyFallback = false
        val enqueuedIds = ArrayList<Long>(items.size)

        for (item in items) {
            val rawUrl = item.url
            try {
                if (!isHttpsUrl(rawUrl) || isStreamingManifest(rawUrl) || isBareVRedditUrl(rawUrl)) {
                    failed++
                    continue
                }
                val encoded = Uri.encode(rawUrl, "@#&=*+-_.,:!?()/~'%;\$")
                val uri = Uri.parse(encoded)
                val scheme = lower(uri.scheme ?: "")
                if (scheme != "https") {
                    failed++
                    continue
                }
                val ext = extractExtension(uri, rawUrl)
                if (enqueued == 0) firstExt = ext
                if (isVideoOnlyVRedditFallback(rawUrl)) {
                    hasVideoOnlyFallback = true
                }

                val suffix = if (totalBatchSize > 1) "_${item.index + 1}" else ""
                val fileName = "${baseName}_${stamp}$suffix.$ext"
                val destinationDirectory = if (ext == "mp4" || ext == "webm") {
                    Environment.DIRECTORY_MOVIES
                } else {
                    Environment.DIRECTORY_PICTURES
                }

                val request = DownloadManager.Request(uri)
                request.addRequestHeader("User-Agent", USER_AGENT)
                if (isRedGifsUrl(rawUrl)) {
                    request.addRequestHeader("Referer", "https://www.redgifs.com/")
                }
                request.setTitle(fileName)
                request.setNotificationVisibility(
                    DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED
                )
                request.setDestinationInExternalPublicDir(
                    destinationDirectory,
                    "Reddit/$fileName"
                )
                val downloadId = dm.enqueue(request)
                enqueuedIds.add(downloadId)
                enqueued++
            } catch (t: Throwable) {
                Log.e(TAG, "Failed to enqueue $rawUrl: ${t.message}")
                failed++
            }
        }

        if (enqueuedIds.isNotEmpty()) {
            registerDownloadCompletionTracker(context.applicationContext ?: context, enqueuedIds)
        }

        val msg = when {
            enqueued == 0 -> "Download failed"
            enqueued > 1 && failed > 0 -> "Downloading $enqueued items ($failed skipped)..."
            enqueued > 1 -> "Downloading $enqueued items..."
            failed > 0 -> "Downloading 1 item ($failed skipped)..."
            hasVideoOnlyFallback -> "Downloading video (no audio track)..."
            firstExt == "mp4" || firstExt == "webm" -> "Downloading video..."
            else -> "Downloading image..."
        }
        showToast(context, msg)
    }

    private fun findActivity(context: Context): Activity? {
        var current: Context? = context
        var depth = 0
        while (current is ContextWrapper && depth++ < 20) {
            if (current is Activity) return current
            val next = current.baseContext
            if (next === current) break
            current = next
        }
        return DownloadActionButton.getCurrentActivity()
    }

    private fun dp(context: Context, value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
            context.resources.displayMetrics
        ).toInt()
    }
}
