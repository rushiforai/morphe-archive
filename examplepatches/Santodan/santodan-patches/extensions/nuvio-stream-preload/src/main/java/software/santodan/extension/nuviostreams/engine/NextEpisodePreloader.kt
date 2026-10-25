package software.santodan.extension.nuviostreams.engine

import kotlinx.coroutines.*

/** Uses elapsed playing time, so resumes and seeks cannot skip the buffer grace period. */
class NextEpisodePreloader(
    private val snapshot: () -> Snapshot,
    private val permit: (Snapshot?) -> Unit,
    private val search: suspend (Snapshot) -> Boolean,
    private val now: () -> Long = { System.nanoTime() / 1_000_000 },
    private val tick: suspend () -> Unit = { delay(250) },
    private val onError: (Throwable) -> Unit = {},
    private val onState: (Snapshot, Long) -> Unit = { _, _ -> }
) {
    data class Snapshot(val profile: Any?, val currentVideoId: String?, val next: StreamTargets.Media?,
                        val enabled: Boolean, val playing: Boolean)

    suspend fun run(): Unit = coroutineScope {
        var previous: Snapshot? = null
        var lastTick = now()
        var playedMs = 0L
        var target: Snapshot? = null
        var fetch: Deferred<Boolean>? = null
        var retryAt = 0L
        try {
            while (isActive) {
                val state = snapshot()
                val time = now()
                val sameEpisode = state.profile == previous?.profile &&
                    state.currentVideoId == previous?.currentVideoId && state.enabled && previous?.enabled == true
                if (!sameEpisode) playedMs = 0
                else if (state.playing && previous.playing) playedMs += (time - lastTick).coerceAtLeast(0)
                onState(state, playedMs)
                val ready = state.enabled && state.playing && state.profile != null &&
                    !state.currentVideoId.isNullOrBlank() && state.next != null &&
                    state.next.videoId != state.currentVideoId && playedMs >= 30_000
                val sameTarget = target?.profile == state.profile && target?.currentVideoId == state.currentVideoId &&
                    target?.next == state.next
                if (!sameTarget || !state.enabled) {
                    permit(null)
                    fetch?.cancelAndJoin()
                    fetch = null
                    target = null
                    retryAt = 0
                } else {
                    // Observe a completed result even if pause/buffering arrived before this tick.
                    if (fetch?.isCompleted == true) {
                        val success = fetch.await()
                        permit(null)
                        fetch = null
                        // Re-observe the native cache without force-refresh. Network work resumes only
                        // when its 15-minute TTL expires; this keeps long episodes ready too.
                        retryAt = time + if (success) 60_000 else 15_000
                    }
                    if (!ready) {
                        permit(null)
                        if (fetch != null) {
                            fetch?.cancelAndJoin()
                            fetch = null
                            retryAt = maxOf(retryAt, time + 15_000)
                        }
                    }
                }
                if (ready && fetch == null && time >= retryAt) {
                    target = state
                    permit(state)
                    fetch = async {
                        try { withTimeoutOrNull(45_000) { search(state) } == true }
                        catch (cancelled: CancellationException) {
                            if (!currentCoroutineContext().isActive) throw cancelled
                            false // A stale native search must not stop the playback observer.
                        }
                        catch (error: Exception) { onError(error); false }
                    }
                }
                previous = state
                lastTick = time
                tick()
            }
        } catch (cancelled: CancellationException) {
            throw cancelled
        } catch (error: Exception) {
            onError(error)
        } finally {
            permit(null)
            fetch?.cancel()
        }
    }
}
