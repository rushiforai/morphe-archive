package com.sarp.tiktokliquidglass

import android.app.Activity
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.BitmapShader
import android.graphics.Canvas
import android.graphics.Matrix
import android.graphics.Paint
import android.graphics.Shader
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.SparseArray
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import java.lang.reflect.Field
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import java.util.Locale
import java.util.concurrent.Executors

/**
 * Extracts active feed creator metadata (display name, @handle, follower/following/likes/video
 * counts, bio, avatar drawable/URL, and UID comparison against logged-in user) safely via
 * view hierarchy + TikTok Aweme/User reflection, with asynchronous IProfileService enrichment
 * and a 2-video-window / 10 MB-capped in-memory prefetch cache.
 */
object TikTokCreatorExtractor {

    private const val TAG = "TikTokLiquidGlass"
    private const val MAX_CACHE_BYTES = 10L * 1024L * 1024L
    private const val EVICT_VIDEO_DISTANCE = 2
    private const val MAX_CACHED_AVATAR_PX = 256

    data class CreatorPreviewData(
        val uid: String?,
        val secUid: String?,
        val displayName: String,
        val handle: String,
        val followingCount: Long,
        val followerCount: Long,
        val totalLikes: Long,
        val videoCount: Long,
        val followStatus: Int,
        val bio: String,
        val avatarDrawable: Drawable?,
        val avatarUrl: String?,
        val isOwnAccount: Boolean,
        val isEnriched: Boolean = false
    )

    data class ActiveAwemeInfo(
        val aid: String,
        val commentCount: Long
    )

    private data class CachedCreatorEntry(
        val key: String,
        val uid: String?,
        val handleKey: String,
        val data: CreatorPreviewData,
        val avatarBitmap: Bitmap?,
        val byteSize: Long,
        var videoSeq: Int,
        var cachedAtMs: Long
    )

    private val avatarExecutor = Executors.newSingleThreadExecutor()
    private val mainHandler = Handler(Looper.getMainLooper())
    private var mKeyedTagsField: Field? = null
    private var mKeyedTagsResolved = false

    private val cacheLock = Any()
    private val cacheByKey = LinkedHashMap<String, CachedCreatorEntry>()
    private val keyByHandle = HashMap<String, String>()
    private val inFlightKeys = HashSet<String>()
    private var totalCacheBytes: Long = 0L

    @Volatile
    private var latestVideoSeq: Int = 0

    @Volatile
    private var cachedCurrentUid: String? = null

    fun needsEnrichment(data: CreatorPreviewData): Boolean {
        if (data.isEnriched) return false
        return data.followingCount < 0L ||
            data.followerCount < 0L ||
            data.totalLikes < 0L ||
            data.videoCount < 0L ||
            (data.followingCount == 0L && data.followerCount == 0L) ||
            (data.followingCount == 0L && data.videoCount == 0L && data.totalLikes == 0L)
    }

    private fun normalizeHandleKey(handle: String?): String {
        val h = handle?.trim()?.removePrefix("@")?.lowercase(Locale.ROOT).orEmpty()
        return if (h.isEmpty() || h == "hesap") "" else h
    }

    private fun primaryCacheKey(uid: String?, handle: String?): String {
        val u = uid?.trim().orEmpty()
        if (u.isNotEmpty() && u != "0") return "u:$u"
        val h = normalizeHandleKey(handle)
        return if (h.isNotEmpty()) "h:$h" else ""
    }

    private fun removeEntryLocked(key: String) {
        val removed = cacheByKey.remove(key) ?: return
        totalCacheBytes = (totalCacheBytes - removed.byteSize).coerceAtLeast(0L)
        if (removed.handleKey.isNotEmpty() && keyByHandle[removed.handleKey] == key) {
            keyByHandle.remove(removed.handleKey)
        }
    }

    fun onVideoSequenceChanged(currentVideoSeq: Int) {
        latestVideoSeq = currentVideoSeq
        synchronized(cacheLock) {
            val toRemove = ArrayList<String>()
            for ((k, entry) in cacheByKey) {
                if ((currentVideoSeq - entry.videoSeq) >= EVICT_VIDEO_DISTANCE ||
                    entry.videoSeq > currentVideoSeq + 1
                ) {
                    toRemove.add(k)
                }
            }
            for (k in toRemove) {
                removeEntryLocked(k)
            }
        }
    }

