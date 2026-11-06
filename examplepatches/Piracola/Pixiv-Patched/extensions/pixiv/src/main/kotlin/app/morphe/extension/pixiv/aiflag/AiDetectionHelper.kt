package app.morphe.extension.pixiv.aiflag

import android.content.Context
import java.lang.reflect.Field
import java.util.concurrent.ConcurrentHashMap

/**
 * AI-work detection for Pixiv 6.202.1 (jp.pxv.android).
 *
 * Field map verified against the obfuscated build (.re/apktool/smali_classes4):
 *  - illust  Le97; : a:J id, d:Lud7; user, e:List tags, w:I illustAiType
 *  - user    Lud7; : a:J id, b:String name
 *  - tag     Lgd7; : a:String name, b:String translatedName (no other fields)
 *  - pager   Llc2; : d:Le97; work, e:I page index
 *
 * All reflection is cached per class, and no path throws.
 */
object AiDetectionHelper {

    private const val DECISION_WHITELISTED = 0
    private const val DECISION_AI = 1
    private const val DECISION_CLEAN = 2
    private const val DECISION_CACHE_SIZE = 512

    /** AiFilterConfig has no change callback, so the tag lists are re-read at most this often. */
    private const val TAG_LISTS_CHECK_INTERVAL_NANOS = 500_000_000L

    @Volatile
    var appContext: Context? = null
        private set

    private class IllustMeta(val aiType: Field?, val user: Field?, val tags: Field?, val id: Field?)

    private class UserMeta(val id: Field?)

    private class TagMeta(val name: Field?, val translatedName: Field?)

    private class PagerItemMeta(val pageIndex: Field?)

    private val illustMetas = ConcurrentHashMap<Class<*>, IllustMeta>()
    private val userMetas = ConcurrentHashMap<Class<*>, UserMeta>()
    private val tagMetas = ConcurrentHashMap<Class<*>, TagMeta>()
    private val pagerItemMetas = ConcurrentHashMap<Class<*>, PagerItemMeta>()
    private val unwrapNeeded = ConcurrentHashMap<Class<*>, Boolean>()

