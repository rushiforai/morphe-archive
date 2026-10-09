package ka
import software.santodan.extension.nuviostreams.engine.StreamTargets
class ResolvedVideo(val id: String, val season: Int?, val episode: Int?)
object e1 {
    @JvmStatic fun C(meta: Any, next: Any?, episodes: List<*>): Any? {
        if (StreamTargets.get(meta, "getApiType") == "movie") return null
        if (next == null) return null
        val id = StreamTargets.get(next, "getNextVideoId") as? String ?: return null
        return ResolvedVideo("resolved:$id", StreamTargets.get(next, "getNextSeason") as? Int,
            StreamTargets.get(next, "getNextEpisode") as? Int)
    }
}