    fun clearCache() {
        synchronized(cacheLock) {
            cacheByKey.clear()
            keyByHandle.clear()
            inFlightKeys.clear()
            totalCacheBytes = 0L
        }
    }

    fun lookupCached(activity: Activity, uid: String?, handle: String?): CreatorPreviewData? {
        synchronized(cacheLock) {
            val uKey = primaryCacheKey(uid, null)
            val hKey = normalizeHandleKey(handle)
            var entry = if (uKey.isNotEmpty()) cacheByKey[uKey] else null
            if (entry == null && hKey.isNotEmpty()) {
                val mapped = keyByHandle[hKey] ?: "h:$hKey"
                entry = cacheByKey[mapped]
            }
            if (entry == null) return null
            if ((latestVideoSeq - entry.videoSeq) >= EVICT_VIDEO_DISTANCE) {
                removeEntryLocked(entry.key)
                return null
            }
            val bmp = entry.avatarBitmap
            val bmpDrawable = if (bmp != null && !bmp.isRecycled) {
                BitmapDrawable(activity.resources, bmp)
            } else {
                null
            }
            return entry.data.copy(
                avatarDrawable = bmpDrawable ?: entry.data.avatarDrawable
            )
        }
    }

    private fun putCached(data: CreatorPreviewData, avatarBitmap: Bitmap?, videoSeq: Int) {
        val key = primaryCacheKey(data.uid, data.handle)
        if (key.isEmpty()) return
        val hKey = normalizeHandleKey(data.handle)
        synchronized(cacheLock) {
            if ((latestVideoSeq - videoSeq) >= EVICT_VIDEO_DISTANCE) {
                return
            }
            val prevBmp = cacheByKey[key]?.avatarBitmap
            val finalBmp = avatarBitmap ?: prevBmp
            removeEntryLocked(key)

            val bmpBytes = if (finalBmp != null && !finalBmp.isRecycled) {
                finalBmp.allocationByteCount.toLong()
            } else {
                0L
            }
            val entrySize = 2048L + bmpBytes
            val entry = CachedCreatorEntry(
                key = key,
                uid = data.uid,
                handleKey = hKey,
                data = data.copy(avatarDrawable = null),
                avatarBitmap = finalBmp,
                byteSize = entrySize,
                videoSeq = videoSeq,
                cachedAtMs = System.currentTimeMillis()
            )
            cacheByKey[key] = entry
            if (hKey.isNotEmpty()) {
                keyByHandle[hKey] = key
            }
            totalCacheBytes += entrySize

            while (totalCacheBytes > MAX_CACHE_BYTES && cacheByKey.isNotEmpty()) {
                var oldestKey: String? = null
                var oldestSeq = Int.MAX_VALUE
                var oldestTs = Long.MAX_VALUE
                for ((k, e) in cacheByKey) {
                    if (e.videoSeq < oldestSeq || (e.videoSeq == oldestSeq && e.cachedAtMs < oldestTs)) {
                        oldestKey = k
                        oldestSeq = e.videoSeq
                        oldestTs = e.cachedAtMs
                    }
                }
                if (oldestKey != null) {
                    removeEntryLocked(oldestKey)
                } else {
                    break
                }
            }
        }
    }

