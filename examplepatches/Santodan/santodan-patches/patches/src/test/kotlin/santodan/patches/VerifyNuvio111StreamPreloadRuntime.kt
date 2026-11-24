package santodan.patches

import android.app.ActivityThread
import android.util.Log
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicInteger
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviostreams.NuvioStreamPreload

private class RuntimeProfile111 { @JvmField val f = MutableStateFlow(1) }
private class RuntimeProvider111(private val value: Any) { fun get(): Any = value }
private class RuntimeComponent111(profile: RuntimeProfile111, repository: RuntimeRepository111) {
    @JvmField val B = RuntimeProvider111(profile)
    @JvmField val g3 = RuntimeProvider111(repository)
    @JvmField val e3 = Any() // Beta.9's field now belongs to another provider.
}
private class RuntimeProgress111(val contentType: String, val videoId: String, val season: Int?, val episode: Int?)
private class RuntimeCard111(@JvmField val r: RuntimeProgress111, @JvmField val s: Any? = null)
private typealias RuntimeMeta111 = com.nuvio.tv.domain.model.Meta
private typealias RuntimeNext111 = com.nuvio.tv.domain.model.NextToWatch
private class RuntimeState111(@JvmField val b: RuntimeMeta111?, @JvmField val h: RuntimeNext111?, @JvmField val f: List<Any> = emptyList())
private class RuntimeModel111(val flow: MutableStateFlow<RuntimeState111>) { fun u(): StateFlow<RuntimeState111> = flow }
private class RuntimeAddonStreams111(val streams: List<String>)
private class RuntimePlayerNext111(@JvmField val a: String, @JvmField val b: Int, @JvmField val c: Int,
                               @JvmField val h: Boolean = true, @JvmField val i: Boolean? = true,
                               @JvmField val g: String? = "2026-01-01")
private class RuntimePlayerState111(@JvmField val F0: String, @JvmField val y1: RuntimePlayerNext111?,
                                @JvmField val a: Boolean = true, @JvmField val b: Boolean = false,
                                @JvmField val c: Boolean = false, @JvmField val d: Any? = null,
                                @JvmField val m1: String? = null, @JvmField val g: String = "")
private class RuntimePlayerController111 {
    @JvmField val U: String = "SERIES"
    @JvmField var v3: String? = "release-A"
}
private class RuntimePlayerModel111(private val flow: MutableStateFlow<RuntimePlayerState111>) {
    @JvmField val Y = RuntimePlayerController111()
    fun e(): StateFlow<RuntimePlayerState111> = flow
    fun f(): Unit = error("Void player action must never be invoked to read state")
}
private class RuntimePluginRequest111(@JvmField val j: RuntimeRepository111, @JvmField val k: String,
                                  @JvmField val l: String, @JvmField val m: Int?, @JvmField val n: Int?)
private class RuntimeRepository111(private val profile: RuntimeProfile111, private val scope: CoroutineScope) {
    companion object {
        @JvmStatic fun l(owner: RuntimeRepository111, type: String, id: String, season: Int?, episode: Int?,
                         refresh: Boolean, group: String?, first: Boolean, second: Boolean, mask: Int): Flow<Any> {
            check(!refresh && first == second && mask == 16)
            return owner.l(type, id, season, episode, false, group, first)
        }
    }
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
    fun l(type: String, id: String, season: Int?, episode: Int?, force: Boolean,
          group: String? = null, preferred: Boolean = false): Flow<Any> = flow {
        if (Thread.currentThread().name == "main") mainThreadSearches.incrementAndGet()
        val mode = if (preferred) "continuePluginOnly" else ""
        val keyGroup = if (preferred) "" else group?.trim().orEmpty()
        val key = "${profile.f.value}|$type|$id|$season|$episode|$mode|$keyGroup"
        if (force) {
            forceRefreshes.incrementAndGet()
            sessions.remove(key)?.cancel() // Native force-refresh really discards the warmed session.
        }
        val session = sessions.computeIfAbsent(key) {
            scope.async {
                networkCalls.incrementAndGet()
                NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest111(this@RuntimeRepository111, id, type, season, episode))
                    .first { !it }
                localSearches.add(id)
                delay(30)
                seen.add(id)
                b9.r(listOf(RuntimeAddonStreams111(listOf("source-$id"))))
            }
        }
        emit(session.await())
    }
}

