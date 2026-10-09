package software.santodan.extension.nuviostreams.engine

import java.lang.reflect.Field
import java.lang.reflect.Method
import java.util.Locale
import java.util.concurrent.ConcurrentHashMap

/** Reads the host's actual playback target; never advances episodes or guesses numbering. */
object StreamTargets {
    data class Media(val type: String, val videoId: String, val season: Int?, val episode: Int?)
    private val fields = ConcurrentHashMap<Pair<Class<*>, String>, Field>()
    private val methods = ConcurrentHashMap<Pair<Class<*>, String>, Method>()
    fun field(owner: Any, name: String): Any? = fields.getOrPut(owner.javaClass to name) {
        owner.javaClass.getDeclaredField(name).apply { isAccessible = true }
    }.get(owner)
    fun get(owner: Any, name: String): Any? = methods.getOrPut(owner.javaClass to name) {
        owner.javaClass.getDeclaredMethod(name).apply { isAccessible = true }
    }.invoke(owner)

    private fun media(type: Any?, id: Any?, season: Any?, episode: Any?): Media? {
        val contentType = (type as? String)?.lowercase(Locale.ROOT) ?: return null
        val videoId = (id as? String)?.takeIf { it.isNotBlank() } ?: return null
        if (contentType == "movie") return Media(contentType, videoId, null, null)
        if (contentType != "series") return null
        val s = season as? Int ?: return null
        val e = episode as? Int ?: return null
        if (s < 0 || e < 1) return null
        return Media(contentType, videoId, s, e)
    }

    fun continueWatching(card: Any): Media? {
        val progress = field(card, "x")
        if (progress != null) return media(get(progress, "getContentType"), get(progress, "getVideoId"),
            get(progress, "getSeason"), get(progress, "getEpisode"))
        val item = field(card, "y") ?: return null
        val info = field(item, "a") ?: return null
        if (field(info, "n") != true) return null // Upcoming titles cannot be played yet.
        return media(field(info, "b"), field(info, "g"), field(info, "h"), field(info, "i"))
    }

    fun details(state: Any, resolveVideo: (Any, Any?, List<*>) -> Any?): Media? {
        val meta = field(state, "b") ?: return null
        val next = field(state, "h")
        val type = get(meta, "getApiType")
        val episodes = field(state, "f") as List<*>
        val video = resolveVideo(meta, next, episodes)
        if (video != null) return media(type, get(video, "getId"), get(video, "getSeason"), get(video, "getEpisode"))
        return if ((type as? String)?.lowercase(Locale.ROOT) == "movie") media(type, get(meta, "getId"), null, null) else null
    }
}