    fun extractCurrentCreator(activity: Activity, decor: View): CreatorPreviewData {
        val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
        val titleTv = activeWidget?.let { TikTokViewResolver.findAuthorTitleView(activity, it) as? TextView }
        val visibleTitle = titleTv?.text?.toString()?.trim().orEmpty()
        val avatarView = activeWidget?.let { TikTokViewResolver.findCreatorAvatarView(activity, it) }
        val clonedAvatar = cloneDrawableSafely(avatarView?.drawable)

        val currentUid = getCurrentUserUid(activity)

        val candidateList = ArrayList<Any>()
        val seenIds = HashSet<Int>()

        fun addCandidate(userObj: Any?) {
            if (userObj == null) return
            val id = System.identityHashCode(userObj)
            if (seenIds.add(id)) {
                candidateList.add(userObj)
            }
        }

        if (activeWidget != null) {
            var cur: View? = activeWidget
            var depth = 0
            while (cur != null && depth < 6) {
                inspectViewTagsForUser(cur, 0, ::addCandidate)
                cur = cur.parent as? View
                depth++
            }
        }

        scanFragmentsForUser(activity, ::addCandidate)

        val matchedUser = selectBestMatchingUser(candidateList, visibleTitle)

        var uid: String? = null
        var secUid: String? = null
        var nickname = visibleTitle.removePrefix("@").trim()
        var uniqueId = if (visibleTitle.startsWith("@")) visibleTitle.removePrefix("@").trim() else ""
        var following = -1L
        var follower = -1L
        var totalLikes = -1L
        var videoCount = -1L
        var followStatus = 0
        var bio = ""
        var avatarUrl: String? = null

        if (matchedUser != null) {
            uid = readStringProp(matchedUser, "getUid", "uid")
            secUid = readStringProp(matchedUser, "getSecUid", "secUid")
            val nick = readStringProp(matchedUser, "getNickname", "nickname")
            val uniq = readStringProp(matchedUser, "getUniqueId", "uniqueId")
            val sig = readStringProp(matchedUser, "getSignature", "signature")
            val fwg = readLongProp(matchedUser, "getFollowingCount", "followingCount")
            var fwr = readLongProp(matchedUser, "getFollowerCount", "followerCount")
            if (fwr < 0L) {
                fwr = readLongProp(matchedUser, "getFansCount", null)
            }
            val likes = readLongProp(matchedUser, "getTotalFavorited", "totalFavorited")
            var awemes = readLongProp(matchedUser, "getAwemeCount", "awemeCount")
            if (awemes < 0L) {
                awemes = readLongProp(matchedUser, "getPostCount", null)
            }
            val fs = readLongProp(matchedUser, "getFollowStatus", "followStatus")
            avatarUrl = extractAvatarUrl(matchedUser)

            if (!nick.isNullOrBlank()) nickname = nick.trim()
            if (!uniq.isNullOrBlank()) uniqueId = uniq.trim()
            if (!sig.isNullOrBlank()) bio = sig.trim()
            if (fwg >= 0L) following = fwg
            if (fwr >= 0L) follower = fwr
            if (likes >= 0L) totalLikes = likes
            if (awemes >= 0L) videoCount = awemes
            if (fs >= 0L) followStatus = fs.toInt()
        }

        if (nickname.isEmpty() && uniqueId.isNotEmpty()) {
            nickname = uniqueId
        }
        if (uniqueId.isEmpty() && nickname.isNotEmpty()) {
            uniqueId = nickname.lowercase().replace(" ", "")
        }

        val isOwn = !uid.isNullOrBlank() && !currentUid.isNullOrBlank() && uid == currentUid
        val handleStr = if (uniqueId.isNotEmpty()) "@$uniqueId" else "@hesap"

        if (!isOwn) {
            lookupCached(activity, uid, handleStr)?.let { cached ->
                val mergedAvatar = if (cached.avatarDrawable == null && clonedAvatar != null) {
                    cached.copy(avatarDrawable = clonedAvatar)
                } else {
                    cached
                }
                Log.i(
                    TAG,
                    "CreatorCacheHit: uid=${mergedAvatar.uid} ${mergedAvatar.handle} following=${mergedAvatar.followingCount} follower=${mergedAvatar.followerCount}"
                )
                return mergedAvatar
            }
        }

        Log.i(
            TAG,
            "CreatorExtracted: uid=$uid curUid=$currentUid own=$isOwn nick='$nickname' @$uniqueId following=$following follower=$follower likes=$totalLikes videos=$videoCount bioLen=${bio.length}"
        )

        return CreatorPreviewData(
            uid = uid,
            secUid = secUid,
            displayName = if (nickname.isNotEmpty()) nickname else MergenStrings.t(activity, "Kullanıcı", "Creator"),
            handle = handleStr,
            followingCount = following,
            followerCount = follower,
            totalLikes = totalLikes,
            videoCount = videoCount,
            followStatus = followStatus,
            bio = bio,
            avatarDrawable = clonedAvatar,
            avatarUrl = avatarUrl,
            isOwnAccount = isOwn
        )
    }

