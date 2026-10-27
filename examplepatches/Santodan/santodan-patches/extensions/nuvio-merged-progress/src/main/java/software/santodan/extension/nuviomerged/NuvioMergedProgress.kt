package software.santodan.extension.nuviomerged

import software.santodan.nuvio.NuvioNative

import android.app.Application
import android.app.Activity
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.JsonReader
import android.util.JsonToken
import java.io.StringReader
import android.widget.Toast
import kotlin.coroutines.suspendCoroutine
import kotlin.coroutines.resume
import kotlin.coroutines.Continuation
import kotlinx.coroutines.withTimeout
import kotlinx.coroutines.withContext
import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import java.lang.reflect.Field
import java.lang.reflect.Method
import java.lang.reflect.Proxy
import java.util.ArrayList
import java.util.HashSet
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.emitAll
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.combine
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.flow.drop
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.mapNotNull
import kotlinx.coroutines.flow.merge
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.Job
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.launch
import org.json.JSONArray
import org.json.JSONObject

/** Runtime bridge for the optional merged watch-progress snapshot. */
object NuvioMergedProgress {
    private const val TAG = "SantodanMergedProgress"
    private const val PREFS = "santodan_nuvio_merged_progress"
    private const val ENABLED = "enabled"
    private const val SHOW_PROVIDER = "show_provider"
    private const val STRATEGY = "strategy"
    private const val RECENT = "recent"
    private const val SNAPSHOT = "snapshot_v2"
    private val methods = ConcurrentHashMap<Triple<Class<*>, String, Int>, Method>()
    private val fields = ConcurrentHashMap<Pair<Class<*>, String>, Field>()
    private val badgeWorker = java.util.concurrent.Executors.newSingleThreadExecutor { task ->
        Thread(task, "SantodanBadgeValidation").apply { isDaemon = true }
    }
    private val merging = AtomicBoolean(false)
    private val settingsReadLogged = AtomicBoolean(false)
    private val navigation = NuvioMergePolicy()
    private var navigationOwner: Any? = null
    private var navigationJob: Job? = null
    private var localProgressJob: Job? = null
    private var activity = java.lang.ref.WeakReference<Activity>(null)
    private var startupActivity = java.lang.ref.WeakReference<Activity>(null)
    @Volatile private var homePresented = false
    private var settingsExpanded = false
    @Volatile private var manualMerge = false
    @Volatile private var quickMerge = false
    @Volatile private var startupReconcile = false
    @Volatile private var mergeJob: Job? = null
    private val cancelRevision = java.util.concurrent.atomic.AtomicLong()
    @Volatile private var cancelledProfile: String? = null
    private val mergeWorkCheck = ThreadLocal<() -> Unit>()
    private val manualRequests = NuvioMergeWork.ManualRequests()
    private val homeRequests = NuvioMergeWork.HomeRequests()
    private var nativeHome = java.lang.ref.WeakReference<Any>(null)
    private val homePipelineGate = NuvioMergeWork.HomePipelineGate()
    @Volatile private var syncError = false
    @Volatile private var syncMessage = "Not synced yet"
    @Volatile private var syncProfile: String? = null
    @Volatile private var syncStep = 0
    @Volatile private var syncSteps = 1
    private var activeDialog: String? = null
    private var dialogProfile: String? = null
    @Volatile private var playbackPaused = false
    private val playbackRevision = java.util.concurrent.atomic.AtomicLong()
    private val deferredBadges = java.util.Collections.synchronizedMap(java.util.WeakHashMap<Any, Boolean>())
    @Volatile private var activeCacheKey: String? = null
    @Volatile private var cachedSnapshotAvailable = false
    @Volatile private var cachedSnapshotTime = 0L
    @Volatile private var cachedHistoryTime = 0L
    @Volatile private var cachedSnapshotValidated = false
    @Volatile private var cachedMembershipReady = false
    @Volatile private var forceFullSync = false
    private val providerObserverScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val badgeHistories = java.util.Collections.synchronizedMap(
        java.util.WeakHashMap<Any, Map<String, Set<Any>>>())
    @Volatile private var repository: Any? = null
    @Volatile private var allProgressMethod = "q"
    @Volatile private var providerLayout = NuvioProviderLayout.forRepository(NuvioNative.PROGRESS_REPOSITORY_NAME)
    @Volatile private var proxyRepository: Any? = null
    @Volatile private var providerProxy: Any? = null
    private val mergedProgress = MutableStateFlow<List<Any>>(emptyList())
    private val mergedNextUpSeeds = MutableStateFlow<List<Any>>(emptyList())
    private val mergedSnapshotReady = MutableStateFlow(false)
    private val watchedSnapshotReady = MutableStateFlow(false)
    private val mergedWatchedItems = MutableStateFlow<List<Any>>(emptyList())
    private val providerRevision = MutableStateFlow(0L)
    @Volatile private var mergedWatchedHistory: Map<String, Set<Any>> = emptyMap()
    @Volatile private var mergedShowSiblings: Map<String, Set<String>> = emptyMap()
    private val badgeDeltas = java.util.Collections.synchronizedMap(java.util.WeakHashMap<Any, NuvioBadgeDelta>())
    private val badgeRetryTimes = java.util.Collections.synchronizedMap(java.util.WeakHashMap<Any, Long>())
    private val retryBadgeCache = ThreadLocal<Boolean>()
    @Volatile private var lastBadgeLog = 0L
    private val pendingBadgePublications = ConcurrentHashMap.newKeySet<Any>()
    private val authenticated = MutableStateFlow(true)
    private val originByContent = ConcurrentHashMap<String, String>()
    private val providerBySource = ConcurrentHashMap<String, Any>()
    private val preparedProviderCard = ThreadLocal<Any>()
    private val providerResources = ConcurrentHashMap<String, Int>()

    @Volatile private var menuRevision: Any? = null
    private val configuring = AtomicBoolean(false)

    private inline fun startupStage(name: String, action: () -> Unit) {
        val started = System.nanoTime()
        Log.d(TAG, "Startup begin: stage=$name thread=${Thread.currentThread().name}")
        try { action() }
        finally { Log.d(TAG, "Startup end: stage=$name elapsedMs=${(System.nanoTime() - started) / 1_000_000}") }
    }

    @JvmStatic fun registerSettingsStore(value: Any) = startupStage("merge.settingsStore") { NuvioSettingsStoreResolver.registerStore(value) }
    @JvmStatic fun registerSettingsComponent(value: Any) = startupStage("merge.settingsComponent") { NuvioSettingsStoreResolver.registerComponent(value) }

    /** The same back-stack flow used by MainActivity, including actual player routes. */
    @JvmStatic fun activityResumed(value: Any) = startupStage("merge.activityResumed") {
        activity = java.lang.ref.WeakReference(value as Activity)
        navigation.foreground(true)
        observeHomePresentation(value)

        requestAutomaticSync()
        refreshSyncBanner()
    }

    /** beta.8 ComponentActivity's reporter sets f and invokes g under lock c. */
    private fun observeHomePresentation(owner: Activity) {
        if (startupActivity.get() === owner) return
        startupActivity = java.lang.ref.WeakReference(owner)
        homePresented = false
        runCatching {
            NuvioProviderRefresh.afterPresentation(owner) {
                if (startupActivity.get() === owner) {
                    homePresented = true
                    Log.d(TAG, "Startup Home presented; deferred history and automatic sync released")
                    requestAutomaticSync()
                }
            }
        }.onFailure { Log.e(TAG, "Unable to observe Home presentation; automatic startup work remains deferred", it) }
    }

    @JvmStatic fun activityPaused(value: Any) {
        if (activity.get() !== value) return
        navigation.foreground(false)
        playbackRevision.incrementAndGet()
        mergeJob?.cancel()
        NuvioSyncBanner.hide()
    }

    @JvmStatic fun activityDestroyed(value: Any) {
        if (activity.get() !== value) return
        activeDialog = null
        dialogProfile = null
        activity.clear()
        NuvioSyncBanner.hide()
        navigation.foreground(false)
        navigation.navigate(null)
        navigationJob?.cancel()
        navigationOwner = null
    }

    @JvmStatic fun registerNavigation(controller: Any) {
        if (navigationOwner === controller) return
        navigationOwner = controller
        navigationJob?.cancel()
        navigationJob = providerObserverScope.launch(Dispatchers.Main.immediate) {
            try {
                @Suppress("UNCHECKED_CAST")
                val entries = field(controller, "F").get(controller) as Flow<Any>
                entries.collect { entry ->
                    val destination = field(entry, "e").get(entry)
                    val route = field(destination, "o").get(destination) as? String
                    val previousRoute = navigation.revision()
                    val enteredHome = navigation.navigate(route)
                    if (navigation.revision() != previousRoute && activeDialog != null) dismissTrackingDialog()
                    val enteringPlayer = route?.startsWith("player/") == true
                    if (enteringPlayer && !playbackPaused) {
                        playbackRevision.incrementAndGet()
                        pauseHomePipeline()
                    }
                    playbackPaused = enteringPlayer
                    refreshSyncBanner()
                    if (!navigation.allowed(manualMerge)) mergeJob?.cancel()
                    if (enteredHome) {
                        resumeHomePipeline()
                        requestAutomaticSync()
                        val homes = synchronized(deferredBadges) {
                            deferredBadges.keys.toList().also { deferredBadges.clear() }
                        }
                        homes.forEach(::publishCachedWatchedBadges)
                    }
                }
            } catch (error: kotlinx.coroutines.CancellationException) { throw error }
            catch (error: Throwable) {
                navigation.navigate(null)
                navigation.foreground(false)
                playbackPaused = true
                mergeJob?.cancel()
                navigationOwner = null
                Log.e(TAG, "Navigation observation failed; automatic sync stays gated", error)
            }
        }
    }

    private fun requestAutomaticSync() {
        if (cancelledProfile == snapshotKey()) return
        if (merging.get()) return
        if (enabled() && homeRequests.claim(snapshotKey(), homePresented, navigation.allowed(false)))
            mergeAsync(true, preferences().getBoolean("quick_startup_sync", true) && !forceFullSync, NuvioMergePolicy.ReadTrigger.STARTUP)
    }

    /** beta.8 xa.s3.b assigns i1 after starting the native Home CW pipeline. */
    @JvmStatic fun homePipelineStarted(home: Any) {
        nativeHome = java.lang.ref.WeakReference(home)
        if (enabled() && playbackPaused) pauseHomePipeline()
    }

    private fun pauseHomePipeline() {
        if (!enabled()) return
        val home = nativeHome.get() ?: return
        try {
            if (homePipelineGate.pause(home, field(home, "i1").get(home) as? Job))
                Log.d(TAG, "Native Home CW pipeline paused for playback; cards retained")
        } catch (error: Throwable) { Log.e(TAG, "Unable to pause native Home CW pipeline", error) }
    }

    private fun resumeHomePipeline() {
        val home = nativeHome.get() ?: return
        if (!homePipelineGate.resume(home)) return
        try {
            findMethod(home.javaClass, "b", 1).invoke(null, home)
            Log.d(TAG, "Native Home CW pipeline resumed on Home")
        } catch (error: Throwable) { Log.e(TAG, "Unable to resume native Home CW pipeline", error) }
    }

