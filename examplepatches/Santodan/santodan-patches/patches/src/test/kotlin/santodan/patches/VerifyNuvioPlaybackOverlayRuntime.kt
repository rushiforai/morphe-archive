package santodan.patches

import kotlin.coroutines.Continuation
import kotlin.coroutines.CoroutineContext
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviomerged.NuvioLocalOverlay
import software.santodan.extension.nuviomerged.NuvioPlaybackJournal
import software.santodan.extension.nuviomerged.NuvioLocalWriteContinuation
import software.santodan.extension.nuviomerged.NuvioMergePolicy
import software.santodan.extension.nuviomerged.NuvioMergeWork

private data class Playback(val id: String, val ep: Int, val at: Long, val position: Long,
                            val threshold: Long = 90, val kind: String = "playback")
private class LocalDisk : NuvioPlaybackJournal.Storage<Playback> {
    val rows = mutableMapOf<String, MutableMap<NuvioLocalOverlay.Key, NuvioLocalOverlay.Entry<Playback>>>()
    val writes = mutableListOf<Pair<String, Int>>()
    override fun read(profile: String) = rows[profile]?.values?.toList().orEmpty()
    override fun write(profile: String, changed: Collection<NuvioLocalOverlay.Entry<Playback>>, removed: Set<NuvioLocalOverlay.Key>) {
        val map = rows.getOrPut(profile) { linkedMapOf() }
        removed.forEach(map::remove)
        changed.forEach { map[it.key] = it.copy(record = it.record?.copy()) }
        writes += profile to changed.size
    }
}
private fun engine() = NuvioLocalOverlay(object : NuvioLocalOverlay.Model<Playback> {
    override fun key(record: Playback) = if (record.id.startsWith("movie:")) NuvioLocalOverlay.key(record.id, "movie", null, null)
        else NuvioLocalOverlay.key(record.id, "series", 1, record.ep)
    override fun updated(record: Playback) = record.at
    override fun position(record: Playback) = record.position
    override fun completed(record: Playback) = record.position >= record.threshold
    override fun anchor(template: Playback, episode: Pair<Int, Int>) = template.copy(ep = episode.second, position = 100, kind = "membership-anchor")
})
private fun row(engine: NuvioLocalOverlay<Playback>, record: Playback, at: Long = record.at) =
    NuvioLocalOverlay.Entry(engine.model.key(record), NuvioLocalOverlay.Action.PLAY, record, at, "TRAKT")

private suspend fun immediateViews() = coroutineScope {
    val overlay = engine()
    val disk = LocalDisk()
    var now = 10_000L
    val journal = NuvioPlaybackJournal(overlay, disk)
    journal.load("p1")
    val baseline = listOf(Playback("show", 8, 100, 10), Playback("other-provider", 3, 200, 40))
    val seeds = listOf(Playback("show", 7, 100, 100), baseline[1])
    val history = mapOf("show" to (1..7).map { 1 to it }.toSet(), "foreign" to setOf(4 to 11))
    val aliases = mapOf("show" to setOf("tmdb:123"), "tmdb:123" to setOf("show"))
    val revisions = MutableStateFlow(0)
    val detail = async(start = CoroutineStart.UNDISPATCHED) {
        revisions.map {
            overlay.details(emptyMap(), "show", journal.entries("p1"), aliases)[1 to 8]
        }.first { it?.position == 35L }
    }
    val home = async(start = CoroutineStart.UNDISPATCHED) {
        revisions.map { overlay.progress(baseline, journal.entries("p1"), aliases) }
            .first { it.any { r -> r.id == "show" && r.position == 35L } }
    }
    val partial = Playback("show", 8, now, 35)
    journal.apply("p1", listOf(row(overlay, partial)))
    revisions.value++
    check(detail.await() === partial && home.await().single { it.id == "show" } === partial)
    check(home.await().any { it.id == "other-provider" })
    check(overlay.history(history, journal.entries("p1"), aliases) === history)
    check(disk.writes.last() == "p1" to 1) // One local entry, never the provider cache.

    now += 5000
    val completed = partial.copy(at = now, position = 89, threshold = 88)
    journal.apply("p1", listOf(row(overlay, completed)))
    val entries = journal.entries("p1")
    val watched = overlay.history(history, entries, aliases)
    check(1 to 8 in watched.getValue("show") && 1 to 8 in watched.getValue("tmdb:123"))
    check(watched["foreign"] === history["foreign"] && history.getValue("show").size == 7)
    check(overlay.progress(baseline, entries, aliases).none { it.id == "show" })
    check(overlay.details(emptyMap(), "show", entries, aliases)[1 to 8] === completed)
    val nextSeed = overlay.seeds(seeds, entries, watched, aliases).single { it.id == "show" }
    check(nextSeed === completed && nextSeed.ep == 8 && nextSeed.kind == "playback")
    // Pass episode 8 to native next-up. Feeding a synthetic episode 9 here would advance twice.
    check(nextSeed.ep + 1 == 9)
    journal.apply("p1", listOf(row(overlay, completed)))
    check(overlay.seeds(seeds, journal.entries("p1"), watched, aliases).count { it.id == "show" } == 1)

    now += 5000
    val rewatch = completed.copy(at = now, position = 12)
    journal.apply("p1", listOf(row(overlay, rewatch)))
    check(overlay.progress(baseline, journal.entries("p1"), aliases).single { it.id == "show" } === rewatch)
    check(1 to 8 in overlay.history(history, journal.entries("p1"), aliases).getValue("show"))
    check(overlay.details(emptyMap(), "show", journal.entries("p1"), aliases)[1 to 8] === rewatch)
    journal.apply("p1", listOf(NuvioLocalOverlay.Entry(overlay.model.key(rewatch.copy(ep = 7)),
        NuvioLocalOverlay.Action.UNWATCH, null, now + 1, "TRAKT")))
    check(overlay.progress(baseline, journal.entries("p1"), aliases).single { it.id == "show" } === rewatch)
    check(overlay.seeds(seeds, journal.entries("p1"), overlay.history(history, journal.entries("p1"), aliases), aliases)
        .single { it.id == "show" } === rewatch) { "Unmarking another episode regressed current playback" }
    val aliasUnmark = NuvioLocalOverlay.Entry<Playback>(NuvioLocalOverlay.key("tmdb:123", "series", 1, 8),
        NuvioLocalOverlay.Action.UNWATCH, null, now + 2, "TRAKT")
    val aliasRows = listOf(row(overlay, rewatch), aliasUnmark)
    check(overlay.progress(baseline, aliasRows, aliases).none { it.id == "show" })
    check(1 to 8 !in overlay.details(mapOf((1 to 8) to completed), "show", aliasRows, aliases))
    println("PASS: immediate detail/Home flows, native completion threshold, single next-up seed, rewatch and foreign history preservation")
}

