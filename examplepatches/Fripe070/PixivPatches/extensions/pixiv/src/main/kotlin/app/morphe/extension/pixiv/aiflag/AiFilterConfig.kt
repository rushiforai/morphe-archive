package app.morphe.extension.pixiv.aiflag

import android.content.Context
import android.content.SharedPreferences

object AiFilterConfig {
    private const val PREFS_NAME = "pixiv_ai_filter_prefs"

    private const val KEY_HIDE_COMPLETELY = "hide_completely"
    private const val KEY_AUTO_BLOCK_ARTISTS = "auto_block_artists"
    private const val KEY_BLOCKED_USER_IDS = "blocked_user_ids"
    private const val KEY_EXACT_BLOCKLIST = "exact_blocklist"
    private const val KEY_SUBSTRING_BLOCKLIST = "substring_blocklist"
    private const val KEY_WHITELIST = "whitelist"

    val DEFAULT_EXACT_BLOCKLIST = linkedSetOf(
        "AI",
        "AI Art",
        "AI illustration",
        "Generative AI"
    )

    val DEFAULT_SUBSTRING_BLOCKLIST = linkedSetOf(
        "AIイラスト",
        "AI生成",
        "AIart",
        "AI-generated",
        "NovelAI",
        "Stable Diffusion",
        "StableDiffusion",
        "Midjourney",
        "Nijijourney",
        "DALL-E",
        "Created with AI",
        "Flux",
        "AI绘画",
        "AI 그림"
    )

    @Volatile
    private var initialized = false

    @Volatile
    private var cachedHideCompletely = false

    @Volatile
    private var cachedAutoBlockArtists = true

    private val cachedBlockedUserIds = HashSet<String>()
    private val cachedExactBlocklist = HashSet<String>()
    private val cachedSubstringBlocklist = HashSet<String>()
    private val cachedWhitelist = HashSet<String>()

    private val lock = Any()

    private fun getPrefs(context: Context): SharedPreferences {
        return context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    }

    fun initIfNeeded(context: Context) {
        if (initialized) return
        synchronized(lock) {
            if (initialized) return
            val prefs = getPrefs(context)
            cachedHideCompletely = prefs.getBoolean(KEY_HIDE_COMPLETELY, false)
            cachedAutoBlockArtists = prefs.getBoolean(KEY_AUTO_BLOCK_ARTISTS, true)

            cachedBlockedUserIds.clear()
            prefs.getStringSet(KEY_BLOCKED_USER_IDS, null)?.let {
                cachedBlockedUserIds.addAll(it)
            }

            cachedExactBlocklist.clear()
            val exactStored = prefs.getStringSet(KEY_EXACT_BLOCKLIST, null)
            if (exactStored != null) {
                cachedExactBlocklist.addAll(exactStored)
            } else {
                cachedExactBlocklist.addAll(DEFAULT_EXACT_BLOCKLIST)
            }

            cachedSubstringBlocklist.clear()
            val subStored = prefs.getStringSet(KEY_SUBSTRING_BLOCKLIST, null)
            if (subStored != null) {
                cachedSubstringBlocklist.addAll(subStored)
            } else {
                cachedSubstringBlocklist.addAll(DEFAULT_SUBSTRING_BLOCKLIST)
            }

            cachedWhitelist.clear()
            prefs.getStringSet(KEY_WHITELIST, null)?.let {
                cachedWhitelist.addAll(it)
            }

            initialized = true
        }
    }

    fun getHideCompletely(context: Context): Boolean {
        initIfNeeded(context)
        return cachedHideCompletely
    }

    fun setHideCompletely(context: Context, value: Boolean) {
        initIfNeeded(context)
        synchronized(lock) {
            cachedHideCompletely = value
            getPrefs(context).edit().putBoolean(KEY_HIDE_COMPLETELY, value).apply()
        }
    }

    fun getAutoBlockArtists(context: Context): Boolean {
        initIfNeeded(context)
        return cachedAutoBlockArtists
    }

    fun setAutoBlockArtists(context: Context, value: Boolean) {
        initIfNeeded(context)
        synchronized(lock) {
            cachedAutoBlockArtists = value
            getPrefs(context).edit().putBoolean(KEY_AUTO_BLOCK_ARTISTS, value).apply()
        }
    }

    fun getBlockedUserIds(context: Context): Set<String> {
        initIfNeeded(context)
        synchronized(lock) {
            return HashSet(cachedBlockedUserIds)
        }
    }

    fun getBlockedUserCount(context: Context): Int {
        initIfNeeded(context)
        synchronized(lock) {
            return cachedBlockedUserIds.size
        }
    }

