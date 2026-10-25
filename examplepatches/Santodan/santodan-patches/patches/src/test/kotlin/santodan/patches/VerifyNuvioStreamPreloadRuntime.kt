package santodan.patches

import android.app.ActivityThread
import android.util.Log
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicInteger
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviostreams.NuvioStreamPreload

private class RuntimeProfile { @JvmField val f = MutableStateFlow(1) }
private class RuntimeProvider(private val value: Any) { fun get(): Any = value }
private class RuntimeComponent(profile: RuntimeProfile, repository: RuntimeRepository) {
    @JvmField val B = RuntimeProvider(profile)
    @JvmField val e3 = RuntimeProvider(repository)
}
private class RuntimeProgress(val contentType: String, val videoId: String, val season: Int?, val episode: Int?)
private class RuntimeCard(@JvmField val x: RuntimeProgress, @JvmField val y: Any? = null)
private typealias RuntimeMeta = com.nuvio.tv.domain.model.Meta
private typealias RuntimeNext = com.nuvio.tv.domain.model.NextToWatch
private class RuntimeState(@JvmField val b: RuntimeMeta?, @JvmField val h: RuntimeNext?, @JvmField val f: List<Any> = emptyList())
private class RuntimeModel(val flow: MutableStateFlow<RuntimeState>) { fun u(): StateFlow<RuntimeState> = flow }
private class RuntimeAddonStreams(val streams: List<String>)
private class RuntimePlayerNext(@JvmField val a: String, @JvmField val b: Int, @JvmField val c: Int,
                               @JvmField val h: Boolean = true, @JvmField val i: Boolean? = true,
                               @JvmField val g: String? = "2026-01-01")
private class RuntimePlayerState(@JvmField val C0: String, @JvmField val v1: RuntimePlayerNext?,
                                @JvmField val a: Boolean = true, @JvmField val b: Boolean = false,
                                @JvmField val c: Boolean = false, @JvmField val d: Any? = null,
                                @JvmField val j1: String? = null, @JvmField val g: String = "")
private class RuntimePlayerController { @JvmField val T: String = "SERIES" }
private class RuntimePlayerModel(private val flow: MutableStateFlow<RuntimePlayerState>) {
    @JvmField val Y = RuntimePlayerController()
    fun e(): StateFlow<RuntimePlayerState> = flow
    fun f(): Unit = error("Void player action must never be invoked to read state")
}
private class RuntimePluginRequest(@JvmField val o: RuntimeRepository, @JvmField val p: String,
                                  @JvmField val q: String, @JvmField val r: Int?, @JvmField val s: Int?)
private class RuntimeRepository(private val profile: RuntimeProfile, private val scope: CoroutineScope) {
    @JvmField val l = MutableStateFlow(false)
    val wrongSearchCalls = AtomicInteger()
    fun j(type: String, id: String, season: Int?, episode: Int?, continuation: kotlin.coroutines.Continuation<Any>): Any {
        wrongSearchCalls.incrementAndGet()
        error("The same-arity suspend search entry must not be used")
    }
    val networkCalls = AtomicInteger()
    val forceRefreshes = AtomicInteger()
    val mainThreadSearches = AtomicInteger()
    val seen = ConcurrentHashMap.newKeySet<String>()
    val localSearches = ConcurrentHashMap.newKeySet<String>()
    private val sessions = ConcurrentHashMap<String, Deferred<Any>>()
    // This fixture models the native session boundary, not the patch's queue or target selection.
    fun l(type: String, id: String, season: Int?, episode: Int?, force: Boolean): Flow<Any> = flow {
        if (Thread.currentThread().name == "main") mainThreadSearches.incrementAndGet()
        val key = "${profile.f.value}|$type|$id|$season|$episode"
        if (force) {
            forceRefreshes.incrementAndGet()
            sessions.remove(key)?.cancel() // Native force-refresh really discards the warmed session.
        }
        val session = sessions.computeIfAbsent(key) {
            scope.async {
                networkCalls.incrementAndGet()
                NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest(this@RuntimeRepository, id, type, season, episode))
                    .first { !it }
                localSearches.add(id)
                delay(30)
                seen.add(id)
                b9.l(listOf(RuntimeAddonStreams(listOf("source-$id"))))
            }
        }
        emit(session.await())
    }
}

