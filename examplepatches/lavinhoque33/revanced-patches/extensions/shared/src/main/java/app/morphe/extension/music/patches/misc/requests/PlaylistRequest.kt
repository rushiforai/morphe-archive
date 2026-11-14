package app.morphe.extension.music.patches.misc.requests

import androidx.annotation.GuardedBy
import app.morphe.extension.music.patches.misc.AutoSongVersionPatch
import app.morphe.extension.shared.utils.Logger
import app.morphe.extension.shared.utils.Utils
import java.util.concurrent.ExecutionException
import java.util.concurrent.Future
import java.util.concurrent.TimeUnit
import java.util.concurrent.TimeoutException

class PlaylistRequest private constructor(
    private val videoId: String,
    private val playlistId: String,
) {
    /** The uniquely matched album recording, with metadata belonging to that recording. */
    data class Song(
        val videoId: String,
        val title: String,
        val artist: String,
        val durationSeconds: Int,
    )

    private val timeFetched = System.currentTimeMillis()
    private val future: Future<Song?> = Utils.submitOnBackgroundThread {
        AutoSongVersionPatch.resolveAlbumSong(videoId, playlistId)?.let { song ->
            Song(song.videoId(), song.title(), song.artist(), song.durationSeconds())
        }
    }

    fun isExpired(now: Long): Boolean =
        now - timeFetched > CACHE_RETENTION_TIME_MILLISECONDS || (future.isDone && getSong() == null)

    /** Waits for an identity-based lookup, never a player-response playlist index. */
    fun getSong(): Song? {
        return try {
            future[MAX_MILLISECONDS_TO_WAIT_FOR_FETCH, TimeUnit.MILLISECONDS]
        } catch (ex: TimeoutException) {
            Logger.printInfo({ "getSong timed out" }, ex)
            null
        } catch (ex: InterruptedException) {
            Thread.currentThread().interrupt()
            Logger.printException({ "getSong interrupted" }, ex)
            null
        } catch (ex: ExecutionException) {
            Logger.printException({ "getSong failure" }, ex)
            null
        }
    }

    companion object {
        private const val CACHE_RETENTION_TIME_MILLISECONDS = 60 * 1000L
        private const val MAX_MILLISECONDS_TO_WAIT_FOR_FETCH = 10 * 1000L

        @GuardedBy("itself")
        private val cache: MutableMap<String, PlaylistRequest> = HashMap()

        @JvmStatic
        fun fetchRequestIfNeeded(videoId: String, playlistId: String) {
            synchronized(cache) {
                val now = System.currentTimeMillis()
                cache.values.removeIf { request -> request.isExpired(now) }

                val known = cache[videoId]
                if (known == null || known.playlistId != playlistId) {
                    cache[videoId] = PlaylistRequest(videoId, playlistId)
                }
            }
        }

        @JvmStatic
        fun getRequestForVideoId(videoId: String): PlaylistRequest? {
            synchronized(cache) {
                return cache[videoId]
            }
        }
    }
}