    private fun trackingKey(name: String) = "${snapshotKey()}_$name"
    private fun mainTracking(): String {
        val previous = preferences().getString("previous_source_${snapshotKey().removePrefix("${SNAPSHOT}_")}", "NUVIO_SYNC")
        val initial = previous?.takeIf { it in setOf("NUVIO_SYNC", "TRAKT", "SIMKL", "MDBLIST") } ?: "NUVIO_SYNC"
        return preferences().getString(trackingKey("main"), initial) ?: initial
    }
    private fun selectedTrackings(): Set<String> =
        preferences().getStringSet(trackingKey("services"), setOf("NUVIO_SYNC", "TRAKT", "SIMKL", "MDBLIST"))!!.toSet() + mainTracking()
    private fun trackingLabel(id: String) = when (id) {
        "TRAKT" -> "Trakt"; "SIMKL" -> "Simkl"; "MDBLIST" -> "MDBList"; else -> "Nuvio Sync"
    }
    private fun providerId(provider: Any) =
        (findMethod(provider.javaClass, "a", 0).invoke(provider) as Enum<*>).name

    /** Native scrobbling keeps its authentication/error handling, but targets only the main service. */
    @JvmStatic fun playbackScrobblers(original: java.util.ArrayList<Any>): java.util.ArrayList<Any> =
        NuvioMergePolicy.scrobblers(original, enabled(), mainTracking(), ::providerId)

    @JvmStatic fun syncLocalProgress(original: Boolean): Boolean =
        NuvioMergePolicy.syncLocal(original, enabled(), mainTracking())

    private fun mainProvider(): Any? = repository?.let { repo ->
        val registry = field(repo, "k").get(repo)
        @Suppress("UNCHECKED_CAST")
        val providers = findMethod(registry.javaClass, "b", 0).invoke(registry) as Collection<Any>
        providers.firstOrNull { providerId(it) == mainTracking() }
    }

    @Volatile private var syncStartedNanos = 0L
    private fun syncElapsed(): String = "${((System.nanoTime() - syncStartedNanos).coerceAtLeast(0) / 100_000_000) / 10.0}s"
    private fun logSyncStage(stage: String, started: Long) {
        Log.d(TAG, "Sync stage: $stage elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
    }

    private fun updateSync(message: String, step: Int = syncStep, total: Int = syncSteps) {
        if (startupReconcile) return
        if (syncProfile != null && syncProfile != snapshotKey()) return
        syncMessage = if (syncStartedNanos != 0L &&
            (message.contains("Sync failed:") || message.startsWith("Sync deferred"))) "$message Elapsed ${syncElapsed()}." else message
        syncStep = step; syncSteps = total.coerceAtLeast(1)
        if (merging.get()) Log.d(TAG, "Sync status: step=$step/$total elapsed=${syncElapsed()} message=$syncMessage")
        Handler(Looper.getMainLooper()).post {
            refreshMenu()
            refreshSyncBanner()
        }
    }

    private fun refreshSyncBanner() {
        val owner = activity.get()
        if (owner == null || !homePresented || !navigation.allowed(true) || !enabled() || syncProfile != snapshotKey()) {
            NuvioSyncBanner.hide()
            return
        }
        NuvioSyncBanner.update(owner, syncMessage, syncStep, syncSteps, merging.get(), syncError, ::cancelSync)
    }

    /** Stop this request, including a cancellation made before its worker Job is assigned. */
    @JvmStatic fun cancelSync() {
        if (!merging.get()) return
        cancelledProfile = snapshotKey()
        cancelRevision.incrementAndGet()
        manualRequests.clear()

        mergeJob?.cancel()
        updateSync("Cancelling sync… Previous snapshot retained.")
    }

    /** Uses the same native persistence route as Watch Progress, from the Layout submenu. */
    @JvmStatic fun renderSettings(composer: Any) {
        try {
            val loader = composer.javaClass.classLoader
            var revision = menuRevision
            if (revision == null) {
                revision = findMethod(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, 0)
                menuRevision = revision
            }
            findMethod(revision!!.javaClass, "getValue", 0).invoke(revision)
            val toggle = menuCallback(loader) { settingsExpanded = !settingsExpanded; refreshMenu() }
            val body = Proxy.newProxyInstance(loader, arrayOf(loader.loadClass("kotlin.jvm.functions.Function3"))) { proxy, method, args ->
                when (method.name) {
                    "invoke" -> { renderTrackingSettings(args!![1]); Unit }
                    "hashCode" -> System.identityHashCode(proxy)
                    "equals" -> proxy === args?.firstOrNull()
                    else -> "SantodanTrackingContent"
                }
            }
            val content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(Int::class.javaPrimitiveType, Any::class.java,
                Boolean::class.javaPrimitiveType).newInstance(0x534d4750, body, true)
            findMethod(loader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "a", 11).invoke(null,
                "Tracking progress", "Merge services, choose the main tracker and sync", settingsExpanded,
                toggle, fieldStatic(loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME), "b"), null, null,
                menuCallback(loader) {}, content, composer, 0)
            renderTrackingDialog(composer)
        } catch (error: Throwable) { Log.e(TAG, "Merged settings rendering failed", error) }
    }

