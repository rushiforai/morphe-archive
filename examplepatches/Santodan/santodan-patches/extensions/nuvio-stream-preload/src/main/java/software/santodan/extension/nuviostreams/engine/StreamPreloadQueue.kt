package software.santodan.extension.nuviostreams.engine

import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel

/** Bounded consumers of the host's cached searches. Never owns or duplicates stream results. */
class StreamPreloadQueue(
    private val scope: CoroutineScope,
    private val profile: () -> Any?,
    private val enabled: (String) -> Boolean,
    private val paused: () -> Boolean,
    private val search: suspend (Target) -> Boolean,
    private val now: () -> Long = { System.nanoTime() / 1_000_000 },
    private val timeoutMs: Long = 45_000,
    private val onError: (Throwable) -> Unit = {},
    private val onEvent: (Target, String, Long) -> Unit = { _, _, _ -> }
) {
    data class Target(val mode: String, val profile: Any, val type: String, val videoId: String,
                      val season: Int?, val episode: Int?)
    private data class Key(val profile: Any, val type: String, val videoId: String,
                           val season: Int?, val episode: Int?)
    private data class Entry(val target: Target, val key: Key, val time: Long)
    private val lock = Any()
    private val queue = ArrayList<Entry>()
    private val pending = HashSet<Key>()
    private val cooldown = LinkedHashMap<Key, Long>()
    private val wake = Channel<Unit>(2)

    init {
        repeat(2) {
            scope.launch {
                for (signal in wake) {
                    while (true) {
                        val entry = synchronized(lock) {
                            if (queue.isEmpty()) null else queue.removeAt(0)
                        } ?: break
                        var success = false
                        val started = now()
                        var outcome = "skipped"
                        try {
                            val target = entry.target
                            if (enabled(target.mode) && profile() == target.profile && !paused() &&
                                now() - entry.time < 15_000) {
                                onEvent(target, "started", 0)
                                val result = withTimeoutOrNull(timeoutMs) { search(target) }
                                success = result == true
                                outcome = if (result == null) "timeout" else if (success) "completed" else "empty-or-unavailable"
                            } else {
                                outcome = when {
                                    !enabled(target.mode) -> "skipped-disabled"
                                    profile() != target.profile -> "skipped-profile-changed"
                                    paused() -> "skipped-playback"
                                    else -> "skipped-stale"
                                }
                            }
                        } catch (cancelled: CancellationException) {
                            outcome = "cancelled"
                            if (!currentCoroutineContext().isActive) throw cancelled
                        } catch (error: Throwable) { outcome = "failed"; onError(error) }
                        finally {
                            onEvent(entry.target, outcome, now() - started)
                            synchronized(lock) {
                                pending.remove(entry.key)
                                cooldown[entry.key] = now() + if (success) 60_000 else 15_000
                                while (cooldown.size > 64) cooldown.remove(cooldown.keys.first())
                            }
                        }
                    }
                }
            }
        }
    }

    fun offer(target: Target) {
        if (!enabled(target.mode) || profile() != target.profile || paused()) return
        val key = Key(target.profile, target.type, target.videoId, target.season, target.episode)
        synchronized(lock) {
            if (key in pending || (cooldown[key] ?: 0) > now()) return
            if (target.mode == "details") {
                val obsolete = queue.filter { it.target.mode == "details" && it.target.profile == target.profile }
                queue.removeAll(obsolete.toSet())
                obsolete.forEach { pending.remove(it.key) }
            }
            if (queue.size >= 8) {
                // A detail-page request takes precedence over cards left behind while browsing.
                if (target.mode != "details") return
                val evicted = queue.indexOfLast { it.target.mode != "details" }
                if (evicted < 0) return
                pending.remove(queue.removeAt(evicted).key)
            }
            pending.add(key)
            val entry = Entry(target, key, now())
            if (target.mode == "details") queue.add(0, entry) else queue.add(entry)
        }
        wake.trySend(Unit)
    }

    fun disable(mode: String) = synchronized(lock) {
        val removed = queue.filter { it.target.mode == mode }
        queue.removeAll(removed.toSet())
        removed.forEach { pending.remove(it.key) }
        cooldown.clear()
    }
}
