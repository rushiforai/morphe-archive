package software.santodan.extension.nuviomerged

import android.app.Application
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Toast
import kotlin.coroutines.suspendCoroutine
import kotlin.coroutines.resume
import kotlin.coroutines.Continuation
import kotlinx.coroutines.withTimeout
import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import java.lang.reflect.Field
import java.lang.reflect.Method
import java.lang.reflect.Proxy
import java.util.ArrayList
import java.util.HashSet
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.emitAll
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.mapNotNull
import kotlinx.coroutines.flow.merge
import kotlinx.coroutines.runBlocking
import org.json.JSONArray
import org.json.JSONObject

/** Runtime bridge for the optional merged watch-progress snapshot. */
object NuvioMergedProgress {
    private const val TAG = "SantodanMergedProgress"
    private const val PREFS = "santodan_nuvio_merged_progress"
    private const val ENABLED = "enabled"
    private const val STRATEGY = "strategy"
    private const val RECENT = "recent"
    private const val SNAPSHOT = "snapshot_v2"
    private val methods = ConcurrentHashMap<Triple<Class<*>, String, Int>, Method>()
    private val fields = ConcurrentHashMap<Pair<Class<*>, String>, Field>()
    private val badgeWorker = java.util.concurrent.Executors.newSingleThreadExecutor { task ->
        Thread(task, "SantodanBadgeValidation").apply { isDaemon = true }
    }
    private val merging = AtomicBoolean(false)
    @Volatile private var activeCacheKey: String? = null
    private val refreshWorker = java.util.concurrent.Executors.newSingleThreadScheduledExecutor { task ->
        Thread(task, "SantodanMergedRefresh").apply { isDaemon = true }
    }
    private val refreshStarted = AtomicBoolean(false)
    @Volatile private var lastRefresh = 0L
    private val badgeHistories = java.util.Collections.synchronizedMap(
        java.util.WeakHashMap<Any, Map<String, Set<Any>>>())
    @Volatile private var repository: Any? = null
    @Volatile private var allProgressMethod = "q"
    @Volatile private var providerLayout = NuvioProviderLayout.forRepository("ja.md")
    @Volatile private var proxyRepository: Any? = null
    @Volatile private var providerProxy: Any? = null
    private val mergedProgress = MutableStateFlow<List<Any>>(emptyList())
    private val mergedNextUpSeeds = MutableStateFlow<List<Any>>(emptyList())
    private val mergedSnapshotReady = MutableStateFlow(false)
    private val watchedSnapshotReady = MutableStateFlow(false)
    private val mergedWatchedItems = MutableStateFlow<List<Any>>(emptyList())
    @Volatile private var mergedWatchedHistory: Map<String, Set<Any>> = emptyMap()
    @Volatile private var mergedShowSiblings: Map<String, Set<String>> = emptyMap()
    private val pendingBadgePublications = ConcurrentHashMap.newKeySet<Any>()
    private val authenticated = MutableStateFlow(true)
    private val originByContent = ConcurrentHashMap<String, String>()
    private val providerBySource = ConcurrentHashMap<String, Any>()

    @Volatile private var menuRevision: Any? = null
    private val configuring = AtomicBoolean(false)

    @JvmStatic fun registerSettingsStore(value: Any) { NuvioSettingsStoreResolver.registerStore(value) }
    @JvmStatic fun registerSettingsComponent(value: Any) { NuvioSettingsStoreResolver.registerComponent(value) }

    /** Uses the same native persistence route as Watch Progress, from the Layout submenu. */
    @JvmStatic fun renderSettings(composer: Any) {
        try {
            val loader = composer.javaClass.classLoader
            var revision = menuRevision
            if (revision == null) {
                revision = findMethod(loader.loadClass("g1.j"), "r", 1).invoke(null, 0)
                menuRevision = revision
            }
            findMethod(revision!!.javaClass, "getValue", 0).invoke(revision)
            renderMenuToggle(composer, "Merge tracking progress",
                "Combine Nuvio Sync and connected tracking providers.", enabled()) {
                configureMerge(!enabled(), preferences().getString(STRATEGY, "highest") ?: "highest")
            }
            renderMenuToggle(composer, "Prefer most recently updated progress",
                "When merging, use the latest update instead of the highest progress.",
                preferences().getString(STRATEGY, "highest") == RECENT) {
                configureMerge(enabled(), if (preferences().getString(STRATEGY, "highest") == RECENT) "highest" else RECENT)
            }
        } catch (error: Throwable) { Log.e(TAG, "Merged settings rendering failed", error) }
    }

    private fun renderMenuToggle(composer: Any, title: String, description: String, checked: Boolean, action: () -> Unit) {
        val loader = composer.javaClass.classLoader
        val function = loader.loadClass("kotlin.jvm.functions.Function0")
        fun callback(block: () -> Unit): Any = Proxy.newProxyInstance(loader, arrayOf(function)) { proxy, method, args ->
            when (method.name) {
                "invoke" -> { block(); Unit }
                "hashCode" -> System.identityHashCode(proxy)
                "equals" -> proxy === args?.firstOrNull()
                else -> "SantodanMergedSettingsCallback"
            }
        }
        findMethod(loader.loadClass("sa.eb"), "m", 13).invoke(null,
            title, description, checked, callback(action), null, callback {}, false, null, 0L, false, composer, 0, 1008)
    }