    private fun renderTrackingSettings(composer: Any) {
        try {
            renderMenuToggle(composer, "Merge tracking progress",
                "Combine Nuvio Sync and connected tracking providers.", enabled()) {
                configureMerge(!enabled(), preferences().getString(STRATEGY, "highest") ?: "highest")
            }
            renderMenuToggle(composer, "Prefer most recently updated progress",
                "When merging, use the latest update instead of the highest progress.",
                preferences().getString(STRATEGY, "highest") == RECENT) {
                configureMerge(enabled(), if (preferences().getString(STRATEGY, "highest") == RECENT) "highest" else RECENT)
            }
            renderMenuToggle(composer, "Show merged progress provider",
                "Show the selected provider's icon on Continue Watching cards.",
                preferences().getBoolean(SHOW_PROVIDER, false)) {
                preferences().edit().putBoolean(SHOW_PROVIDER, !preferences().getBoolean(SHOW_PROVIDER, false)).apply()
                refreshMenu()
            }
            renderMenuToggle(composer, "Quick startup sync",
                "Restore saved progress, then reconcile tracker updates without a forced full refresh.",
                preferences().getBoolean("quick_startup_sync", true), info = { openDialog("quick_info") }) {
                preferences().edit().putBoolean("quick_startup_sync", !preferences().getBoolean("quick_startup_sync", true)).apply()
                refreshMenu()
            }
            renderMenuAction(composer, "Main tracking: ${trackingLabel(mainTracking())}") { chooseMainTracking() }
            renderMenuAction(composer, "Services to merge: ${selectedTrackings().joinToString { trackingLabel(it) }}") { chooseTrackings() }
            renderMenuAction(composer, if (merging.get() && quickMerge) "Refresh all services now"
                else if (merging.get()) "Sync in progress" else "Sync now") { showSync() }
            if (merging.get()) renderMenuAction(composer, "Cancel sync", ::cancelSync)
            findMethod(composer.javaClass.classLoader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "e", 6).invoke(null,
                0, 4, composer, if (syncProfile == snapshotKey()) syncMessage else
                    preferences().getString(trackingKey("last_sync"), "Not synced yet"), null,
                fieldStatic(composer.javaClass.classLoader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME), "b"))
        } catch (error: Throwable) { Log.e(TAG, "Merged settings rendering failed", error) }
    }

    private fun menuCallback(loader: ClassLoader, action: () -> Unit): Any =
        Proxy.newProxyInstance(loader, arrayOf(loader.loadClass("kotlin.jvm.functions.Function0"))) { proxy, method, args ->
            when (method.name) {
                "invoke" -> { action(); Unit }
                "hashCode" -> System.identityHashCode(proxy)
                "equals" -> proxy === args?.firstOrNull()
                else -> "SantodanTrackingCallback"
            }
        }

    private fun renderMenuAction(composer: Any, title: String, action: () -> Unit) {
        val loader = composer.javaClass.classLoader
        findMethod(loader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "d", 6).invoke(null, title, menuCallback(loader, action),
            fieldStatic(loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME), "b"), menuCallback(loader) {}, composer, 0)
    }

    private fun openDialog(mode: String) {
        dialogProfile = snapshotKey()
        activeDialog = mode
        refreshMenu()
    }

    private fun dismissTrackingDialog() {
        activeDialog = null
        dialogProfile = null
        refreshMenu()
    }

    private fun chooseMainTracking() = openDialog("main")

    private fun chooseTrackings() = openDialog("services")

    private fun showSync() {
        if (!enabled()) { openDialog("disabled"); return }
        if (activeDialog == "sync") return
        openDialog("sync")
        cancelledProfile = null
        mergeAsync(true)
    }

    private fun renderTrackingDialog(composer: Any) {
        val mode = activeDialog ?: return
        if (dialogProfile != snapshotKey()) { dismissTrackingDialog(); return }
        val ids = listOf("NUVIO_SYNC", "TRAKT", "SIMKL", "MDBLIST")
        val profile = dialogProfile
        findMethod(composer.javaClass, "d0", 1).invoke(composer, 0x534d4757)
        try {
            if (mode == "main") {
                NuvioTrackingDialogs.picker(composer, "Main tracking service", ids, ids.map(::trackingLabel),
                    mainTracking(), { id ->
                        if (profile == snapshotKey()) {
                            preferences().edit().putString(trackingKey("main"), id).apply()
                            playbackRevision.incrementAndGet(); mergeJob?.cancel()

                            if (enabled()) configureMerge(true, preferences().getString(STRATEGY, "highest") ?: "highest")
                        }
                        dismissTrackingDialog()
                    }, ::dismissTrackingDialog)
            } else if (mode == "services") {
                NuvioTrackingDialogs.services(composer, ids, ids.map(::trackingLabel), selectedTrackings().toList(),
                    mainTracking(), { values ->
                        if (profile == snapshotKey()) {
                            preferences().edit().putStringSet(trackingKey("services"), values).apply()
                            forceFullSync = true
                            playbackRevision.incrementAndGet(); mergeJob?.cancel()

                        }
                        dismissTrackingDialog()
                    }, ::dismissTrackingDialog)
            } else {
                val title = when (mode) {
                    "disabled" -> "Tracking progress"
                    "quick_info" -> "Quick startup sync"
                    else -> "Sync tracking progress"
                }
                NuvioTrackingDialogs.dialog(composer, title, null, ::dismissTrackingDialog) { nested ->
                    // Subscribe inside the dialog composition too, so sync stages update while it is open.
                    menuRevision?.let { findMethod(it.javaClass, "getValue", 0).invoke(it) }
                    when (mode) {
                        "quick_info" -> {
                            NuvioTrackingDialogs.label(nested, "Shows saved Continue Watching and local playback changes immediately, then reconciles included trackers once at startup. Watching updates details and Continue Watching locally without another provider sync. Sync now refreshes included services. Native rate limits still apply. Cancel sync stops the current merge and keeps saved progress.")
                            NuvioTrackingDialogs.action(nested, "Close", ::dismissTrackingDialog)
                        }
                        "disabled" -> {
                            NuvioTrackingDialogs.label(nested, "Enable merged tracking progress before syncing.")
                            NuvioTrackingDialogs.action(nested, "Close", ::dismissTrackingDialog)
                        }
                        else -> {
                            NuvioTrackingDialogs.label(nested, if (syncProfile == snapshotKey()) syncMessage else
                                preferences().getString(trackingKey("last_sync"), "Not synced yet"))
                            NuvioTrackingDialogs.progress(nested, syncStep, syncSteps)
                            NuvioTrackingDialogs.label(nested, "Stage ${syncStep.coerceIn(0, syncSteps)} of $syncSteps")
                            if (merging.get()) NuvioTrackingDialogs.action(nested, "Cancel sync", ::cancelSync)
                            else NuvioTrackingDialogs.action(nested, "Sync now") {
                                cancelledProfile = null
                                mergeAsync(true)
                            }
                            NuvioTrackingDialogs.action(nested, "Close", ::dismissTrackingDialog)
                        }
                    }
                }
            }
        } finally { findMethod(composer.javaClass, "p", 1).invoke(composer, false) }
    }

    @JvmStatic fun prepareProviderBadge(card: Any) { preparedProviderCard.set(card) }

    /** Render with Nuvio's existing image loader and bundled artwork; no remote requests. */
    @JvmStatic fun renderProviderBadge(composer: Any) {
        val card = preparedProviderCard.get()
        preparedProviderCard.remove()
        try {
            findMethod(composer.javaClass, "d0", 1).invoke(composer, 1403088901)
            try {
                val loader = composer.javaClass.classLoader
                val revision = menuRevision ?: findMethod(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1)
                    .invoke(null, 0).also { menuRevision = it }
                findMethod(revision.javaClass, "getValue", 0).invoke(revision)
                if (!enabled() || !preferences().getBoolean(SHOW_PROVIDER, false)) return
                val source = NuvioProviderBadge.source(card, originByContent) ?: return
                val resource = NuvioProviderBadge.resource(source) ?: return
                val app = application()
                val resourceId = providerResources.getOrPut(resource) {
                    val resourcePackage = app.resources.getResourcePackageName(app.applicationInfo.icon)
                    app.resources.getIdentifier(resource.substringAfter('/'), resource.substringBefore('/'), resourcePackage)
                }
                if (resourceId == 0) return
                val modifierType = loader.loadClass(NuvioNative.MODIFIER_NAME)
                var modifier = fieldStatic(loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME), "b")
                val scope = fieldStatic(loader.loadClass("e0.v"), "a")
                modifier = findMethod(scope.javaClass, "a", 2).invoke(scope, modifier,
                    fieldStatic(loader.loadClass(NuvioNative.ALIGNMENTS_NAME), "i"))
                val layer = loader.loadClass(NuvioNative.GRAPHICS_MODIFIER_NAME).getDeclaredConstructor(Float::class.javaPrimitiveType)
                    .apply { isAccessible = true }.newInstance(10f)
                modifier = modifierType.getMethod("d", modifierType).invoke(modifier, layer)
                modifier = findMethod(loader.loadClass("e0.b"), "u", 2).invoke(null, modifier, 6f)
                modifier = findMethod(loader.loadClass("y.m"), "g", 3).invoke(null, modifier,
                    0xcc10101000000000UL.toLong(), fieldStatic(loader.loadClass("e2.g0"), "b"))
                modifier = findMethod(loader.loadClass("e0.b"), "u", 2).invoke(null, modifier, 4f)
                modifier = findMethod(loader.loadClass("androidx.compose.foundation.layout.b"), "n", 2)
                    .invoke(null, modifier, 24f)
                findMethod(loader.loadClass(NuvioNative.POSTER_IMAGE_NAME), "b", 15).invoke(null,
                    "android.resource://${app.packageName}/$resourceId", "Progress from $source", modifier,
                    null, null, null, null, null, fieldStatic(loader.loadClass(NuvioNative.ALIGNMENTS_NAME), "e"),
                    fieldStatic(loader.loadClass("v2.l"), "b"), 1f, composer, 0, 0, 2552)
            } finally { findMethod(composer.javaClass, "p", 1).invoke(composer, false) }
        } catch (error: Throwable) { Log.e(TAG, "Provider badge rendering failed", error) }
    }

    private fun fieldStatic(owner: Class<*>, name: String): Any =
        fields.getOrPut(owner to name) { owner.getDeclaredField(name).apply { isAccessible = true } }.get(null)!!

    private fun renderMenuToggle(composer: Any, title: String, description: String, checked: Boolean,
                                 info: () -> Unit = {}, action: () -> Unit) {
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
        // Bit 32 would replace the supplied info callback with the native default.
        findMethod(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "m", 13).invoke(null,
            title, description, checked, callback(action), null, callback(info), false, null, 0L, false, composer, 0, 976)
    }

    private fun configureMerge(mergeEnabled: Boolean, strategy: String) {
        forceFullSync = true
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

    @JvmStatic fun registerRepository(value: Any) = startupStage("merge.repository") {
        repository = value
        providerLayout = NuvioProviderLayout.forRepository(value.javaClass.name)
        localProgressJob?.cancel()
        localProgressJob = providerObserverScope.launch {
            var observed: String? = null
            var loading: Job? = null
            try {
                @Suppress("UNCHECKED_CAST")
                val profiles = field(field(value, "j").get(value), "f").get(field(value, "j").get(value)) as Flow<Any>
                profiles.distinctUntilChanged().collect { id ->
                    val key = "${SNAPSHOT}_$id"
                    if ((observed != null && observed != key) || (syncProfile != null && syncProfile != key)) {
                        // Invalidate even an A -> B -> A transition while an old provider read is suspended.
                        playbackRevision.incrementAndGet()
                        mergeJob?.cancel()
                    }
                    observed = key
                    loading?.cancel()
                    loading = launch {
                        try {
                            if (enabled()) {
                                ensureSnapshotLoaded()
                                NuvioPlaybackBridge.load(key)
                                if (key == snapshotKey()) {
                                    NuvioPlaybackBridge.changed()
                                    requestAutomaticSync()
                                }
                            }
                        } catch (error: kotlinx.coroutines.CancellationException) { throw error }
                        catch (error: Exception) { Log.w(TAG, "Local profile cache unavailable; native records retained", error) }
                    }
                }
            } catch (error: kotlinx.coroutines.CancellationException) { throw error }
            catch (error: Throwable) { Log.w(TAG, "Local playback profile observation failed", error) }
        }
        NuvioStartupActivity.profile(snapshotKey().removePrefix("${SNAPSHOT}_"))
        providerLayout = NuvioProviderLayout.forRepository(value.javaClass.name)
        allProgressMethod = providerLayout.allProgressMethod
        Log.d(TAG, "Provider layout: interface=${providerLayout.providerInterface} allProgress=$allProgressMethod")
        if (enabled()) {

            requestAutomaticSync()
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
            val delegate = mainProvider()
            val identityDelegate = delegate ?: nativeProvider ?: firstProvider(repo)
            seedFromNativeProvider(delegate)
            val progressFlow = retainedFlow(mergedProgress)
            val nextUpFlow = retainedFlow(mergedNextUpSeeds)
            val created = Proxy.newProxyInstance(repo.javaClass.classLoader, arrayOf(providerInterface)) { proxy, method, args ->
                when {
                    method.declaringClass == Any::class.java && method.name == "toString" -> "SantodanMergedProgressProvider"
                    method.declaringClass == Any::class.java && method.name == "hashCode" -> System.identityHashCode(proxy)
                    method.declaringClass == Any::class.java && method.name == "equals" -> proxy === args?.firstOrNull()
                    !enabled() && delegate != null -> method.invoke(delegate, *(args ?: emptyArray()))
                    // Playback-side optimistic updates must follow the authoritative tracker.
                    method.name == providerLayout.progressWriteMethod && method.parameterCount == 2 ->
                        mainProvider()?.let { method.invoke(it, *(args ?: emptyArray())) }
                    method.parameterCount == 0 && method.name == "a" -> mergedIdentity(identityDelegate)
                    // The obfuscated allProgress accessor differs by app version;
                    // f() remains nextUpSeeds. These must remain
                    // separate: completed history records are valid progress but
                    // must never be published wholesale as Continue Watching seeds.
                    method.parameterCount == 0 && method.name == allProgressMethod -> progressFlow
                    method.parameterCount == 0 && method.name == "f" -> nextUpFlow
                    method.parameterCount == 0 && method.name == "d" -> visibleWatchedItems()
                    method.name == "g" && method.parameterCount == 1 ->
                        watchedProjection(args?.getOrNull(0), false, delegate)
                    method.name == providerLayout.siblingsMethod && method.parameterCount == 1 ->
                        watchedProjection(args?.getOrNull(0), true, delegate)
                    method.parameterCount == 0 && method.name == "b" -> authenticated
                    method.parameterCount == 0 && method.name == providerLayout.snapshotReadyMethod -> mergedSnapshotReady
                    method.parameterCount == 0 && method.name == "j" -> visibleWatchedItems().map { items ->
                        items.filter { findMethod(it.javaClass, "getContentType", 0).invoke(it) == "movie" }
                            .map { findMethod(it.javaClass, "getContentId", 0).invoke(it).toString() }.toSet()
                    }
                    method.name == providerLayout.itemProgressMethod && method.parameterCount == 2 ->
                        combine(retainedFlow(mergedProgress), visibleWatchedItems()) { progress, items ->
                            val entry = progress.firstOrNull {
                                findMethod(it.javaClass, "getContentId", 0).invoke(it) == args?.getOrNull(0) &&
                                    findMethod(it.javaClass, "getSeason", 0).invoke(it) == null
                            }
                            val completed = entry?.let {
                                findMethod(it.javaClass, "isCompleted\$default", 4).invoke(null, it, 0f, 1, null) == true
                            } == true
                            if (entry != null && !completed && (number(entry, "getPosition") > 0 || number(entry, "getProgressPercent") > 0)) false
                            else completed || items.any { findMethod(it.javaClass, "getContentId", 0).invoke(it) == args?.getOrNull(0) &&
                                findMethod(it.javaClass, "getSeason", 0).invoke(it) == null }
                        }
                    delegate == null && method.name == "c" && method.parameterCount == 2 -> args?.getOrNull(0)
                    // Route provider-specific reconciliation back to the provider
                    // that supplied this show's winning Continue Watching seed.
                    method.name == "l" && method.parameterCount == 1 ->
                        providerFlow(args)
                    method.name == "i" && method.parameterCount == 2 ->
                        if (localSeed(args?.getOrNull(0))) true else providerForProgress(args?.getOrNull(0))?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: delegate?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: mergedNextUpSeeds.value.any { key(it) == args?.getOrNull(0)?.let(::key) }
                    method.name == "h" && method.parameterCount == 2 ->
                        if (localSeed(args?.getOrNull(0))) args?.getOrNull(0) else providerForProgress(args?.getOrNull(0))?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: delegate?.let { method.invoke(it, *(args ?: emptyArray())) }
                            ?: args?.getOrNull(0)
                    delegate != null -> method.invoke(delegate, *(args ?: emptyArray()))
                    else -> defaultValue(method.returnType)
                }
            }
            proxyRepository = repo
            providerProxy = created
            return created
        }
    }

    /** Cached merged history also owns episode details; native per-show flows launch detached fetches. */
    private fun providerFlow(args: Array<out Any?>?): Flow<Any?> =
        flow {
            withContext(Dispatchers.IO) { ensureSnapshotLoaded(); NuvioPlaybackBridge.load(snapshotKey()) }
            val id = args?.getOrNull(0)?.toString().orEmpty()
            val profile = snapshotKey()
            val projection = NuvioMergeWork.EpisodeProjection<Any>()
            val model = requireNotNull(repository).javaClass.classLoader.loadClass("com.nuvio.tv.domain.model.WatchProgress")
            val constructor = model.declaredConstructors.single { it.parameterCount == 26 }
            val source = model.getField("SOURCE_REMOTE_HISTORY").get(null)
            emitAll(combine(mergedProgress, providerRevision, NuvioPlaybackBridge.revision) { items, _, _ ->
                if (snapshotKey() != profile || activeCacheKey != profile) return@combine emptyMap<Pair<Int, Int>, Any>()
                val lookup = id.removePrefix("imdb:")
                val ids = linkedSetOf(id, lookup)
                val siblings = mergedShowSiblings[id] ?: mergedShowSiblings[lookup].orEmpty()
                if ("__ambiguous__" !in siblings) ids.addAll(siblings)
                // Keep the selected provider's numbering; aliases are lookup fallbacks, not histories to union.
                val watched = ids.firstNotNullOfOrNull { visibleHistory()[it] }.orEmpty()
                    .filterIsInstance<Pair<Int, Int>>().toSet()
                val progress = items.filter { findMethod(it.javaClass, "getContentId", 0).invoke(it) in ids }
                    .filter { findMethod(it.javaClass, "getSeason", 0).invoke(it) != null &&
                        findMethod(it.javaClass, "getEpisode", 0).invoke(it) != null }
                    .associateBy { number(it, "getSeason").toInt() to number(it, "getEpisode").toInt() }
                val baseline = projection.snapshot(watched, progress) { (season, episode) ->
                    // Read-only detail projection. These records never become CW seeds or tracker writes.
                    constructor.newInstance(id, "series", id, null, null, null, "$id:$season:$episode",
                        season, episode, null, 1L, 1L, 0L, null, 100f, source,
                        null, null, null, null, null, null, null, null, null, emptySet<Int>())
                }
                NuvioPlaybackBridge.overlay.details(baseline, id, NuvioPlaybackBridge.entries(profile), mergedShowSiblings)
            }.distinctUntilChanged())
        }.flowOn(Dispatchers.Default)

    /** Called from effectiveWatchProgressSource; merged snapshots are read as Nuvio Sync. */
    @JvmStatic fun effectiveSource(requested: Any, isAuthenticated: Any): Any {
        val name = (requested as? Enum<*>)?.name
        when (name) {
            "MERGED_HIGHEST" -> preferences().edit().putBoolean(ENABLED, true).putString(STRATEGY, "highest").commit()
            "MERGED_RECENT" -> preferences().edit().putBoolean(ENABLED, true).putString(STRATEGY, RECENT).commit()
            else -> if (!enabled()) return requested
        }
        requestAutomaticSync()
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
        providerProxy = null
        proxyRepository = null
        refreshMenu()
        if (merged) {
            mergeAsync()
        }
        return if (merged) {
            // Persist a real provider source so Nuvio creates an active provider.
            // mergedProvider() replaces that provider with the aggregate proxy.
            requested.javaClass.enumConstants.firstOrNull { (it as Enum<*>).name == mainTracking() }
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

    private fun mergeAsync(manual: Boolean = false, quick: Boolean = false,
                           trigger: NuvioMergePolicy.ReadTrigger = NuvioMergePolicy.ReadTrigger.USER_SYNC) {
        if (!NuvioMergePolicy.readsProviders(trigger)) return
        val userSync = manual && trigger == NuvioMergePolicy.ReadTrigger.USER_SYNC
        val dispatchedCancel = cancelRevision.get()
        // Implicit requests are the same full sync as the button, released only after Home.
        if (!manual) { requestAutomaticSync(); return }
        if (!navigation.allowed(userSync)) {
            homeRequests.finish(snapshotKey(), true)

            return
        }
        if (!enabled()) return
        if (!merging.compareAndSet(false, true)) {
            if (manual && (!manualMerge || syncProfile != snapshotKey() || (!quick && quickMerge))) {
                manualRequests.offer(snapshotKey())
                updateSync("Waiting for the background sync to stop before starting manual sync.")
                mergeJob?.cancel()
            }
            return
        }
        manualMerge = userSync
        startupReconcile = false
        quickMerge = quick && cachedSnapshotValidated
        syncError = false
        val dispatchedNavigation = navigation.revision()
        val dispatchedProfile = snapshotKey()
        val dispatchedPlayback = playbackRevision.get()
        syncProfile = dispatchedProfile
        syncStartedNanos = System.nanoTime()

        updateSync(if (quick) "Starting quick sync…" else "Starting full sync…", 0, 1)
        Thread({
            try {
                runBlocking {
                    mergeJob = coroutineContext[Job]
                    try {
                        var checks = 0
                        NuvioMergeWork.stages({
                            cancelRevision.get() == dispatchedCancel && navigation.current(dispatchedNavigation, userSync) && playbackRevision.get() == dispatchedPlayback &&
                                (++checks % 128 != 1 || (enabled() && snapshotKey() == dispatchedProfile))
                        }, if (userSync) 0 else 1_500, refreshMs = if (userSync) 180_000 else 90_000,
                        prepare = { checkpoint ->
                            mergeWorkCheck.set(checkpoint)
                            try {
                                checkpoint()
                                updateSync("Loading saved progress…", 1, if (quick) 3 else selectedTrackings().size + 3)
                                ensureSnapshotLoaded()
                                checkpoint()
                                restoreLegacyStartupSnapshot(checkpoint)
                                checkpoint()
                                migrateSnapshotStorage()
                                logSyncStage("prepare", syncStartedNanos)
                                checkpoint()
                                // A successful refresh supplies complete history. Do not decode thousands
                                // of stale watched models only to replace them immediately afterwards.
                            } finally { mergeWorkCheck.remove() }
                        }, refresh = { checkpoint ->
                            mergeWorkCheck.set(checkpoint)
                            try {
                                if (quick && cachedSnapshotAvailable && cachedSnapshotValidated) {
                                    quickSnapshot(checkpoint)
                                    checkpoint()
                                    // Exactly one startup reconciliation, never an observer/navigation catch-up.
                                    val quickSummary = syncMessage
                                    updateSync("Checking included trackers once for this startup...", 3, 3)
                                    startupReconcile = true
                                    refreshSyncBanner()
                                    try { mergeSnapshot(refreshProviders = false) }
                                    finally { startupReconcile = false; updateSync(quickSummary, 3, 3) }

                                }
                                else {
                                    quickMerge = false
                                    if (quick) updateSync("Validating saved tracker data with a full sync…", 1)
                                    mergeSnapshot()
                                }
                            } finally { mergeWorkCheck.remove() }
                        })
                    } finally { mergeJob = null }
                }
            }
            catch (error: kotlinx.coroutines.CancellationException) {
                if (cancelRevision.get() != dispatchedCancel) {

                    updateSync("Sync cancelled. Previous snapshot retained.")
                }
                else if (error is kotlinx.coroutines.TimeoutCancellationException) handleMergeFailure(error, dispatchedProfile, userSync)
                else {

                    Log.d(TAG, "Merge work deferred; cached snapshot retained")
                    updateSync("Sync stopped. Previous snapshot retained. Use Sync now to retry.")
                }
            }
            catch (error: Throwable) {
                if (trigger == NuvioMergePolicy.ReadTrigger.STARTUP && quick) Log.w(TAG, "Startup reconciliation failed; previous snapshot retained", error)
                else handleMergeFailure(error, dispatchedProfile, userSync)
            }
            finally {
                homeRequests.finish(dispatchedProfile, false)
                quickMerge = false
                startupReconcile = false
                merging.set(false); refreshMenu()
                refreshSyncBanner()
                if (cancelRevision.get() != dispatchedCancel) Unit
                else if (manualRequests.take(snapshotKey())) mergeAsync(true)
                else if (navigation.revision() != dispatchedNavigation || dispatchedProfile != snapshotKey()) requestAutomaticSync()
            }
        }, "SantodanMergedProgress").apply { isDaemon = true }.start()
    }

    private fun handleMergeFailure(error: Throwable, dispatchedProfile: String, manual: Boolean) {
        if (cancelledProfile == dispatchedProfile) {
            updateSync("Sync cancelled. Previous snapshot retained.")
            return
        }
        syncError = true
        Log.e(TAG, "Snapshot merge failed", error)

        val failedStage = syncMessage
        var fallback = false
        if (dispatchedProfile == snapshotKey() && navigation.allowed(manual) && !watchedSnapshotReady.value) {
            val navigationRevision = navigation.revision()
            runCatching {
                runBlocking {
                    mergeJob = coroutineContext[Job]
                    try {
                        withTimeout(60_000L) {
                            NuvioMergeWork.run({ cancelledProfile != dispatchedProfile && navigation.current(navigationRevision, manual) &&
                                dispatchedProfile == snapshotKey() && enabled() }) { checkpoint ->
                                mergeWorkCheck.set(checkpoint)
                                try { restoreWatchedSnapshot(repository?.javaClass?.classLoader, checkpoint) }
                                finally { mergeWorkCheck.remove() }
                            }
                        }
                    } finally { mergeJob = null }
                }
            }.onFailure { Log.w(TAG, "Cached history fallback unavailable", it) }
        }
        if (dispatchedProfile == snapshotKey() && navigation.allowed(manual) &&
            mergedProgress.value.isEmpty() && mergedNextUpSeeds.value.isEmpty() && mergedWatchedItems.value.isEmpty()) {
            runCatching {
                val navigationRevision = navigation.revision()
                runBlocking {
                    mergeJob = coroutineContext[Job]
                    try {
                        withTimeout(15_000L) {
                            NuvioMergeWork.run({ cancelledProfile != dispatchedProfile && navigation.current(navigationRevision, manual) &&
                                dispatchedProfile == snapshotKey() && enabled() }) { checkpoint ->
                                mergeWorkCheck.set(checkpoint)
                                try { mergeSnapshot(true) } finally { mergeWorkCheck.remove() }
                            }
                        }
                    } finally { mergeJob = null }
                }
                fallback = syncMessage.startsWith("Main tracker fallback")
            }.onFailure { Log.w(TAG, "Main tracking fallback unavailable", it) }
        }
        updateSync("$failedStage\nSync failed: ${error.cause?.message ?: error.message ?: error.javaClass.simpleName}. " +
            if (fallback) "Using the main tracker's snapshot." else "Previous snapshot retained.")
    }

    /** Complete native suspend getters only after the merged badge projection is ready. */
    @Suppress("UNCHECKED_CAST")
    private fun watchedProjection(completion: Any?, siblings: Boolean, delegate: Any?): Any? {
        return if (siblings) mergedShowSiblings else visibleHistory()
    }

    /** Other patches need full history even when native incremental publication uses a delta. */
    @JvmStatic fun completeWatchedHistory(native: Map<*, *>): Map<*, *> =
        if (enabled() && (cachedMembershipReady || watchedSnapshotReady.value || NuvioPlaybackBridge.entries(snapshotKey()).isNotEmpty())) visibleHistory() else native

    @JvmStatic fun allowBadgeCacheHit(nativeHit: Boolean): Boolean {
        val retry = retryBadgeCache.get() == true
        retryBadgeCache.remove()
        return NuvioProviderRefresh.badgeCacheHit(nativeHit, enabled(), watchedSnapshotReady.value, playbackPaused, retry)
    }

    /** A persisted deadline cannot replace missing in-memory episode metadata. */
    @JvmStatic fun prepareBadgeValidation(home: Any) {
        retryBadgeCache.set(false)
        if (enabled() && !cachedMembershipReady && !watchedSnapshotReady.value) deferredBadges[home] = true
        if (!enabled() || !watchedSnapshotReady.value) return
        if (playbackPaused) { deferredBadges[home] = true; return }
        try {
            val now = System.nanoTime()
            val changed = badgeHistories[home] != mergedWatchedHistory
            if (!changed && now - (badgeRetryTimes[home] ?: 0L) < 120_000_000_000L) return
            badgeRetryTimes[home] = now
            retryBadgeCache.set(true)
            if (!changed) return
            badgeHistories[home] = mergedWatchedHistory
            val cache = field(home, "V0").get(home) as Map<*, *>
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
        if (playbackPaused) { if (enabled()) deferredBadges[home] = true; return }
        if (!enabled() || (!cachedMembershipReady && !watchedSnapshotReady.value) || !pendingBadgePublications.add(home)) return
        Handler(Looper.getMainLooper()).postDelayed({
            badgeWorker.execute {
              try {
                if (!enabled()) return@execute
                if (playbackPaused) { deferredBadges[home] = true; return@execute }
                val cache = field(home, "V0").get(home) as Map<*, *>
                val snapshot = synchronized(cache) { HashMap(cache) }
                val delta = synchronized(badgeDeltas) { badgeDeltas.getOrPut(home) { NuvioBadgeDelta() } }
                val changed = delta.changed(mergedWatchedHistory, snapshot)
                if (changed.isEmpty()) return@execute
                findMethod(home.javaClass.classLoader.loadClass(NuvioNative.HOME_PIPELINE_NAME), "g", 2)
                    .invoke(null, home, changed)
                val holder = field(home, "u").get(home)
                val labels = (field(holder, "f").get(holder) as StateFlow<*>).value as Set<*>
                val now = System.nanoTime()
                if (now - lastBadgeLog >= 30_000_000_000L) {
                    lastBadgeLog = now
                    Log.d(TAG, "Badge validation progress: changed=${changed.size} cached=${cache.size} labels=${labels.size}")
                }
              } catch (error: Throwable) { Log.e(TAG, "Incremental watched badge validation failed", error) }
              finally { pendingBadgePublications.remove(home) }
            }
        }, 500L)
    }

    private suspend fun invokeSuspending(target: Any, name: String): Any? = suspendCancellableCoroutine { completion ->
        val result = findMethod(target.javaClass, name, 1).invoke(target, NuvioSourceContinuation(completion))
        if (result !== COROUTINE_SUSPENDED) completion.resume(result)
    }

    /** Cache-first startup: no provider refresh or full WatchedItem decoding/serialization. */
    @Suppress("UNCHECKED_CAST")
    private suspend fun quickSnapshot(checkpoint: () -> Unit, restoreMembership: Boolean = true) {
        var stageStarted = System.nanoTime()
        val cacheKey = snapshotKey()
        val origins = HashMap(originByContent)
        var savedHistory = mergedWatchedHistory
        var savedAliases = mergedShowSiblings
        var historyTime = cachedHistoryTime
        var membershipReady = cachedMembershipReady
        updateSync("Using saved Continue Watching…", 1, 3)
        if (restoreMembership && !cachedMembershipReady) {
            val compact = membershipPreferences().getString(cacheKey, null)
            logSyncStage("quick.openMembership", stageStarted)
            val encoded = compact ?: application().getSharedPreferences("${PREFS}_membership", Context.MODE_PRIVATE)
                .getString(cacheKey, null) ?: historyPreferences().getString(cacheKey, null)
            if (encoded != null) {
                val decodeStarted = System.nanoTime()
                if (NuvioMembershipCache.encoded(encoded)) {
                    val restored = NuvioMembershipCache.read(encoded, { season, episode -> season to episode }, checkpoint)
                    savedHistory = restored.history
                    savedAliases = restored.siblings
                    historyTime = restored.savedAt
                } else {
                    val restored = NuvioWatchedSnapshot.projection(encoded, checkpoint) { season, episode -> season to episode }
                    check(restored.historyPresent && restored.siblingsPresent) { "Saved episode membership cache is incomplete" }
                    savedHistory = restored.history
                    savedAliases = restored.siblings
                    historyTime = restored.savedAt
                }
                checkpoint()
                logSyncStage("quick.decodeMembership", decodeStarted)
                Log.d(TAG, "Membership cache: grouped=${NuvioMembershipCache.encoded(encoded)} chars=${encoded.length} shows=${savedHistory.size} aliases=${savedAliases.size}")
                membershipReady = true
                // One migration for existing installs; subsequent launches never open
                // the large SharedPreferences XML containing all WatchedItem models.
                if (compact == null) persistMembership(savedHistory, savedAliases, historyTime, cacheKey)
            }
        }
        logSyncStage("quick.restoreMembership", stageStarted)
        stageStarted = System.nanoTime()
        updateSync("Applying local playback changes…", 2, 3)
        NuvioPlaybackBridge.load(cacheKey)
        checkpoint()
        val membershipChanged = membershipReady && (!cachedMembershipReady || mergedWatchedHistory != savedHistory || mergedShowSiblings != savedAliases)
        val committed = NuvioMergeWork.commit({ action -> Handler(Looper.getMainLooper()).post { action() }; Unit },
            { cacheKey == snapshotKey() && navigation.allowed(true) }) {
            mergedWatchedHistory = savedHistory
            mergedShowSiblings = savedAliases
            cachedHistoryTime = historyTime
            cachedMembershipReady = membershipReady
            if (membershipChanged) providerRevision.value += 1
            NuvioPlaybackBridge.changed()
        }
        if (!committed) return
        if (membershipChanged) notifyRestoredMembership()
        val progress = mergedProgress.value
        val next = mergedNextUpSeeds.value
        logSyncStage("quick.localOverlay", stageStarted)
        val summary = "Quick sync complete: saved progress and local playback applied in ${syncElapsed()}. Local playback updates do not require another provider sync."
        if (!startupReconcile) preferences().edit().putString("${cacheKey}_last_sync", summary).apply()
        updateSync(summary, 3, 3)
        Log.d(TAG, "Quick cache restored: progress=${progress.size} seeds=${next.size}; membershipDeferred=${!membershipReady}; elapsed=${syncElapsed()}")
    }

    /** Independent extensions are optional; publish only visible counts and already cached metadata. */
    private fun notifyRestoredMembership() {
        registerCachedRemainingCards(mergedProgress.value)
        runCatching {
            Class.forName("software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes")
                .getMethod("refreshWatchedHistory", Map::class.java).invoke(null, mergedWatchedHistory)
        }.onFailure { if (it !is ClassNotFoundException) Log.w(TAG, "Remaining count publication failed", it) }
        val homes = synchronized(deferredBadges) {
            deferredBadges.keys.toList().also { deferredBadges.clear() }
        }
        homes.forEach(::publishCachedWatchedBadges)
    }

    private fun registerCachedRemainingCards(progress: List<Any>) {
        runCatching {
            val method = Class.forName("software.santodan.extension.nuvioremaining.NuvioRemainingEpisodes")
                .getMethod("registerProgress", Any::class.java)
            progress.forEach { method.invoke(null, it) }
        }.onFailure { if (it !is ClassNotFoundException) Log.w(TAG, "Cached remaining-card registration failed", it) }
    }

    @Suppress("UNCHECKED_CAST")
    private suspend fun mergeSnapshot(onlyMain: Boolean = false, refreshProviders: Boolean = true) {
        val repo = repository ?: return
        val revision = playbackRevision.get()
        val navigationRevision = navigation.revision()
        val manual = manualMerge
        val cancellation = cancelRevision.get()
        fun deferred(): Boolean {
            mergeWorkCheck.get()?.invoke()
            if (cancelRevision.get() != cancellation) return true
            val stop = !enabled() || !navigation.current(navigationRevision, manual) || playbackRevision.get() != revision
            if (stop) {

                updateSync("Sync stopped. Previous snapshot retained. Use Sync now to retry.")
            }
            return stop
        }
        if (deferred()) return
        val cacheKey = snapshotKey()
        val started = System.nanoTime()
        val snapshotStartedAt = System.currentTimeMillis()
        // NuvioTV 1.1.0-beta.8 constructor fields: a = WatchProgressPreferences,
        // j = ProfileManager, k = tracking providers.
        val registry = field(repo, "k").get(repo)
        val localStore = field(repo, "a").get(repo)
        val candidates = ArrayList<Any>()
        val localFlow = field(localStore, "q").get(localStore) as Flow<Any>
        val selected = if (onlyMain) setOf(mainTracking()) else selectedTrackings()
        val localItems = (localFlow.first() as? Collection<Any>).orEmpty().takeIf { "NUVIO_SYNC" in selected }.orEmpty()
        candidates.addAll(localItems)
        val sourceCounts = ArrayList<String>()
        val sourceItems = LinkedHashMap<String, Collection<Any>>()
        val sourceSeeds = LinkedHashMap<String, Collection<Any>>()
        val sourceWatched = LinkedHashMap<String, Map<String, Set<Any>>>()
        val sourceWatchedItems = LinkedHashMap<String, List<Any>>()
        val siblings = LinkedHashMap<String, MutableSet<String>>()
        val watchedStore = field(repo, "e").get(repo)
        val localWatched = if (!startupReconcile && "NUVIO_SYNC" in selected)
            (field(watchedStore, providerLayout.localWatchedField).get(watchedStore) as Flow<Any>)
                .first().let { it as? List<Any> ?: emptyList() } else emptyList()
        sourceWatchedItems["Nuvio Sync"] = localWatched
        sourceWatched["Nuvio Sync"] = if (startupReconcile && "NUVIO_SYNC" in selected) mergedWatchedHistory else localWatched.filter {
            findMethod(it.javaClass, "getSeason", 0).invoke(it) != null &&
                findMethod(it.javaClass, "getEpisode", 0).invoke(it) != null
        }
            .groupBy { findMethod(it.javaClass, "getContentId", 0).invoke(it).toString() }
            .mapValues { (_, items) -> items.map { number(it, "getSeason").toInt() to number(it, "getEpisode").toInt() }.toSet() }
        if ("NUVIO_SYNC" in selected) sourceCounts.add("Nuvio Sync=${localItems.size}")
        sourceItems["Nuvio Sync"] = localItems
        val providers = findMethod(registry.javaClass, "b", 0).invoke(registry) as Collection<Any>
        val included = providers.filter { providerId(it) in selected }
        if (!startupReconcile) syncSteps = included.size + 3
        var completedProviders = 0
        updateSync(if ("NUVIO_SYNC" in selected) "Read Nuvio Sync: ${localItems.size} progress entries"
            else "Preparing selected tracking services", 2, syncSteps)
        val snapshotProviders = LinkedHashMap<String, Any>()
        val unavailable = LinkedHashSet<String>()
        for (provider in included) {
            if (deferred()) return
            val sourceLabel = providerSource(provider)
            updateSync("Fetching $sourceLabel…", completedProviders + 2)
            Log.d(TAG, "Provider read started: source=$sourceLabel manual=$manual refresh=$refreshProviders")
            val result = NuvioMergeWork.providerResult(sourceLabel, 45_000) {
                val authenticated = (findMethod(provider.javaClass, "b", 0).invoke(provider) as Flow<Any>).first() as? Boolean ?: false
                if (deferred()) return@providerResult
                if (!authenticated) {
                    if (onlyMain) throw IllegalStateException("Main tracker $sourceLabel is not connected")
                    sourceCounts.add("$sourceLabel: not connected")
                    return@providerResult
                }
                // onStart can launch a refresh without awaiting it (notably MDBList),
                // and Trakt's seed flow has no refresh hook. Wait before reading.
                if (!onlyMain && refreshProviders) NuvioProviderRefresh.await(provider, providerLayout.refreshMethod, manual)
                if (deferred()) return@providerResult
                // Sample once during startup or explicit sync; notifications never schedule another merge.
                val seeds = (findMethod(provider.javaClass, "f", 0).invoke(provider) as Flow<Any>).first() as? Collection<Any>
                if (deferred()) return@providerResult
                if (providerId(provider) == "TRAKT") {
                    // beta.8 ba.pc.a -> ba.jb; T is set only after f() installs
                    // watched episode maps and the canonical watched-show seeds.
                    val service = field(provider, "a").get(provider)
                    if (!field(service, "T").getBoolean(service)) {
                        if (!refreshProviders) throw IllegalStateException("Trakt watched history is not ready; saved progress retained")
                        val loaded = kotlinx.coroutines.withTimeoutOrNull(10_000) {
                            NuvioProviderRefresh.historyReady { field(service, "T").getBoolean(service) }
                            true
                        }
                        check(loaded == true) { "Trakt watched history did not become ready within 10s; saved progress retained" }
                    }
                }
                // Trigger projections, then wait for the native readiness signal and re-read.
                // A refresh call alone does not guarantee these cold flows are hydrated.
                (findMethod(provider.javaClass, allProgressMethod, 0).invoke(provider) as Flow<Any>).first()
                NuvioProviderRefresh.ready(provider, providerLayout.snapshotReadyMethod)
                val items = (findMethod(provider.javaClass, allProgressMethod, 0).invoke(provider) as Flow<Any>).first() as? Collection<Any>
                if (deferred()) return@providerResult
                if (items != null) {
                    val source = providerSource(provider)
                    snapshotProviders[sourceName(source)] = provider
                    sourceCounts.add("$source=${items.size}")
                    sourceItems[source] = items
                    candidates.addAll(items)
                    sourceWatched[source] = invokeSuspending(provider, "g") as? Map<String, Set<Any>> ?: emptyMap()
                    if (deferred()) return@providerResult
                    if (!startupReconcile) sourceWatchedItems[source] = (findMethod(provider.javaClass, "d", 0).invoke(provider) as Flow<Any>)
                        .first() as? List<Any> ?: emptyList()
                    if (deferred()) return@providerResult
                    val aliases = invokeSuspending(provider, providerLayout.siblingsMethod) as? Map<String, Set<String>> ?: emptyMap()
                    if (deferred()) return@providerResult
                    // Simkl's progress/history accessors can finish loading after the
                    // first nextUpSeeds read. Do not publish those pre-refresh seeds
                    // alongside the refreshed watched history and evict cached cards.
                    val refreshedSeeds = (findMethod(provider.javaClass, "f", 0).invoke(provider) as Flow<Any>)
                        .first() as? Collection<Any>
                    if (deferred()) return@providerResult
                    sourceSeeds[source] = refreshedSeeds.orEmpty()
                    Log.d(TAG, "Provider snapshot: source=$source progress=${items.size} initialSeeds=${seeds?.size ?: 0} refreshedSeeds=${refreshedSeeds?.size ?: 0}")
                    refreshedSeeds.orEmpty().filter(::diagnosticShow).forEach {
                        Log.d(TAG, "Show seed: source=$source id=${showKey(it)} season=${number(it, "getSeason").toInt()} episode=${number(it, "getEpisode").toInt()}")
                    }
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
            if (result.isFailure) {
                val error = result.exceptionOrNull()!!
                if (onlyMain) throw error
                unavailable.add(sourceLabel)
                sourceItems.remove(sourceLabel)
                sourceSeeds.remove(sourceLabel)
                sourceWatched.remove(sourceLabel)
                sourceWatchedItems.remove(sourceLabel)
                snapshotProviders.remove(sourceLabel)
                sourceCounts.removeAll { it.startsWith("$sourceLabel=") }
                sourceCounts.add("$sourceLabel: unavailable (saved progress retained)")
                Log.w(TAG, "Provider unavailable: source=$sourceLabel; continuing other services", error)
            }
            completedProviders++
            updateSync(if (result.isSuccess) "Read $sourceLabel" else "$sourceLabel unavailable; continuing other services", completedProviders + 2)
        }
        if (deferred()) return
        Log.d(TAG, "Merge provider reads: ${(System.nanoTime() - started) / 1_000_000}ms")
        if (!NuvioMergeWork.canPublishProviders(sourceItems.keys.count { it != "Nuvio Sync" },
                unavailable.size, "NUVIO_SYNC" in selected)) {
            syncError = !startupReconcile
            updateSync("Providers are still loading or unavailable. Saved Continue Watching retained.", syncSteps)
            Log.d(TAG, "No fresh provider snapshot; saved progress/history retained without rewriting cache")
            return
        }
        // Never treat a failed provider as an authenticated empty snapshot. Prefer
        // fresh sources for overlapping shows and retain saved entries elsewhere.
        val covered = (sourceItems.values.flatten() + sourceSeeds.values.flatten()).mapTo(HashSet(), ::showKey)
        for (source in unavailable) {
            fun saved(items: List<Any>) = NuvioMergeWork.unavailableEntries(items, covered, setOf(source), ::showKey) {
                originByContent[showKey(it)]
            }
            sourceItems[source] = saved(mergedProgress.value)
            sourceSeeds[source] = saved(mergedNextUpSeeds.value)
            val ids = (sourceItems[source].orEmpty() + sourceSeeds[source].orEmpty()).mapTo(HashSet()) {
                findMethod(it.javaClass, "getContentId", 0).invoke(it).toString()
            }
            sourceWatched[source] = mergedWatchedHistory.filterKeys { it in ids }
            sourceWatchedItems[source] = mergedWatchedItems.value.filter {
                findMethod(it.javaClass, "getContentId", 0).invoke(it).toString() in ids
            }
            for (id in ids) mergedShowSiblings[id]?.let { related -> siblings.getOrPut(id) { LinkedHashSet() }.addAll(related) }
        }
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
            val winningSeeds = seedIndex[winner.first]?.get(show).orEmpty()
            val completedAt = winningSeeds.maxOfOrNull { number(it, "getLastWatched").toLong() }
            for (item in winner.second) {
                val id = findMethod(item.javaClass, "getContentId", 0).invoke(item).toString()
                val watched = (number(item, "getSeason").toInt() to number(item, "getEpisode").toInt()) in
                    sourceWatched[winner.first]?.get(id).orEmpty()
                if (!NuvioMergeWork.retainPlayback(number(item, "getLastWatched").toLong(), watched, completedAt)) continue
                val episode = key(item)
                val old = coherent[episode]
                if (old == null || better(item, old, recent)) coherent[episode] = item
            }
            merged.addAll(coherent.values)
            if ((winningSeeds + winner.second).any(::diagnosticShow)) {
                Log.d(TAG, "Show merge selection: id=$show source=${winner.first} choices=${choices.map { it.first }} progress=${coherent.size} seeds=${winningSeeds.size}")
            }
            mergedSeeds.addAll(winningSeeds)
            origins[show] = sourceName(winner.first)
        }
        if (cacheKey != snapshotKey() || deferred()) return
        val badgeOrigins = origins.mapKeys { (show, _) -> show.substringAfter('|') }
        val checkpoint = Runnable { mergeWorkCheck.get()?.invoke() }
        val badgeSources = NuvioWatchedHistory.sources(sourceWatched, badgeOrigins, siblings, checkpoint)
        val watchedHistory = NuvioWatchedHistory.select(sourceWatched, badgeSources, siblings, checkpoint)
        val watchedItems = sourceWatchedItems.flatMap { (source, items) -> items.filter { item ->
            val id = findMethod(item.javaClass, "getContentId", 0).invoke(item).toString()
            (badgeSources[id] ?: badgeOrigins[id] ?: source) == source
        } }.distinctBy(::key)
        Log.d(TAG, "Published watched badges: shows=${watchedHistory.size} items=${watchedItems.size} aliases=${siblings.size}")
        // Provider lists are individually ordered, but concatenating them leaves
        // every Trakt record ahead of Simkl/MDBList-only records. Nuvio limits
        // work near the front of this history, so restore a global activity order.
        val published = ArrayList(merged.sortedByDescending { number(it, "getLastWatched") })
        val publishedSeeds = ArrayList(mergedSeeds
            .distinctBy(::showKey)
            .sortedByDescending { number(it, "getLastWatched") })
        val previous = mergedProgress.value.associateBy(::key)
        val updated = published.count { previous[key(it)] != it }
        val publishedKeys = published.mapTo(HashSet(), ::key)
        val removed = previous.keys.count { it !in publishedKeys }
        val publishedSiblings = siblings.mapValues { (_, ids) -> ids.toSet() }
        if (startupReconcile && published == mergedProgress.value && publishedSeeds == mergedNextUpSeeds.value &&
            watchedHistory == mergedWatchedHistory && publishedSiblings == mergedShowSiblings) {
            Log.d(TAG, "Startup snapshots unchanged; no publication or cache write")
            return
        }
        val committed = NuvioMergeWork.commit(
            { action -> Handler(Looper.getMainLooper()).post { action() }; Unit },
            { cacheKey == snapshotKey() && !deferred() }) {
                originByContent.clear()
                originByContent.putAll(origins)
                providerBySource.clear()
                providerBySource.putAll(snapshotProviders)
                mergedWatchedHistory = watchedHistory
                mergedShowSiblings = publishedSiblings
                mergedProgress.value = published
                mergedNextUpSeeds.value = publishedSeeds
                if (!startupReconcile) mergedWatchedItems.value = watchedItems
                providerRevision.value += 1L
                if (!startupReconcile) watchedSnapshotReady.value = unavailable.isEmpty() || watchedSnapshotReady.value
                cachedSnapshotAvailable = true
                cachedSnapshotValidated = true
                cachedMembershipReady = true
                forceFullSync = false
                mergedSnapshotReady.value = true
                refreshMenu()
        }
        if (!committed) return
        // Retire only after the new provider baseline has been installed, never on a read notification.
        for ((source, records) in sourceItems) {
            val destination = when (source) { "Trakt" -> "TRAKT"; "Simkl" -> "SIMKL"; "MDBList" -> "MDBLIST"; else -> "NUVIO_SYNC" }
            if (source in unavailable || (destination == "NUVIO_SYNC" && destination !in selected)) continue
            NuvioPlaybackBridge.reconcile(cacheKey, destination, records, sourceSeeds[source].orEmpty(),
                sourceWatched[source].orEmpty() as Map<String, Set<Pair<Int, Int>>>, publishedSiblings,
                refreshProviders && !startupReconcile, snapshotStartedAt, sourceWatchedItems[source].orEmpty(),
                published, publishedSeeds, watchedHistory as Map<String, Set<Pair<Int, Int>>>, watchedItems)
        }
        if (startupReconcile) {
            cachedHistoryTime = System.currentTimeMillis()
            persistMembership(mergedWatchedHistory, mergedShowSiblings, cachedHistoryTime, cacheKey)
            persistLightweight(published, publishedSeeds, origins, cacheKey, true)
            notifyRestoredMembership()
            Log.d(TAG, "Startup snapshots updated: progress=${published.size} seeds=${publishedSeeds.size}; no full watched-model read or save")
            return
        }
        persistSnapshot(published, publishedSeeds, origins, watchedItems, cacheKey)
        syncError = unavailable.isNotEmpty()
        val summary = "${if (onlyMain) "Main tracker fallback" else if (unavailable.isNotEmpty()) "Sync completed with unavailable services" else if (!refreshProviders) "Quick sync complete" else "Sync complete"}: ${sourceCounts.joinToString()}. ${published.size} progress entries ($updated updated, $removed removed), " +
            "${publishedSeeds.size} Continue Watching shows, ${watchedItems.size} watched items. Total ${syncElapsed()}."
        preferences().edit().putString("${cacheKey}_last_sync", summary).apply()
        updateSync(summary, syncSteps)
        Log.d(TAG, "Merge total: ${(System.nanoTime() - started) / 1_000_000}ms")
        Log.d(TAG, "Sources: ${sourceCounts.joinToString()}")
        Log.d(TAG, "Published ${merged.size} progress entries and ${publishedSeeds.size} next-up seeds for ${histories.size} shows from ${candidates.size} provider records")
    }

    private fun key(item: Any): String {
        mergeWorkCheck.get()?.invoke()
        fun value(name: String) = runCatching { findMethod(item.javaClass, name, 0).invoke(item) }.getOrNull()
        return listOf(value("getContentId"), value("getSeason"), value("getEpisode")).joinToString("|")
    }

    private fun showKey(item: Any): String {
        mergeWorkCheck.get()?.invoke()
        val id = runCatching { findMethod(item.javaClass, "getContentId", 0).invoke(item) }.getOrNull()
        val type = runCatching { findMethod(item.javaClass, "getContentType", 0).invoke(item) }.getOrNull()
        return "$type|$id"
    }

    /** Focused diagnostics for the reported disappearing anime; no full library dump. */
    private fun diagnosticShow(item: Any): Boolean {
        val id = findMethod(item.javaClass, "getContentId", 0).invoke(item)?.toString()
        if (id in setOf("tt3981938", "tt21927720", "tt12057106")) return true
        val title = findMethod(item.javaClass, "getName", 0).invoke(item)?.toString().orEmpty()
        return title.contains("bahamut", ignoreCase = true) || title.contains("virgin soul", ignoreCase = true)
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
        if (localSeed(progress)) return true
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

    private fun number(item: Any, name: String): Double {
        mergeWorkCheck.get()?.invoke()
        return (runCatching { findMethod(item.javaClass, name, 0).invoke(item) }.getOrNull() as? Number)?.toDouble() ?: 0.0
    }

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

    private fun cacheConfiguration() = "${mainTracking()}|${selectedTrackings().sorted().joinToString(",")}|${preferences().getString(STRATEGY, "highest")}"

    private fun persistLightweight(progress: List<Any>, seeds: List<Any>, origins: Map<String, String>,
                                   cacheKey: String, validated: Boolean): JSONObject {
        mergeWorkCheck.get()?.invoke()
        val root = JSONObject().put("progress", encodeItems(progress)).put("seeds", encodeItems(seeds))
            .put("savedAt", System.currentTimeMillis()).put("validatedProviders", validated)
            .put("configuration", cacheConfiguration())
        val encodedOrigins = JSONObject()
        origins.forEach(encodedOrigins::put)
        root.put("origins", encodedOrigins)
        startupPreferences().edit().putString(cacheKey, root.toString()).apply()
        cachedSnapshotTime = root.getLong("savedAt")
        return root
    }

    /** Small, independent disk store: opening history preferences loads every model's XML. */
    private fun persistMembership(history: Map<String, Set<Any>>, aliases: Map<String, Set<String>>,
                                  savedAt: Long, cacheKey: String) {
        val started = System.nanoTime()
        val encoded = NuvioMembershipCache.encode(history, aliases, savedAt, { episode ->
            val pair = episode as Pair<Int, Int>
            (pair.first.toLong() shl 32) or (pair.second.toLong() and 0xffffffffL)
        }, { mergeWorkCheck.get()?.invoke(); Unit })
        mergeWorkCheck.get()?.invoke()
        check(membershipPreferences().edit().putString(cacheKey, encoded).commit()) {
            "Could not save merged membership cache"
        }
        logSyncStage("saveMembership", started)
    }

    private fun persistSnapshot(progress: List<Any>, seeds: List<Any>, origins: Map<String, String>, watchedItems: List<Any>, cacheKey: String) {
        runCatching {
            mergeWorkCheck.get()?.invoke()
            // Keep CW available, but do not trust this cache for quick startup
            // until its matching full history is durably saved.
            val root = persistLightweight(progress, seeds, origins, cacheKey, false)
            cachedHistoryTime = root.getLong("savedAt")
            val history = JSONObject()
            mergedWatchedHistory.forEach { (id, episodes) ->
                mergeWorkCheck.get()?.invoke()
                history.put(id, JSONArray().also { array -> episodes.forEach { episode ->
                    mergeWorkCheck.get()?.invoke()
                    val pair = episode as Pair<*, *>
                    array.put(JSONArray(listOf(pair.first, pair.second)))
                } })
            }
            root.put("watchedHistory", history)
            val aliases = JSONObject()
            mergedShowSiblings.forEach { (id, ids) ->
                mergeWorkCheck.get()?.invoke()
                aliases.put(id, JSONArray(ids.toList()))
            }
            root.put("siblings", aliases)
            root.put("watchedItems", JSONArray().also { array -> watchedItems.forEach { item ->
                mergeWorkCheck.get()?.invoke()
                array.put(JSONObject().also { json -> WATCHED_GETTERS.forEach { getter ->
                    json.put(getter, findMethod(item.javaClass, getter, 0).invoke(item) ?: JSONObject.NULL)
                } })
            } })
            mergeWorkCheck.get()?.invoke()
            val encoded = root.toString()
            mergeWorkCheck.get()?.invoke()
            check(historyPreferences().edit().putString(cacheKey, encoded).commit()) { "Could not save merged history cache" }
            mergeWorkCheck.get()?.invoke()
            persistMembership(mergedWatchedHistory, mergedShowSiblings, cachedHistoryTime, cacheKey)
            persistLightweight(progress, seeds, origins, cacheKey, true)
        }.onFailure { error ->
            if (error is kotlinx.coroutines.CancellationException) throw error
            Log.w(TAG, "Unable to persist merged snapshot", error)
            throw error
        }
    }

    /** Called on IO before exposing the aggregate, independently of Home sync gating. */
    private fun ensureSnapshotLoaded() = synchronized(this) {
        val cacheKey = snapshotKey()
        if (activeCacheKey == cacheKey) return@synchronized
        // Only a profile change invalidates in-memory data. On first launch,
        // retain any native cache seeded while the saved merge is loading.
        if (activeCacheKey != null) {
            cachedSnapshotAvailable = false
            cachedSnapshotValidated = false
            cachedMembershipReady = false
            cachedSnapshotTime = 0L
            cachedHistoryTime = 0L
            mergedSnapshotReady.value = false
            watchedSnapshotReady.value = false
            mergedProgress.value = emptyList()
            mergedNextUpSeeds.value = emptyList()
            mergedWatchedItems.value = emptyList()
            mergedWatchedHistory = emptyMap()
            mergedShowSiblings = emptyMap()
            originByContent.clear()
            providerBySource.clear()
        }
        restoreSnapshot(repository?.javaClass?.classLoader)
        if (cacheKey == snapshotKey()) {
            activeCacheKey = cacheKey
            NuvioStartupActivity.rememberProfile(application(), cacheKey.removePrefix("${SNAPSHOT}_"))
            mergedSnapshotReady.value = true
        }
    }

    /** Legacy cache migration is allowed only inside the post-Home sync worker. */
    private fun restoreLegacyStartupSnapshot(checkpoint: () -> Unit) {
        val key = snapshotKey()
        if (startupPreferences().contains(key)) return
        checkpoint()
        val encoded = application().getSharedPreferences("${PREFS}_startup", Context.MODE_PRIVATE)
            .getString(key, null) ?: preferences().getString(key, null)
            ?: historyPreferences().getString(key, null) ?: return
        checkpoint()
        restoreSnapshot(repository?.javaClass?.classLoader, encoded, checkpoint)
    }

    private fun restoreSnapshot(loader: ClassLoader?, legacy: String? = null, checkpoint: () -> Unit = {}) {
        val started = System.nanoTime()
        Log.d(TAG, "Startup CW cache loading: legacy=${legacy != null}")
        runCatching {
            val cacheKey = snapshotKey()
            // A new, exclusively lightweight file avoids loading the previous giant
            // preferences file (including its XML decoding) before Home can appear.
            val encoded = legacy ?: startupPreferences().getString(cacheKey, null) ?: return
            val root = readStartupSnapshot(encoded, checkpoint)
            checkpoint()
            val model = requireNotNull(loader).loadClass("com.nuvio.tv.domain.model.WatchProgress")
            val progress = decodeItems(root.optJSONArray("progress"), model)
            val seeds = decodeItems(root.optJSONArray("seeds"), model)
            checkpoint()
            if (cacheKey != snapshotKey()) return
            registerCachedRemainingCards(progress)
            cachedSnapshotAvailable = true
            cachedSnapshotValidated = root.optBoolean("validatedProviders", false) && root.optString("configuration") == cacheConfiguration()
            cachedSnapshotTime = root.optLong("savedAt", 0L)
            val encodedOrigins = root.optJSONObject("origins")
            val restoredOrigins = HashMap<String, String>()
            encodedOrigins?.keys()?.forEach { key -> restoredOrigins[key] = encodedOrigins.getString(key) }
            originByContent.putAll(restoredOrigins)
            mergedProgress.value = progress
            mergedNextUpSeeds.value = seeds
            mergedSnapshotReady.value = true
            if (legacy != null) startupPreferences().edit().putString(cacheKey, root.toString()).apply()
            Log.d(TAG, "Startup CW cache ready: progress=${progress.size} nextUp=${seeds.size} legacy=${legacy != null} elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
        }.onFailure { error ->
            if (error is kotlinx.coroutines.CancellationException) throw error
            Log.w(TAG, "Unable to restore Continue Watching cache", error)
        }
    }

    /** Skip legacy history tokens without constructing their JSON trees. */
    private fun readStartupSnapshot(encoded: String, checkpoint: () -> Unit = {}): JSONObject {
        JsonReader(object : java.io.FilterReader(StringReader(encoded)) {
            override fun read(buffer: CharArray, offset: Int, length: Int): Int {
                checkpoint()
                return super.read(buffer, offset, length.coerceAtMost(1024))
            }
        }).use { reader ->
            val root = JSONObject()
            reader.beginObject()
            while (reader.hasNext()) {
                val name = reader.nextName()
                if (name in setOf("progress", "seeds", "origins", "savedAt", "validatedProviders", "configuration")) root.put(name, readSnapshotValue(reader))
                else reader.skipValue()
            }
            reader.endObject()
            return root
        }
    }

    private fun readSnapshotValue(reader: JsonReader): Any = when (reader.peek()) {
        JsonToken.BEGIN_OBJECT -> JSONObject().also { value ->
            reader.beginObject()
            while (reader.hasNext()) value.put(reader.nextName(), readSnapshotValue(reader))
            reader.endObject()
        }
        JsonToken.BEGIN_ARRAY -> JSONArray().also { value ->
            reader.beginArray()
            while (reader.hasNext()) value.put(readSnapshotValue(reader))
            reader.endArray()
        }
        JsonToken.STRING -> reader.nextString()
        JsonToken.NUMBER -> reader.nextString().let { it.toLongOrNull() ?: it.toDouble() }
        JsonToken.BOOLEAN -> reader.nextBoolean()
        JsonToken.NULL -> { reader.nextNull(); JSONObject.NULL }
        else -> error("Unexpected snapshot token ${reader.peek()}")
    }

    /** Remove history from the settings file only after its separate copy is durable. */
    private fun migrateSnapshotStorage() {
        val started = System.nanoTime()
        runCatching {
            val legacy = preferences()
            // Do not open the heavyweight XML when there are no legacy snapshots.
            val destination by lazy { historyPreferences() }
            var moved = 0
            val complete = NuvioProviderRefresh.migrateSnapshots(legacy.all, { key -> destination.contains(key) },
                { snapshots ->
                    val editor = destination.edit()
                    snapshots.forEach { (key, value) -> editor.putString(key, value) }
                    // Also commit an existing in-memory destination: an earlier
                    // failed disk write must not permit source removal on retry.
                    editor.commit()
                }, { keys ->
                    moved = keys.size
                    val editor = legacy.edit()
                    keys.forEach(editor::remove)
                    editor.commit()
                })
            Log.d(TAG, "History storage migration: complete=$complete profiles=$moved elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
        }.onFailure { Log.w(TAG, "History storage migration failed; legacy cache retained", it) }
    }

    /** Only the post-presentation merge worker restores the heavyweight badge data. */
    private suspend fun restoreWatchedSnapshot(loader: ClassLoader?, checkpoint: () -> Unit) {
        if (watchedSnapshotReady.value) return
        checkpoint()
        val started = System.nanoTime()
        Log.d(TAG, "Deferred watched cache loading")
        runCatching {
            val cacheKey = snapshotKey()
            val encoded = historyPreferences().getString(cacheKey, null)
                ?: preferences().getString(cacheKey, null) ?: return
            val constructor by lazy {
                requireNotNull(loader).loadClass("com.nuvio.tv.domain.model.WatchedItem")
                    .declaredConstructors.single { it.parameterCount == 11 }
            }
            var restoredCount = 0
            var lastProgress = System.nanoTime()
            updateSync("Restoring saved watched history…", 1)
            val restored = NuvioWatchedSnapshot.read(encoded, checkpoint, { season, episode -> season to episode }, { values ->
                require(values["getWatchedAt"] is Long) { "Missing watched timestamp" }
                constructor.newInstance(*WATCHED_GETTERS.map(values::get).toTypedArray()).also {
                    restoredCount++
                    val now = System.nanoTime()
                    if (now - lastProgress >= 1_000_000_000L) {
                        updateSync("Restoring saved watched history: $restoredCount items…", 1)
                        lastProgress = now
                    }
                }
            })
            checkpoint()
            if (cacheKey != snapshotKey() || activeCacheKey != cacheKey || watchedSnapshotReady.value) return
            withContext(Dispatchers.Main) {
                // Serialize publication with navigation; cancelled/old-profile partial work stays private.
                checkpoint()
                if (cacheKey != snapshotKey() || activeCacheKey != cacheKey || watchedSnapshotReady.value) return@withContext
                mergedWatchedHistory = restored.history
                mergedShowSiblings = restored.siblings
                mergedWatchedItems.value = restored.items
                watchedSnapshotReady.value = true
                Log.d(TAG, "Deferred watched cache ready: shows=${restored.history.size} items=${restored.items.size} elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
                refreshMenu()
            }
        }.onFailure { error ->
            if (error is kotlinx.coroutines.CancellationException) throw error
            Log.w(TAG, "Unable to restore merged snapshot", error)
        }
    }

    private fun encodeItems(items: List<Any>): JSONArray = JSONArray().also { array ->
        items.forEach { item ->
            mergeWorkCheck.get()?.invoke()
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

    private fun retainedFlow(
        merged: StateFlow<List<Any>>,
    ): Flow<List<Any>> {
        return NuvioProviderRefresh.hydratedSnapshot(merged) {
            withContext(Dispatchers.IO) { ensureSnapshotLoaded(); NuvioPlaybackBridge.load(snapshotKey()) }
        }.combine(NuvioPlaybackBridge.revision) { baseline, _ ->
            val profile = snapshotKey()
            val entries = NuvioPlaybackBridge.entries(profile)
            if (activeCacheKey != profile) emptyList()
            else if (!enabled()) baseline
            else if (merged === mergedProgress) NuvioPlaybackBridge.overlay.progress(baseline, entries, mergedShowSiblings)
            else NuvioPlaybackBridge.overlay.seeds(baseline, entries, visibleHistory(), mergedShowSiblings)
        }.distinctUntilChanged().flowOn(Dispatchers.Default)
    }

    @Suppress("UNCHECKED_CAST")
    private fun visibleHistory(): Map<String, Set<Pair<Int, Int>>> {
        val profile = snapshotKey()
        if (activeCacheKey != profile) return emptyMap()
        return NuvioPlaybackBridge.history(profile, mergedWatchedHistory as Map<String, Set<Pair<Int, Int>>>, mergedShowSiblings)
    }

    private fun localSeed(record: Any?): Boolean = record != null && NuvioPlaybackBridge.localSeed(snapshotKey(), record)

    private fun visibleWatchedItems(): Flow<List<Any>> = combine(mergedWatchedItems, NuvioPlaybackBridge.revision) { base, _ ->
        if (activeCacheKey != snapshotKey()) return@combine emptyList<Any>()
        val entries = NuvioPlaybackBridge.entries(snapshotKey())
        val result = base.filter { item -> entries.none {
            (it.action == NuvioLocalOverlay.Action.UNWATCH || it.watched == false) &&
                NuvioPlaybackBridge.overlay.sameEpisode(it.key, playbackKey(item), mergedShowSiblings)
        } }.associateByTo(LinkedHashMap(), ::playbackKey)
        val model by lazy { requireNotNull(repository).javaClass.classLoader.loadClass("com.nuvio.tv.domain.model.WatchedItem")
            .declaredConstructors.single { it.parameterCount == 11 } }
        for (entry in entries) {
            val record = entry.record ?: continue
            if (entry.action == NuvioLocalOverlay.Action.UNWATCH ||
                (entry.watched != true && !playbackCompleted(record))) continue
            fun get(name: String) = findMethod(record.javaClass, name, 0).invoke(record)
            result[entry.key] = model.newInstance(get("getContentId"), get("getContentType"), get("getName"),
                get("getSeason"), get("getEpisode"), get("getLastWatched"), get("getPoster"), null,
                get("getTrackingProviderId"), get("getTrackingProviderItemId"), get("getTrackingSourceUrl"))
        }
        result.values.toList()
    }.distinctUntilChanged().flowOn(Dispatchers.Default)

    internal fun playbackEnabled() = enabled() && repository != null
    internal fun playbackMethod(owner: Any, name: String, count: Int): Method =
        methods.getOrPut(Triple(owner.javaClass, name, count)) {
            owner.javaClass.declaredMethods.single { it.name == name && it.parameterCount == count }.apply { isAccessible = true }
        }
    internal fun playbackNumber(record: Any, getter: String) = number(record, getter).toLong()
    internal fun playbackCompleted(record: Any) = findMethod(record.javaClass, "isCompleted\$default", 4)
        .invoke(null, record, 0f, 1, null) == true
    internal fun playbackKey(record: Any): NuvioLocalOverlay.Key {
        fun get(name: String) = findMethod(record.javaClass, name, 0).invoke(record)
        return NuvioLocalOverlay.key(get("getContentId").toString(), get("getContentType").toString(),
            get("getSeason") as? Int, get("getEpisode") as? Int)
    }
    internal fun acceptPlaybackRecord(record: Any, profile: String) = profile != snapshotKey() ||
        playbackNumber(record, "getLastWatched") >= cachedSnapshotTime ||
        NuvioPlaybackBridge.entries(profile).any { it.key == playbackKey(record) }
    internal fun playbackPreferences(profile: String) = application().getSharedPreferences("${PREFS}_local_$profile", Context.MODE_PRIVATE)
    internal fun encodePlayback(record: Any) = encodeItems(listOf(record)).getJSONObject(0).toString()
    internal fun decodePlayback(json: String): Any = decodeItems(JSONArray().put(JSONObject(json)),
        requireNotNull(repository).javaClass.classLoader.loadClass("com.nuvio.tv.domain.model.WatchProgress")).single()
    internal fun playbackAnchor(template: Any, episode: Pair<Int, Int>): Any {
        val json = JSONObject(encodePlayback(template)).put("season", episode.first).put("episode", episode.second)
            .put("videoId", "${playbackKey(template).id}:${episode.first}:${episode.second}")
            .put("position", 1L).put("duration", 1L).put("progressPercent", 100f)
        for (field in listOf("traktPlaybackId", "traktMovieId", "traktShowId", "traktEpisodeId", "simklPlaybackId",
            "trackingProviderId", "trackingProviderItemId", "trackingSourceUrl", "episodeTitle")) json.put(field, JSONObject.NULL)
        return decodePlayback(json.toString())
    }
    private fun playbackProvider(profile: Int): String {
        if (snapshotKey() == "${SNAPSHOT}_$profile") return mainTracking()
        val previous = preferences().getString("previous_source_$profile", "NUVIO_SYNC") ?: "NUVIO_SYNC"
        return preferences().getString("${SNAPSHOT}_${profile}_main", previous) ?: previous
    }

    @JvmStatic fun localSave(owner: Any, record: Any?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "C", completion, arrayOf(record, profile)) { persisted ->
            NuvioPlaybackBridge.save("${SNAPSHOT}_$profile", record, playbackProvider(profile), persisted)
        }
    @JvmStatic fun localSaveBatch(owner: Any, records: Any?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "D", completion, arrayOf(records, profile)) { persisted ->
            NuvioPlaybackBridge.save("${SNAPSHOT}_$profile", records, playbackProvider(profile), persisted)
        }
    @JvmStatic fun localRemove(owner: Any, id: String?, season: Int?, episode: Int?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "A", completion, arrayOf(id, season, episode, profile)) { persisted ->
            if (id != null) NuvioPlaybackBridge.remove("${SNAPSHOT}_$profile", id, listOf(season to episode), false, playbackProvider(profile), persisted) else Unit
        }
    @JvmStatic fun localUnwatch(owner: Any, id: String?, season: Int?, episode: Int?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "p", completion, arrayOf(id, season, episode, profile)) { persisted ->
            if (id != null) NuvioPlaybackBridge.remove("${SNAPSHOT}_$profile", id, listOf(season to episode), true, playbackProvider(profile), persisted) else Unit
        }
    @Suppress("UNCHECKED_CAST")
    @JvmStatic fun localRemoveBatch(owner: Any, id: String?, episodes: Any?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "B", completion, arrayOf(id, episodes, profile)) { persisted ->
            if (id != null) NuvioPlaybackBridge.remove("${SNAPSHOT}_$profile", id, episodes as List<Pair<Int?, Int?>>, false, playbackProvider(profile), persisted) else Unit
        }
    @Suppress("UNCHECKED_CAST")
    @JvmStatic fun localUnwatchBatch(owner: Any, id: String?, episodes: Any?, profile: Int, completion: Any): Any? =
        NuvioPlaybackBridge.invoke(owner, "q", completion, arrayOf(id, episodes, profile)) { persisted ->
            if (id != null) NuvioPlaybackBridge.remove("${SNAPSHOT}_$profile", id, episodes as List<Pair<Int?, Int?>>, true, playbackProvider(profile), persisted) else Unit
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
                if ((providerId as? Enum<*>)?.name == mainTracking() && test.invoke(providerId) == true) {
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

    private fun enabled(): Boolean {
        if (settingsReadLogged.get()) return preferences().getBoolean(ENABLED, false)
        val started = System.nanoTime()
        val value = preferences().getBoolean(ENABLED, false)
        if (settingsReadLogged.compareAndSet(false, true)) {
            Log.d(TAG, "Merge settings first read: elapsedMs=${(System.nanoTime() - started) / 1_000_000}")
        }
        return value
    }
    private fun preferences() = application().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
    private fun historyPreferences() = application().getSharedPreferences("${PREFS}_history", Context.MODE_PRIVATE)
    private fun membershipPreferences() = application().getSharedPreferences("${PREFS}_membership_v2", Context.MODE_PRIVATE)
    private fun startupPreferences() = application().getSharedPreferences("${PREFS}_startup_light", Context.MODE_PRIVATE)
    private fun application(): Application = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null) as Application
    private fun snapshotKey(): String {
        val repo = repository ?: return "${SNAPSHOT}_unavailable"
        val profile = field(repo, "j").get(repo)
        val id = (field(profile, "f").get(profile) as StateFlow<*>).value
        return "${SNAPSHOT}_$id"
    }
    private fun field(owner: Any, name: String): Field = fields.getOrPut(owner.javaClass to name) {
        generateSequence(owner.javaClass as Class<*>?) { it.superclass }
            .mapNotNull { type -> runCatching { type.getDeclaredField(name) }.getOrNull() }
            .first().apply { isAccessible = true }
    }
    private fun findMethod(owner: Class<*>, name: String, count: Int): Method {
        mergeWorkCheck.get()?.invoke()
        return methods.getOrPut(Triple(owner, name, count)) {
            owner.declaredMethods.filter { it.name == name && it.parameterCount == count }
                .ifEmpty { owner.methods.filter { it.name == name && it.parameterCount == count } }
                .single().apply { isAccessible = true }
        }
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