    fun isUserBlocked(context: Context, userId: String): Boolean {
        initIfNeeded(context)
        synchronized(lock) {
            return cachedBlockedUserIds.contains(userId)
        }
    }

    fun addBlockedUserId(context: Context, userId: String) {
        if (userId.isEmpty()) return
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedBlockedUserIds.add(userId)) {
                getPrefs(context).edit()
                    .putStringSet(KEY_BLOCKED_USER_IDS, HashSet(cachedBlockedUserIds))
                    .apply()
            }
        }
    }

    fun removeBlockedUserId(context: Context, userId: String) {
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedBlockedUserIds.remove(userId)) {
                getPrefs(context).edit()
                    .putStringSet(KEY_BLOCKED_USER_IDS, HashSet(cachedBlockedUserIds))
                    .apply()
            }
        }
    }

    fun clearBlockedUserIds(context: Context) {
        initIfNeeded(context)
        synchronized(lock) {
            cachedBlockedUserIds.clear()
            getPrefs(context).edit().remove(KEY_BLOCKED_USER_IDS).apply()
        }
    }

    fun getExactBlocklist(context: Context): Set<String> {
        initIfNeeded(context)
        synchronized(lock) {
            return HashSet(cachedExactBlocklist)
        }
    }

    fun addExactBlocklistTag(context: Context, tag: String) {
        val trimmed = tag.trim()
        if (trimmed.isEmpty()) return
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedExactBlocklist.add(trimmed)) {
                getPrefs(context).edit()
                    .putStringSet(KEY_EXACT_BLOCKLIST, HashSet(cachedExactBlocklist))
                    .apply()
            }
        }
    }

    fun removeExactBlocklistTag(context: Context, tag: String) {
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedExactBlocklist.remove(tag.trim())) {
                getPrefs(context).edit()
                    .putStringSet(KEY_EXACT_BLOCKLIST, HashSet(cachedExactBlocklist))
                    .apply()
            }
        }
    }

    fun getSubstringBlocklist(context: Context): Set<String> {
        initIfNeeded(context)
        synchronized(lock) {
            return HashSet(cachedSubstringBlocklist)
        }
    }

    fun addSubstringBlocklistTag(context: Context, tag: String) {
        val trimmed = tag.trim()
        if (trimmed.isEmpty()) return
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedSubstringBlocklist.add(trimmed)) {
                getPrefs(context).edit()
                    .putStringSet(KEY_SUBSTRING_BLOCKLIST, HashSet(cachedSubstringBlocklist))
                    .apply()
            }
        }
    }

    fun removeSubstringBlocklistTag(context: Context, tag: String) {
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedSubstringBlocklist.remove(tag.trim())) {
                getPrefs(context).edit()
                    .putStringSet(KEY_SUBSTRING_BLOCKLIST, HashSet(cachedSubstringBlocklist))
                    .apply()
            }
        }
    }

    fun getWhitelist(context: Context): Set<String> {
        initIfNeeded(context)
        synchronized(lock) {
            return HashSet(cachedWhitelist)
        }
    }

    fun addWhitelistTag(context: Context, tag: String) {
        val trimmed = tag.trim()
        if (trimmed.isEmpty()) return
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedWhitelist.add(trimmed)) {
                getPrefs(context).edit()
                    .putStringSet(KEY_WHITELIST, HashSet(cachedWhitelist))
                    .apply()
            }
        }
    }

    fun removeWhitelistTag(context: Context, tag: String) {
        initIfNeeded(context)
        synchronized(lock) {
            if (cachedWhitelist.remove(tag.trim())) {
                getPrefs(context).edit()
                    .putStringSet(KEY_WHITELIST, HashSet(cachedWhitelist))
                    .apply()
            }
        }
    }

    fun resetDefaultTags(context: Context) {
        initIfNeeded(context)
        synchronized(lock) {
            cachedExactBlocklist.clear()
            cachedExactBlocklist.addAll(DEFAULT_EXACT_BLOCKLIST)

            cachedSubstringBlocklist.clear()
            cachedSubstringBlocklist.addAll(DEFAULT_SUBSTRING_BLOCKLIST)

            cachedWhitelist.clear()

            getPrefs(context).edit()
                .putStringSet(KEY_EXACT_BLOCKLIST, HashSet(cachedExactBlocklist))
                .putStringSet(KEY_SUBSTRING_BLOCKLIST, HashSet(cachedSubstringBlocklist))
                .remove(KEY_WHITELIST)
                .apply()
        }
    }
}