    private fun configureMerge(mergeEnabled: Boolean, strategy: String) {
        if (!configuring.compareAndSet(false, true)) return
        Thread({
            val wasEnabled = enabled()
            val oldStrategy = preferences().getString(STRATEGY, "highest") ?: "highest"
            try {
                if (!mergeEnabled && !wasEnabled) {
                    preferences().edit().putString(STRATEGY, strategy).commit()
                } else {
                    val store = NuvioSettingsStoreResolver.resolve()
                    val current = (field(store, "k").get(store) as StateFlow<*>).value as Enum<*>
                    val profile = field(store, "j").get(store)
                    val profileId = (field(profile, "f").get(profile) as StateFlow<*>).value
                    val previousKey = "previous_source_$profileId"
                    if (mergeEnabled && !wasEnabled)
                        preferences().edit().putString(previousKey, current.name).commit()
                    val wanted = if (mergeEnabled) {
                        if (strategy == RECENT) "MERGED_RECENT" else "MERGED_HIGHEST"
                    } else preferences().getString(previousKey, current.name) ?: current.name
                    val requested = current.javaClass.enumConstants.first { (it as Enum<*>).name == wanted }
                    val carrier = selectSource(requested)
                    runBlocking {
                        suspendCoroutine<Any?> { completion ->
                            val result = findMethod(store.javaClass, "f", 2).invoke(store, carrier,
                                NuvioSourceContinuation(completion))
                            if (result !== COROUTINE_SUSPENDED) completion.resume(result)
                        }
                    }
                    if (mergeEnabled) mergeAsync()
                }
            } catch (error: Throwable) {
                preferences().edit().putBoolean(ENABLED, wasEnabled).putString(STRATEGY, oldStrategy).commit()
                Log.e(TAG, "Merged settings update failed", error)
                Handler(Looper.getMainLooper()).post {
                    Toast.makeText(application(), "Could not update merged progress settings", Toast.LENGTH_SHORT).show()
                }
            } finally {
                configuring.set(false)
                refreshMenu()
            }
        }, "SantodanMergedSettings").apply { isDaemon = true }.start()
    }

    private fun refreshMenu() {
        Handler(Looper.getMainLooper()).post {
            val state = menuRevision ?: return@post
            val value = (findMethod(state.javaClass, "getValue", 0).invoke(state) as Number).toInt()
            findMethod(state.javaClass, "setValue", 1).invoke(state, value + 1)
        }
    }

    @JvmStatic fun registerRepository(value: Any) {
        repository = value
        providerLayout = NuvioProviderLayout.forRepository(value.javaClass.name)
        allProgressMethod = providerLayout.allProgressMethod
        Log.d(TAG, "Provider layout: interface=${providerLayout.providerInterface} allProgress=$allProgressMethod")
        if (refreshStarted.compareAndSet(false, true)) {
            refreshWorker.scheduleWithFixedDelay({
                runCatching {
                    if (enabled() && (activeCacheKey != snapshotKey() ||
                        System.nanoTime() - lastRefresh >= 120_000_000_000L)) mergeAsync()
                }.onFailure { Log.w(TAG, "Background refresh check failed", it) }
            }, 1L, 1L, java.util.concurrent.TimeUnit.SECONDS)
        }
        if (enabled()) {
            mergedSnapshotReady.value = true
            mergeAsync()
        }
    }

    /** Called from the repository's selected-provider mapper. */
    @JvmStatic fun mergedProvider(nativeProvider: Any?): Any? {
        if (!enabled()) return nativeProvider
        val repo = repository ?: return nativeProvider
        val existing = providerProxy
        if (existing != null && proxyRepository === repo) return existing
        synchronized(this) {
            providerProxy?.takeIf { proxyRepository === repo }?.let { return it }
            val providerInterface = repo.javaClass.classLoader.loadClass(providerLayout.providerInterface)
            // Keep Nuvio's currently selected provider visible until the first
            // merged refresh is ready. Starting these flows at empty makes Home
            // briefly remove every Continue Watching card on each app launch.
            val delegate = nativeProvider ?: firstProvider(repo)
            seedFromNativeProvider(delegate)
            val progressFlow = retainedFlow(delegate, allProgressMethod, mergedProgress)
            val nextUpFlow = retainedFlow(delegate, "f", mergedNextUpSeeds)
            val created = Proxy.newProxyInstance(repo.javaClass.classLoader, arrayOf(providerInterface)) { proxy, method, args ->
                when {
                    method.declaringClass == Any::class.java && method.name == "toString" -> "SantodanMergedProgressProvider"
                    method.declaringClass == Any::class.java && method.name == "hashCode" -> System.identityHashCode(proxy)
                    method.declaringClass == Any::class.java && method.name == "equals" -> proxy === args?.firstOrNull()
                    !enabled() && delegate != null -> method.invoke(delegate, *(args ?: emptyArray()))
                    method.parameterCount == 0 && method.name == "a" -> mergedIdentity(delegate)
                    // The obfuscated allProgress accessor differs by app version;
                    // f() remains nextUpSeeds. These must remain
                    // separate: completed history records are valid progress but
                    // must never be published wholesale as Continue Watching seeds.
                    method.parameterCount == 0 && method.name == allProgressMethod -> progressFlow
                    method.parameterCount == 0 && method.name == "f" -> nextUpFlow
                    method.parameterCount == 0 && method.name == "d" -> mergedWatchedItems
                    method.name == "g" && method.parameterCount == 1 ->
                        watchedProjection(args?.getOrNull(0), false, delegate)
                    method.name == providerLayout.siblingsMethod && method.parameterCount == 1 ->
                        watchedProjection(args?.getOrNull(0), true, delegate)
                    method.parameterCount == 0 && method.name == "b" -> authenticated
                    // Route provider-specific reconciliation back to the provider
                    // that supplied this show's winning Continue Watching seed.
                    method.name == "l" && method.parameterCount == 1 ->
                        providerForContent(args?.getOrNull(0)?.toString())?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: delegate?.let { method.invoke(it, *(args ?: emptyArray())) }
                    method.name == "i" && method.parameterCount == 2 ->
                        providerForProgress(args?.getOrNull(0))?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: delegate?.let { method.invoke(it, *(args ?: emptyArray())) }
                    method.name == "h" && method.parameterCount == 2 ->
                        providerForProgress(args?.getOrNull(0))?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: delegate?.let { method.invoke(it, *(args ?: emptyArray())) }
                    delegate != null -> method.invoke(delegate, *(args ?: emptyArray()))
                    else -> defaultValue(method.returnType)
                }
            }
            proxyRepository = repo
            providerProxy = created
            return created
        }
    }