fun main() = runBlocking {
    val nativeScope = CoroutineScope(SupervisorJob() + Dispatchers.Default)
    try {
        val profile = RuntimeProfile111()
        val repository = RuntimeRepository111(profile, nativeScope)
        NuvioStreamPreload.registerComponent(RuntimeComponent111(profile, repository))
        val prefs = ActivityThread.currentApplication().getSharedPreferences("santodan_stream_preload", 0)
        val card = RuntimeCard111(RuntimeProgress111("series", "tt1:2:3", 2, 3))
        NuvioStreamPreload.onContinueWatching(card)
        delay(50)
        check(repository.networkCalls.get() == 0)
        prefs.edit().putBoolean("continue_watching", true).apply()
        repeat(100) { NuvioStreamPreload.onContinueWatching(card) }
        suspend fun waitFor(timeout: Long = 3_000, condition: () -> Boolean) = withTimeout(timeout) {
            try { while (!condition()) delay(5) } catch(e: Exception) { println(Log.messages.joinToString("\n"));println(Log.errors.joinToString("\n"));throw e }
        }
        waitFor { "tt1:2:3" in repository.seen }
        check(repository.networkCalls.get() == 1)
        val playbackSources = withContext(Dispatchers.Default) { repository.l("series", "tt1:2:3", 2, 3, false).first() }
        check(((playbackSources as b9.r).a as List<*>).let { (it.single() as RuntimeAddonStreams111).streams } == listOf("source-tt1:2:3"))
        check(repository.networkCalls.get() == 1)
        prefs.edit().putBoolean("details", true).apply()
        val state = MutableStateFlow(RuntimeState111(RuntimeMeta111("movie", "ttmovie"), RuntimeNext111(null, null, null)))
        val model = RuntimeModel111(state)
        NuvioStreamPreload.observeDetails(model)
        waitFor { "ttmovie" in repository.seen }
        state.value = RuntimeState111(RuntimeMeta111("series", "tt2"), RuntimeNext111("tt2:3:4", 3, 4))
        waitFor { "resolved:tt2:3:4" in repository.seen }
        NuvioStreamPreload.stopDetails(model)
        state.value = RuntimeState111(RuntimeMeta111("series", "tt2"), RuntimeNext111("tt2:3:5", 3, 5))
        delay(100)
        check("resolved:tt2:3:5" !in repository.seen)
        repository.l.value = true
        NuvioStreamPreload.onContinueWatching(RuntimeCard111(RuntimeProgress111("movie", "paused", null, null)))
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
        val playerFlow = MutableStateFlow(RuntimePlayerState111("ttnext:1:1", RuntimePlayerNext111("ttnext:1:2", 1, 2)))
        val playerModel = RuntimePlayerModel111(playerFlow)
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
        check(NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest111(repository, "unrelated", "series", 1, 2)).first())
        println("Checking production 30-second playback delay...")
        waitFor(35_000) { "ttnext:1:2" in repository.seen }
        check("ttnext:1:2" in repository.localSearches) // Exact next target runs even while native playback is paused.
        check(repository.l.value) // The singleton pause flag was never cleared.
        val nextSources = withContext(Dispatchers.Default) {
            repository.l("series", "ttnext:1:2", 1, 2, NuvioStreamPreload.nextEpisodePickerRefresh(true), "release-A").first()
        }
        check(((nextSources as b9.r).a as List<*>).let { (it.single() as RuntimeAddonStreams111).streams } == listOf("source-ttnext:1:2"))
        check(repository.networkCalls.get() == 5)
        // Changing the active source group must invalidate the preload cooldown. Local-plugin
        // autoplay and the full manual list use different native modes, and both must be warm.
        playerModel.Y.v3 = "local-plugin-demo|1080p"
        waitFor { repository.networkCalls.get() == 7 }
        withContext(Dispatchers.Default) {
            repository.l("series", "ttnext:1:2", 1, 2, false, playerModel.Y.v3).first()
            repository.l("series", "ttnext:1:2", 1, 2, false, playerModel.Y.v3, true).first()
        }
        check(repository.networkCalls.get() == 7)
        println("PASS: beta.13 binge-group cache keys, source-group changes and preferred-plugin autoplay reuse")
        check(NuvioStreamPreload.nextEpisodePluginPause(RuntimePluginRequest111(repository, "unrelated", "series", 1, 2)).first())
        NuvioStreamPreload.stopNextEpisode(playerModel)
        playerFlow.value = RuntimePlayerState111("ttnext:1:2", RuntimePlayerNext111("ttnext:1:3", 1, 3))
        delay(300)
        check("ttnext:1:3" !in repository.seen)
        check(repository.forceRefreshes.get() == 0 && repository.mainThreadSearches.get() == 0)
        check(repository.wrongSearchCalls.get() == 0)
        check(Log.errors.isEmpty()) { Log.errors.joinToString() }
        println("PASS: real delayed player observer, next-episode cache reuse, scoped local-scraper permission, duplicate observers and disposal")
        repository.l.value = false
        withContext(Dispatchers.Default) { repository.l("series", "ttnext:1:2", 1, 2, true, playerModel.Y.v3).first() }
        check(repository.networkCalls.get() == 8 && repository.forceRefreshes.get() == 1)
        prefs.edit().putBoolean("next_episode", false).apply()
        check(NuvioStreamPreload.useNativeNextEpisodeThresholdPreload())
        check(NuvioStreamPreload.nextEpisodePickerRefresh(true))
        println("PASS: enabled patch suppresses threshold preload and manual picker refresh; explicit refresh and disabled native behavior remain available")
    } finally { nativeScope.cancel() }
}