private fun persistenceAndManualActions() {
    val overlay = engine()
    val disk = LocalDisk()
    var now = 100_000L
    val first = NuvioPlaybackJournal(overlay, disk)
    val completed = Playback("show", 8, now, 100)
    first.apply("p1", listOf(row(overlay, completed)))
    val other = Playback("different-profile", 3, now, 25)
    first.apply("p2", listOf(row(overlay, other)))
    val restart = NuvioPlaybackJournal(overlay, disk)
    restart.load("p1"); restart.load("p2")
    check(restart.entries("p1").single().record == completed)
    check(restart.entries("p2").single().record == other)
    check(overlay.progress(emptyList(), restart.entries("p2"), emptyMap()) == listOf(other))
    val watched = mapOf("show" to (1..8).map { 1 to it }.toSet(), "other" to setOf(2 to 10))
    now += 1000
    val unmark = NuvioLocalOverlay.Entry<Playback>(overlay.model.key(completed), NuvioLocalOverlay.Action.UNWATCH, null, now, "TRAKT")
    restart.apply("p1", listOf(unmark))
    val history = overlay.history(watched, restart.entries("p1"), emptyMap())
    check(1 to 8 !in history.getValue("show") && history["other"] == watched["other"])
    val details = overlay.details(mapOf((1 to 8) to completed.copy(kind = "read-only-detail")), "show", restart.entries("p1"), emptyMap())
    check(1 to 8 !in details)
    val anchor = overlay.seeds(listOf(completed), restart.entries("p1"), history, emptyMap()).single()
    check(anchor.ep == 7 && anchor.kind == "membership-anchor")
    check(overlay.progress(listOf(completed), restart.entries("p1"), emptyMap()).isEmpty())
    val restartAgain = NuvioPlaybackJournal(overlay, disk)
    restartAgain.load("p1")
    check(restartAgain.entries("p1").single().action == NuvioLocalOverlay.Action.UNWATCH)
    check(restartAgain.entries("p1").single().watched == false)
    now += 1000
    restartAgain.apply("p1", listOf(row(overlay, completed.copy(at = now))))
    check(1 to 8 in overlay.history(watched, restartAgain.entries("p1"), emptyMap()).getValue("show"))
    val snapshot = restartAgain.entries("p1").toList()
    restartAgain.apply("p2", listOf(row(overlay, other.copy(position = 50, at = now))))
    check(restartAgain.entries("p1").toList() == snapshot)
    val batch = (8..10).map { row(overlay, completed.copy(ep = it, at = now + 100)) }
    val batchHistory = overlay.history(watched, batch, emptyMap())
    check(overlay.seeds(listOf(completed), batch, batchHistory, emptyMap()).single().ep == 10)
    check(overlay.progress(emptyList(), batch, emptyMap()).isEmpty())
    println("PASS: incremental persistence/restart, profile isolation, manual watched/unwatched, native next-up anchor and no detail-to-resume leakage")
}