fun main() = runBlocking {
    val nativeScope = CoroutineScope(SupervisorJob() + Dispatchers.Default)
    try {
        val profile = RuntimeProfile()
        val repository = RuntimeRepository(profile, nativeScope)
        NuvioStreamPreload.registerComponent(RuntimeComponent(profile, repository))
        val prefs = ActivityThread.currentApplication().getSharedPreferences("santodan_stream_preload", 0)
        val card = RuntimeCard(RuntimeProgress("series", "tt1:2:3", 2, 3))
        NuvioStreamPreload.onContinueWatching(card)
        delay(50)
        check(repository.networkCalls.get() == 0)
        prefs.edit().putBoolean("continue_watching", true).apply()
        repeat(100) { NuvioStreamPreload.onContinueWatching(card) }
        suspend fun waitFor(timeout: Long = 3_000, condition: () -> Boolean) = withTimeout(timeout) {
            while (!condition()) delay(5)
        }
        waitFor { "tt1:2:3" in repository.seen }
        check(repository.networkCalls.get() == 1)
        val playbackSources = withContext(Dispatchers.Default) { repository.l("series", "tt1:2:3", 2, 3, false).first() }
        check(((playbackSources as b9.l).a as List<*>).let { (it.single() as RuntimeAddonStreams).streams } == listOf("source-tt1:2:3"))
        check(repository.networkCalls.get() == 1)
        prefs.edit().putBoolean("details", true).apply()
        val state = MutableStateFlow(RuntimeState(RuntimeMeta("movie", "ttmovie"), RuntimeNext(null, null, null)))
        val model = RuntimeModel(state)
        NuvioStreamPreload.observeDetails(model)
        waitFor { "ttmovie" in repository.seen }
        state.value = RuntimeState(RuntimeMeta("series", "tt2"), RuntimeNext("tt2:3:4", 3, 4))
        waitFor { "resolved:tt2:3:4" in repository.seen }
        NuvioStreamPreload.stopDetails(model)
        state.value = RuntimeState(RuntimeMeta("series", "tt2"), RuntimeNext("tt2:3:5", 3, 5))
        delay(100)
        check("resolved:tt2:3:5" !in repository.seen)
        repository.l.value = true
        NuvioStreamPreload.onContinueWatching(RuntimeCard(RuntimeProgress("movie", "paused", null, null)))
        delay(50)
        check("paused" !in repository.seen)
        repository.l.value = false
        profile.f.value = 2
        NuvioStreamPreload.onContinueWatching(card)
        waitFor { repository.networkCalls.get() == 4 }
        check(repository.forceRefreshes.get() == 0)
        check(repository.mainThreadSearches.get() == 0)
        check(repository.wrongSearchCalls.get() == 0)
        check(Log.errors.isEmpty()) { Log.errors.joinToString() }
        waitFor { Log.messages.any { "Preload completed" in it } }
        check(Log.messages.count { "Preload started" in it && "video=tt1:2:3" in it } == 2)
        check(Log.messages.any { "addonGroups=1 sources=1" in it })
        check(Log.messages.none { "resolved:tt2" in it })
        println("PASS: production runtime resolves lazy Hilt provider, preloads off UI thread, reuses playback sources, observes movie/episode targets, stops on clear, and isolates profiles")

        repository.l.value = true
        val playerFlow = MutableStateFlow(RuntimePlayerState("ttnext:1:1", RuntimePlayerNext("ttnext:1:2", 1, 2)))
        val playerModel = RuntimePlayerModel(playerFlow)
        NuvioStreamPreload.observeNextEpisode(playerModel)
        delay(300)
        check(repository.networkCalls.get() == 4)
        check(NuvioStreamPreload.nextEpisodePickerRefresh(true))
        check(!NuvioStreamPreload.nextEpisodePickerRefresh(false))
        check(NuvioStreamPreload.useNativeNextEpisodeThresholdPreload())
        prefs.edit().putBoolean("next_episode", true).apply()
        check(!NuvioStreamPreload.nextEpisodePickerRefresh(true))
        check(!NuvioStreamPreload.useNativeNextEpisodeThresholdPreload())
        repeat(10) { NuvioStreamPreload.observeNextEpisode(playerModel) }
        delay(1_000)
        check("ttnext:1:2" !in repository.seen)
        check(NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest(repository, "unrelated", "series", 1, 2)).first())
        println("Checking production 30-second playback delay...")
        waitFor(35_000) { "ttnext:1:2" in repository.seen }
        check("ttnext:1:2" in repository.localSearches) // Exact next target runs even while native playback is paused.
        check(repository.l.value) // The singleton pause flag was never cleared.
        val nextSources = withContext(Dispatchers.Default) {
            repository.l("series", "ttnext:1:2", 1, 2, NuvioStreamPreload.nextEpisodePickerRefresh(true)).first()
        }
        check(((nextSources as b9.l).a as List<*>).let { (it.single() as RuntimeAddonStreams).streams } == listOf("source-ttnext:1:2"))
        check(repository.networkCalls.get() == 5)
        check(NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest(repository, "unrelated", "series", 1, 2)).first())
        NuvioStreamPreload.stopNextEpisode(playerModel)
        playerFlow.value = RuntimePlayerState("ttnext:1:2", RuntimePlayerNext("ttnext:1:3", 1, 3))
        delay(300)
        check("ttnext:1:3" !in repository.seen)
        check(repository.forceRefreshes.get() == 0 && repository.mainThreadSearches.get() == 0)
        check(repository.wrongSearchCalls.get() == 0)
        check(Log.errors.isEmpty()) { Log.errors.joinToString() }
        println("PASS: real delayed player observer, next-episode cache reuse, scoped local-scraper permission, duplicate observers and disposal")
        repository.l.value = false
        withContext(Dispatchers.Default) { repository.l("series", "ttnext:1:2", 1, 2, true).first() }
        check(repository.networkCalls.get() == 6 && repository.forceRefreshes.get() == 1)
        prefs.edit().putBoolean("next_episode", false).apply()
        check(NuvioStreamPreload.useNativeNextEpisodeThresholdPreload())
        check(NuvioStreamPreload.nextEpisodePickerRefresh(true))
        println("PASS: enabled patch suppresses threshold preload and manual picker refresh; explicit refresh and disabled native behavior remain available")
    } finally { nativeScope.cancel() }
}