    fun prefetchCurrentCreator(activity: Activity, decor: View, videoSeq: Int) {
        latestVideoSeq = maxOf(latestVideoSeq, videoSeq)
        val initial = extractCurrentCreator(activity, decor)
        if (initial.isOwnAccount) return
        val key = primaryCacheKey(initial.uid, initial.handle)
        if (key.isEmpty()) return

        synchronized(cacheLock) {
            val existing = cacheByKey[key]
            if (existing != null &&
                existing.data.isEnriched &&
                (existing.avatarBitmap != null || existing.data.avatarUrl.isNullOrBlank())
            ) {
                existing.videoSeq = maxOf(existing.videoSeq, videoSeq)
                existing.cachedAtMs = System.currentTimeMillis()
                return
            }
            if (!inFlightKeys.add(key)) return
        }

        avatarExecutor.execute {
            try {
                if ((latestVideoSeq - videoSeq) >= EVICT_VIDEO_DISTANCE) return@execute
                val resolved = if (needsEnrichment(initial)) {
                    fetchEnrichedCreatorSync(initial) ?: initial
                } else {
                    initial.copy(isEnriched = true)
                }
                if ((latestVideoSeq - videoSeq) >= EVICT_VIDEO_DISTANCE) return@execute
                val circBmp = fetchCircularAvatarSync(resolved.avatarUrl)
                putCached(resolved, circBmp, videoSeq)
                Log.i(
                    TAG,
                    "CreatorPrefetched: ${resolved.handle} seq=$videoSeq cacheBytes=$totalCacheBytes"
                )
            } catch (t: Throwable) {
                Log.w(TAG, "CreatorPrefetch failed (${t.javaClass.simpleName}): ${t.message}")
            } finally {
                synchronized(cacheLock) {
                    inFlightKeys.remove(key)
                }
            }
        }
    }

