package santodan.patches

import java.util.concurrent.atomic.AtomicInteger
import kotlinx.coroutines.*
import software.santodan.extension.nuviostreams.engine.StreamPreloadQueue
import software.santodan.extension.nuviostreams.engine.StreamTargets

private class Progress(val contentType: String, val videoId: String, val season: Int?, val episode: Int?)
private class NextUp(@JvmField val b: String, @JvmField val g: String, @JvmField val h: Int,
                     @JvmField val i: Int, @JvmField val n: Boolean)
private class Item(@JvmField val a: Any)
private class Card(@JvmField val x: Progress?, @JvmField val y: Item?)
private class Meta(val apiType: String, val id: String)
private class Next(val nextVideoId: String?, val nextSeason: Int?, val nextEpisode: Int?, val watchProgress: Progress?)
private class Detail(@JvmField val b: Meta?, @JvmField val h: Next?, @JvmField val f: List<Any> = emptyList())
private class Video(val id: String, val season: Int?, val episode: Int?)

fun main() = runBlocking {
    check(StreamTargets.continueWatching(Card(Progress("movie", "tt1", null, null), null)) ==
        StreamTargets.Media("movie", "tt1", null, null))
    check(StreamTargets.continueWatching(Card(Progress("series", "tt1:2:3", 2, 3), null)) ==
        StreamTargets.Media("series", "tt1:2:3", 2, 3))
    check(StreamTargets.continueWatching(Card(null, Item(NextUp("series", "tt2:0:1", 0, 1, true)))) ==
        StreamTargets.Media("series", "tt2:0:1", 0, 1))
    check(StreamTargets.continueWatching(Card(null, Item(NextUp("series", "tt2:2:3", 2, 3, false)))) == null)
    check(StreamTargets.continueWatching(Card(Progress("series", "", 1, 1), null)) == null)
    check(StreamTargets.details(Detail(Meta("movie", "tt3"), Next(null, null, null, null))) { _, _, _ -> null } ==
        StreamTargets.Media("movie", "tt3", null, null))
    check(StreamTargets.details(Detail(Meta("series", "tt3"), Next("old:3:4", 3, 4, null))) { _, _, _ -> Video("addon:exact:3:4", 3, 4) } ==
        StreamTargets.Media("series", "addon:exact:3:4", 3, 4))
    check(StreamTargets.details(Detail(Meta("series", "tt3"), Next(null, null, null,
        Progress("series", "tt3:1:2", 1, 2)))) { _, _, _ -> Video("tt3:1:2", 1, 2) } == StreamTargets.Media("series", "tt3:1:2", 1, 2))
    check(StreamTargets.details(Detail(null, null)) { _, _, _ -> error("No metadata") } == null)
    check(StreamTargets.details(Detail(Meta("series", "tt3"), Next(null, 1, 1, null))) { _, _, _ -> null } == null)
    println("PASS: movie/resume/next-up/detail targets, exact IDs, specials, Upcoming and incomplete targets")

    // A deterministic dispatcher makes queue ordering assertions independent of thread scheduling.
    val workerScope = CoroutineScope(SupervisorJob() + coroutineContext.minusKey(Job))
    try {
        var activeProfile: Any = 1
        val enabled = java.util.concurrent.ConcurrentHashMap<String, Boolean>()
        var playback = false
        val running = AtomicInteger()
        val maximum = AtomicInteger()
        val calls = java.util.Collections.synchronizedList(mutableListOf<String>())
        val gate = CompletableDeferred<Unit>()
        val queue = StreamPreloadQueue(workerScope, { activeProfile }, { enabled[it] == true }, { playback }, {
            calls.add(it.videoId)
            val count = running.incrementAndGet()
            maximum.updateAndGet { old -> maxOf(old, count) }
            try { gate.await(); true } finally { running.decrementAndGet() }
        })
        fun target(id: String, mode: String = "continue_watching", profile: Any = activeProfile) =
            StreamPreloadQueue.Target(mode, profile, "movie", id, null, null)
        suspend fun waitFor(condition: () -> Boolean) = withTimeout(3_000) {
            while (!condition()) delay(5)
        }
        queue.offer(target("disabled"))
        delay(30)
        check(calls.isEmpty())
        enabled["continue_watching"] = true
        enabled["details"] = true
        repeat(100) { queue.offer(target("one")) }
        waitFor { calls.size == 1 }
        queue.offer(target("two"))
        waitFor { calls.size == 2 }
        repeat(50) { queue.offer(target("queued-$it")) }
        queue.offer(target("detail-priority", "details"))
        gate.complete(Unit)
        waitFor { running.get() == 0 && calls.contains("detail-priority") }
        delay(50)
        check(maximum.get() == 2)
        check(calls.size <= 10)
        check(calls.count { it == "one" } == 1)
        check(calls.indexOf("detail-priority") == 2)
        queue.offer(target("one"))
        delay(30)
        check(calls.count { it == "one" } == 1)
        playback = true
        queue.offer(target("during-playback"))
        playback = false
        activeProfile = 2
        queue.offer(target("old-profile", profile = 1))
        delay(30)
        check("during-playback" !in calls && "old-profile" !in calls)
        queue.offer(target("one"))
        waitFor { calls.count { it == "one" } == 2 }
        println("PASS: default-off, recomposition deduplication, bounded queue/concurrency, detail priority, cooldown, playback and profile isolation")

        val stalled = AtomicInteger()
        val events = mutableListOf<String>()
        val timeoutQueue = StreamPreloadQueue(workerScope, { 2 }, { true }, { false }, {
            stalled.incrementAndGet()
            awaitCancellation()
        }, timeoutMs = 30, onEvent = { _, event, _ -> events.add(event) })
        repeat(4) { timeoutQueue.offer(target("timeout-$it")) }
        waitFor { stalled.get() == 4 }
        waitFor { events.count { it == "timeout" } == 4 }
        check(events.count { it == "started" } == 4)
        println("PASS: timed-out consumers release worker capacity")
    } finally { workerScope.cancel() }
}
