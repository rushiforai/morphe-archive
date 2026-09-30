package app.morphe.extension.pixiv.premium

import android.content.Context
import java.lang.reflect.Constructor
import java.lang.reflect.Field
import java.util.concurrent.ConcurrentHashMap
import org.json.JSONArray
import org.json.JSONObject

object MuteHelper {

    private const val PREFS_NAME = "pixiv_morphe_mute_prefs"
    private const val KEY_MUTED_TAGS = "muted_tags"
    private const val KEY_MUTED_USERS = "muted_users"

    data class MutedUserData(
        val id: Long,
        val name: String,
        val account: String,
        val avatarUrl: String
    )

    private val userCache = ConcurrentHashMap<Long, MutedUserData>()

    private var pixivTagCtor: Constructor<*>? = null
    private var pixivMutedTagCtor: Constructor<*>? = null
    private var pixivUserCtor: Constructor<*>? = null
    private var pixivProfileImageUrlsCtor: Constructor<*>? = null
    private var pixivMutedUserCtor: Constructor<*>? = null

    private fun getContext(): Context? {
        return runCatching {
            val activityThreadClass = Class.forName("android.app.ActivityThread")
            val currentAppMethod = activityThreadClass.getMethod("currentApplication")
            currentAppMethod.invoke(null) as? Context
        }.getOrNull()
    }

    @JvmStatic
    fun rememberUser(id: Long, name: String, account: String? = null, avatarUrl: String? = null) {
        val data = MutedUserData(
            id = id,
            name = name,
            account = account ?: "$id",
            avatarUrl = avatarUrl ?: ""
        )
        userCache[id] = data
    }

