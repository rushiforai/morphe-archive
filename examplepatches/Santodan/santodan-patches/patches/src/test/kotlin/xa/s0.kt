package xa
import com.nuvio.tv.domain.model.Meta
import com.nuvio.tv.domain.model.NextToWatch
import com.nuvio.tv.domain.model.Video

object s0 {
    @JvmStatic fun C(index: Int, first: String, second: String): String =
        error("The incompatible beta7 C method must never resolve detail targets")

    @JvmStatic fun D(meta: Meta, next: NextToWatch?, episodes: List<*>): Video? {
        if (meta.apiType == "movie") return null
        val id = next?.nextVideoId ?: return null
        return Video("resolved:$id", next.nextSeason, next.nextEpisode)
    }
}
