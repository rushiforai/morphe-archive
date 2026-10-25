package santodan.patches

import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel
import software.santodan.extension.nuviostreams.engine.NextEpisodePreloader
import software.santodan.extension.nuviostreams.engine.StreamTargets

/** Latest-player scheduling regression: independent of historical obfuscated field fixtures. */
fun main() = runBlocking {
    val next = StreamTargets.Media("series", "tt1:1:2", 1, 2)
    var state = NextEpisodePreloader.Snapshot("profile1", "tt1:1:1", next, true, true)
    var time = 0L
    var permit: NextEpisodePreloader.Snapshot? = null
    val calls = mutableListOf<NextEpisodePreloader.Snapshot>()
    var blocked = false
    var fail = false
    var cancelled = 0
    val ticks = Channel<Unit>()
    val processed = Channel<Unit>(Channel.UNLIMITED)
    val worker = launch {
        NextEpisodePreloader({ state }, { permit = it }, {
            calls += it
            if (blocked) try { awaitCancellation() } finally { cancelled++ }
            !fail
        }, now = { time }, tick = { processed.send(Unit); ticks.receive() }).run()
    }
    suspend fun step(at: Long, value: NextEpisodePreloader.Snapshot = state) {
        time = at; state = value
        ticks.send(Unit); processed.receive(); yield()
    }
    try {
        processed.receive()
        step(29_999); check(calls.isEmpty())
        step(30_000); check(calls.size == 1)
        // Pause before the scheduler's next completion poll. Success must not be lost.
        step(30_001, state.copy(playing = false)); check(permit == null)
        step(40_000, state.copy(playing = true)); check(calls.size == 1)
        step(45_000, state.copy(playing = false))
        step(50_000, state.copy(playing = true)); check(calls.size == 1)
        step(90_000); check(calls.size == 1)
        step(90_001); check(calls.size == 2)
        step(90_002); check(permit == null)

        val episode2 = state.copy(currentVideoId = "tt1:1:2", next = StreamTargets.Media("series", "tt1:1:3", 1, 3))
        step(100_000, episode2)
        blocked = true
        step(130_000); check(calls.size == 3 && permit != null)
        step(130_001, episode2.copy(playing = false))
        check(cancelled == 1 && permit == null)
        step(130_002, episode2); check(calls.size == 3)
        step(145_000); check(calls.size == 3)
        blocked = false
        step(145_001); check(calls.size == 4)
        step(145_002)
        step(150_000, episode2.copy(profile = "profile2"))
        step(179_999); check(calls.size == 4)
        step(180_000); check(calls.size == 5 && calls.last().profile == "profile2")
        step(180_001)
        fail = true
        step(180_002, state.copy(next = StreamTargets.Media("series", "tt1:2:1", 2, 1)))
        check(calls.size == 6)
        step(180_003, state.copy(playing = false))
        step(180_004, state.copy(playing = true)); check(calls.size == 6)
        step(195_002); check(calls.size == 6)
        fail = false
        step(195_003); check(calls.size == 7)
        step(195_004)
        step(200_000, state.copy(enabled = false))
        step(200_001, state.copy(enabled = true))
        step(230_000); check(calls.size == 7)
        step(230_001); check(calls.size == 8)
    } finally { worker.cancelAndJoin() }
    check(permit == null)
    println("PASS: successful and failed cooldowns survive pause/buffering, completion-at-pause is retained, active searches cancel with backoff, and profile/target/enable changes invalidate correctly")
}
