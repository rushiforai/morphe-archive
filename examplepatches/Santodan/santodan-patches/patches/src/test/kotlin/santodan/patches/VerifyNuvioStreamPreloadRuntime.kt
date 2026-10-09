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
    @JvmField val y = RuntimeProvider(profile)
    @JvmField val K2 = RuntimeProvider(repository)
}
private class RuntimeProgress(val contentType: String, val videoId: String, val season: Int?, val episode: Int?)
private class RuntimeCard(@JvmField val x: RuntimeProgress, @JvmField val y: Any? = null)
private class RuntimeMeta(val apiType: String, val id: String)
private class RuntimeNext(val nextVideoId: String?, val nextSeason: Int?, val nextEpisode: Int?, val watchProgress: Any? = null)
private class RuntimeState(@JvmField val b: RuntimeMeta?, @JvmField val h: RuntimeNext?, @JvmField val f: List<Any> = emptyList())
private class RuntimeModel(val flow: MutableStateFlow<RuntimeState>) { fun u(): StateFlow<RuntimeState> = flow }
private class RuntimeAddonStreams(val streams: List<String>)
private class RuntimeRepository(private val profile: RuntimeProfile, private val scope: CoroutineScope) {
    @JvmField val k = MutableStateFlow(false)
    val networkCalls = AtomicInteger()
    val forceRefreshes = AtomicInteger()
    val mainThreadSearches = AtomicInteger()
    val seen = ConcurrentHashMap.newKeySet<String>()
    private val sessions = ConcurrentHashMap<String, Deferred<Any>>()
    // This fixture models the native session boundary, not the patch's queue or target selection.
    fun j(type: String, id: String, season: Int?, episode: Int?, force: Boolean): Flow<Any> = flow {
        if (Thread.currentThread().name == "main") mainThreadSearches.incrementAndGet()
        if (force) forceRefreshes.incrementAndGet()
        val key = "${profile.f.value}|$type|$id|$season|$episode"
        val session = sessions.computeIfAbsent(key) {
            scope.async {
                networkCalls.incrementAndGet()
                delay(30)
                seen.add(id)
                a9.n(listOf(RuntimeAddonStreams(listOf("source-$id"))))
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
        suspend fun waitFor(condition: () -> Boolean) = withTimeout(3_000) {
            while (!condition()) delay(5)
        }
        waitFor { "tt1:2:3" in repository.seen }
        check(repository.networkCalls.get() == 1)
        val playbackSources = withContext(Dispatchers.Default) { repository.j("series", "tt1:2:3", 2, 3, false).first() }
        check(((playbackSources as a9.n).a as List<*>).let { (it.single() as RuntimeAddonStreams).streams } == listOf("source-tt1:2:3"))
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
        repository.k.value = true
        NuvioStreamPreload.onContinueWatching(RuntimeCard(RuntimeProgress("movie", "paused", null, null)))
        delay(50)
        check("paused" !in repository.seen)
        repository.k.value = false
        profile.f.value = 2
        NuvioStreamPreload.onContinueWatching(card)
        waitFor { repository.networkCalls.get() == 4 }
        check(repository.forceRefreshes.get() == 0)
        check(repository.mainThreadSearches.get() == 0)
        check(Log.errors.isEmpty()) { Log.errors.joinToString() }
        waitFor { Log.messages.any { "Preload completed" in it } }
        check(Log.messages.count { "Preload started" in it && "video=tt1:2:3" in it } == 2)
        check(Log.messages.any { "addonGroups=1 sources=1" in it })
        check(Log.messages.none { "resolved:tt2" in it })
        println("PASS: production runtime resolves lazy Hilt provider, preloads off UI thread, reuses playback sources, observes movie/episode targets, stops on clear, and isolates profiles")
    } finally { nativeScope.cancel() }
}
