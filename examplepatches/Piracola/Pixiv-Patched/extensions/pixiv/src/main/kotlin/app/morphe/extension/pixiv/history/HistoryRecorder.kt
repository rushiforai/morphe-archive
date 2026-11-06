package app.morphe.extension.pixiv.history

import app.morphe.extension.pixiv.aiflag.AiDetectionHelper
import java.lang.reflect.Field

/**
 * Turns the works the app hands to the detail screens into [HistoryStore] entries.
 *
 * Everything here is reflective on purpose: the app's domain classes are obfuscated, so field and
 * method lookups fall back to the readable Kotlin property names R8 keeps inside toString().
 */
object HistoryRecorder {

    private val USER_NAME = Regex("""name=([^,)\]]+)""")
    private val IMAGE_URL = Regex("""(?:square|medium|large|url)=(https?://[^,)\]\s"]+)""")

    /** A novel reader screen is open; only novels built while it is are worth recording. */
    @Volatile
    private var novelScreenOpen = false

    @Volatile
    private var novelRecordedOnScreen = false

    @JvmStatic
    fun recordIllust(work: Any?) {
        if (work == null) return
        try {
            val context = AiDetectionHelper.getContext() ?: return
            val id = (invokeNoArg(work, "getId") as? Number)?.toLong() ?: return
            val title = invokeNoArg(work, "getTitle") as? String
            val text = runCatching { work.toString() }.getOrNull().orEmpty()
            val author = USER_NAME.find(text)?.groupValues?.get(1)
            val thumb = IMAGE_URL.find(text)?.groupValues?.get(1)
            // The same bottom bar also serves novel details, so novels have to be told apart here.
            val kind = if (isNovel(work, thumb)) HistoryStore.KIND_NOVEL else HistoryStore.KIND_ILLUST
            HistoryStore.record(context, id, kind, title, author, thumb)
        } catch (_: Throwable) {
        }
    }

    private fun isNovel(work: Any, thumb: String?): Boolean =
        thumb?.contains("/novel-cover") == true ||
            work.javaClass.simpleName.contains("Novel", ignoreCase = true)

    @JvmStatic
    fun enterNovelScreen() {
        novelScreenOpen = true
        novelRecordedOnScreen = false
    }

    @JvmStatic
    fun leaveNovelScreen() {
        novelScreenOpen = false
        novelRecordedOnScreen = false
    }

    /**
     * Called for every novel the reader serialises to its web view, including the related works in
     * the sidebar. Only the first one after the reader opens is the novel the user actually opened.
     */
    @JvmStatic
    fun recordNovel(id: Long, title: String?, user: Any?) {
        if (!novelScreenOpen || novelRecordedOnScreen || id <= 0L) return
        novelRecordedOnScreen = true
        try {
            val context = AiDetectionHelper.getContext() ?: return
            // A detail screen may already have recorded this novel together with its cover image.
            if (HistoryStore.contains(context, id, HistoryStore.KIND_NOVEL)) return
            val author = readField(user, "name") as? String
            HistoryStore.record(context, id, HistoryStore.KIND_NOVEL, title, author, null)
        } catch (_: Throwable) {
        }
    }

    private fun invokeNoArg(target: Any, name: String): Any? = try {
        target.javaClass.getMethod(name).invoke(target)
    } catch (_: Throwable) {
        null
    }

    private fun readField(target: Any?, name: String): Any? {
        if (target == null) return null
        return try {
            var clazz: Class<*>? = target.javaClass
            while (clazz != null) {
                val field: Field? = runCatching { clazz.getDeclaredField(name) }.getOrNull()
                if (field != null) {
                    field.isAccessible = true
                    return field.get(target)
                }
                clazz = clazz.superclass
            }
            null
        } catch (_: Throwable) {
            null
        }
    }
}