    @JvmStatic
    fun initSa6(sa6: Any?) {
        if (sa6 == null) return
        try {
            val eField = sa6.javaClass.getDeclaredField("e").apply { isAccessible = true }
            val fField = sa6.javaClass.getDeclaredField("f").apply { isAccessible = true }
            @Suppress("UNCHECKED_CAST")
            val usersMap = eField.get(sa6) as? MutableMap<Long, Boolean> ?: return
            @Suppress("UNCHECKED_CAST")
            val tagsMap = fField.get(sa6) as? MutableMap<String, Boolean> ?: return

            for (user in getLocalMutedUsers()) {
                usersMap[user.id] = true
            }
            for (tag in getLocalMutedTags()) {
                tagsMap[tag] = true
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun onMuteSettingUpdated(
        addUserIds: List<*>?,
        deleteUserIds: List<*>?,
        addTags: List<*>?,
        deleteTags: List<*>?
    ) {
        try {
            updateLocalMutedTags(addTags, deleteTags)
            updateLocalMutedUsers(addUserIds, deleteUserIds)
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun getLocalMutedTags(): Set<String> {
        val ctx = getContext() ?: return emptySet()
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        return prefs.getStringSet(KEY_MUTED_TAGS, null)?.toSet() ?: emptySet()
    }

    @Synchronized
    private fun updateLocalMutedTags(addTags: List<*>?, deleteTags: List<*>?) {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val current = HashSet(prefs.getStringSet(KEY_MUTED_TAGS, null) ?: emptySet())
        var changed = false

        if (addTags != null) {
            for (tag in addTags) {
                val str = tag?.toString()?.trim()
                if (!str.isNullOrEmpty() && current.add(str)) {
                    changed = true
                }
            }
        }
        if (deleteTags != null) {
            for (tag in deleteTags) {
                val str = tag?.toString()?.trim()
                if (!str.isNullOrEmpty() && current.remove(str)) {
                    changed = true
                }
            }
        }

        if (changed) {
            prefs.edit().putStringSet(KEY_MUTED_TAGS, current).apply()
        }
    }

    @JvmStatic
    fun getLocalMutedUsers(): List<MutedUserData> {
        val ctx = getContext() ?: return emptyList()
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val jsonStr = prefs.getString(KEY_MUTED_USERS, null) ?: return emptyList()
        return runCatching {
            val array = JSONArray(jsonStr)
            val list = ArrayList<MutedUserData>(array.length())
            for (i in 0 until array.length()) {
                val obj = array.getJSONObject(i)
                val id = obj.getLong("id")
                val name = obj.optString("name", "User #$id")
                val account = obj.optString("account", "$id")
                val avatarUrl = obj.optString("avatarUrl", "")
                list.add(MutedUserData(id, name, account, avatarUrl))
            }
            list
        }.getOrDefault(emptyList())
    }

    @Synchronized
    private fun updateLocalMutedUsers(addUserIds: List<*>?, deleteUserIds: List<*>?) {
        val ctx = getContext() ?: return
        val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val currentUsers = getLocalMutedUsers().toMutableList()
        var changed = false

        if (deleteUserIds != null) {
            val toDelete = deleteUserIds.mapNotNull {
                (it as? Number)?.toLong() ?: it?.toString()?.toLongOrNull()
            }.toSet()
            if (toDelete.isNotEmpty()) {
                val removed = currentUsers.removeAll { toDelete.contains(it.id) }
                if (removed) changed = true
            }
        }

        if (addUserIds != null) {
            for (item in addUserIds) {
                val id = (item as? Number)?.toLong() ?: item?.toString()?.toLongOrNull() ?: continue
                if (currentUsers.none { it.id == id }) {
                    val cached = userCache[id]
                    val name = cached?.name ?: "User #$id"
                    val account = cached?.account ?: "$id"
                    val avatar = cached?.avatarUrl ?: ""
                    currentUsers.add(MutedUserData(id, name, account, avatar))
                    changed = true
                }
            }
        }

        if (changed) {
            val array = JSONArray()
            for (user in currentUsers) {
                val obj = JSONObject().apply {
                    put("id", user.id)
                    put("name", user.name)
                    put("account", user.account)
                    put("avatarUrl", user.avatarUrl)
                }
                array.put(obj)
            }
            prefs.edit().putString(KEY_MUTED_USERS, array.toString()).apply()
        }
    }

    private fun extractTagName(item: Any?): String? {
        if (item == null) return null
        return runCatching {
            val tag = item.javaClass.getDeclaredField("tag").apply { isAccessible = true }.get(item) ?: return null
            tag.javaClass.getDeclaredField("name").apply { isAccessible = true }.get(tag) as? String
        }.getOrNull()
    }

    private fun extractUserId(item: Any?): Long? {
        if (item == null) return null
        return runCatching {
            val user = item.javaClass.getDeclaredField("user").apply { isAccessible = true }.get(item) ?: return null
            val idObj = user.javaClass.getDeclaredField("id").apply { isAccessible = true }.get(user)
            (idObj as? Number)?.toLong()
        }.getOrNull()
    }

    private fun createPixivMutedTag(tagName: String): Any? {
        return runCatching {
            if (pixivTagCtor == null) {
                val tagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivTag")
                pixivTagCtor = tagCls.getConstructor(String::class.java, String::class.java)
            }
            if (pixivMutedTagCtor == null) {
                val mutedTagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivMutedTag")
                val tagCls = Class.forName("jp.pxv.android.domain.commonentity.PixivTag")
                pixivMutedTagCtor = mutedTagCls.getConstructor(tagCls, java.lang.Boolean.TYPE)
            }
            val tag = pixivTagCtor!!.newInstance(tagName, null)
            pixivMutedTagCtor!!.newInstance(tag, true)
        }.getOrNull()
    }

    private fun createPixivMutedUser(user: MutedUserData): Any? {
        return runCatching {
            if (pixivProfileImageUrlsCtor == null) {
                val cls = Class.forName("jp.pxv.android.domain.commonentity.PixivProfileImageUrls")
                pixivProfileImageUrlsCtor = cls.getConstructor(String::class.java)
            }
            if (pixivUserCtor == null) {
                val userCls = Class.forName("jp.pxv.android.domain.commonentity.PixivUser")
                val profileUrlsCls = Class.forName("jp.pxv.android.domain.commonentity.PixivProfileImageUrls")
                pixivUserCtor = userCls.getConstructor(
                    java.lang.Long.TYPE,
                    String::class.java,
                    String::class.java,
                    String::class.java,
                    profileUrlsCls,
                    java.lang.Boolean.TYPE,
                    java.lang.Boolean::class.java,
                    java.lang.Boolean.TYPE,
                    List::class.java
                )
            }
            if (pixivMutedUserCtor == null) {
                val mutedUserCls = Class.forName("jp.pxv.android.domain.commonentity.PixivMutedUser")
                val userCls = Class.forName("jp.pxv.android.domain.commonentity.PixivUser")
                pixivMutedUserCtor = mutedUserCls.getConstructor(userCls, java.lang.Boolean.TYPE)
            }
            val avatarUrl = if (user.avatarUrl.isNotEmpty()) user.avatarUrl else "https://s.pximg.net/common/images/no_profile.png"
            val profileUrls = pixivProfileImageUrlsCtor!!.newInstance(avatarUrl)
            val pixivUser = pixivUserCtor!!.newInstance(
                user.id,
                user.name,
                user.account,
                null,
                profileUrls,
                false,
                null,
                false,
                null
            )
            pixivMutedUserCtor!!.newInstance(pixivUser, true)
        }.getOrNull()
    }

    @JvmStatic
    fun getMergedMutedTags(response: Any?): List<*> {
        if (response == null) return emptyList<Any>()
        return try {
            val field = response.javaClass.getDeclaredField("mutedTags").apply { isAccessible = true }
            val serverList = (field.get(response) as? List<*>) ?: emptyList<Any>()
            val existingNames = HashSet<String>()
            for (item in serverList) {
                val name = extractTagName(item)
                if (name != null) existingNames.add(name)
            }
            val localTags = getLocalMutedTags()
            val merged = ArrayList<Any>(serverList.size + localTags.size)
            merged.addAll(serverList.filterNotNull())
            for (tag in localTags) {
                if (!existingNames.contains(tag)) {
                    val mutedTag = createPixivMutedTag(tag)
                    if (mutedTag != null) {
                        merged.add(mutedTag)
                    }
                }
            }
            merged
        } catch (_: Throwable) {
            runCatching {
                val field = response.javaClass.getDeclaredField("mutedTags").apply { isAccessible = true }
                field.get(response) as? List<*>
            }.getOrNull() ?: emptyList<Any>()
        }
    }

    @JvmStatic
    fun getMergedMutedUsers(response: Any?): List<*> {
        if (response == null) return emptyList<Any>()
        return try {
            val field = response.javaClass.getDeclaredField("mutedUsers").apply { isAccessible = true }
            val serverList = (field.get(response) as? List<*>) ?: emptyList<Any>()
            val existingIds = HashSet<Long>()
            for (item in serverList) {
                val id = extractUserId(item)
                if (id != null) existingIds.add(id)
            }
            val localUsers = getLocalMutedUsers()
            val merged = ArrayList<Any>(serverList.size + localUsers.size)
            merged.addAll(serverList.filterNotNull())
            for (user in localUsers) {
                if (!existingIds.contains(user.id)) {
                    val mutedUser = createPixivMutedUser(user)
                    if (mutedUser != null) {
                        merged.add(mutedUser)
                    }
                }
            }
            merged
        } catch (_: Throwable) {
            runCatching {
                val field = response.javaClass.getDeclaredField("mutedUsers").apply { isAccessible = true }
                field.get(response) as? List<*>
            }.getOrNull() ?: emptyList<Any>()
        }
    }
}
