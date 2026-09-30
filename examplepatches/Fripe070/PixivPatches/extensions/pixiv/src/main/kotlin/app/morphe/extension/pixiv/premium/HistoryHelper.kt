package app.morphe.extension.pixiv.premium

import java.util.Collections
import java.util.LinkedList

object HistoryHelper {

    private val localHistory = Collections.synchronizedList(LinkedList<Any>())
    private const val MAX_HISTORY = 100

    @JvmStatic
    fun recordView(illust: Any?) {
        if (illust == null) return
        try {
            val id = getIllustId(illust) ?: return
            synchronized(localHistory) {
                // Remove existing instance to move to front (most recent)
                localHistory.removeAll { getIllustId(it) == id }
                localHistory.add(0, illust)
                if (localHistory.size > MAX_HISTORY) {
                    localHistory.removeAt(localHistory.size - 1)
                }
            }

            // Cache author user info for MuteHelper
            try {
                val userField = runCatching { illust.javaClass.getDeclaredField("user").apply { isAccessible = true } }.getOrNull()
                val user = userField?.get(illust)
                if (user != null) {
                    val uid = (runCatching { user.javaClass.getDeclaredField("id").apply { isAccessible = true } }.getOrNull()?.get(user) as? Number)?.toLong()
                    val uname = runCatching { user.javaClass.getDeclaredField("name").apply { isAccessible = true } }.getOrNull()?.get(user) as? String
                    val uaccount = runCatching { user.javaClass.getDeclaredField("account").apply { isAccessible = true } }.getOrNull()?.get(user) as? String
                    val profileUrls = runCatching { user.javaClass.getDeclaredField("profileImageUrls").apply { isAccessible = true } }.getOrNull()?.get(user)
                    val avatarUrl = profileUrls?.let {
                        runCatching { it.javaClass.getDeclaredField("medium").apply { isAccessible = true } }.getOrNull()?.get(it) as? String
                    }
                    if (uid != null && uname != null) {
                        MuteHelper.rememberUser(uid, uname, uaccount, avatarUrl)
                    }
                }
            } catch (_: Throwable) {
            }
        } catch (_: Throwable) {
        }
    }

    @JvmStatic
    fun getHistoryList(response: Any?): List<*> {
        try {
            if (response != null) {
                val illustsField = response.javaClass.getDeclaredField("illusts").apply { isAccessible = true }
                val serverList = illustsField.get(response) as? List<*>
                if (!serverList.isNullOrEmpty()) {
                    return serverList
                }
            }
        } catch (_: Throwable) {
        }
        return synchronized(localHistory) {
            ArrayList(localHistory)
        }
    }

    private fun getIllustId(illust: Any?): String? {
        if (illust == null) return null
        return runCatching {
            illust.javaClass.getMethod("getId").invoke(illust)?.toString()
        }.getOrNull() ?: runCatching {
            var c: Class<*>? = illust.javaClass
            var f: java.lang.reflect.Field? = null
            while (c != null && f == null) {
                f = runCatching { c.getDeclaredField("id") }.getOrNull()
                c = c.superclass
            }
            f?.apply { isAccessible = true }?.get(illust)?.toString()
        }.getOrNull()
    }
}
