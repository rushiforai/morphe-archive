package software.santodan.extension.nuviometadata

import android.util.Log
import java.lang.reflect.InvocationTargetException
import java.util.WeakHashMap
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.sync.Semaphore
import kotlinx.coroutines.sync.withPermit
import java.util.concurrent.atomic.AtomicInteger
import software.santodan.nuvio.NuvioNative

/** Native repositories own requests, cancellation, DTO conversion and HTTP cache lifetimes. */
object NuvioMetadataAddon {
    private data class Selection(val profile: Int, val url: String)
    private data class Repository(val original: Any, val selection: Selection)
    private data class Art(val poster: String?, val landscape: String?, val background: String?, val logo: String?)
    private val repositories = object : LinkedHashMap<Repository, Any>(8, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<Repository, Any>?) = size > 4
    }
    private val restricted = WeakHashMap<Any, Selection>()
    @Volatile private var nativeRepository: Any? = null
    private val libraryPermits = Semaphore(2)
    private val libraryQueued = AtomicInteger()
    private val libraryStates = object : LinkedHashMap<String, Any>(256, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, Any>?) = size > 256
    }
    /** Hilt constructs its original singleton before any private selected-provider repository. */
    @JvmStatic fun registerRepository(repo: Any) { if (nativeRepository == null) nativeRepository = repo }
    private val artwork = object : LinkedHashMap<String, Art>(256, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, Art>?) = size > 256
    }
    private val failures = object : LinkedHashMap<String, Long>(256, .75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, Long>?) = size > 256
    }
    private fun coolingDown(key: String) = synchronized(failures) {
        failures[key]?.let { System.nanoTime() - it < 60_000_000_000L } ?: false
    }
    private fun field(owner: Any, name: String): Any? = owner.javaClass.getDeclaredField(name).apply { isAccessible = true }.get(owner)
    private fun getter(owner: Any, name: String): String? = owner.javaClass.getMethod(name).invoke(owner) as String?
    private fun selection(cw: Boolean): Selection? {
        val profile = NuvioMetadataSettings.currentProfile()
        if (cw && !NuvioMetadataSettings.continueWatching(profile)) return null
        val url = NuvioMetadataSettings.selectedAddon(profile)
        return url.takeIf { it.isNotEmpty() }?.let { Selection(profile, it) }
    }
    private fun librarySelection(): Selection? {
        val id = NuvioMetadataSettings.currentProfile()
        return if (NuvioMetadataSettings.libraryPosters(id)) selection(false) else null
    }
    private fun owner(ref: String) = Class.forName(ref.substring(1, ref.indexOf(';')).replace('/', '.'))
    private fun parameters(ref: String): Array<Class<*>> {
        val types = ref.substringAfter('(').substringBefore(')')
        val result = ArrayList<Class<*>>()
        var i = 0
        while (i < types.length) {
            if (types[i] == 'L') {
                val end = types.indexOf(';', i)
                result += Class.forName(types.substring(i + 1, end).replace('/', '.'))
                i = end + 1
            } else {
                result += when (types[i++]) { 'Z' -> Boolean::class.javaPrimitiveType!!; 'I' -> Int::class.javaPrimitiveType!!; else -> error("Unsupported native parameter") }
            }
        }
        return result.toTypedArray()
    }
    private fun invoke(ref: String, receiver: Any, vararg args: Any?): Any? = try {
        owner(ref).getDeclaredMethod(ref.substringAfter("->").substringBefore('('), *parameters(ref)).invoke(receiver, *args)
    } catch (error: InvocationTargetException) { throw error.targetException }
    private fun construct(ref: String, vararg args: Any?): Any = owner(ref).getDeclaredConstructor(*parameters(ref)).newInstance(*args)
    private fun staticInvoke(ref: String, vararg args: Any?): Any? = try {
        owner(ref).getDeclaredMethod(ref.substringAfter("->").substringBefore('('), *parameters(ref)).invoke(null, *args)
    } catch (error: InvocationTargetException) { throw error.targetException }
    @Synchronized private fun repository(original: Any, selected: Selection): Any = repositories.getOrPut(Repository(original, selected)) {
        construct(NuvioNative.REF_METADATA_INIT, field(original, "a"), field(original, "b"), field(original, "c"), field(original, "d")).also {
            restricted[it] = selected
        }
    }
    /** Only the private repository sees a restricted list. The installed list is never changed. */
    @JvmStatic @Synchronized fun filterAddons(repo: Any, installed: List<Any>): List<Any> {
        val selected = restricted[repo] ?: return installed
        return installed.filter { getter(it, "getBaseUrl") == selected.url }
    }
    @Suppress("UNCHECKED_CAST")
    private fun native(repo: Any, type: String, id: String, source: String?, primary: Boolean): Flow<Any> =
        (if (primary) invoke(NuvioNative.REF_METADATA_PRIMARY, repo, type, id)
        else invoke(NuvioNative.REF_METADATA_ALL, repo, type, id, source)) as Flow<Any>
    private fun key(selection: Selection, type: String, id: String) = "${selection.profile}|${selection.url}|${if (type == "tv") "series" else type}:$id"
    private fun route(repo: Any, type: String, id: String, source: String?, primary: Boolean, cw: Boolean): Flow<Any> {
        val selected = try { selection(cw) } catch (error: Exception) {
            Log.e("SantodanMetadata", "Cannot read metadata preference", error); null
        } ?: return native(repo, type, id, source, primary)
        return flow {
            // A flow may have been created just before a profile/settings switch.
            if (selection(cw) != selected) { emitAll(native(repo, type, id, source, primary)); return@flow }
            val cacheKey = key(selected, type, id)
            if (coolingDown(cacheKey)) { emitAll(native(repo, type, id, source, primary)); return@flow }
            var succeeded = false
            val preferred = try { native(repository(repo, selected), type, id, null, false) }
            catch (error: Exception) {
                if (error is CancellationException) throw error
                Log.e("SantodanMetadata", "Cannot create selected metadata lookup", error)
                synchronized(failures) { failures[cacheKey] = System.nanoTime() }
                emitAll(native(repo, type, id, source, primary)); return@flow
            }
            preferred.catch { error ->
                if (error is CancellationException) throw error
                Log.e("SantodanMetadata", "Selected metadata lookup failed; using Nuvio fallback", error)
            }.collect { result ->
                    if (result.javaClass.name == "b9.r") {
                        val meta = field(result, "a")!!
                        if (selection(cw) != selected) throw CancellationException("Metadata selection changed")
                        val art = Art(getter(meta, "getPoster"), getter(meta, "getLandscapePoster"), getter(meta, "getBackground"), getter(meta, "getLogo"))
                        synchronized(artwork) { artwork[cacheKey] = art }
                        synchronized(failures) { failures.remove(cacheKey) }
                        succeeded = true
                        emit(result)
                    } else if (result.javaClass.name != "b9.p") emit(result)
            }
            if (!succeeded && selection(cw) == selected) {
                synchronized(failures) { failures[cacheKey] = System.nanoTime() }
                emitAll(native(repo, type, id, source, primary))
            }
        }
    }
    @JvmStatic fun all(repo: Any, type: String, id: String, source: String?): Flow<Any> = route(repo, type, id, source, false, false)
    @JvmStatic fun cwAll(repo: Any, type: String, id: String): Flow<Any> = route(repo, type, id, null, false, true)
    @JvmStatic fun cwPrimary(repo: Any, type: String, id: String): Flow<Any> = route(repo, type, id, null, true, true)

    private fun art(selected: Selection, item: Any): Art? {
        val info = field(item, "a")!!
        val progress = info.javaClass.name == "com.nuvio.tv.domain.model.WatchProgress"
        val id = if (progress) getter(info, "getContentId")!! else field(info, "a") as String
        val type = if (progress) getter(info, "getContentType")!! else field(info, "b") as String
        return synchronized(artwork) { artwork[key(selected, type, id)] }
    }
    private fun image(art: Art?, poster: Boolean): String? =
        (if (poster) art?.poster else art?.landscape ?: art?.background ?: art?.poster)?.takeIf { it.isNotBlank() }

    /** A native LaunchedEffect owns each visible card request and cancels it on disposal. */
    @JvmStatic fun libraryPoster(card: Any, nativeUrl: String?, composer: Any, landscape: Boolean): String? {
        val selected = try { librarySelection() } catch (error: Exception) {
            Log.e("SantodanMetadata", "Cannot read library artwork preference", error); null
        } ?: return nativeUrl
        val repo = nativeRepository ?: return nativeUrl
        var grouped = false
        return try {
            invoke(NuvioNative.REF_COMPOSER_D0, composer, 0x534d4c42)
            grouped = true
            val preview = field(card, NuvioNative.REF_METADATA_LIBRARY_PREVIEW.substringAfter("->").substringBefore(':'))!!
            val id = getter(preview, "getId")!!
            val type = getter(preview, "getApiType")!!
            val cacheKey = key(selected, type, id)
            val state = synchronized(libraryStates) { libraryStates.getOrPut(cacheKey) {
                staticInvoke(NuvioNative.REF_COMPOSE_FACTORY_T, synchronized(artwork) { artwork[cacheKey] })!!
            } }
            val art = state.javaClass.getMethod("getValue").invoke(state) as Art?
            val block: suspend CoroutineScope.() -> Unit = {
                if (libraryQueued.incrementAndGet() > 64) libraryQueued.decrementAndGet()
                else try {
                    withContext(Dispatchers.IO) {
                        libraryPermits.withPermit {
                            if (librarySelection() == selected && !coolingDown(cacheKey)) {
                                if (synchronized(artwork) { !artwork.containsKey(cacheKey) }) {
                                    withTimeoutOrNull(8_000L) {
                                        route(repo, type, id, null, false, false).first {
                                            it.javaClass.name == "b9.r" || it.javaClass.name == "b9.p"
                                        }
                                    }
                                }
                                if (librarySelection() == selected) {
                                    val loaded = synchronized(artwork) { artwork[cacheKey] }
                                    if (loaded == null) synchronized(failures) { failures[cacheKey] = System.nanoTime() }
                                    state.javaClass.getMethod("setValue", Any::class.java).invoke(state, loaded)
                                }
                            }
                        }
                    }
                } catch (cancelled: CancellationException) { throw cancelled }
                catch (error: Exception) {
                    synchronized(failures) { failures[cacheKey] = System.nanoTime() }
                    Log.e("SantodanMetadata", "Library artwork lookup failed", error)
                } finally { libraryQueued.decrementAndGet() }
            }
            staticInvoke(NuvioNative.REF_METADATA_LIBRARY_EFFECT, composer, listOf(cacheKey, state), block)
            image(art, !landscape) ?: nativeUrl
        } catch (error: Exception) {
            Log.e("SantodanMetadata", "Cannot apply library artwork", error); nativeUrl
        } finally { if (grouped) invoke(NuvioNative.REF_COMPOSER_P, composer, false) }
    }
    /** Classic/Grid callers retain their native image request, sizing and image-error fallback. */
    @JvmStatic fun image(item: Any, poster: Boolean): String? = try {
        selection(true)?.let { image(art(it, item), poster) }
    } catch (error: Exception) { Log.e("SantodanMetadata", "Cannot select Continue Watching artwork", error); null }

    /** A disk-restored enrichment must not prevent the native background job resolving the selected source. */
    @JvmStatic fun cached(value: Any?): Any? = try {
        val selected = selection(true)
        if (selected == null || value == null) value else {
            val info = if (value.javaClass.name == "ya.j9") value else field(value, "a")!!
            val progress = info.javaClass.name == "com.nuvio.tv.domain.model.WatchProgress"
            val id = if (progress) getter(info, "getContentId")!! else field(info, "a") as String
            val type = if (progress) getter(info, "getContentType")!! else field(info, "b") as String
            val cacheKey = key(selected, type, id)
            if (synchronized(artwork) { artwork.containsKey(cacheKey) } || coolingDown(cacheKey)) value else null
        }
    } catch (error: Exception) { Log.e("SantodanMetadata", "Cannot validate cached Continue Watching source", error); value }

    /** Rebuild only the transient carousel presentation; watch history remains native. */
    @JvmStatic fun decorate(card: Any, landscape: Boolean): Any = try {
        val selected = selection(true)
        if (selected == null) card else {
            val item = field(field(card, "f")!!, "g")!!
            val art = art(selected, item)
            val image = image(art, !landscape)
            if (art == null || image.isNullOrBlank()) card else {
                val hero = field(card, "e")!!
                val values = ('a'..'u').map { field(hero, it.toString()) }.toTypedArray()
                values[1] = art.logo ?: values[1]
                values[14] = art.poster ?: values[14]
                values[15] = art.background ?: values[15]
                values[16] = image
                val replacement = construct(NuvioNative.REF_METADATA_HERO, *values)
                construct(NuvioNative.REF_METADATA_CARD, field(card, "a"), field(card, "b"), field(card, "c"), image, replacement, field(card, "f"), field(card, "g"))
            }
        }
    } catch (error: Exception) { Log.e("SantodanMetadata", "Cannot apply Continue Watching artwork", error); card }
}