    /**
     * Asynchronously enriches missing follower/following/likes/video stats & bio using
     * TikTok's native IProfileService.queryUser(url, false, "homepage_hot").
     */
    fun enrichCreatorAsync(
        activity: Activity,
        initial: CreatorPreviewData,
        videoSeq: Int = latestVideoSeq,
        onEnriched: (CreatorPreviewData) -> Unit
    ) {
        lookupCached(activity, initial.uid, initial.handle)?.let { cached ->
            if (cached.isEnriched) {
                mainHandler.post {
                    if (!activity.isFinishing && !activity.isDestroyed) {
                        onEnriched(cached)
                    }
                }
                return
            }
        }
        if (!needsEnrichment(initial)) return
        val uid = initial.uid?.trim().orEmpty()
        val secUid = initial.secUid?.trim().orEmpty()
        if (uid.isEmpty() && secUid.isEmpty()) return

        avatarExecutor.execute {
            try {
                val enriched = fetchEnrichedCreatorSync(initial) ?: return@execute
                val circBmp = fetchCircularAvatarSync(enriched.avatarUrl)
                putCached(enriched, circBmp, videoSeq)
                val withDrawable = if (circBmp != null && !circBmp.isRecycled) {
                    enriched.copy(avatarDrawable = BitmapDrawable(activity.resources, circBmp))
                } else {
                    enriched
                }

                mainHandler.post {
                    if (!activity.isFinishing && !activity.isDestroyed) {
                        onEnriched(withDrawable)
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "CreatorEnriched failed (${t.javaClass.simpleName}): ${t.message}")
            }
        }
    }

    private fun fetchEnrichedCreatorSync(initial: CreatorPreviewData): CreatorPreviewData? {
        val uid = initial.uid?.trim().orEmpty()
        val secUid = initial.secUid?.trim().orEmpty()
        if (uid.isEmpty() && secUid.isEmpty()) return null

        val smCls = Class.forName("com.ss.android.ugc.aweme.framework.services.ServiceManager")
        val sm = smCls.getMethod("get").invoke(null)
        val getService = smCls.getMethod("getService", Class::class.java)
        val profCls = Class.forName("com.ss.android.ugc.aweme.profile.IProfileService")
        val profSvc = getService.invoke(sm, profCls) ?: return null

        val basePath = try {
            (profCls.getMethod("getUserPath", Boolean::class.javaPrimitiveType)
                .invoke(profSvc, false) as? String).orEmpty()
        } catch (_: Throwable) {
            "/aweme/v1/user/profile/other/"
        }

        val prefix = if (basePath.startsWith("http")) {
            basePath
        } else {
            val normalized = if (basePath.startsWith("/")) basePath else "/$basePath"
            "https://api16-normal-c-useast1a.tiktokv.com$normalized"
        }
        val sep = if (prefix.contains('?')) '&' else '?'
        val params = ArrayList<String>(2)
        if (secUid.isNotEmpty()) {
            params.add("sec_user_id=${URLEncoder.encode(secUid, "UTF-8")}")
        }
        if (uid.isNotEmpty()) {
            params.add("user_id=${URLEncoder.encode(uid, "UTF-8")}")
        }
        val fullUrl = "$prefix$sep${java.lang.String.join("&", params)}"

        val queryMethod = profCls.getMethod(
            "queryUser",
            String::class.java,
            Boolean::class.javaPrimitiveType,
            String::class.java
        )
        val fetchedUser = queryMethod.invoke(profSvc, fullUrl, false, "homepage_hot")
            ?: return null

        val nick = readStringProp(fetchedUser, "getNickname", "nickname")?.trim()
        val uniq = readStringProp(fetchedUser, "getUniqueId", "uniqueId")?.trim()
        val sig = readStringProp(fetchedUser, "getSignature", "signature")?.trim()
        val fwg = readLongProp(fetchedUser, "getFollowingCount", "followingCount")
        var fwr = readLongProp(fetchedUser, "getFollowerCount", "followerCount")
        if (fwr < 0L) fwr = readLongProp(fetchedUser, "getFansCount", null)
        val likes = readLongProp(fetchedUser, "getTotalFavorited", "totalFavorited")
        var awemes = readLongProp(fetchedUser, "getAwemeCount", "awemeCount")
        if (awemes < 0L) awemes = readLongProp(fetchedUser, "getPostCount", null)
        val fs = readLongProp(fetchedUser, "getFollowStatus", "followStatus")
        val hdAvatar = extractAvatarUrl(fetchedUser) ?: initial.avatarUrl

        val enriched = initial.copy(
            displayName = if (!nick.isNullOrBlank()) nick else initial.displayName,
            handle = if (!uniq.isNullOrBlank()) "@$uniq" else initial.handle,
            followingCount = if (fwg >= 0L) fwg else initial.followingCount,
            followerCount = if (fwr >= 0L) fwr else initial.followerCount,
            totalLikes = if (likes >= 0L) likes else initial.totalLikes,
            videoCount = if (awemes >= 0L) awemes else initial.videoCount,
            followStatus = if (fs >= 0L) fs.toInt() else initial.followStatus,
            bio = if (!sig.isNullOrBlank()) sig else initial.bio,
            avatarUrl = hdAvatar,
            isEnriched = true
        )

        Log.i(
            TAG,
            "CreatorEnriched: ${enriched.handle} following=${enriched.followingCount} follower=${enriched.followerCount} likes=${enriched.totalLikes} videos=${enriched.videoCount}"
        )
        return enriched
    }

    fun getCurrentUserUid(activity: Activity): String? {
        cachedCurrentUid?.let { if (it.isNotEmpty()) return it }

        try {
            val smCls = Class.forName("com.ss.android.ugc.aweme.framework.services.ServiceManager")
            val sm = smCls.getMethod("get").invoke(null)
            val getService = smCls.getMethod("getService", Class::class.java)

            val accCls = Class.forName("com.ss.android.ugc.aweme.IAccountService")
            val accSvc = getService.invoke(sm, accCls)
            if (accSvc != null) {
                for (m in accCls.methods) {
                    if (m.parameterCount == 0 &&
                        m.returnType.name == "com.ss.android.ugc.aweme.IAccountUserService"
                    ) {
                        val userSvc = m.invoke(accSvc)
                        if (userSvc != null) {
                            val uid = (userSvc.javaClass.getMethod("getCurUserId").invoke(userSvc) as? String)?.trim()
                            if (!uid.isNullOrEmpty() && uid != "0") {
                                cachedCurrentUid = uid
                                return uid
                            }
                        }
                    }
                }
            }
        } catch (_: Throwable) {
        }

        try {
            val smCls = Class.forName("com.ss.android.ugc.aweme.framework.services.ServiceManager")
            val sm = smCls.getMethod("get").invoke(null)
            val getService = smCls.getMethod("getService", Class::class.java)
            val userCls = Class.forName("com.ss.android.ugc.aweme.framework.services.IUserService")
            val userSvc = getService.invoke(sm, userCls)
            if (userSvc != null) {
                val uid = (userSvc.javaClass.getMethod("getCurrentUserID").invoke(userSvc) as? String)?.trim()
                if (!uid.isNullOrEmpty() && uid != "0") {
                    cachedCurrentUid = uid
                    return uid
                }
            }
        } catch (_: Throwable) {
        }

        try {
            val baseUser = Class.forName("com.ss.android.ugc.aweme.services.BaseUserService")
            for (m in baseUser.methods) {
                if (java.lang.reflect.Modifier.isStatic(m.modifiers) && m.parameterCount == 1) {
                    val inst = m.invoke(null, false)
                    val uid = (inst?.javaClass?.getMethod("getCurrentUserID")?.invoke(inst) as? String)?.trim()
                    if (!uid.isNullOrEmpty() && uid != "0") {
                        cachedCurrentUid = uid
                        return uid
                    }
                }
            }
        } catch (_: Throwable) {
        }

        return cachedCurrentUid
    }

    private fun fetchCircularAvatarSync(urlString: String?): Bitmap? {
        if (urlString.isNullOrBlank()) return null
        var conn: HttpURLConnection? = null
        return try {
            val url = URL(urlString)
            conn = (url.openConnection() as HttpURLConnection).apply {
                connectTimeout = 5000
                readTimeout = 5000
                doInput = true
            }
            conn.connect()
            if (conn.responseCode in 200..299) {
                val raw = conn.inputStream.use { BitmapFactory.decodeStream(it) } ?: return null
                val circ = toCircularBitmap(raw, MAX_CACHED_AVATAR_PX)
                if (raw !== circ && !raw.isRecycled) {
                    raw.recycle()
                }
                circ
            } else {
                null
            }
        } catch (_: Throwable) {
            null
        } finally {
            try {
                conn?.disconnect()
            } catch (_: Throwable) {
            }
        }
    }

    fun loadAvatarBitmapAsync(urlString: String?, target: ImageView) {
        if (urlString.isNullOrBlank()) return
        target.setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, urlString)
        avatarExecutor.execute {
            val circ = fetchCircularAvatarSync(urlString) ?: return@execute
            mainHandler.post {
                if (target.isAttachedToWindow &&
                    target.getTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW) == urlString
                ) {
                    target.setImageBitmap(circ)
                }
            }
        }
    }

    private fun toCircularBitmap(src: Bitmap, maxSize: Int = MAX_CACHED_AVATAR_PX): Bitmap {
        val rawSize = minOf(src.width, src.height).coerceAtLeast(1)
        val outSize = minOf(rawSize, maxSize)
        val out = Bitmap.createBitmap(outSize, outSize, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(out)
        val shader = BitmapShader(src, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP)
        val matrix = Matrix()
        val dx = (src.width - rawSize) * 0.5f
        val dy = (src.height - rawSize) * 0.5f
        val scale = outSize.toFloat() / rawSize.toFloat()
        matrix.setTranslate(-dx, -dy)
        matrix.postScale(scale, scale)
        shader.setLocalMatrix(matrix)
        val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply { this.shader = shader }
        val r = outSize * 0.5f
        canvas.drawCircle(r, r, r, paint)
        return out
    }

    private fun cloneDrawableSafely(drawable: Drawable?): Drawable? {
        if (drawable == null) return null
        return try {
            val w = drawable.intrinsicWidth.coerceIn(64, 256)
            val h = drawable.intrinsicHeight.coerceIn(64, 256)
            val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
            val canvas = Canvas(bmp)
            val prevBounds = android.graphics.Rect(drawable.bounds)
            drawable.setBounds(0, 0, w, h)
            drawable.draw(canvas)
            drawable.bounds = prevBounds
            BitmapDrawable(null, toCircularBitmap(bmp))
        } catch (_: Throwable) {
            null
        }
    }

    fun extractActiveAwemeInfo(activity: Activity, decor: View): ActiveAwemeInfo? {
        val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
        val titleTv = activeWidget?.let { TikTokViewResolver.findAuthorTitleView(activity, it) as? TextView }
        val visibleTitle = titleTv?.text?.toString()?.trim().orEmpty()

        val awemeCandidates = ArrayList<Any>()
        val seenIds = HashSet<Int>()

        fun addAweme(awemeObj: Any) {
            val id = System.identityHashCode(awemeObj)
            if (seenIds.add(id)) {
                awemeCandidates.add(awemeObj)
            }
        }

        if (activeWidget != null) {
            var cur: View? = activeWidget
            var depth = 0
            while (cur != null && depth < 6) {
                inspectViewTagsForUser(cur, 0, {}, ::addAweme)
                cur = cur.parent as? View
                depth++
            }
        }

        if (awemeCandidates.isEmpty()) {
            scanFragmentsForUser(activity, {}, ::addAweme)
        }

        if (awemeCandidates.isEmpty()) return null
        val selected = selectBestMatchingAweme(awemeCandidates, visibleTitle) ?: return null
        val aid = readStringProp(selected, "getAid", "aid")?.trim().orEmpty()
        if (aid.isEmpty()) return null

        val stats = readAnyProp(selected, "getStatistics", "statistics")
        val commentCount = if (stats != null) {
            readLongProp(stats, "getCommentCount", "commentCount").coerceAtLeast(0L)
        } else {
            0L
        }
        return ActiveAwemeInfo(aid = aid, commentCount = commentCount)
    }

    private fun selectBestMatchingAweme(candidates: List<Any>, visibleTitle: String): Any? {
        if (candidates.isEmpty()) return null
        val cleanTitle = visibleTitle.removePrefix("@").trim()
        if (cleanTitle.isNotEmpty()) {
            for (aweme in candidates) {
                val author = readAnyProp(aweme, "getAuthor", "author") ?: continue
                val nick = readStringProp(author, "getNickname", "nickname")?.trim().orEmpty()
                val uniq = readStringProp(author, "getUniqueId", "uniqueId")?.trim().orEmpty()
                if (nick.equals(cleanTitle, ignoreCase = true) || uniq.equals(cleanTitle, ignoreCase = true)) {
                    return aweme
                }
            }
            for (aweme in candidates) {
                val author = readAnyProp(aweme, "getAuthor", "author") ?: continue
                val nick = readStringProp(author, "getNickname", "nickname")?.trim().orEmpty()
                val uniq = readStringProp(author, "getUniqueId", "uniqueId")?.trim().orEmpty()
                if ((nick.isNotEmpty() && cleanTitle.contains(nick, ignoreCase = true)) ||
                    (uniq.isNotEmpty() && cleanTitle.contains(uniq, ignoreCase = true))
                ) {
                    return aweme
                }
            }
        }
        return candidates.firstOrNull {
            !readStringProp(it, "getAid", "aid").isNullOrBlank()
        } ?: candidates.first()
    }

    private fun inspectViewTagsForUser(
        view: View,
        fieldDepth: Int,
        onFound: (Any) -> Unit,
        onAweme: ((Any) -> Unit)? = null
    ) {
        view.tag?.let { tag ->
            extractUserFromObject(tag, fieldDepth, onFound, onAweme)
        }
        try {
            if (!mKeyedTagsResolved) {
                mKeyedTagsResolved = true
                mKeyedTagsField = View::class.java.getDeclaredField("mKeyedTags").apply {
                    isAccessible = true
                }
            }
            @Suppress("UNCHECKED_CAST")
            val keyed = mKeyedTagsField?.get(view) as? SparseArray<Any?>
            if (keyed != null) {
                for (i in 0 until keyed.size()) {
                    keyed.valueAt(i)?.let { v ->
                        extractUserFromObject(v, fieldDepth, onFound, onAweme)
                    }
                }
            }
        } catch (_: Throwable) {
        }
    }

    private fun scanFragmentsForUser(
        activity: Activity,
        onFound: (Any) -> Unit,
        onAweme: ((Any) -> Unit)? = null
    ) {
        try {
            val getFm = activity.javaClass.getMethod("getSupportFragmentManager")
            val fm = getFm.invoke(activity) ?: return
            scanFragmentManagerRecursive(fm, depth = 0, onFound = onFound, onAweme = onAweme)
        } catch (_: Throwable) {
        }
    }

    private fun scanFragmentManagerRecursive(
        fm: Any,
        depth: Int,
        onFound: (Any) -> Unit,
        onAweme: ((Any) -> Unit)? = null
    ) {
        if (depth > 4) return
        try {
            val getFragments = fm.javaClass.getMethod("getFragments")
            @Suppress("UNCHECKED_CAST")
            val frags = getFragments.invoke(fm) as? List<Any?> ?: return
            for (frag in frags) {
                if (frag == null) continue
                val isVisible = try {
                    (frag.javaClass.getMethod("isVisible").invoke(frag) as? Boolean) ?: true
                } catch (_: Throwable) {
                    true
                }
                if (isVisible) {
                    scanObjectFieldsForAwemeOrUser(frag, maxDepth = 1, onFound = onFound, onAweme = onAweme)
                }
                try {
                    val childFm = frag.javaClass.getMethod("getChildFragmentManager").invoke(frag)
                    if (childFm != null) {
                        scanFragmentManagerRecursive(childFm, depth + 1, onFound = onFound, onAweme = onAweme)
                    }
                } catch (_: Throwable) {
                }
            }
        } catch (_: Throwable) {
        }
    }

    private fun scanObjectFieldsForAwemeOrUser(
        obj: Any,
        maxDepth: Int,
        onFound: (Any) -> Unit,
        onAweme: ((Any) -> Unit)? = null
    ) {
        var cls: Class<*>? = obj.javaClass
        var levels = 0
        while (cls != null && levels < 3 && !cls.name.startsWith("android.") && !cls.name.startsWith("androidx.")) {
            for (f in cls.declaredFields) {
                try {
                    val typeName = f.type.name
                    if (typeName == "com.ss.android.ugc.aweme.feed.model.Aweme" ||
                        typeName == "com.ss.android.ugc.aweme.profile.model.User" ||
                        (maxDepth > 0 && typeName.contains("ViewHolder", ignoreCase = true))
                    ) {
                        f.isAccessible = true
                        val value = f.get(obj) ?: continue
                        extractUserFromObject(value, maxDepth, onFound, onAweme)
                    }
                } catch (_: Throwable) {
                }
            }
            cls = cls.superclass
            levels++
        }
    }

    private fun extractUserFromObject(
        obj: Any,
        depth: Int,
        onFound: (Any) -> Unit,
        onAweme: ((Any) -> Unit)? = null
    ) {
        val name = obj.javaClass.name
        when (name) {
            "com.ss.android.ugc.aweme.profile.model.User" -> {
                onFound(obj)
            }
            "com.ss.android.ugc.aweme.feed.model.Aweme" -> {
                onAweme?.invoke(obj)
                val author = readAnyProp(obj, "getAuthor", "author")
                if (author != null) onFound(author)
            }
            else -> {
                if (depth < 1 && !name.startsWith("java.") && !name.startsWith("android.") && !name.startsWith("androidx.")) {
                    scanObjectFieldsForAwemeOrUser(obj, maxDepth = 0, onFound = onFound, onAweme = onAweme)
                }
            }
        }
    }

    private fun selectBestMatchingUser(candidates: List<Any>, visibleTitle: String): Any? {
        if (candidates.isEmpty()) return null
        val cleanTitle = visibleTitle.removePrefix("@").trim()
        if (cleanTitle.isNotEmpty()) {
            for (u in candidates) {
                val nick = readStringProp(u, "getNickname", "nickname")?.trim().orEmpty()
                val uniq = readStringProp(u, "getUniqueId", "uniqueId")?.trim().orEmpty()
                if (nick.equals(cleanTitle, ignoreCase = true) ||
                    uniq.equals(cleanTitle, ignoreCase = true)
                ) {
                    return u
                }
            }
            for (u in candidates) {
                val nick = readStringProp(u, "getNickname", "nickname")?.trim().orEmpty()
                val uniq = readStringProp(u, "getUniqueId", "uniqueId")?.trim().orEmpty()
                if ((nick.isNotEmpty() && cleanTitle.contains(nick, ignoreCase = true)) ||
                    (uniq.isNotEmpty() && cleanTitle.contains(uniq, ignoreCase = true))
                ) {
                    return u
                }
            }
        }
        return candidates.firstOrNull {
            readLongProp(it, "getFollowerCount", "followerCount") > 0L ||
                readLongProp(it, "getFollowingCount", "followingCount") > 0L
        } ?: candidates.first()
    }

    private fun extractAvatarUrl(user: Any): String? {
        for (getter in arrayOf("getAvatarMedium", "getAvatarThumb", "getAvatarLarger")) {
            val urlModel = readAnyProp(user, getter, null) ?: continue
            val list = readAnyProp(urlModel, "getUrlList", "urlList") as? List<*> ?: continue
            val first = list.firstOrNull { it is String && it.startsWith("http") } as? String
            if (!first.isNullOrBlank()) return first
        }
        return null
    }

    private fun readAnyProp(obj: Any, method: String, field: String?): Any? {
        try {
            return obj.javaClass.getMethod(method).invoke(obj)
        } catch (_: Throwable) {
        }
        if (field != null) {
            var c: Class<*>? = obj.javaClass
            while (c != null) {
                try {
                    val f = c.getDeclaredField(field).apply { isAccessible = true }
                    return f.get(obj)
                } catch (_: Throwable) {
                    c = c.superclass
                }
            }
        }
        return null
    }

    private fun readStringProp(obj: Any, method: String, field: String?): String? =
        readAnyProp(obj, method, field)?.toString()

    private fun readLongProp(obj: Any, method: String, field: String?): Long {
        val raw = readAnyProp(obj, method, field) ?: return -1L
        return when (raw) {
            is Number -> raw.toLong()
            else -> -1L
        }
    }
}