    private val decisionCache = object : LinkedHashMap<Long, Int>(128, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<Long, Int>?): Boolean =
            size > DECISION_CACHE_SIZE
    }

    /** One immutable generation of the three tag lists; [version] is what the decision cache keys on. */
    private class TagLists(
        val whitelist: Set<String>,
        val exactBlocklist: Set<String>,
        val substringBlocklist: Set<String>,
        val version: Int
    )

    private val tagListsLock = Any()

    @Volatile
    private var tagLists: TagLists? = null

    @Volatile
    private var lastTagListsCheckNanos = 0L

    private var tagListsVersion = 0

    @Volatile
    private var decisionCacheVersion = Int.MIN_VALUE

    // Last-resort fallback: Pixiv data classes print their original Kotlin property names in toString().
    private val TAG_NAME_PATTERN = Regex("""(?:translatedName|name)=([^,)\]]+)""")

    fun ensureContext(context: Context) {
        if (appContext != null) return
        synchronized(this) {
            if (appContext == null) appContext = context.applicationContext
        }
    }

    fun getContext(): Context? {
        appContext?.let { return it }
        try {
            val activityThreadClass = Class.forName("android.app.ActivityThread")
            val currentAppMethod = activityThreadClass.getMethod("currentApplication")
            val app = currentAppMethod.invoke(null) as? Context
            if (app != null) {
                ensureContext(app)
                return appContext
            }
        } catch (_: Throwable) {
        }
        return null
    }

    /** Unwraps pager/list wrappers (Llc2;) down to the illust object itself (Le97;). */
    fun unwrapIllust(item: Any?): Any? {
        if (item == null) return null
        return try {
            val clazz = item.javaClass
            val needsUnwrap = unwrapNeeded.getOrPut(clazz) {
                findField(clazz, "illustAiType", "w") == null && findField(clazz, "d") != null
            }
            if (!needsUnwrap) return item
            val inner = findField(clazz, "d")?.get(item) ?: return item
            if (findField(inner.javaClass, "illustAiType", "w") != null) inner else item
        } catch (_: Throwable) {
            item
        }
    }

    /**
     * Page index carried by the detail pager item (Llc2;->e:I), or null when [item] is not such an item.
     * The pager itself uses this same field to pick the top-image layout (DetailImageViewHolder.bind).
     */
    fun pageIndex(item: Any?): Int? {
        if (item == null) return null
        return try {
            val clazz = item.javaClass
            val meta = pagerItemMetas.getOrPut(clazz) {
                val pageField = findField(clazz, "pageIndex", "e")?.takeIf { it.type == Integer.TYPE }
                val workField = findField(clazz, "work", "d")
                val isPagerItem = pageField != null && workField != null &&
                    findField(workField.type, "illustAiType", "w") != null
                PagerItemMeta(if (isPagerItem) pageField else null)
            }
            meta.pageIndex?.getInt(item)
        } catch (_: Throwable) {
            null
        }
    }

    @JvmStatic
    fun isAi(illust: Any?): Boolean {
        if (illust == null) return false
        return try {
            detect(unwrapIllust(illust) ?: illust)
        } catch (_: Throwable) {
            // Safety fallback: never crash app
            false
        }
    }

    private fun detect(illust: Any): Boolean {
        val clazz = illust.javaClass
        val meta = illustMetas.getOrPut(clazz) {
            IllustMeta(
                aiType = findField(clazz, "illustAiType", "w"),
                user = findField(clazz, "user", "d"),
                tags = findField(clazz, "tags", "e"),
                id = findField(clazz, "id", "a")
            )
        }
        val userId = readUserId(illust, meta)
        val context = getContext()

        // Whitelist wins over everything, including a native AI flag and a blocked artist.
        val decision = decisionFor(context, illust, meta)
        if (decision == DECISION_WHITELISTED) return false

        if (context != null && userId.isNotEmpty() && AiFilterConfig.isUserBlocked(context, userId)) {
            return true
        }

        if (decision != DECISION_AI) return false

        if (context != null && userId.isNotEmpty() && AiFilterConfig.getAutoBlockArtists(context)) {
            AiFilterConfig.addBlockedUserId(context, userId)
        }
        return true
    }

    private fun decisionFor(context: Context?, illust: Any, meta: IllustMeta): Int {
        if (context == null) {
            return if (readAiType(illust, meta) >= 2) DECISION_AI else DECISION_CLEAN
        }

        val lists = tagListsFor(context)
        val illustId = readIllustId(illust, meta)
        if (illustId != 0L) {
            cachedDecision(lists.version, illustId)?.let { return it }
        }

        val decision = computeDecision(illust, meta, lists.whitelist, lists.exactBlocklist, lists.substringBlocklist)
        if (illustId != 0L) memoizeDecision(lists.version, illustId, decision)
        return decision
    }

    /**
     * The current tag lists. AiFilterConfig copies each of the three sets under its own lock on every
     * getter, so this cannot run per bind: it runs at most once per [TAG_LISTS_CHECK_INTERVAL_NANOS]
     * and only bumps the cache version when the contents really changed, compared by set equality
     * instead of a hash of hashes that could collide and keep a stale decision cache alive.
     */
    private fun tagListsFor(context: Context): TagLists {
        val cached = tagLists
        if (cached != null && System.nanoTime() - lastTagListsCheckNanos < TAG_LISTS_CHECK_INTERVAL_NANOS) {
            return cached
        }
        synchronized(tagListsLock) {
            val now = System.nanoTime()
            val current = tagLists
            if (current != null && now - lastTagListsCheckNanos < TAG_LISTS_CHECK_INTERVAL_NANOS) {
                return current
            }
            lastTagListsCheckNanos = now

            val whitelist = AiFilterConfig.getWhitelist(context)
            val exactBlocklist = AiFilterConfig.getExactBlocklist(context)
            val substringBlocklist = AiFilterConfig.getSubstringBlocklist(context)
            if (current != null &&
                current.whitelist == whitelist &&
                current.exactBlocklist == exactBlocklist &&
                current.substringBlocklist == substringBlocklist
            ) {
                return current
            }

            val fresh = TagLists(whitelist, exactBlocklist, substringBlocklist, ++tagListsVersion)
            tagLists = fresh
            synchronized(decisionCache) { decisionCache.clear() }
            return fresh
        }
    }

    private fun computeDecision(
        illust: Any,
        meta: IllustMeta,
        whitelist: Set<String>,
        exactBlocklist: Set<String>,
        substringBlocklist: Set<String>
    ): Int {
        val tags = readTagStrings(illust, meta)
        if (tagsMatch(tags, whitelist, substring = false)) return DECISION_WHITELISTED
        if (readAiType(illust, meta) >= 2) return DECISION_AI
        if (tagsMatch(tags, exactBlocklist, substring = false)) return DECISION_AI
        if (tagsMatch(tags, substringBlocklist, substring = true)) return DECISION_AI
        return DECISION_CLEAN
    }

    private fun tagsMatch(tags: List<String>, candidates: Set<String>, substring: Boolean): Boolean {
        if (tags.isEmpty() || candidates.isEmpty()) return false
        val lowered = candidates.map { it.lowercase() }
        for (tag in tags) {
            val loweredTag = tag.lowercase()
            for (candidate in lowered) {
                val hit = if (substring) loweredTag.contains(candidate) else loweredTag == candidate
                if (hit) return true
            }
        }
        return false
    }

    private fun readTagStrings(illust: Any, meta: IllustMeta): List<String> {
        val tagsField = meta.tags ?: return emptyList()
        val raw = try {
            tagsField.get(illust)
        } catch (_: Throwable) {
            null
        }
        if (raw !is List<*>) return emptyList()

        val result = ArrayList<String>(raw.size * 2)
        for (tag in raw) {
            if (tag == null) continue
            if (tag is String) {
                result.add(tag)
                continue
            }
            val tagClass = tag.javaClass
            val tagMeta = tagMetas.getOrPut(tagClass) {
                TagMeta(
                    name = findField(tagClass, "name", "a"),
                    translatedName = findField(tagClass, "translatedName", "b")
                )
            }
            val name = readString(tagMeta.name, tag)
            if (name.isNullOrEmpty()) {
                result.addAll(parseTagNames(tag))
            } else {
                result.add(name)
            }
            val translated = readString(tagMeta.translatedName, tag)
            if (!translated.isNullOrEmpty()) result.add(translated)
        }
        return result
    }

    private fun readAiType(illust: Any, meta: IllustMeta): Int {
        val field = meta.aiType ?: return 0
        return try {
            field.getInt(illust)
        } catch (_: Throwable) {
            0
        }
    }

    private fun readIllustId(illust: Any, meta: IllustMeta): Long {
        val field = meta.id ?: return 0L
        return try {
            field.getLong(illust)
        } catch (_: Throwable) {
            0L
        }
    }

    private fun readUserId(illust: Any, meta: IllustMeta): String {
        val userField = meta.user ?: return ""
        val userObj = try {
            userField.get(illust)
        } catch (_: Throwable) {
            null
        } ?: return ""
        val userClass = userObj.javaClass
        val userMeta = userMetas.getOrPut(userClass) { UserMeta(findField(userClass, "id", "a")) }
        return readString(userMeta.id, userObj) ?: ""
    }

    private fun readString(field: Field?, target: Any): String? {
        if (field == null) return null
        return try {
            field.get(target)?.toString()
        } catch (_: Throwable) {
            null
        }
    }

    private fun parseTagNames(tag: Any): List<String> {
        return try {
            TAG_NAME_PATTERN.findAll(tag.toString())
                .map { it.groupValues[1].trim() }
                .filter { it.isNotEmpty() }
                .toList()
        } catch (_: Throwable) {
            emptyList()
        }
    }

    private fun cachedDecision(version: Int, illustId: Long): Int? = synchronized(decisionCache) {
        if (decisionCacheVersion != version) return null
        decisionCache[illustId]
    }

    private fun memoizeDecision(version: Int, illustId: Long, decision: Int) = synchronized(decisionCache) {
        if (decisionCacheVersion != version) {
            decisionCache.clear()
            decisionCacheVersion = version
        }
        decisionCache[illustId] = decision
    }

    private fun findField(clazz: Class<*>, vararg fieldNames: String): Field? {
        var current: Class<*>? = clazz
        while (current != null && current != Any::class.java) {
            for (fieldName in fieldNames) {
                try {
                    val f = current.getDeclaredField(fieldName)
                    f.isAccessible = true
                    return f
                } catch (_: NoSuchFieldException) {
                    // try next alias
                }
            }
            current = current.superclass
        }
        return null
    }
}