    /** Called from effectiveWatchProgressSource; merged snapshots are read as Nuvio Sync. */
    @JvmStatic fun effectiveSource(requested: Any, isAuthenticated: Any): Any {
        val name = (requested as? Enum<*>)?.name
        when (name) {
            "MERGED_HIGHEST" -> preferences().edit().putBoolean(ENABLED, true).putString(STRATEGY, "highest").commit()
            "MERGED_RECENT" -> preferences().edit().putBoolean(ENABLED, true).putString(STRATEGY, RECENT).commit()
            else -> if (!enabled()) return requested
        }
        mergeAsync()
        val carrier = authenticatedCarrier(requested, isAuthenticated)
        Log.d(TAG, "effective merged carrier=${(carrier as? Enum<*>)?.name}")
        return carrier
    }

    @JvmStatic fun selectSource(requested: Any): Any {
        val name = (requested as? Enum<*>)?.name
        val merged = name == "MERGED_HIGHEST" || name == "MERGED_RECENT"
        preferences().edit()
            .putBoolean(ENABLED, merged)
            .putString(STRATEGY, if (name == "MERGED_RECENT") RECENT else "highest")
            .commit()
        Log.d(TAG, "selected source=$name merged=$merged")
        refreshMenu()
        if (merged) {
            mergeAsync()
        }
        return if (merged) {
            // Persist a real provider source so Nuvio creates an active provider.
            // mergedProvider() replaces that provider with the aggregate proxy.
            requested.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == "TRAKT" }
                ?: requested
        } else requested
    }

    @JvmStatic fun selectedSource(nativeSource: Any): Any {
        if (!enabled()) return nativeSource
        val wanted = if (preferences().getString(STRATEGY, "highest") == RECENT) "MERGED_RECENT" else "MERGED_HIGHEST"
        return nativeSource.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == wanted } ?: nativeSource
    }

    @JvmStatic fun appendEnum(array: Any, value: Any): Any {
        val length = java.lang.reflect.Array.getLength(array)
        val result = java.lang.reflect.Array.newInstance(array.javaClass.componentType, length + 1)
        System.arraycopy(array, 0, result, 0, length)
        java.lang.reflect.Array.set(result, length, value)
        return result
    }

    @JvmStatic fun appendMergedSources(original: List<Any>): List<Any> {
        val result = ArrayList(original)
        val enumClass = original.firstOrNull()?.javaClass ?: return result
        val additions = enumClass.enumConstants.orEmpty().filter {
            val name = (it as Enum<*>).name
            name == "MERGED_HIGHEST" || name == "MERGED_RECENT"
        }
        result.addAll(additions)
        Log.d(TAG, "picker append reached original=${original.size} additions=${additions.size}")
        return result
    }

    @JvmStatic fun displayLabel(source: Any): String = when ((source as? Enum<*>)?.name) {
        "MERGED_HIGHEST" -> "Merged - Highest progress"
        "MERGED_RECENT" -> "Merged - Most recently updated"
        "TRAKT" -> "Trakt"
        "SIMKL" -> "Simkl"
        "MDBLIST" -> "MDBList"
        else -> "Nuvio Sync"
    }

    /** The outer settings row already has Nuvio's correct native label. */
    @JvmStatic fun summaryLabel(source: Any, nativeLabel: String): String =
        if (enabled()) {
            if (preferences().getString(STRATEGY, "highest") == RECENT) "Merged - Most recently updated"
            else "Merged - Highest progress"
        } else nativeLabel

    private fun mergeAsync() {
        if (!enabled() || !merging.compareAndSet(false, true)) return
        lastRefresh = System.nanoTime()
        Thread({
            try {
                val cacheKey = snapshotKey()
                if (activeCacheKey != cacheKey) {
                    activeCacheKey = cacheKey
                    mergedProgress.value = emptyList()
                    mergedNextUpSeeds.value = emptyList()
                    mergedWatchedItems.value = emptyList()
                    mergedWatchedHistory = emptyMap()
                    mergedShowSiblings = emptyMap()
                    originByContent.clear()
                    watchedSnapshotReady.value = false
                    mergedSnapshotReady.value = true
                    restoreSnapshot(repository?.javaClass?.classLoader)
                }
                runBlocking { withTimeout(90_000L) { mergeSnapshot() } }
            }
            catch (error: Throwable) { Log.e(TAG, "Snapshot merge failed", error) }
            finally { merging.set(false) }
        }, "SantodanMergedProgress").apply { isDaemon = true }.start()
    }

    /** Complete native suspend getters only after the merged badge projection is ready. */
    @Suppress("UNCHECKED_CAST")
    private fun watchedProjection(completion: Any?, siblings: Boolean, delegate: Any?): Any? {
        return if (siblings) mergedShowSiblings else mergedWatchedHistory
    }

    @JvmStatic fun allowBadgeCacheHit(nativeHit: Boolean): Boolean {
        if (!enabled()) return nativeHit
        if (nativeHit) Log.d(TAG, "Retrying badge metadata despite unchanged watched IDs")
        return false
    }

    /** A persisted deadline cannot replace missing in-memory episode metadata. */
    @JvmStatic fun prepareBadgeValidation(home: Any) {
        if (!enabled()) return
        try {
            if (!watchedSnapshotReady.value || badgeHistories[home] == mergedWatchedHistory) return
            badgeHistories[home] = mergedWatchedHistory
            val cache = field(home, "T0").get(home) as Map<*, *>
            val holder = field(home, "u").get(home) ?: return
            synchronized(holder) {
                val deadlinesField = field(holder, "g")
                val deadlines = deadlinesField.get(holder) as Map<*, *>
                val retained = synchronized(cache) {
                    deadlines.filter { (id, _) -> cache["series:$id"] != null || cache["tv:$id"] != null }
                }
                if (retained.size != deadlines.size) {
                    deadlinesField.set(holder, retained)
                    Log.d(TAG, "Badge validation pending: missingMetadata=${deadlines.size - retained.size}")
                }
            }
        } catch (error: Throwable) { Log.e(TAG, "Badge validation preparation failed", error) }
    }

    /** Native badge loading normally publishes only after all metadata requests finish. */
    @JvmStatic fun publishCachedWatchedBadges(home: Any) {
        if (!enabled() || !watchedSnapshotReady.value || !pendingBadgePublications.add(home)) return
        Handler(Looper.getMainLooper()).postDelayed({
            badgeWorker.execute {
              try {
                if (!enabled()) return@execute
                val cache = field(home, "T0").get(home) as Map<*, *>
                findMethod(home.javaClass.classLoader.loadClass("la.t5"), "g", 2)
                    .invoke(null, home, mergedWatchedHistory)
                val holder = field(home, "u").get(home)
                val labels = (field(holder, "f").get(holder) as StateFlow<*>).value as Set<*>
                Log.d(TAG, "Badge validation progress: cached=${cache.size} watched=${mergedWatchedHistory.size} labels=${labels.size}")
              } catch (error: Throwable) { Log.e(TAG, "Incremental watched badge validation failed", error) }
              finally { pendingBadgePublications.remove(home) }
            }
        }, 500L)
    }

    private suspend fun invokeSuspending(target: Any, name: String): Any? = suspendCoroutine { completion ->
        val result = findMethod(target.javaClass, name, 1).invoke(target, NuvioSourceContinuation(completion))
        if (result !== COROUTINE_SUSPENDED) completion.resume(result)
    }

    @Suppress("UNCHECKED_CAST")
    private suspend fun mergeSnapshot() {
        val repo = repository ?: return
        val cacheKey = snapshotKey()
        val started = System.nanoTime()
        // NuvioTV 1.1.0-beta.2 constructor fields: a = WatchProgressPreferences,
        // j = ProfileManager, k = tracking providers.
        val registry = field(repo, "k").get(repo)
        val localStore = field(repo, "a").get(repo)
        val candidates = ArrayList<Any>()
        val localFlow = field(localStore, "q").get(localStore) as Flow<Any>
        val localItems = (localFlow.first() as? Collection<Any>).orEmpty()
        candidates.addAll(localItems)
        val sourceCounts = ArrayList<String>()
        val sourceItems = LinkedHashMap<String, Collection<Any>>()
        val sourceSeeds = LinkedHashMap<String, Collection<Any>>()
        val sourceWatched = LinkedHashMap<String, Map<String, Set<Any>>>()
        val sourceWatchedItems = LinkedHashMap<String, List<Any>>()
        val siblings = LinkedHashMap<String, MutableSet<String>>()
        val watchedStore = field(repo, "e").get(repo)
        val localWatched = (field(watchedStore, providerLayout.localWatchedField).get(watchedStore) as Flow<Any>)
            .first() as? List<Any> ?: emptyList()
        sourceWatchedItems["Nuvio Sync"] = localWatched
        sourceWatched["Nuvio Sync"] = localWatched.filter {
            findMethod(it.javaClass, "getSeason", 0).invoke(it) != null &&
                findMethod(it.javaClass, "getEpisode", 0).invoke(it) != null
        }
            .groupBy { findMethod(it.javaClass, "getContentId", 0).invoke(it).toString() }
            .mapValues { (_, items) -> items.map { number(it, "getSeason").toInt() to number(it, "getEpisode").toInt() }.toSet() }
        sourceCounts.add("Nuvio Sync=${localItems.size}")
        sourceItems["Nuvio Sync"] = localItems
        val providers = findMethod(registry.javaClass, "b", 0).invoke(registry) as Collection<Any>
        providerBySource.clear()
        for (provider in providers) {
            val authenticated = (findMethod(provider.javaClass, "b", 0).invoke(provider) as Flow<Any>).first() as? Boolean ?: false
            if (!authenticated) continue
            // Nuvio's provider implementations attach their remote Continue
            // Watching synchronization to nextUpSeeds.onStart. Collect this
            // before allProgress so a launch merge does not publish the stale
            // pre-refresh progress snapshot.
            val seeds = (findMethod(provider.javaClass, "f", 0).invoke(provider) as Flow<Any>).first() as? Collection<Any>
            val items = (findMethod(provider.javaClass, allProgressMethod, 0).invoke(provider) as Flow<Any>).first() as? Collection<Any>
            if (items != null) {
                val source = providerSource(provider)
                providerBySource[sourceName(source)] = provider
                sourceCounts.add("$source=${items.size}")
                sourceItems[source] = items
                candidates.addAll(items)
                sourceSeeds[source] = seeds.orEmpty()
                sourceWatched[source] = invokeSuspending(provider, "g") as? Map<String, Set<Any>> ?: emptyMap()
                sourceWatchedItems[source] = (findMethod(provider.javaClass, "d", 0).invoke(provider) as Flow<Any>)
                    .first() as? List<Any> ?: emptyList()
                val aliases = invokeSuspending(provider, providerLayout.siblingsMethod) as? Map<String, Set<String>> ?: emptyMap()
                for ((id, related) in aliases) {
                    if ("__ambiguous__" in related) {
                        siblings.getOrPut(id) { LinkedHashSet() }.addAll(related)
                        continue
                    }
                    val group = related + id
                    for (alias in group) siblings.getOrPut(alias) { LinkedHashSet() }.addAll(group - alias)
                }
                Log.d(TAG, "Watched source=$source shows=${sourceWatched[source]?.size} items=${sourceWatchedItems[source]?.size} aliases=${aliases.size}")
            }
        }
        Log.d(TAG, "Merge provider reads: ${(System.nanoTime() - started) / 1_000_000}ms")
        val seedIndex = sourceSeeds.mapValues { (_, seeds) -> seeds.groupBy(::showKey) }
        val recent = preferences().getString(STRATEGY, "highest") == RECENT
        val histories = LinkedHashMap<String, MutableList<Pair<String, List<Any>>>>()
        for ((source, items) in sourceItems) {
            for ((show, records) in items.groupBy(::showKey)) {
                histories.getOrPut(show) { ArrayList() }.add(source to records)
            }
        }
        // A provider's nextUpSeeds is its authoritative Continue Watching
        // projection. Include those shows even when no active playback record
        // exists in allProgress (the normal case for fully watched episodes whose
        // next aired episode should be offered).
        for ((source, seeds) in sourceSeeds) {
            for ((show, records) in seeds.groupBy(::showKey)) {
                if (histories[show].orEmpty().none { it.first == source }) {
                    histories.getOrPut(show) { ArrayList() }.add(source to emptyList())
                }
            }
        }
        val merged = ArrayList<Any>()
        val mergedSeeds = ArrayList<Any>()
        val origins = HashMap<String, String>()
        for ((show, choices) in histories) {
            val winner = choices.maxWithOrNull { left, right ->
                val leftScore = seedIndex[left.first]?.get(show).orEmpty().ifEmpty { left.second }
                val rightScore = seedIndex[right.first]?.get(show).orEmpty().ifEmpty { right.second }
                compareHistories(leftScore, rightScore, recent)
            } ?: continue
            val coherent = LinkedHashMap<String, Any>()
            for (item in winner.second) {
                val episode = key(item)
                val old = coherent[episode]
                if (old == null || better(item, old, recent)) coherent[episode] = item
            }
            merged.addAll(coherent.values)
            val winningSeeds = seedIndex[winner.first]?.get(show).orEmpty()
            mergedSeeds.addAll(winningSeeds)
            origins[show] = sourceName(winner.first)
        }
        if (cacheKey != snapshotKey()) return
        originByContent.clear()
        originByContent.putAll(origins)
        val badgeOrigins = origins.mapKeys { (show, _) -> show.substringAfter('|') }
        val badgeSources = NuvioWatchedHistory.sources(sourceWatched, badgeOrigins, siblings)
        val watchedHistory = NuvioWatchedHistory.select(sourceWatched, badgeSources, siblings)
        val watchedItems = sourceWatchedItems.flatMap { (source, items) -> items.filter { item ->
            val id = findMethod(item.javaClass, "getContentId", 0).invoke(item).toString()
            (badgeSources[id] ?: badgeOrigins[id] ?: source) == source
        } }.distinctBy(::key)
        mergedWatchedHistory = watchedHistory
        mergedShowSiblings = siblings.mapValues { (_, ids) -> ids.toSet() }
        Log.d(TAG, "Published watched badges: shows=${watchedHistory.size} items=${watchedItems.size} aliases=${siblings.size}")
        // Provider lists are individually ordered, but concatenating them leaves
        // every Trakt record ahead of Simkl/MDBList-only records. Nuvio limits
        // work near the front of this history, so restore a global activity order.
        val published = ArrayList(merged.sortedByDescending { number(it, "getLastWatched") })
        val publishedSeeds = ArrayList(mergedSeeds
            .distinctBy(::showKey)
            .sortedByDescending { number(it, "getLastWatched") })
        Handler(Looper.getMainLooper()).post {
            if (cacheKey != snapshotKey()) return@post
            mergedProgress.value = published
            mergedNextUpSeeds.value = publishedSeeds
            mergedWatchedItems.value = watchedItems
            watchedSnapshotReady.value = true
            mergedSnapshotReady.value = true
        }
        persistSnapshot(published, publishedSeeds, origins, watchedItems, cacheKey)
        Log.d(TAG, "Merge total: ${(System.nanoTime() - started) / 1_000_000}ms")
        Log.d(TAG, "Sources: ${sourceCounts.joinToString()}")
        Log.d(TAG, "Published ${merged.size} progress entries and ${publishedSeeds.size} next-up seeds for ${histories.size} shows from ${candidates.size} provider records")
    }

    private fun key(item: Any): String {
        fun value(name: String) = runCatching { findMethod(item.javaClass, name, 0).invoke(item) }.getOrNull()
        return listOf(value("getContentId"), value("getSeason"), value("getEpisode")).joinToString("|")
    }

    private fun showKey(item: Any): String {
        val id = runCatching { findMethod(item.javaClass, "getContentId", 0).invoke(item) }.getOrNull()
        val type = runCatching { findMethod(item.javaClass, "getContentType", 0).invoke(item) }.getOrNull()
        return "$type|$id"
    }

    private fun compareHistories(left: List<Any>, right: List<Any>, recent: Boolean): Int {
        fun score(records: List<Any>): Double = if (recent) {
            records.maxOfOrNull { number(it, "getLastWatched") } ?: 0.0
        } else {
            records.maxOfOrNull {
                number(it, "getSeason") * 1_000_000_000.0 +
                    number(it, "getEpisode") * 1_000_000.0 +
                    number(it, "getProgressPercent")
            } ?: 0.0
        }
        return score(left).compareTo(score(right))
    }

    private fun sourceName(raw: String): String = when (raw) {
        "cc", "tb" -> "Trakt"
        "l7", "a8" -> "Simkl"
        "d5", "q5" -> "MDBList"
        else -> raw
    }

    private fun providerSource(provider: Any): String {
        // Provider class names change between APK builds. Use the stable enum identity
        // for persisted origins and for routing each show's reconciliation calls.
        val identity = findMethod(provider.javaClass, "a", 0).invoke(provider) as? Enum<*>
        return when (identity?.name) {
            "TRAKT" -> "Trakt"
            "SIMKL" -> "Simkl"
            "MDBLIST" -> "MDBList"
            else -> sourceName(provider.javaClass.simpleName)
        }
    }

    @JvmStatic fun sourceForContent(contentId: String?): String? =
        if (contentId == null) null else originByContent.entries.firstOrNull { it.key.endsWith("|$contentId") }?.value

    @JvmStatic fun adjustContinueWatchingCutoff(nativeCutoff: Long?): Long? =
        if (enabled()) null else nativeCutoff

    @JvmStatic fun adjustNextUpSeedDecision(progress: Any, nativeDecision: Boolean): Boolean {
        if (!enabled()) return nativeDecision
        // Every item in mergedNextUpSeeds has already passed its origin
        // provider's policy. Re-running that policy through an obfuscated method
        // name is both redundant and unsafe because each implementation can be
        // optimized to a different method name.
        val progressKey = key(progress)
        return mergedNextUpSeeds.value.any { key(it) == progressKey } || nativeDecision
    }

    private fun providerForContent(contentId: String?): Any? =
        sourceForContent(contentId)?.let(providerBySource::get)

    private fun providerForProgress(progress: Any?): Any? {
        if (progress == null) return null
        val contentId = runCatching {
            findMethod(progress.javaClass, "getContentId", 0).invoke(progress)?.toString()
        }.getOrNull()
        return providerForContent(contentId)
    }

    private fun better(candidate: Any, current: Any, recent: Boolean): Boolean {
        return if (recent) number(candidate, "getLastWatched") > number(current, "getLastWatched")
        else {
            val candidateProgress = number(candidate, "getProgressPercentage").takeIf { it > 0 } ?: number(candidate, "getProgressPercent")
            val currentProgress = number(current, "getProgressPercentage").takeIf { it > 0 } ?: number(current, "getProgressPercent")
            candidateProgress > currentProgress || candidateProgress == currentProgress && number(candidate, "getLastWatched") > number(current, "getLastWatched")
        }
    }

    private fun number(item: Any, name: String): Double =
        (runCatching { findMethod(item.javaClass, name, 0).invoke(item) }.getOrNull() as? Number)?.toDouble() ?: 0.0

    @Suppress("UNCHECKED_CAST")
    private fun seedFromNativeProvider(provider: Any?) {
        if (provider == null) return
        runCatching {
            val progress = cachedCollection(provider, allProgressMethod)
            val seeds = cachedCollection(provider, "f")
            if (mergedProgress.value.isEmpty() && progress.isNotEmpty()) {
                mergedProgress.value = ArrayList(progress)
            }
            if (mergedNextUpSeeds.value.isEmpty() && seeds.isNotEmpty()) {
                mergedNextUpSeeds.value = ArrayList(seeds)
            }
            Log.d(TAG, "Preserved native snapshot: progress=${progress.size}, next-up=${seeds.size}")
        }.onFailure { error ->
            // A missing cache must not prevent the normal background merge.
            Log.w(TAG, "Unable to preserve native snapshot", error)
        }
    }

    private fun cachedCollection(provider: Any, methodName: String): Collection<Any> {
        val flow = findMethod(provider.javaClass, methodName, 0).invoke(provider)
        val cached = (flow as? StateFlow<*>)?.value
        return (cached as? Collection<*>)?.filterNotNull().orEmpty()
    }

    private fun persistSnapshot(progress: List<Any>, seeds: List<Any>, origins: Map<String, String>, watchedItems: List<Any>, cacheKey: String) {
        runCatching {
            val root = JSONObject()
                .put("progress", encodeItems(progress))
                .put("seeds", encodeItems(seeds))
            val encodedOrigins = JSONObject()
            origins.forEach(encodedOrigins::put)
            root.put("origins", encodedOrigins)
            val history = JSONObject()
            mergedWatchedHistory.forEach { (id, episodes) ->
                history.put(id, JSONArray().also { array -> episodes.forEach { episode ->
                    val pair = episode as Pair<*, *>
                    array.put(JSONArray(listOf(pair.first, pair.second)))
                } })
            }
            root.put("watchedHistory", history)
            val aliases = JSONObject()
            mergedShowSiblings.forEach { (id, ids) -> aliases.put(id, JSONArray(ids.toList())) }
            root.put("siblings", aliases)
            root.put("watchedItems", JSONArray().also { array -> watchedItems.forEach { item ->
                array.put(JSONObject().also { json -> WATCHED_GETTERS.forEach { getter ->
                    json.put(getter, findMethod(item.javaClass, getter, 0).invoke(item) ?: JSONObject.NULL)
                } })
            } })
            preferences().edit().putString(cacheKey, root.toString()).apply()
        }.onFailure { error -> Log.w(TAG, "Unable to persist merged snapshot", error) }
    }

    private fun restoreSnapshot(loader: ClassLoader?) {
        runCatching {
            val cacheKey = snapshotKey()
            val encoded = preferences().getString(cacheKey, null) ?: return
            val root = JSONObject(encoded)
            val model = requireNotNull(loader).loadClass("com.nuvio.tv.domain.model.WatchProgress")
            val progress = decodeItems(root.optJSONArray("progress"), model)
            val seeds = decodeItems(root.optJSONArray("seeds"), model)
            val history = root.optJSONObject("watchedHistory")
            val restoredHistory = history?.keys()?.asSequence()?.associateWith { id ->
                val array = history.getJSONArray(id)
                (0 until array.length()).map { index ->
                    val pair = array.getJSONArray(index)
                    (pair.getInt(0) to pair.getInt(1)) as Any
                }.toSet()
            }.orEmpty()
            val aliases = root.optJSONObject("siblings")
            val restoredSiblings = aliases?.keys()?.asSequence()?.associateWith { id ->
                val array = aliases.getJSONArray(id)
                (0 until array.length()).map { array.getString(it) }.toSet()
            }.orEmpty()
            val watched = root.optJSONArray("watchedItems")
            val restoredWatchedItems = if (watched != null && watched.length() > 0) {
                val constructor = loader.loadClass("com.nuvio.tv.domain.model.WatchedItem")
                    .declaredConstructors.single { it.parameterCount == 11 }
                (0 until watched.length()).map { index ->
                    val json = watched.getJSONObject(index)
                    constructor.newInstance(*WATCHED_GETTERS.map<String, Any?> { getter ->
                        when (getter) {
                            "getSeason", "getEpisode" -> json.nullableInt(getter)
                            "getWatchedAt" -> json.getLong(getter)
                            else -> json.nullableString(getter)
                        }
                    }.toTypedArray())
                }
            } else emptyList()
            if (cacheKey != snapshotKey()) return
            mergedWatchedHistory = restoredHistory
            mergedShowSiblings = restoredSiblings
            mergedWatchedItems.value = restoredWatchedItems
            watchedSnapshotReady.value = true
            mergedProgress.value = progress
            mergedNextUpSeeds.value = seeds
            val encodedOrigins = root.optJSONObject("origins")
            if (encodedOrigins != null) {
                val restoredOrigins = HashMap<String, String>()
                encodedOrigins.keys().forEach { key -> restoredOrigins[key] = encodedOrigins.getString(key) }
                originByContent.putAll(restoredOrigins)
            }
            mergedSnapshotReady.value = true
            Log.d(TAG, "Restored merged snapshot: progress=${progress.size}, next-up=${seeds.size}")
        }.onFailure { error ->
            preferences().edit().remove(snapshotKey()).apply()
            Log.w(TAG, "Unable to restore merged snapshot", error)
        }
    }

    private fun encodeItems(items: List<Any>): JSONArray = JSONArray().also { array ->
        items.forEach { item ->
            val json = JSONObject()
            SNAPSHOT_GETTERS.forEach { (key, getter) ->
                val value = runCatching { findMethod(item.javaClass, getter, 0).invoke(item) }.getOrNull()
                json.put(key, value ?: JSONObject.NULL)
            }
            val excluded = runCatching {
                findMethod(item.javaClass, "getExcludedNextUpSeasons", 0).invoke(item) as? Collection<*>
            }.getOrNull().orEmpty()
            json.put("excludedNextUpSeasons", JSONArray(excluded))
            array.put(json)
        }
    }

    private fun decodeItems(array: JSONArray?, model: Class<*>): ArrayList<Any> {
        val result = ArrayList<Any>()
        if (array == null) return result
        val constructor = model.declaredConstructors.single { it.parameterCount == 26 }.apply { isAccessible = true }
        for (index in 0 until array.length()) {
            val json = array.getJSONObject(index)
            val excluded = HashSet<Int>()
            json.optJSONArray("excludedNextUpSeasons")?.let { values ->
                for (item in 0 until values.length()) excluded.add(values.getInt(item))
            }
            val restored = constructor.newInstance(
                json.requiredString("contentId"), json.requiredString("contentType"),
                json.requiredString("name"), json.nullableString("poster"),
                json.nullableString("backdrop"), json.nullableString("logo"),
                json.requiredString("videoId"), json.nullableInt("season"),
                json.nullableInt("episode"), json.nullableString("episodeTitle"),
                json.getLong("position"), json.getLong("duration"), json.getLong("lastWatched"),
                json.nullableString("addonBaseUrl"), json.nullableFloat("progressPercent"),
                json.requiredString("source"), json.nullableLong("traktPlaybackId"),
                json.nullableInt("traktMovieId"), json.nullableInt("traktShowId"),
                json.nullableInt("traktEpisodeId"), json.nullableLong("simklPlaybackId"),
                json.nullableString("trackingProviderId"), json.nullableString("trackingProviderItemId"),
                json.nullableString("trackingSourceUrl"), json.nullableFloat("completionThresholdOverride"),
                excluded,
            )
            result.add(restored)
        }
        return result
    }

    private fun JSONObject.requiredString(key: String): String = getString(key)
    private fun JSONObject.nullableString(key: String): String? = if (isNull(key)) null else getString(key)
    private fun JSONObject.nullableInt(key: String): Int? = if (isNull(key)) null else getInt(key)
    private fun JSONObject.nullableLong(key: String): Long? = if (isNull(key)) null else getLong(key)
    private fun JSONObject.nullableFloat(key: String): Float? = if (isNull(key)) null else getDouble(key).toFloat()

    @Suppress("UNCHECKED_CAST")
    private fun retainedFlow(
        provider: Any?,
        methodName: String,
        merged: StateFlow<List<Any>>,
    ): Flow<List<Any>> {
        val native = runCatching {
            if (provider == null) null
            else findMethod(provider.javaClass, methodName, 0).invoke(provider) as? Flow<Any>
        }.getOrNull()
        if (native == null) return merged
        return flow {
            // Do not forward the provider's startup empty value. Nuvio keeps its
            // existing Home state until a provider has a real update; mirror that
            // behavior, then hand the stream over to the merged snapshot.
            val initial = merged.value.takeIf { it.isNotEmpty() } ?: merge(
                native.mapNotNull { value ->
                    (value as? Collection<*>)?.filterNotNull()?.takeIf { it.isNotEmpty() }
                },
                mergedSnapshotReady.filter { it }.map { merged.value },
            ).first()
            emit(initial)
            emitAll(merged)
        }
    }

    private fun firstProvider(repo: Any): Any? = runCatching {
        val registry = field(repo, "k").get(repo)
        (findMethod(registry.javaClass, "b", 0).invoke(registry) as? Collection<*>)?.firstOrNull()
    }.getOrNull()

    private fun mergedIdentity(delegate: Any?): Any? = runCatching {
        if (delegate == null) return@runCatching null
        val identity = findMethod(delegate.javaClass, "a", 0).invoke(delegate) ?: return@runCatching null
        if (identity !is Enum<*>) return@runCatching identity
        identity.javaClass.enumConstants?.firstOrNull {
            (it as Enum<*>).name == "NUVIO_SYNC"
        } ?: identity
    }.getOrNull()

    @Suppress("UNCHECKED_CAST")
    private fun authenticatedCarrier(requested: Any, predicate: Any): Any {
        return runCatching {
            val repo = repository ?: return@runCatching requested
            val registry = field(repo, "k").get(repo)
            val providers = findMethod(registry.javaClass, "b", 0).invoke(registry) as Collection<Any>
            val test = predicate as kotlin.Function1<Any, Any?>
            for (provider in providers) {
                val providerId = findMethod(provider.javaClass, "a", 0).invoke(provider) ?: continue
                if (test.invoke(providerId) == true) {
                    val name = (providerId as? Enum<*>)?.name ?: continue
                    requested.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == name }
                        ?.let { return@runCatching it }
                }
            }
            requested.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == "NUVIO_SYNC" } ?: requested
        }.getOrElse { error ->
            Log.e(TAG, "Unable to select merged provider carrier", error)
            requested.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == "NUVIO_SYNC" } ?: requested
        }
    }

    private fun defaultValue(type: Class<*>): Any? = when {
        type == java.lang.Boolean.TYPE -> false
        type == java.lang.Integer.TYPE -> 0
        type == java.lang.Long.TYPE -> 0L
        type == java.lang.Float.TYPE -> 0f
        type == java.lang.Double.TYPE -> 0.0
        type == java.lang.Void.TYPE -> null
        else -> null
    }

    private fun enabled() = preferences().getBoolean(ENABLED, false)
    private fun preferences() = application().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
    private fun application(): Application = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null) as Application
    private fun snapshotKey(): String {
        val repo = repository ?: return "${SNAPSHOT}_unavailable"
        val profile = field(repo, "j").get(repo)
        val id = (field(profile, "f").get(profile) as StateFlow<*>).value
        return "${SNAPSHOT}_$id"
    }
    private fun field(owner: Any, name: String): Field = fields.getOrPut(owner.javaClass to name) {
        owner.javaClass.getDeclaredField(name).apply { isAccessible = true }
    }
    private fun findMethod(owner: Class<*>, name: String, count: Int): Method =
        methods.getOrPut(Triple(owner, name, count)) {
            owner.declaredMethods.filter { it.name == name && it.parameterCount == count }
                .ifEmpty { owner.methods.filter { it.name == name && it.parameterCount == count } }
                .single().apply { isAccessible = true }
        }
    private val WATCHED_GETTERS = listOf("getContentId", "getContentType", "getTitle",
        "getSeason", "getEpisode", "getWatchedAt", "getPoster", "getReleaseInfo",
        "getTrackingProviderId", "getTrackingProviderItemId", "getTrackingSourceUrl")

    private val SNAPSHOT_GETTERS = linkedMapOf(
        "contentId" to "getContentId", "contentType" to "getContentType", "name" to "getName",
        "poster" to "getPoster", "backdrop" to "getBackdrop", "logo" to "getLogo",
        "videoId" to "getVideoId", "season" to "getSeason", "episode" to "getEpisode",
        "episodeTitle" to "getEpisodeTitle", "position" to "getPosition", "duration" to "getDuration",
        "lastWatched" to "getLastWatched", "addonBaseUrl" to "getAddonBaseUrl",
        "progressPercent" to "getProgressPercent", "source" to "getSource",
        "traktPlaybackId" to "getTraktPlaybackId", "traktMovieId" to "getTraktMovieId",
        "traktShowId" to "getTraktShowId", "traktEpisodeId" to "getTraktEpisodeId",
        "simklPlaybackId" to "getSimklPlaybackId", "trackingProviderId" to "getTrackingProviderId",
        "trackingProviderItemId" to "getTrackingProviderItemId", "trackingSourceUrl" to "getTrackingSourceUrl",
        "completionThresholdOverride" to "getCompletionThresholdOverride",
    )
}