private fun staleSnapshotsAndExpiry() {
    val overlay = engine()
    val disk = LocalDisk()
    var now = 50_000L
    val journal = NuvioPlaybackJournal(overlay, disk)
    val record = Playback("show", 8, now, 40)
    journal.apply("p1", listOf(row(overlay, record)))
    check(!journal.reconcile("p1", "TRAKT", listOf(record.copy(at = 100, position = 100)), emptyList(), emptyMap(), emptyMap(), true, now + 1))
    check(!journal.reconcile("p1", "TRAKT", listOf(record.copy(at = now - 1, position = 100)), emptyList(), emptyMap(), emptyMap(), true, now + 1))
    check(!journal.reconcile("p1", "MDBLIST", listOf(record), emptyList(), emptyMap(), emptyMap(), true, now + 1))
    check(!journal.reconcile("p1", "TRAKT", listOf(record), emptyList(), emptyMap(), emptyMap(), true, now - 1))
    check(!journal.reconcile("p1", "TRAKT", listOf(record), emptyList(), emptyMap(), emptyMap(), true, now + 1,
        canRetire = { entry -> overlay.acknowledged(entry, "TRAKT", listOf(record.copy(at = 1, ep = 12)),
            emptyList(), emptyMap(), emptyMap(), true, now + 1) })) { "An old competing source erased newly acknowledged playback" }
    check(journal.reconcile("p1", "TRAKT", listOf(record), emptyList(), emptyMap(), emptyMap(), true, now + 1))
    check(journal.entries("p1").isEmpty())
    val completed = record.copy(at = now + 1000, position = 100)
    journal.apply("p1", listOf(row(overlay, completed)))
    val history = mapOf("show" to setOf(1 to 8))
    check(!journal.reconcile("p1", "TRAKT", emptyList(), listOf(completed.copy(at = 1)), history, emptyMap(), false, now + 2000))
    check(journal.reconcile("p1", "TRAKT", emptyList(), listOf(completed.copy(ep = 9, at = now + 2000)), history, emptyMap(), false, now + 2000))
    now += 3000
    journal.apply("p1", listOf(NuvioLocalOverlay.Entry(overlay.model.key(record), NuvioLocalOverlay.Action.UNWATCH, null, now, "TRAKT")))
    check(!journal.reconcile("p1", "TRAKT", emptyList(), emptyList(), emptyMap(), emptyMap(), false, now + 1))
    check(journal.reconcile("p1", "TRAKT", emptyList(), emptyList(), emptyMap(), emptyMap(), true, now + 1))
    journal.apply("p1", listOf(row(overlay, record.copy(at = now))))
    // An out-of-order native hydration must not replace the newer playback record.
    journal.apply("p1", listOf(row(overlay, record.copy(at = 100, position = 1), now + 2)))
    check(journal.entries("p1").single().record?.position == 40L)
    now += 30L * 24 * 60 * 60 * 1000
    val restart = NuvioPlaybackJournal(overlay, disk)
    restart.load("p1")
    check(restart.entries("p1").single().record?.position == 40L) { "Offline pending playback was silently expired" }
    check(!restart.reconcile("p1", "TRAKT", listOf(record.copy(at = 1)), emptyList(), emptyMap(), emptyMap(), true, now))
    check(restart.reconcile("p1", "TRAKT", listOf(record.copy(ep = 9, at = now)), emptyList(), emptyMap(), emptyMap(), true, now))
    check(restart.entries("p1").isEmpty() && disk.rows.getValue("p1").isEmpty())
    val rows = (0..10_000).map { row(overlay, record.copy(at = now + it)) }
    check(overlay.compact(rows).size == 1)
    val batch = (1..2050).map { row(overlay, record.copy(ep = it, at = now + 1, position = 100)) }
    restart.apply("bulk", batch)
    val bulkRestart = NuvioPlaybackJournal(overlay, disk)
    bulkRestart.load("bulk")
    check(bulkRestart.entries("bulk").size == 2050)
    check(overlay.history(emptyMap(), bulkRestart.entries("bulk"), emptyMap()).getValue("show").size == 2050)
    val movie = record.copy(id = "movie:1", at = now + 10, position = 100)
    restart.apply("movies", listOf(row(overlay, movie)))
    check(restart.reconcile("movies", "TRAKT", emptyList(), emptyList(), emptyMap(), emptyMap(), true, now + 20,
        watchedAt = mapOf(overlay.model.key(movie) to now + 11)))
    var published = false
    val broken = NuvioPlaybackJournal(overlay, object : NuvioPlaybackJournal.Storage<Playback> {
        override fun read(profile: String) = emptyList<NuvioLocalOverlay.Entry<Playback>>()
        override fun write(profile: String, changed: Collection<NuvioLocalOverlay.Entry<Playback>>, removed: Set<NuvioLocalOverlay.Key>) {
            check(published)
            throw java.io.IOException("optional journal disk failure")
        }
    })
    check(runCatching { broken.apply("p1", listOf(row(overlay, record))) { published = true } }.isFailure)
    check(published && broken.entries("p1").single().record == record)
    println("PASS: stale/foreign snapshots, in-flight write protection, destination acknowledgements/newer authority, offline retention and per-episode coalescing")
}

