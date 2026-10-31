package software.santodan.extension.nuviostreams

import software.santodan.nuvio.NuvioAccess

import software.santodan.nuvio.NuvioNative

import android.app.Application
import android.util.Log
import java.lang.reflect.Method
import java.lang.reflect.Proxy
import java.util.WeakHashMap
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import software.santodan.extension.nuviostreams.engine.StreamPreloadQueue
import software.santodan.extension.nuviostreams.engine.StreamTargets
import software.santodan.extension.nuviostreams.engine.NextEpisodePreloader

/** Warms the same native stream-search sessions that playback observes. */
object NuvioStreamPreload {
    private const val TAG = "SantodanStreams"
    private const val CW = "continue_watching"
    private const val DETAILS = "details"
    private const val NEXT = "next_episode"
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val settings = MutableStateFlow(0)
    private val states = ConcurrentHashMap<String, Any>()
    private val observers = WeakHashMap<Any, Job>()
    private val nextObservers = WeakHashMap<Any, Job>()
    private data class Permit(val profile: Any, val media: StreamTargets.Media)
    private val nextPermits = MutableStateFlow<Map<Any, Permit>>(emptyMap())
    @Volatile private var component: Any? = null
    @Volatile private var repository: Any? = null
    private val heroResolver by lazy {
        Class.forName(NuvioNative.DETAIL_RESOLVER_NAME).getDeclaredMethod("D",
            Class.forName("com.nuvio.tv.domain.model.Meta"),
            Class.forName("com.nuvio.tv.domain.model.NextToWatch"), List::class.java).apply {
            check(java.lang.reflect.Modifier.isStatic(modifiers) &&
                returnType.name == "com.nuvio.tv.domain.model.Video")
            isAccessible = true
        }
    }
    private val queue by lazy {
        StreamPreloadQueue(scope, ::profile, ::enabled, ::paused, { search(it) },
            onError = { Log.e(TAG, "Stream preload failed", it) },
            onEvent = { target, event, elapsed ->
                Log.d(TAG, "Preload $event ${targetLabel(target)} elapsedMs=$elapsed")
            })
    }

    private fun targetLabel(target: StreamPreloadQueue.Target): String {
        // Custom addon identifiers can contain URLs or tokens; log only standard catalog IDs.
        val id = target.videoId.takeIf { it.matches(Regex("(?:tt[0-9]+|tmdb:[0-9]+)(?::[0-9]+)*")) } ?: "custom-id"
        return "mode=${target.mode} type=${target.type} video=$id season=${target.season} episode=${target.episode}"
    }

    private fun app(): Application = Class.forName("android.app.ActivityThread")
        .getMethod("currentApplication").invoke(null) as Application
    private fun preferences() = app().getSharedPreferences("santodan_stream_preload", 0)
    private fun enabled(mode: String) = try { preferences().getBoolean(mode, false) } catch (_: Exception) { false }
    private fun method(owner: Class<*>, name: String, count: Int): Method = owner.declaredMethods
        .single { it.name == name && it.parameterCount == count }.apply { isAccessible = true }
    private fun field(owner: Any, name: String) = StreamTargets.field(owner, name)
    private fun get(owner: Any, name: String) = StreamTargets.get(owner, name)
    private fun profileFlow(): StateFlow<*>? {
        val current = component ?: return null
        val provider = NuvioAccess.profileProvider(current) ?: return null
        val manager = get(provider, "get") ?: return null
        return field(manager, "f") as StateFlow<*>
    }
    private fun profile(): Any? = profileFlow()?.value
    private fun paused(): Boolean {
        val current = repository ?: return false
        return (field(current, "l") as StateFlow<*>).value == true
    }

