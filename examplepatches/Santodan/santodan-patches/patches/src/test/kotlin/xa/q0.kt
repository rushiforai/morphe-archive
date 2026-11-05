package xa
import com.nuvio.tv.domain.model.Meta
import com.nuvio.tv.domain.model.NextToWatch
import com.nuvio.tv.domain.model.Video

/** Beta.10 detail resolver: the same-arity incompatible overload must remain unused. */
object q0 {
    @JvmStatic fun D(index: Int, first: String, second: String): String =
        error("The incompatible D method must never resolve detail targets")

    @JvmStatic fun C(meta: Meta, next: NextToWatch?, episodes: List<*>): Video? {
        if (meta.apiType == "movie") return null
        val id = next?.nextVideoId ?: return null
        return Video("resolved:$id", next.nextSeason, next.nextEpisode)
    }
}
