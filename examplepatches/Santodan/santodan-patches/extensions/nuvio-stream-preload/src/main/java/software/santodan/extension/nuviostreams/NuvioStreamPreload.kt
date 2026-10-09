package software.santodan.extension.nuviostreams

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

/** Warms the same native stream-search sessions that playback observes. */
object NuvioStreamPreload {
    private const val TAG = "SantodanStreams"
    private const val CW = "continue_watching"
    private const val DETAILS = "details"
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val settings = MutableStateFlow(0)
    private val states = ConcurrentHashMap<String, Any>()
    private val observers = WeakHashMap<Any, Job>()
    @Volatile private var component: Any? = null
    @Volatile private var repository: Any? = null
    private val heroResolver by lazy {
        val beta5 = app().packageManager.getPackageInfo(app().packageName, 0).versionName == "1.1.0-beta.5"
        method(Class.forName(if (beta5) "ka.e1" else "ka.d1"), "C", 3)
    }
    private val queue by lazy {
        StreamPreloadQueue(scope, ::profile, ::enabled, ::paused, ::search,
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
    private fun profile(): Any? {
        val current = component ?: return null
        val provider = field(current, "y") ?: return null
        val manager = get(provider, "get") ?: return null
        return (field(manager, "f") as StateFlow<*>).value
    }
    private fun paused(): Boolean {
        val current = repository ?: return false
        return (field(current, "k") as StateFlow<*>).value == true
    }

    @JvmStatic fun registerComponent(value: Any) {
        component = value
        Log.d(TAG, "Stream preload runtime ready")
    }

    private suspend fun search(target: StreamPreloadQueue.Target): Boolean {
        val current = repository ?: run {
            val owner = component ?: return false
            // Scoped Hilt provider: obtain the native singleton without opening the stream screen.
            val provider = field(owner, "K2") ?: return false
            (get(provider, "get") ?: return false).also { repository = it }
        }
        if (!enabled(target.mode) || profile() != target.profile || paused()) return false
        @Suppress("UNCHECKED_CAST")
        val results = method(current.javaClass, "j", 5).invoke(current,
            target.type, target.videoId, target.season, target.episode, false) as Flow<Any>
        var success = false
        var groups = 0
        var sources = 0
        results.collect { result ->
            if (!enabled(target.mode) || profile() != target.profile || paused())
                throw CancellationException("Preload is no longer needed")
            // Verified native NetworkResult.Success on beta4 and beta5.
            success = result.javaClass.name == "a9.n" && (field(result, "a") as? List<*>)?.isNotEmpty() == true
            if (result.javaClass.name == "a9.n") {
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

    @JvmStatic fun renderSettings(composer: Any, mode: String) {
        try {
            val loader = composer.javaClass.classLoader!!
            val state = states.getOrPut(mode) {
                method(loader.loadClass("g1.j"), "r", 1).invoke(null, enabled(mode))
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
            val beta5 = app().packageManager.getPackageInfo(app().packageName, 0).versionName == "1.1.0-beta.5"
            val title = if (mode == CW) "Preload streams in Continue Watching" else "Preload streams on detail page"
            val description = if (mode == CW) "Search sources in the background for visible episodes and movies."
                else "Search sources for the detail page's Play or Resume episode or movie."
            method(loader.loadClass(if (beta5) "sa.db" else "sa.eb"), "m", 13).invoke(null,
                title, description, get(state, "getValue"), toggle, null, callback {}, false,
                null, 0L, false, composer, 0, 1008)
        } catch (error: Exception) { Log.e(TAG, "Stream settings rendering failed", error) }
    }

    private fun unit(loader: ClassLoader): Any {
        val owner = loader.loadClass("kotlin.Unit")
        return try { owner.getField("INSTANCE").get(null) } catch (_: NoSuchFieldException) { owner.getField("a").get(null) }
    }
}