private fun continuationsAndTriggers() {
    var receipts = 0
    var completion: Result<Any?>? = null
    val context = CoroutineName("native-local-write")
    val receiver = object : Continuation<Any?> {
        override val context: CoroutineContext = context
        override fun resumeWith(result: Result<Any?>) { completion = result }
    }
    val inline = NuvioLocalWriteContinuation(receiver) { receipts++; Unit }
    check(inline.context === context)
    check(inline.inlineResult(Unit) === Unit && receipts == 1)
    inline.inlineResult(Unit)
    check(receipts == 1)
    val suspended = NuvioLocalWriteContinuation(receiver) { receipts++; Unit }
    val token = kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
    check(suspended.inlineResult(token) === token && receipts == 1)
    suspended.resumeWith(Result.success(Unit))
    check(receipts == 2 && completion?.isSuccess == true)
    val failed = NuvioLocalWriteContinuation(receiver) { receipts++; Unit }
    val error = IllegalStateException("native disk write failed")
    failed.resumeWith(Result.failure(error))
    check(receipts == 2 && completion?.exceptionOrNull() === error)
    val cancelled = NuvioLocalWriteContinuation(receiver) { receipts++; Unit }
    cancelled.resumeWith(Result.failure(CancellationException("native cancelled")))
    check(receipts == 2 && completion?.exceptionOrNull() is CancellationException)
    var persisted: Continuation<Any?>? = null
    completion = null
    val durable = NuvioLocalWriteContinuation(receiver) { done -> persisted = done; token }
    check(durable.inlineResult(Unit) === token && completion == null)
    persisted!!.resumeWith(Result.success(Unit))
    check(completion?.isSuccess == true)

    val requests = NuvioMergeWork.HomeRequests()
    check(requests.claim("p1", true, true))
    requests.finish("p1", true)
    repeat(20) {
        for (trigger in listOf(NuvioMergePolicy.ReadTrigger.PLAYBACK, NuvioMergePolicy.ReadTrigger.NAVIGATION,
            NuvioMergePolicy.ReadTrigger.PROVIDER_NOTIFICATION)) check(!NuvioMergePolicy.readsProviders(trigger))
        check(!requests.claim("p1", true, true))
    }
    check(requests.claim("p2", true, true))
    check(!requests.claim("p1", true, true))
    check(NuvioMergePolicy.readsProviders(NuvioMergePolicy.ReadTrigger.USER_SYNC))
    val explicit = NuvioMergeWork.ManualRequests()
    explicit.offer("p1"); check(explicit.take("p1"))
    val original = arrayListOf("TRAKT", "SIMKL", "MDBLIST")
    check(NuvioMergePolicy.scrobblers(original, false, "TRAKT") { it } === original)
    check(NuvioMergePolicy.scrobblers(original, true, "MDBLIST") { it } == listOf("MDBLIST"))
    println("PASS: synchronous/suspended native success, errors/cancellation, context, exactly-once callbacks, main-only writes and startup/menu-only provider reads")
}

private suspend fun nativeContextAfterPersistence() {
    java.util.concurrent.Executors.newSingleThreadExecutor { task -> Thread(task, "native-write-context") }
        .asCoroutineDispatcher().use { dispatcher ->
            withContext(dispatcher) {
                suspendCancellableCoroutine<Unit> { waiting ->
                    val native = object : Continuation<Any?> {
                        override val context = waiting.context
                        override fun resumeWith(result: Result<Any?>) {
                            check(Thread.currentThread().name == "native-write-context")
                            waiting.resumeWith(result.map { Unit })
                        }
                    }
                    val observer = NuvioLocalWriteContinuation(native) { durable ->
                        Thread({ durable.resumeWith(Result.success(Unit)) }, "overlay-disk-context").start()
                        kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
                    }
                    check(observer.inlineResult(Unit) === kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED)
                }
            }
        }
    println("PASS: native save resumes on its original dispatcher after asynchronous journal persistence")
}

fun main() = runBlocking {
    withTimeout(5000) { immediateViews() }
    persistenceAndManualActions()
    staleSnapshotsAndExpiry()
    continuationsAndTriggers()
    nativeContextAfterPersistence()
}