    @JvmStatic fun registerComponent(value: Any) {
        val started = System.nanoTime()
        Log.d(TAG, "Startup begin: stage=streams.component thread=${Thread.currentThread().name}")
        component = value
        Log.d(TAG, "Stream preload runtime ready")
        Log.d(TAG, "Startup end: stage=streams.component elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
    }

    private suspend fun search(target: StreamPreloadQueue.Target, valid: () -> Boolean = { true }): Boolean {
        val current = repository ?: run {
            val owner = component ?: return false
            // Scoped Hilt provider: obtain the native singleton without opening the stream screen.
            val provider = NuvioAccess.streamProvider(owner) ?: return false
            (get(provider, "get") ?: return false).also { repository = it }
        }
        fun allowed() = enabled(target.mode) && profile() == target.profile &&
            (target.mode == NEXT || !paused()) && valid()
        if (!allowed()) return false
        @Suppress("UNCHECKED_CAST")
        val search = current.javaClass.getDeclaredMethod("l", String::class.java, String::class.java,
            Int::class.javaObjectType, Int::class.javaObjectType, Boolean::class.javaPrimitiveType)
            .apply { isAccessible = true }
        check(Flow::class.java.isAssignableFrom(search.returnType)) { "Native stream search must return Flow" }
        val results = search.invoke(current,
            target.type, target.videoId, target.season, target.episode, false) as Flow<Any>
        var success = false
        var groups = 0
        var sources = 0
        results.collect { result ->
            if (!allowed())
                throw CancellationException("Preload is no longer needed")
            // Verified native NetworkResult.Success on beta7.
            success = result.javaClass.name == "b9.q" && (field(result, "a") as? List<*>)?.isNotEmpty() == true
            if (result.javaClass.name == "b9.q") {
                val addons = field(result, "a") as List<*>
                groups = addons.size
                sources = addons.sumOf { addon -> (get(addon!!, "getStreams") as List<*>).size }
            }
        }
        Log.d(TAG, "Preload results ${targetLabel(target)} addonGroups=$groups sources=$sources")
        return success
    }

    private fun offer(mode: String, media: StreamTargets.Media?) {
        if (media == null || !enabled(mode)) return
        val active = profile() ?: return
        queue.offer(StreamPreloadQueue.Target(mode, active, media.type, media.videoId, media.season, media.episode))
    }

    @JvmStatic fun onContinueWatching(card: Any) {
        if (!enabled(CW)) return
        try { offer(CW, StreamTargets.continueWatching(card)) }
        catch (error: Exception) { Log.e(TAG, "Continue Watching target read failed", error) }
    }

    @JvmStatic fun observeDetails(model: Any) {
        try {
            @Suppress("UNCHECKED_CAST")
            val flow = get(model, "u") as StateFlow<Any>
            synchronized(observers) {
                if (observers.containsKey(model)) return
                // The coroutine captures the flow, not the ViewModel. onCleared stops observation.
                observers[model] = scope.launch {
                    combine(flow, settings) { state, _ -> state }.collect { state ->
                        if (enabled(DETAILS)) try {
                            offer(DETAILS, StreamTargets.details(state) { meta, next, episodes ->
                                heroResolver.invoke(null, meta, next, episodes)
                            })
                        }
                        catch (error: Exception) { Log.e(TAG, "Detail target read failed", error) }
                    }
                }
            }
        } catch (error: Exception) { Log.e(TAG, "Detail observation failed", error) }
    }

    @JvmStatic fun stopDetails(model: Any) {
        synchronized(observers) { observers.remove(model)?.cancel() }
    }

    @JvmStatic fun observeNextEpisode(model: Any) {
        try {
            @Suppress("UNCHECKED_CAST")
            val flow = get(model, NuvioNative.PLAYER_STATE_METHOD) as StateFlow<Any>
            // Beta7 ub.q reads controller k8.T for the native request type.
            val requestType = field(field(model, "Y")!!, "T") as? String
            synchronized(nextObservers) {
                if (nextObservers.containsKey(model)) return
                Log.d(TAG, "Next episode playback observer ready")
                val token = Any()
                nextObservers[model] = scope.launch {
                    var lastDiagnostic: String? = null
                    fun snapshot() = StreamTargets.player(flow.value, profile(), enabled(NEXT),
                        normalizeType = true, requestType = requestType)
                    NextEpisodePreloader(::snapshot, { state ->
                        synchronized(nextPermits) {
                            nextPermits.value = if (state == null) nextPermits.value - token
                                else nextPermits.value + (token to Permit(state.profile!!, state.next!!))
                        }
                    }, { state ->
                        val media = state.next!!
                        val target = StreamPreloadQueue.Target(NEXT, state.profile!!, media.type,
                            media.videoId, media.season, media.episode)
                        Log.d(TAG, "Preload started ${targetLabel(target)}")
                        val result = search(target) {
                            val current = snapshot()
                            current.enabled && current.playing && current.profile == state.profile &&
                                current.currentVideoId == state.currentVideoId && current.next == state.next
                        }
                        Log.d(TAG, "Preload ${if (result) "completed" else "empty-or-unavailable"} ${targetLabel(target)}")
                        result
                    }, onError = { Log.e(TAG, "Next episode preload failed", it) }, onState = { state, playedMs ->
                        // Only booleans and elapsed time: never dump native state containing stream URLs.
                        // Emit changes and five-second milestones up to the buffer grace period.
                        val native = flow.value
                        val next = NuvioAccess.nextEpisode(native)
                        val diagnostic = "enabled=${state.enabled} playing=${state.playing} " +
                            "nativePlaying=${field(native, "a") == true} buffering=${field(native, "b") == true} " +
                            "ended=${field(native, "c") == true} exiting=${field(native, "d") != null} " +
                            "error=${!(NuvioAccess.playbackError(native) as? String).isNullOrBlank()} " +
                            "series=${requestType.equals("series", true) || requestType.equals("tv", true)} nextPresent=${next != null} " +
                            "nextAired=${next != null && field(next, "h") == true} " +
                            "profileReady=${state.profile != null} currentReady=${!state.currentVideoId.isNullOrBlank()} " +
                            "nextReady=${state.next != null} sameEpisode=${state.next?.videoId == state.currentVideoId} " +
                            "playedSeconds=${(playedMs.coerceAtMost(30_000) / 5_000) * 5}"
                        if (diagnostic != lastDiagnostic) {
                            lastDiagnostic = diagnostic
                            Log.d(TAG, "Next episode state $diagnostic")
                        }
                    }).run()
                }
            }
        } catch (error: Exception) { Log.e(TAG, "Player observation failed", error) }
    }

    @JvmStatic fun stopNextEpisode(model: Any) {
        synchronized(nextObservers) { nextObservers.remove(model)?.cancel() }
    }

    @JvmStatic fun nextEpisodePickerRefresh(requested: Boolean): Boolean {
        val refresh = requested && !enabled(NEXT)
        if (requested && !refresh) Log.d(TAG, "Next episode picker forceRefresh=false")
        return refresh
    }

    @JvmStatic fun useNativeNextEpisodeThresholdPreload(): Boolean = !enabled(NEXT)

    /** Allow local scrapers only for the exact next episode during its delayed search. */
    @JvmStatic fun nextEpisodePluginPause(request: Any): Flow<Boolean> {
        val owner = field(request, "i")!!
        @Suppress("UNCHECKED_CAST")
        val native = field(owner, "l") as StateFlow<Boolean>
        return try {
            val media = StreamTargets.Media(field(request, "k") as String, field(request, "j") as String,
                field(request, "l") as? Int, field(request, "m") as? Int)
            val activeProfile = profileFlow() ?: return native
            combine(native, nextPermits, activeProfile, settings) { paused, permits, active, _ ->
                paused && !(enabled(NEXT) && permits.values.any { it.profile == active && it.media == media })
            }.distinctUntilChanged()
        } catch (error: Exception) {
            Log.e(TAG, "Next episode plugin pause read failed", error)
            native
        }
    }

    @JvmStatic fun renderSettings(composer: Any, mode: String) {
        try {
            val loader = composer.javaClass.classLoader!!
            val state = states.getOrPut(mode) {
                method(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, enabled(mode))
            }
            fun callback(action: () -> Unit): Any {
                val contract = loader.loadClass("kotlin.jvm.functions.Function0")
                return Proxy.newProxyInstance(loader, arrayOf(contract)) { proxy, called, args ->
                    when (called.name) {
                        "invoke" -> { action(); unit(loader) }
                        "hashCode" -> System.identityHashCode(proxy)
                        "equals" -> proxy === args?.get(0)
                        "toString" -> "SantodanStreamsCallback"
                        else -> null
                    }
                }
            }
            val toggle = callback {
                val value = !(get(state, "getValue") as Boolean)
                preferences().edit().putBoolean(mode, value).apply()
                method(state.javaClass, "setValue", 1).invoke(state, value)
                if (!value) queue.disable(mode)
                settings.value += 1
                Log.d(TAG, "Preload setting mode=$mode enabled=$value")
            }
                val title = when (mode) {
                CW -> "Preload streams in Continue Watching"
                NEXT -> "Preload streams for next episode"
                else -> "Preload streams on detail page"
            }
            val description = when (mode) {
                CW -> "Search sources in the background for visible episodes and movies."
                NEXT -> "Fetch the next episode's source list after 30 seconds of playback."
                else -> "Search sources for the detail page's Play or Resume episode or movie."
            }
            method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "m", 13).invoke(null,
                title, description, get(state, "getValue"), toggle, null, callback {}, false,
                null, 0L, false, composer, 0, 1008)
        } catch (error: Exception) { Log.e(TAG, "Stream settings rendering failed", error) }
    }

    private fun unit(loader: ClassLoader): Any {
        val owner = loader.loadClass("kotlin.Unit")
        return try { owner.getField("INSTANCE").get(null) } catch (_: NoSuchFieldException) { owner.getField("a").get(null) }
    }
}
