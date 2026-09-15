package app.morphe.extension.pixiv.aiflag

import android.content.Context
import java.lang.reflect.Field

object AiDetectionHelper {

    @Volatile
    var appContext: Context? = null

    // Reflection caches
    private var cachedIllustClass: Class<*>? = null
    private var cachedIllustAiTypeField: Field? = null
    private var cachedUserField: Field? = null
    private var cachedTagsField: Field? = null

    private var cachedUserClass: Class<*>? = null
    private var cachedUserIdField: Field? = null

    private var cachedTagClass: Class<*>? = null
    private var cachedTagNameField: Field? = null
    private var cachedTagTranslatedNameField: Field? = null

    fun getContext(): Context? {
        if (appContext != null) return appContext
        try {
            val activityThreadClass = Class.forName("android.app.ActivityThread")
            val currentAppMethod = activityThreadClass.getMethod("currentApplication")
            val app = currentAppMethod.invoke(null) as? Context
            if (app != null) {
                appContext = app.applicationContext
                return appContext
            }
        } catch (_: Throwable) {
        }
        return null
    }

    @JvmStatic
    fun isAi(illust: Any?): Boolean {
        if (illust == null) return false
        val context = getContext()

        return try {
            checkIllust(context, illust)
        } catch (t: Throwable) {
            // Safety fallback: never crash app
            false
        }
    }

    private fun checkIllust(context: Context?, illust: Any): Boolean {
        val clazz = illust.javaClass

        // 1. Extract illustAiType
        var illustAiType = 0
        try {
            if (cachedIllustClass != clazz) {
                cachedIllustClass = clazz
                cachedIllustAiTypeField = findField(clazz, "illustAiType")
                cachedUserField = findField(clazz, "user")
                cachedTagsField = findField(clazz, "tags")
            }
            cachedIllustAiTypeField?.let {
                illustAiType = it.getInt(illust)
            }
        } catch (_: Throwable) {
        }

        // 2. Extract artist/user ID
        var userId = ""
        try {
            val userObj = cachedUserField?.get(illust)
            if (userObj != null) {
                val userClazz = userObj.javaClass
                if (cachedUserClass != userClazz) {
                    cachedUserClass = userClazz
                    cachedUserIdField = findField(userClazz, "id")
                }
                cachedUserIdField?.let {
                    val idVal = it.get(userObj)
                    if (idVal != null) {
                        userId = idVal.toString()
                    }
                }
            }
        } catch (_: Throwable) {
        }

        // 3. Extract tags
        val tagStrings = mutableListOf<String>()
        try {
            val tagsObj = cachedTagsField?.get(illust)
            if (tagsObj is List<*>) {
                for (tag in tagsObj) {
                    if (tag == null) continue
                    if (tag is String) {
                        tagStrings.add(tag)
                    } else {
                        val tagClazz = tag.javaClass
                        if (cachedTagClass != tagClazz) {
                            cachedTagClass = tagClazz
                            cachedTagNameField = findField(tagClazz, "name")
                            cachedTagTranslatedNameField = findField(tagClazz, "translatedName")
                        }
                        cachedTagNameField?.get(tag)?.let {
                            val str = it.toString()
                            if (str.isNotEmpty()) tagStrings.add(str)
                        }
                        cachedTagTranslatedNameField?.get(tag)?.let {
                            val str = it.toString()
                            if (str.isNotEmpty()) tagStrings.add(str)
                        }
                    }
                }
            }
        } catch (_: Throwable) {
        }

        // Check Whitelist if context is available
        if (context != null) {
            val whitelist = AiFilterConfig.getWhitelist(context)
            if (whitelist.isNotEmpty()) {
                val isWhitelisted = tagStrings.any { tagStr ->
                    whitelist.any { w -> tagStr.equals(w, ignoreCase = true) }
                }
                if (isWhitelisted) {
                    return false
                }
            }
        }

        // Check if artist is already blocked
        if (context != null && userId.isNotEmpty()) {
            if (AiFilterConfig.isUserBlocked(context, userId)) {
                return true
            }
        }

        // Check native AI flag (illust_ai_type == 2)
        var isAiDetected = (illustAiType >= 2)

        // Check tag blocklists
        if (!isAiDetected && context != null && tagStrings.isNotEmpty()) {
            val exactBlocklist = AiFilterConfig.getExactBlocklist(context)
            val substringBlocklist = AiFilterConfig.getSubstringBlocklist(context)

            for (tagStr in tagStrings) {
                if (exactBlocklist.any { exact -> tagStr.equals(exact, ignoreCase = true) }) {
                    isAiDetected = true
                    break
                }
                if (substringBlocklist.any { sub -> tagStr.contains(sub, ignoreCase = true) }) {
                    isAiDetected = true
                    break
                }
            }
        }

        // Handle auto-blocking
        if (isAiDetected && context != null && userId.isNotEmpty()) {
            if (AiFilterConfig.getAutoBlockArtists(context)) {
                AiFilterConfig.addBlockedUserId(context, userId)
            }
        }

        return isAiDetected
    }

    private fun findField(clazz: Class<*>, fieldName: String): Field? {
        var current: Class<*>? = clazz
        while (current != null && current != Any::class.java) {
            try {
                val f = current.getDeclaredField(fieldName)
                f.isAccessible = true
                return f
            } catch (_: NoSuchFieldException) {
                current = current.superclass
            }
        }
        return null
    }
}
