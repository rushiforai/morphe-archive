package santodan.patches

import kotlin.coroutines.Continuation
import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import software.santodan.extension.nuviomerged.NuvioSourceContinuation
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviomerged.NuvioProviderRefresh
import software.santodan.extension.nuviomerged.NuvioMergeWork
import software.santodan.extension.nuviomerged.NuvioMergePolicy

enum class RefreshIntent { AUTOMATIC, USER_INITIATED }

class StartupReporterFixture {
    @JvmField val c = Any()
    @JvmField var f = false
    @JvmField val g = arrayListOf<() -> Unit>()
    fun report() = synchronized(c) {
        f = true
        g.toList().forEach { it() }
        g.clear()
    }
}
class StartupActivityFixture {
    val reporter = StartupReporterFixture()
    fun getFullyDrawnReporter() = reporter
}

class RefreshFixture {
    val seeds = MutableStateFlow<Any?>("episode 8")
    val progress = MutableStateFlow<Any?>("cached progress")
    val watched = MutableStateFlow<Any?>("cached history")
    var completion: Continuation<Any?>? = null
    var intent: RefreshIntent? = null
    fun v(value: RefreshIntent, continuation: NuvioSourceContinuation): Any {
        intent = value
        completion = continuation
        return COROUTINE_SUSPENDED
    }
    fun q(): Flow<Any?> = progress
    fun f(): Flow<Any?> = seeds
    fun d(): Flow<Any?> = watched
}

class ReadyFixture {
    val loaded = MutableStateFlow(false)
    val progress = MutableStateFlow(emptyList<String>())
    fun p(): Flow<Boolean> = loaded
}

class ProgressOnlyFixture {
    val progress = MutableStateFlow<Any?>("cached episode")
    val seeds = MutableStateFlow<Any?>("cached seed")
    val loaded = MutableStateFlow(false)
    fun q(): Flow<Any?> = progress
    fun f(): Flow<Any?> = seeds
    fun p(): Flow<Boolean> = loaded
    fun d(): Flow<Any?> = error("Live updates must not collect full watched models")
}

private fun verifyEpisodeProjection() {
    val projection = NuvioMergeWork.EpisodeProjection<String>()
    var builds = 0
    fun completed(key: Pair<Int, Int>): String { builds++; return "completed $key" }
    val watched = setOf(1 to 1, 1 to 2)
    val first = projection.snapshot(watched, emptyMap(), ::completed)
    check(first.keys == watched && builds == 2)
    check(projection.snapshot(watched.toSet(), emptyMap(), ::completed) === first)
    val playing = projection.snapshot(watched, mapOf((1 to 3) to "playing"), ::completed)
    check(playing[1 to 1] == first[1 to 1] && playing[1 to 3] == "playing" && builds == 2)
    val unmarked = projection.snapshot(setOf(1 to 2), emptyMap(), ::completed)
    check(1 to 1 !in unmarked && builds == 3)
    check(projection.snapshot(emptySet(), emptyMap(), ::completed).isEmpty())
    check(first.keys == watched) // Published snapshots remain immutable across profile/history changes.
    println("PASS: cached episode markers, live progress, unmarks and bounded materialization")
}

private suspend fun verifyHomePipelineGate() = coroutineScope {
        val homeGate = NuvioMergeWork.HomePipelineGate()
        val home = Any()
        val cards = MutableStateFlow(listOf("cached card"))
        val metadataStarted = CompletableDeferred<Unit>()
        var metadataStopped = false
        val homeJob = launch {
            coroutineScope {
                launch {
                    try { metadataStarted.complete(Unit); awaitCancellation() }
                    finally { metadataStopped = true }
                }
                awaitCancellation()
            }
        }
        metadataStarted.await()
        check(homeGate.pause(home, homeJob))
        homeJob.join()
        check(metadataStopped && cards.value == listOf("cached card"))
        check(homeGate.resume(home))
        check(!homeGate.resume(home)) { "Repeated Home navigation restarted the pipeline twice" }
        check(!homeGate.pause(home, homeJob)) { "Already-cancelled native pipeline was claimed" }
        check(!homeGate.resume(home))
        val oldProfile = launch { awaitCancellation() }
        yield()
        check(homeGate.pause(home, oldProfile))
        oldProfile.join()
        check(!homeGate.resume(Any())) { "Different profile restarted a stale Home pipeline" }
        println("PASS: native Home pipeline pause cancels metadata children, preserves cards and resumes once for its owner")
}

fun main() = runBlocking {
    verifyEpisodeProjection()
    withTimeout(5_000) {
        verifyHomePipelineGate()
        val localWork = NuvioMergeWork.LocalChanges()
        check(localWork.claim())
        repeat(3) { check(!localWork.claim()) { "Tracker-only changes replayed local startup work" } }
        localWork.changed(); localWork.changed()
        check(localWork.claim())
        check(!localWork.claim()) { "Duplicate playback notifications scheduled duplicate local work" }
        localWork.changed() // An interrupted local pass returns its claim for retry.
        check(localWork.claim())
        println("PASS: local playback work is coalesced, independent of provider notifications and retryable")
        val lightProvider = ProgressOnlyFixture()
        val lightUpdates = kotlinx.coroutines.channels.Channel<Unit>(kotlinx.coroutines.channels.Channel.UNLIMITED)
        val lightObserver = launch {
            NuvioProviderRefresh.observeProgress(lightProvider, "q", "p") { lightUpdates.trySend(Unit) }
        }
        yield(); yield()
        check(lightUpdates.tryReceive().isFailure)
        lightProvider.loaded.value = true
        lightUpdates.receive()
        lightProvider.seeds.value = "episode 12"
        lightUpdates.receive()
        lightObserver.cancelAndJoin()
        val preserved = MutableStateFlow<List<Any>>(listOf("saved progress", "saved seed"))
        var historyWrites = 0
        check(!NuvioMergeWork.commit({ it() }, { NuvioMergeWork.canPublishProviders(0, 3, false) }) {
            preserved.value = emptyList(); historyWrites++
        })
        check(preserved.value.size == 2 && historyWrites == 0) { "All unavailable providers erased or rewrote cache" }
        check(NuvioMergeWork.canPublishProviders(1, 2, false))
        check(NuvioMergeWork.canPublishProviders(0, 0, false)) { "A valid empty selection could not clear removed entries" }
        check(NuvioMergeWork.canPublishProviders(0, 3, true))
        println("PASS: live observers avoid full watched models; cold readiness triggers updates; all unavailable providers preserve cache without writes")
        val visited = mutableListOf<String>()
        val successful = mutableListOf<String>()
        for (source in listOf("Trakt", "Simkl", "MDBList")) {
            val result = NuvioMergeWork.providerResult(source, 25) {
                visited.add(source)
                if (source == "Trakt") awaitCancellation()
                source
            }
            result.getOrNull()?.let(successful::add)
        }
        check(visited == listOf("Trakt", "Simkl", "MDBList"))
        check(successful == listOf("Simkl", "MDBList")) { "Trakt timeout prevented other services from syncing" }
        check(NuvioMergeWork.providerResult("Trakt") { error("history unavailable") }.isFailure)
        check(NuvioMergeWork.providerResult("Trakt") { throw CancellationException("native child fetch cancelled") }.isFailure)
        check(withTimeoutOrNull(25) {
            NuvioMergeWork.providerResult("Trakt") { awaitCancellation() }
            error("Parent cancellation was swallowed")
        } == null)
        data class Saved(val show: String, val source: String)
        val saved = listOf(Saved("trakt-only", "Trakt"), Saved("overlap", "Trakt"), Saved("removed", "Simkl"))
        val retained = NuvioMergeWork.unavailableEntries(saved, setOf("overlap"), setOf("Trakt"), { it.show }, { it.source })
        check(retained == listOf(Saved("trakt-only", "Trakt"))) {
            "Failure erased exclusive cached progress, overrode fresh progress or prevented successful-source removals"
        }
        check(NuvioMergeWork.unavailableEntries(saved, emptySet(), emptySet(), { it.show }, { it.source }).isEmpty())
        println("PASS: failed provider isolation, successful service continuation, cancellation and scoped cache retention")
        var canonicalHistoryLoaded = false
        val historyGate = async(start = CoroutineStart.UNDISPATCHED) {
            NuvioProviderRefresh.historyReady { canonicalHistoryLoaded }
            emptyMap<String, Set<Pair<Int, Int>>>()
        }
        check(!historyGate.isCompleted) { "Playback readiness accepted incomplete canonical history" }
        canonicalHistoryLoaded = true
        check(historyGate.await().isEmpty()) { "A valid loaded empty account was rejected" }
        check(withTimeoutOrNull(30) { NuvioProviderRefresh.historyReady { false }; true } == null)
        check(!NuvioMergeWork.retainPlayback(10, true, 20)) { "Old paused session resurrected a watched episode" }
        check(!NuvioMergeWork.retainPlayback(20, true, 20))
        check(NuvioMergeWork.retainPlayback(30, true, 20)) { "Newer intentional rewatch was removed" }
        check(NuvioMergeWork.retainPlayback(10, false, 20))
        check(NuvioMergeWork.retainPlayback(10, true, null))
        println("PASS: canonical history readiness, valid empty accounts, stale paused-session removal and newer rewatches")
        val waitingProvider = RefreshFixture()
        var publishedEpisode = 8
        val stalled = runCatching {
            NuvioMergeWork.provider("Trakt", 30) {
                NuvioProviderRefresh.await(waitingProvider, "v", true)
                publishedEpisode = 12
            }
        }
        check(stalled.exceptionOrNull() is IllegalStateException)
        check(stalled.exceptionOrNull()!!.message!!.contains("Trakt"))
        check(publishedEpisode == 8) { "Stalled provider replaced the saved snapshot" }
        waitingProvider.completion!!.resumeWith(Result.success(Unit))
        yield()
        check(publishedEpisode == 8) { "Timed-out continuation published a late result" }
        val cancelled = launch(start = CoroutineStart.UNDISPATCHED) {
            NuvioMergeWork.provider("Trakt") {
                NuvioProviderRefresh.await(waitingProvider, "v")
                publishedEpisode = 12
            }
        }
        cancelled.cancelAndJoin()
        waitingProvider.completion!!.resumeWith(Result.success(Unit))
        check(publishedEpisode == 8)
        check(NuvioMergeWork.provider("Trakt") { 12 } == 12) { "Cancelled sync prevented retry" }
        check(withTimeoutOrNull(20) { NuvioMergeWork.provider("Trakt") { awaitCancellation() } } == null) {
            "Provider deadline swallowed parent cancellation"
        }
        val pendingManual = NuvioMergeWork.ManualRequests()
        pendingManual.offer("p1"); pendingManual.clear()
        check(!pendingManual.take("p1")) { "Cancelled sync restarted a queued manual request" }
        println("PASS: provider deadline and user cancellation retain cache, ignore late completion and allow retry")
        data class CachedProgress(val id: String, val at: Long, val done: Boolean = false)
        val cachedProgress = listOf(CachedProgress("keep", 10), CachedProgress("update", 10), CachedProgress("finish", 10))
        fun quick(local: List<CachedProgress>) = NuvioMergeWork.quickProgress(cachedProgress, local, 20,
            { it.id }, { it.at }, { it.done })
        check(quick(emptyList()).toSet() == cachedProgress.toSet()) { "Empty local progress cleared cached remote entries" }
        val quickResult = quick(listOf(CachedProgress("update", 30), CachedProgress("finish", 31, true),
            CachedProgress("new", 32), CachedProgress("stale", 5)))
        check(quickResult.map { it.id } == listOf("new", "update", "keep"))
        check(quickResult.single { it.id == "update" }.at == 30L)
        check(quick(listOf(CachedProgress("finish", 40, true), CachedProgress("finish", 30)))
            .none { it.id == "finish" }) { "An older duplicate resurrected a completed episode" }
        val cold = ReadyFixture()
        val hydratedProvider = async(start = CoroutineStart.UNDISPATCHED) {
            NuvioProviderRefresh.ready(cold, "p")
            cold.progress.first()
        }
        check(!hydratedProvider.isCompleted) { "Unready empty provider was published" }
        cold.progress.value = listOf("restored tracker entry")
        cold.loaded.value = true
        check(hydratedProvider.await() == listOf("restored tracker entry"))
        cold.progress.value = emptyList()
        NuvioProviderRefresh.ready(cold, "p")
        check(cold.progress.first().isEmpty()) { "Ready empty provider could not remove completed/removed entries" }
        println("PASS: quick sync preserves remote entries, applies newer local playback, and full sync awaits provider readiness before accepting empty lists")
        val homeRequests = NuvioMergeWork.HomeRequests()
        check(!homeRequests.claim("p1", false, true)) { "Sync started before Home presentation" }
        check(!homeRequests.claim("p1", true, false)) { "Sync started outside Home" }
        check(homeRequests.claim("p1", true, true))
        check(!homeRequests.claim("p1", true, true)) { "Repeated Home callback duplicated sync" }
        homeRequests.finish("p1", true)
        check(!homeRequests.claim("p1", true, false))
        check(homeRequests.claim("p1", true, true)) { "Interrupted sync did not retry on Home" }
        homeRequests.finish("p1", false)
        check(!homeRequests.claim("p1", true, true)) { "Completed/failed sync restarted on every Home entry" }
        check(homeRequests.claim("p2", true, true)) { "New profile did not get its own sync" }
        homeRequests.finish("p1", false)
        check(!homeRequests.claim("p2", true, true)) { "Old-profile completion changed the new request" }
        homeRequests.finish("p2", false)
        homeRequests.reset()
        check(homeRequests.claim("p2", true, true)) { "Settings changes could not request a new sync" }
        val fullSyncGate = NuvioMergePolicy().apply { navigate("home") }
        val fullSyncRevision = fullSyncGate.revision()
        fullSyncGate.navigate("detail/test")
        check(fullSyncGate.current(fullSyncRevision, true)) { "Button-style sync stopped during normal browsing" }
        check(!fullSyncGate.current(fullSyncRevision, false))
        fullSyncGate.navigate("player/test")
        check(!fullSyncGate.current(fullSyncRevision, true))
        fullSyncGate.navigate("home"); fullSyncGate.foreground(false)
        check(!fullSyncGate.current(fullSyncRevision, true))
        println("PASS: post-Home sync starts once, retries interruptions, isolates profiles, and uses the button-style browsing/playback gate")
        // The cache-hit branch uses already cached metadata; a miss launches a bulk fetch.
        var bulkFetches = 0
        fun validate(nativeHit: Boolean, enabled: Boolean, ready: Boolean, playback: Boolean, retry: Boolean) {
            if (!NuvioProviderRefresh.badgeCacheHit(nativeHit, enabled, ready, playback, retry)) bulkFetches++
        }
        validate(false, true, false, false, false)
        validate(false, true, false, true, true)
        validate(false, true, true, true, true)
        check(bulkFetches == 0) { "Startup projection or playback launched bulk badge metadata loading" }
        validate(true, true, true, false, true)
        check(bulkFetches == 1) { "Completed history could not retry deferred metadata" }
        validate(true, true, true, false, false)
        validate(false, false, false, true, true)
        check(bulkFetches == 2) { "Disabled merging changed native cache behavior" }
        val requests = NuvioMergeWork.ManualRequests()
        requests.offer("profile1"); requests.offer("profile1")
        check(requests.take("profile1") && !requests.take("profile1"))
        requests.offer("profile1")
        check(!requests.take("profile2") && !requests.take("profile1"))
        check(NuvioMergeWork.stages({ true }, preparationMs = 100, refreshMs = 100,
            prepare = { delay(60) }, refresh = { delay(60); "fresh" }) == "fresh")
        var refreshedAfterTimeout = false
        check(runCatching {
            NuvioMergeWork.stages({ true }, preparationMs = 10, refreshMs = 100,
                prepare = { delay(100) }, refresh = { refreshedAfterTimeout = true })
        }.exceptionOrNull() is TimeoutCancellationException && !refreshedAfterTimeout)
        val mergeGate = NuvioMergePolicy().apply { navigate("home") }
        var profile = 1
        var heavyWorkStarted = false
        val queued = launch {
            NuvioMergeWork.run({ mergeGate.allowed(false) }, 100) { heavyWorkStarted = true }
        }
        yield()
        mergeGate.navigate("player/test")
        queued.join()
        check(queued.isCancelled && !heavyWorkStarted)
        mergeGate.navigate("home")
        for (stop in listOf<() -> Unit>({ mergeGate.navigate("stream/test") },
            { mergeGate.navigate("player/test") }, { mergeGate.foreground(false) }, { profile = 2 })) {
            mergeGate.foreground(true); mergeGate.navigate("home"); profile = 1
            val revision = mergeGate.revision()
            var decoded = 0
            var published = false
            val interrupted = launch(start = CoroutineStart.UNDISPATCHED) {
                NuvioMergeWork.run({ mergeGate.current(revision, false) && profile == 1 }) { checkpoint ->
                    repeat(10_000) {
                        checkpoint()
                        if (++decoded == 3) stop()
                    }
                    published = true
                }
            }
            interrupted.join()
            check(interrupted.isCancelled && decoded == 3 && !published)
        }
        var checkpoint: (() -> Unit)? = null
        val held = launch(start = CoroutineStart.UNDISPATCHED) {
            NuvioMergeWork.run({ true }) { check -> checkpoint = check; awaitCancellation() }
        }
        held.cancelAndJoin()
        check(runCatching { checkpoint!!() }.exceptionOrNull() is CancellationException)
        var queuedCommit: (() -> Unit)? = null
        var committed = false
        val cancelledCommit = launch(start = CoroutineStart.UNDISPATCHED) {
            NuvioMergeWork.commit({ queuedCommit = it }, { true }) { committed = true }
        }
        cancelledCommit.cancelAndJoin()
        queuedCommit!!()
        check(!committed)
        check(!NuvioMergeWork.commit({ it() }, { false }) { committed = true })
        check(!committed)
        check(NuvioMergeWork.commit({ it() }, { true }) { committed = true } && committed)
        mergeGate.foreground(true); mergeGate.navigate("home")
        check(NuvioMergeWork.run({ mergeGate.allowed(false) }) { check -> check(); "restored" } == "restored")
        println("PASS: merge hydration settles before starting, stops CPU work on stream/player navigation, backgrounding, profile change and Job cancellation, and retries on Home")

        fun launchDocument(xml: String) = javax.xml.parsers.DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
        }.newDocumentBuilder().parse(java.io.ByteArrayInputStream(xml.toByteArray()))
        val launchBackground = launchDocument("""<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle"><solid android:color="@color/splash_background"/></shape>""")
        addNuvioLaunchLogo(launchBackground)
        check(launchBackground.documentElement.tagName == "layer-list")
        check(launchBackground.getElementsByTagName("solid").length == 1)
        check(launchBackground.getElementsByTagName("gradient").length == 2)
        val logoLayer = launchBackground.getElementsByTagName("item").item(3) as org.w3c.dom.Element
        check(logoLayer.getAttribute("android:height") == "48dp" && logoLayer.getAttribute("android:gravity") == "center")
        val logoBitmap = launchBackground.getElementsByTagName("bitmap").item(0) as org.w3c.dom.Element
        check(logoBitmap.getAttribute("android:src") == "@drawable/app_logo_wordmark")
        check(runCatching { addNuvioLaunchLogo(launchBackground) }.isFailure)
        val invalidBackground = launchDocument("""<shape xmlns:android="http://schemas.android.com/apk/res/android"><solid android:color="#ffffff"/></shape>""")
        check(runCatching { addNuvioLaunchLogo(invalidBackground) }.isFailure)
        println("PASS: launch logo preserves native background, centers native artwork and rejects changed/already-patched resources")

        val iconNames = listOf("AppIconDefault", "AppIconArcticBlue", "AppIconEmerald", "AppIconRoseGold", "AppIconCopper", "AppIconGraphite")
        fun manifest() = launchDocument("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.nuvio.tv"><application><activity android:name=".MainActivity" android:theme="@style/Theme.MyApplication.Launcher" android:configChanges="orientation|screenSize"><intent-filter><action android:name="android.intent.action.VIEW"/></intent-filter></activity>${iconNames.joinToString("") { """<activity android:name="com.nuvio.tv.launcher.$it" android:enabled="${it == "AppIconDefault"}" android:icon="@mipmap/$it" android:launchMode="singleTop"><intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LEANBACK_LAUNCHER"/></intent-filter></activity>""" }}</application></manifest>""")
        val startupManifest = manifest()
        configureNuvioStartupManifest(startupManifest)
        val activities = startupManifest.getElementsByTagName("activity")
        check(activities.length == 2)
        val early = activities.item(0) as org.w3c.dom.Element
        check(early.getAttribute("android:name") == NUVIO_STARTUP_ACTIVITY && early.getAttribute("android:exported") == "false")
        check(early.getAttribute("android:noHistory") == "true")
        check((activities.item(1) as org.w3c.dom.Element).getAttribute("android:name") == ".MainActivity")
        check(startupManifest.getElementsByTagName("action").length == 7) // Native deep link preserved.
        val aliases = startupManifest.getElementsByTagName("activity-alias")
        for (i in 0 until aliases.length) {
            val alias = aliases.item(i) as org.w3c.dom.Element
            check(alias.getAttribute("android:targetActivity") == NUVIO_STARTUP_ACTIVITY)
            check(alias.getAttribute("android:enabled") == (i == 0).toString())
            check(alias.getAttribute("android:name") == "com.nuvio.tv.launcher.${iconNames[i]}")
            check(alias.getAttribute("android:icon") == "@mipmap/${iconNames[i]}")
            check(!alias.hasAttribute("android:launchMode"))
        }
        check(runCatching { configureNuvioStartupManifest(startupManifest) }.isFailure)
        val changedManifest = manifest()
        (changedManifest.getElementsByTagName("activity").item(1) as org.w3c.dom.Element).setAttribute("android:name", ".Unexpected")
        check(runCatching { configureNuvioStartupManifest(changedManifest) }.isFailure)

        val startupGate = software.santodan.extension.nuviomerged.NuvioStartupGate()
        startupGate.resumed(true)
        startupGate.drawn()
        check(!startupGate.takeHandoff())
        startupGate.prepared()
        check(!startupGate.takeHandoff()) // An old/default frame cannot release native startup.
        startupGate.drawn()
        startupGate.resumed(false)
        check(!startupGate.takeHandoff())
        startupGate.resumed(true)
        check(startupGate.takeHandoff() && !startupGate.takeHandoff())
        val destroyedGate = software.santodan.extension.nuviomerged.NuvioStartupGate()
        destroyedGate.resumed(true); destroyedGate.prepared(); destroyedGate.drawn(); destroyedGate.destroyed()
        check(!destroyedGate.takeHandoff())
        println("PASS: early splash aliases preserve icon state/deep links; native handoff waits for prepared frame and resume, and runs once")

        val legacyStorage = mutableMapOf<String, Any>(
            "enabled" to true,
            "snapshot_v2_1_main" to "MDBLIST",
            "snapshot_v2_1_last_sync" to "Sync complete",
            "snapshot_v2_1_services" to setOf("MDBLIST"),
            "snapshot_v2_1" to "{\"progress\":[]}",
            "snapshot_v2_2" to "{\"progress\":[1]}"
        )
        val historyStorage = mutableMapOf<String, String>()
        var removals = 0
        check(!NuvioProviderRefresh.migrateSnapshots(legacyStorage, historyStorage::containsKey,
            { false }, { removals++; true }))
        check(removals == 0 && "snapshot_v2_1" in legacyStorage)
        // A failed cleanup leaves both copies intact. Retry must preserve newer
        // history and keep all settings, summaries and other profile choices.
        check(!NuvioProviderRefresh.migrateSnapshots(legacyStorage, historyStorage::containsKey,
            { historyStorage.putAll(it); true }, { false }))
        check(historyStorage.size == 2 && "snapshot_v2_2" in legacyStorage)
        historyStorage["snapshot_v2_1"] = "{\"progress\":[\"newer\"]}"
        var durableWrites = 0
        check(NuvioProviderRefresh.migrateSnapshots(legacyStorage, historyStorage::containsKey,
            { check(it.isEmpty()); durableWrites++; true }, { keys ->
                keys.forEach(legacyStorage::remove)
                true
            }))
        check(durableWrites == 1 && historyStorage.getValue("snapshot_v2_1").contains("newer"))
        check(legacyStorage.size == 4 && legacyStorage["enabled"] == true)
        check(NuvioProviderRefresh.migrateSnapshots(legacyStorage, { error("Settings-only storage must not open history") },
            { error("Settings-only storage must not load history") }, { error("Unexpected cleanup") }))
        println("PASS: history moves out of settings across profiles; failed writes preserve cache and retries retain newer history")

        val activity = StartupActivityFixture()
        var historyLoads = 0
        var refreshes = 0
        NuvioProviderRefresh.afterPresentation(activity) { historyLoads++; refreshes++ }
        check(historyLoads == 0 && refreshes == 0)
        // Cache readers work independently while expensive startup work is gated.
        val lightweight = MutableStateFlow<List<Any>>(listOf("cached CW"))
        check(NuvioProviderRefresh.hydratedSnapshot(lightweight) {}.first() == listOf("cached CW"))
        check(historyLoads == 0 && refreshes == 0)
        activity.reporter.report()
        check(historyLoads == 1 && refreshes == 1)
        activity.reporter.report()
        check(historyLoads == 1 && refreshes == 1)
        NuvioProviderRefresh.afterPresentation(activity) { refreshes++ }
        check(refreshes == 2) // Already-drawn activities release immediately.
        val otherActivity = StartupActivityFixture()
        NuvioProviderRefresh.afterPresentation(otherActivity) { historyLoads++ }
        check(historyLoads == 1)
        println("PASS: cached CW is available before Home presentation; deferred work waits for the owning reporter")

        // Cold startup must restore disk data before the first publication.
        // A refresh retains that list until its complete replacement is ready.
        val cached = listOf<Any>("unchanged", "old progress", "removed")
        val snapshot = MutableStateFlow<List<Any>>(emptyList())
        val hydrated = CompletableDeferred<Unit>()
        val publications = mutableListOf<List<Any>>()
        val reader = launch(start = CoroutineStart.UNDISPATCHED) {
            var savedMembershipReady = false
            NuvioProviderRefresh.hydratedSnapshot(snapshot) {
                hydrated.await()
                savedMembershipReady = true
                snapshot.value = cached
            }.collect {
                check(savedMembershipReady) { "Saved seeds reached Home before their watched membership" }
                publications.add(it)
            }
        }
        yield()
        check(publications.isEmpty()) { "Published empty startup snapshot before restoration" }
        hydrated.complete(Unit)
        yield()
        check(publications == listOf(cached))
        // Failed/cancelled refreshes make no publication; successful refreshes
        // preserve unchanged entries and apply updates, additions and removals.
        yield()
        check(publications.last() == cached)
        val refreshed = listOf<Any>("unchanged", "new progress", "added")
        snapshot.value = refreshed
        yield()
        check(publications == listOf(cached, refreshed))
        snapshot.value = refreshed.toList()
        yield()
        check(publications.size == 2) { "Unchanged refresh republished the snapshot" }
        reader.cancelAndJoin()
        val blocked = CompletableDeferred<Unit>()
        val cancelledReader = launch(start = CoroutineStart.UNDISPATCHED) {
            NuvioProviderRefresh.hydratedSnapshot(snapshot) { blocked.await() }
                .collect { error("Cancelled restoration published data") }
        }
        cancelledReader.cancelAndJoin()
        val empty = MutableStateFlow<List<Any>>(emptyList())
        check(NuvioProviderRefresh.hydratedSnapshot(empty) {}.first().isEmpty())
        println("PASS: cache hydration precedes publication and refresh preserves entries")

        // MDBList progress/seed flows run ensureLoaded/refreshAsync on collection.
        // A complete but empty snapshot is valid, especially without Nuvio Sync.
        for ((ready, allowNative) in listOf(true to false, false to false, true to true)) {
            val snapshot = MutableStateFlow<List<Any>>(emptyList())
            var nativeReads = 0
            val networkBacked = flow<Any?> {
                nativeReads++
                awaitCancellation()
            }
            val result = NuvioProviderRefresh.retainedSnapshot(networkBacked, snapshot,
                MutableStateFlow(ready)) { allowNative }.first()
            check(result.isEmpty() && nativeReads == 0) {
                "Playback resume collected a native refresh flow for an empty snapshot (ready=$ready, nativeReads=$nativeReads)"
            }
        }
        val emptySnapshot = MutableStateFlow<List<Any>>(emptyList())
        val snapshotReady = MutableStateFlow(true)
        val snapshotValues = kotlinx.coroutines.channels.Channel<List<Any>>(kotlinx.coroutines.channels.Channel.UNLIMITED)
        val snapshotReader = launch {
            NuvioProviderRefresh.retainedSnapshot(flow { error("Unexpected native refresh") }, emptySnapshot,
                snapshotReady) { false }.collect { snapshotValues.send(it) }
        }
        check(snapshotValues.receive().isEmpty())
        emptySnapshot.value = listOf("episode 7")
        check(snapshotValues.receive() == listOf("episode 7")) { "Snapshot reader stopped observing Home sync publication" }
        snapshotReader.cancelAndJoin()

        val startupNative = MutableStateFlow<Any?>(emptyList<Any>())
        val startup = async {
            NuvioProviderRefresh.retainedSnapshot(startupNative, MutableStateFlow(emptyList()),
                MutableStateFlow(false)) { true }.first()
        }
        yield(); yield()
        check(!startup.isCompleted) { "Startup fallback forwarded the provider's temporary empty value" }
        startupNative.value = listOf("cached episode")
        check(startup.await() == listOf("cached episode")) { "Home startup lost the cached native fallback" }
        println("PASS: empty completed snapshots and playback resume never collect refresh-on-start flows; Home startup fallback and live snapshot updates retained")
        for (method in listOf("v")) {
            val provider = RefreshFixture()
            val refresh = async(start = CoroutineStart.UNDISPATCHED) {
                NuvioProviderRefresh.await(provider, method)
                provider.seeds.first()
            }
            check(!refresh.isCompleted && provider.intent == RefreshIntent.AUTOMATIC)
            provider.seeds.value = "episode 20"
            provider.completion!!.resumeWith(Result.success(Unit))
            val manualRefresh = async(start = CoroutineStart.UNDISPATCHED) {
                NuvioProviderRefresh.await(provider, method, true)
            }
            check(provider.intent == RefreshIntent.USER_INITIATED)
            provider.completion!!.resumeWith(Result.success(Unit))
            manualRefresh.await()
            check(refresh.await() == "episode 20") { "Refresh sampled stale cached seeds" }

            val failed = async {
                runCatching { NuvioProviderRefresh.await(provider, method) }
            }
            yield()
            provider.completion!!.resumeWith(Result.failure(IllegalStateException("remote failure")))
            check(failed.await().isFailure) { "Failed synchronization appeared successful" }
            check(withTimeoutOrNull(50) {
                NuvioProviderRefresh.await(provider, method)
                true
            } == null) { "Stalled refresh ignored cancellation" }
            provider.completion!!.resumeWith(Result.success(Unit))
        }

        val provider = RefreshFixture()
        val changed = kotlinx.coroutines.channels.Channel<Unit>(kotlinx.coroutines.channels.Channel.UNLIMITED)
        val observer = launch { NuvioProviderRefresh.observe(provider, listOf("q", "f", "d")) { changed.trySend(Unit) } }
        yield(); yield()
        check(changed.tryReceive().isFailure) { "Initial cached emissions caused a refresh loop" }
        for (flow in listOf(provider.progress, provider.seeds, provider.watched)) {
            flow.value = "remote update"
            changed.receive()
            flow.value = "remote update"
            yield()
            check(changed.tryReceive().isFailure) { "Unchanged values caused a refresh loop" }
        }
        observer.cancelAndJoin()

        val revisions = MutableStateFlow(0L)
        val carrier = MutableStateFlow<Any?>("unwatched on carrier")
        val winner = MutableStateFlow<Any?>("watched on winner")
        var selected = carrier
        val values = kotlinx.coroutines.channels.Channel<Any?>(kotlinx.coroutines.channels.Channel.UNLIMITED)
        val collector = launch { NuvioProviderRefresh.route(revisions) { selected }.collect { values.send(it) } }
        check(values.receive() == "unwatched on carrier")
        selected = winner
        revisions.value++
        check(values.receive() == "watched on winner") { "Open detail collector stayed on the carrier" }
        carrier.value = "stale carrier update"
        winner.value = "new watched history"
        check(values.receive() == "new watched history")
        collector.cancelAndJoin()
    }
    println("PASS: awaited refresh, failure propagation, delayed provider updates, duplicate suppression and live detail rerouting")
}
