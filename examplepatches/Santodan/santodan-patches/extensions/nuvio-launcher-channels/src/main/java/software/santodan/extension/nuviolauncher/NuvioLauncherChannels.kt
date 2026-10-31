package software.santodan.extension.nuviolauncher

import software.santodan.nuvio.NuvioAccess

import software.santodan.nuvio.NuvioNative

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.util.Log
import java.lang.reflect.Proxy
import java.util.WeakHashMap
import java.util.concurrent.ConcurrentHashMap
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import org.json.JSONArray
import org.json.JSONObject
import software.santodan.extension.nuviolauncher.LauncherModels.Source
import software.santodan.extension.nuviolauncher.LauncherModels.Tile

/** Native repositories remain responsible for authentication, fetching, and profile storage. */
@OptIn(FlowPreview::class, ExperimentalCoroutinesApi::class)
object NuvioLauncherChannels {
    private const val TAG = "SantodanLauncher"
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO +
        CoroutineExceptionHandler { _, error -> Log.e(TAG, "Launcher observer failed", error) })
    private val revision = MutableStateFlow(0)
    private val refresh = MutableStateFlow(0)
    private val lock = Mutex()
    private val homes = WeakHashMap<Any, Job>()
    private val uiStates = ConcurrentHashMap<String, Any>()
    private val sources = linkedMapOf<String, Source>()
    private var libraryJob: Job? = null
    private var profileJob: Job? = null
    @Volatile private var profileFlow: StateFlow<*>? = null
    @Volatile private var currentProfile: String? = null
    @Volatile private var choices: List<Source> = emptyList()
    @Volatile private var menuRevision: Any? = null
    private val publisher by lazy { LauncherPublisher(app()) { tile ->
        LauncherArtwork.uri(app(), tile, ::requestPublish)
    } }
    private val artworkSettingsListener = android.content.SharedPreferences.OnSharedPreferenceChangeListener { _, _ -> requestPublish() }

    private fun app(): Application = Class.forName("android.app.ActivityThread")
        .getMethod("currentApplication").invoke(null) as Application
    private fun field(owner: Any, name: String): Any? = owner.javaClass.getDeclaredField(name)
        .apply { isAccessible = true }.get(owner)
    private fun method(owner: Class<*>, name: String, count: Int) = owner.declaredMethods
        .single { it.name == name && it.parameterCount == count }.apply { isAccessible = true }
    private fun call(owner: Any, name: String): Any? = method(owner.javaClass, name, 0).invoke(owner)
    private fun text(owner: Any, name: String) = call(owner, name) as? String ?: ""
    @Suppress("UNCHECKED_CAST") private fun list(owner: Any, name: String) = call(owner, name) as List<Any>
    @Suppress("UNCHECKED_CAST") private fun flow(owner: Any, name: String) = field(owner, name) as Flow<Any>
    @Suppress("UNCHECKED_CAST") private fun flowCall(owner: Any, name: String) = call(owner, name) as Flow<Any>
    private fun active() = profileFlow?.value?.toString()
    private fun prefs(profile: String) = app().getSharedPreferences("santodan_launcher_" + profile, 0)
    private fun selected(profile: String) = prefs(profile).getStringSet("selected", emptySet())!!.toSet()

    @JvmStatic fun effectiveCachedHasAired(cached: Any): Boolean {
        val native = field(cached, "n") as Boolean
        if (!native) return false
        return try {
            val bridge = cached.javaClass.classLoader!!.loadClass("software.santodan.extension.nuvioairing.NuvioAiringSeries")
            bridge.getMethod("effectiveHasAired", Any::class.java).invoke(null, cached) as Boolean
        } catch (_: ClassNotFoundException) { native }
        catch (error: Exception) { Log.e(TAG, "Launcher aired policy failed", error); native }
    }

    @JvmStatic fun registerComponent(component: Any) {
        val startupStartedNanos = System.nanoTime()
        Log.d(TAG, "Startup begin: stage=launcher.component thread=${Thread.currentThread().name}")
        try {
            if (profileJob != null || !publisher.supported()) return
            val manager = call(NuvioAccess.profileProvider(component)!!, "get")!!
            profileFlow = field(manager, "f") as StateFlow<*>
            for (name in listOf("santodan_nuvio_airing_series", "santodan_nuvio_date_label_style"))
                app().getSharedPreferences(name, 0).registerOnSharedPreferenceChangeListener(artworkSettingsListener)
            app().registerActivityLifecycleCallbacks(object : Application.ActivityLifecycleCallbacks {
                private var started = 0
                override fun onActivityStarted(activity: Activity) { started++ }
                override fun onActivityStopped(activity: Activity) {
                    started--
                    if (started == 0) requestPublish()
                }
                override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {}
                override fun onActivityResumed(activity: Activity) {}
                override fun onActivityPaused(activity: Activity) {}
                override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}
                override fun onActivityDestroyed(activity: Activity) {}
            })
            profileJob = scope.launch {
                profileFlow!!.collect { value ->
                    lock.withLock {
                        currentProfile = value.toString()
                        sources.clear()
                        readCache(currentProfile!!).forEach { sources[it.key] = it }
                        updateChoices()
                        publishLocked()
                    }
                    revision.value += 1
                }
            }
            scope.launch {
                revision.debounce(1500).collect { lock.withLock { publishLocked() } }
            }
        } catch (error: Exception) { Log.e(TAG, "Launcher registration failed", error) }
        finally { Log.d(TAG, "Startup end: stage=launcher.component elapsedMs=${(System.nanoTime() - startupStartedNanos) / 1_000_000}") }
    }

    private fun requestPublish() { revision.value += 1 }
    private fun updateChoices() {
        choices = sources.values.toList()
        menuRevision?.let { state ->
            method(state.javaClass, "setValue", 1).invoke(state, revision.value + choices.hashCode())
        }
    }
    private suspend fun replace(profile: String, group: String, values: List<Source>) {
        lock.withLock {
            if (active() != profile || currentProfile != profile) return
            sources.entries.removeAll { it.value.group == group }
            values.forEach { sources[it.key] = it.copy(tiles = LauncherModels.tiles(it.tiles)) }
            updateChoices()
            requestPublish()
        }
    }
    private fun publishLocked() {
        val profile = currentProfile ?: return
        if (profile != active()) return
        try {
            val enabled = selected(profile)
            val desired = sources.values.filter { it.key in enabled }.map { source ->
                if (source.group == "upcoming") source.copy(tiles = source.tiles.map { tile ->
                    val airing = app().getSharedPreferences("santodan_nuvio_airing_series", 0)
                    val finale = airing.getLong("finale_v1_" + tile.id, 0L)
                    if (airing.getBoolean("enabled", false) && finale > System.currentTimeMillis())
                        tile.copy(dateLabel = java.text.SimpleDateFormat("dd-MMM", java.util.Locale.getDefault()).format(java.util.Date(finale)))
                    else tile
                }) else source
            }
            publisher.reconcile(desired)
            writeCache(profile)
            NativeContinueWatchingDiagnostics.report(app(), profile)
        } catch (error: Exception) { Log.e(TAG, "Launcher synchronization failed", error) }
    }

    @JvmStatic fun observeHome(model: Any) {
        try {
            if (!publisher.supported()) return
            synchronized(homes) {
                if (homes.containsKey(model)) return
                val state = field(model, "z") as StateFlow<*>
                val addonFlow = flow(field(model, "b")!!, "r")
                val repository = field(model, "d")!!
                homes[model] = scope.launch {
                    // Component registration precedes creation of HomeViewModel.
                    val profiles = profileFlow ?: return@launch
                    var previousProfile: String? = null
                    profiles.collectLatest { profileValue ->
                        val profile = profileValue.toString()
                        val previousState = state.value
                        val switching = previousProfile != null && previousProfile != profile
                        previousProfile = profile
                        delay(600) // native repositories clear their profile-scoped flows first
                        coroutineScope {
                            launch {
                                state.collect { value ->
                                    if (value == null || (switching && value === previousState)) return@collect
                                    @Suppress("UNCHECKED_CAST")
                                    val upcoming = field(value, "c") as List<Any>
                                    {
                                        @Suppress("UNCHECKED_CAST")
                                        NativeContinueWatchingDiagnostics.observe(profile, field(value, "b") as List<Any>)
                                    }
                                    replace(profile, "upcoming", listOf(Source("upcoming", "Upcoming", "upcoming",
                                        upcoming.map { upcomingTile(it) })))
                                }
                            }
                            launch {
                                combine(addonFlow, refresh) { addons, _ -> addons }.collectLatest { addons ->
                                    @Suppress("UNCHECKED_CAST")
                                    val catalogs = catalogChoices(addons as List<Any>)
                                    lock.withLock {
                                        if (active() != profile || currentProfile != profile) return@withLock
                                        val keys = catalogs.map { it.first.key }.toSet()
                                        sources.entries.removeAll { it.value.group == "catalog" && it.key !in keys }
                                        for ((source, _) in catalogs) sources[source.key] =
                                            source.copy(tiles = sources[source.key]?.tiles ?: emptyList())
                                        updateChoices()
                                    }
                                    // Fetch selected catalogs even when Home's lazy row has never been scrolled into view.
                                    val enabled = selected(profile)
                                    for ((source, args) in catalogs) if (source.key in enabled) {
                                        try {
                                            val fetch = method(repository.javaClass, "a", 11)
                                            val screen = fetch.parameterTypes.last().enumConstants!!.single { (it as Enum<*>).name == "HOME" }
                                            @Suppress("UNCHECKED_CAST")
                                            val results = fetch.invoke(repository, *args, screen) as Flow<Any>
                                            withTimeout(30_000) {
                                                results.collect { result ->
                                                    if (result.javaClass.name == "b9.q") {
                                                        val row = field(result, "a")!!
                                                        val tiles = list(row, "getItems").map { mediaTile(it) }
                                                        lock.withLock {
                                                            if (active() == profile && currentProfile == profile) {
                                                                sources[source.key] = source.copy(tiles = LauncherModels.tiles(tiles))
                                                                updateChoices()
                                                                publishLocked()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        } catch (timeout: TimeoutCancellationException) { Log.w(TAG, "Catalog channel refresh timed out") }
                                        catch (cancelled: CancellationException) { throw cancelled }
                                        catch (error: Exception) { Log.e(TAG, "Catalog channel refresh failed", error) }
                                    }
                                }
                            }
                            launch { while (isActive) { delay(30 * 60_000L); refresh.value += 1; requestPublish() } }
                        }
                    }
                }
            }
        } catch (error: Exception) { Log.e(TAG, "Home channel observation failed", error) }
    }

    @JvmStatic fun stopHome(model: Any) {
        synchronized(homes) { homes.remove(model)?.cancel() }
    }

    private fun catalogChoices(addons: List<Any>): List<Pair<Source, Array<Any>>> = buildList {
        for (addon in addons) {
            if (call(addon, "getEnabled") != true) continue
            for (catalog in list(addon, "getCatalogs")) {
                val extras = list(catalog, "getExtra")
                val defaults = extras.mapNotNull { extra ->
                    val value = call(extra, "getDefaultValue") as? String
                    value?.let { text(extra, "getName") to it }
                }.toMap().toMutableMap()
                val required = (list(catalog, "getExtraRequired").map { it as String } +
                    extras.filter { call(it, "isRequired") == true }.map { text(it, "getName") }).toSet()
                // Search/genre catalogs without a default cannot produce an unfiltered launcher row.
                if (required.any { it != "skip" && it !in defaults }) continue
                if ("skip" in required) defaults["skip"] = "0"
                val url = text(addon, "getBaseUrl")
                val addonId = text(addon, "getId")
                val name = text(addon, "getDisplayName")
                val id = text(catalog, "getId")
                val title = text(catalog, "getName")
                val type = text(catalog, "getApiType")
                val key = LauncherModels.key("catalog", url.trimEnd('/'), addonId, type, id)
                val source = Source(key, "$title · $name ($type)", "catalog", emptyList(),
                    LauncherModels.key("addon", url.trimEnd('/'), addonId), name)
                add(source to arrayOf(url, addonId, name, id, title, type, 0, 100, defaults, false))
            }
        }
    }

    @JvmStatic fun observeLibrary(repository: Any) {
        try {
            if (!publisher.supported() || libraryJob != null) return
            libraryJob = scope.launch {
                val profiles = field(field(repository, "g")!!, "f") as StateFlow<*>
                profiles.collectLatest { profileValue ->
                    val profile = profileValue.toString()
                    delay(600)
                    coroutineScope {
                        launch {
                            flow(repository, "n").collect { value ->
                                @Suppress("UNCHECKED_CAST")
                                replace(profile, "library", listOf(Source("library", "Library", "library",
                                    (value as List<Any>).map { mediaTile(it) })))
                            }
                        }
                        val registry = field(repository, "f")!!
                        val providers = list(registry, "b")
                        val providerFlows = providers.map { provider ->
                            flowCall(provider, "b").flatMapLatest { authenticated ->
                                if (authenticated != true) flowOf(emptyList<Source>())
                                else combine(flowCall(provider, "n"), flowCall(provider, "c")) { entries, tabs ->
                                    @Suppress("UNCHECKED_CAST")
                                    trackingSources(provider, entries as List<Any>, tabs as List<Any>)
                                }
                            }
                        }
                        launch {
                            if (providerFlows.isEmpty()) replace(profile, "tracking", emptyList())
                            else combine(providerFlows) { it.toList().flatten() }.collect { replace(profile, "tracking", it) }
                        }
                    }
                }
            }
        } catch (error: Exception) { Log.e(TAG, "Library channel observation failed", error) }
    }

    private fun trackingSources(provider: Any, entries: List<Any>, tabs: List<Any>): List<Source> {
        val providerId = (call(provider, "a") as Enum<*>).name
        return tabs.map { tab ->
            val listKey = text(tab, "getKey")
            val members = entries.map { entry ->
                @Suppress("UNCHECKED_CAST")
                mediaTile(entry) to (call(entry, "getListKeys") as Set<String>)
            }
            val ranks = entries.associate { entry ->
                @Suppress("UNCHECKED_CAST")
                val rank = (call(entry, "getListRanks") as Map<String, Int>)[listKey] ?: Int.MAX_VALUE
                text(entry, "getType") + ":" + text(entry, "getId") to rank
            }
            Source(LauncherModels.key("tracking", providerId, listKey),
                text(tab, "getTitle") + " · " + providerId, "tracking",
                LauncherModels.listItems(members, listKey, ranks), providerId, providerId)
        }
    }

    private fun mediaTile(item: Any): Tile {
        val type = if (item.javaClass.name.endsWith("LibraryEntry")) text(item, "getType") else text(item, "getApiType")
        return Tile(text(item, "getId"), type, text(item, "getName"),
            call(item, "getPoster") as? String, call(item, "getBackground") as? String,
            call(item, "getDescription") as? String)
    }
    private fun upcomingTile(item: Any): Tile {
        val info = field(item, "a")!!
        // Upcoming contains native NextUp items; model fields verified against both supported APKs.
        val nativeLabel = field(info, "o") as? String
        val released = field(info, "m") as? String
        val date = if (field(info, "n") == false)
            LauncherDates.label(released, nativeLabel) else null
        return Tile(field(info, "a") as String, field(info, "b") as String, field(info, "c") as String,
            field(info, "d") as? String, field(info, "e") as? String, nativeLabel, date)
    }

    @JvmStatic fun renderSettings(composer: Any) {
        try {
            val loader = composer.javaClass.classLoader!!
            val profile = active() ?: return
            val stateFactory = method(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1)
            val redraw = menuRevision ?: stateFactory.invoke(null, 0).also { menuRevision = it }
            call(redraw, "getValue") // register Compose's observation of changing source choices
            val selected = selected(profile)
            val toggleRow = method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "m", 13)
            fun renderSource(source: Source, rowComposer: Any) {
                val stateKey = profile + ":" + source.key
                val state = uiStates.getOrPut(stateKey) { stateFactory.invoke(null, source.key in selected) }
                val toggle = callback(loader) {
                    if (active() != profile) return@callback
                    val value = !(call(state, "getValue") as Boolean)
                    val keys = selected(profile).toMutableSet()
                    if (value) keys.add(source.key) else keys.remove(source.key)
                    prefs(profile).edit().putStringSet("selected", keys).apply()
                    method(state.javaClass, "setValue", 1).invoke(state, value)
                    refresh.value += 1
                    requestPublish()
                    menuRevision?.let { value ->
                        method(value.javaClass, "setValue", 1).invoke(value, (call(value, "getValue") as Number).toInt() + 1)
                    }
                }
                val group = when (source.group) { "catalog" -> "Catalog"; "tracking" -> "Tracking list"; else -> source.title }
                val title = if (source.sourceName.isNotBlank()) source.title.replace(" · ${source.sourceName}", "") else source.title
                toggleRow.invoke(null, title, "$group channel on the Android TV launcher", call(state, "getValue"),
                    toggle, null, callback(loader) {}, false, null, 0L, false, rowComposer, 0, 1008)
            }
            renderSource(Source("library", "Library", "library", emptyList()), composer)
            renderSource(Source("upcoming", "Upcoming", "upcoming", emptyList()), composer)
            for ((group, title) in listOf("catalog" to "Catalogs", "tracking" to "Tracking lists")) {
                val groups = LauncherModels.sourceGroups(choices, group)
                section(composer, profile + ":" + group, title, "Choose channels by source") { parent ->
                    for (source in groups) section(parent, profile + ":" + group + ":" + source.key,
                        source.title, "${source.entries.count { it.key in selected }} selected / ${source.entries.size}") { child ->
                        source.entries.forEach { renderSource(it, child) }
                    }
                }
            }
        } catch (error: Exception) { Log.e(TAG, "Launcher settings failed", error) }
    }
    private fun section(composer: Any, key: String, title: String, description: String, body: (Any) -> Unit) {
        val loader = composer.javaClass.classLoader!!
        val state = uiStates.getOrPut("expanded:" + key) { method(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, false) }
        val toggle = callback(loader) { method(state.javaClass, "setValue", 1).invoke(state, !(call(state, "getValue") as Boolean)) }
        val contentFunction = Proxy.newProxyInstance(loader, arrayOf(loader.loadClass("kotlin.jvm.functions.Function3"))) { proxy, invoked, args ->
            when (invoked.name) {
                "invoke" -> { body(args!![1]); loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null) }
                "hashCode" -> System.identityHashCode(proxy)
                "equals" -> proxy === args?.get(0)
                "toString" -> "LauncherSourceSection"
                else -> null
            }
        }
        val content = loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(Int::class.javaPrimitiveType, Any::class.java, Boolean::class.javaPrimitiveType)
            .newInstance(key.hashCode(), contentFunction, true)
        val modifier = loader.loadClass(NuvioNative.EMPTY_MODIFIER_NAME).getDeclaredField("b").apply { isAccessible = true }.get(null)
        method(loader.loadClass(NuvioNative.SETTINGS_SECTION_NAME), "a", 11).invoke(null,
            title, description, call(state, "getValue"), toggle, modifier, null, null, callback(loader) {}, content, composer, 0)
    }
    private fun callback(loader: ClassLoader, action: () -> Unit): Any =
        Proxy.newProxyInstance(loader, arrayOf(loader.loadClass("kotlin.jvm.functions.Function0"))) { proxy, called, args ->
            when (called.name) {
                "invoke" -> { action(); loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null) }
                "hashCode" -> System.identityHashCode(proxy)
                "equals" -> proxy === args?.get(0)
                "toString" -> "SantodanLauncherCallback"
                else -> null
            }
        }

    private fun writeCache(profile: String) {
        val array = JSONArray()
        for (source in sources.values) {
            val tiles = JSONArray()
            for (tile in source.tiles) tiles.put(JSONObject().put("id", tile.id).put("type", tile.type)
                .put("title", tile.title).put("poster", tile.poster).put("background", tile.background).put("description", tile.description)
                .put("dateLabel", tile.dateLabel))
            array.put(JSONObject().put("key", source.key).put("title", source.title).put("group", source.group).put("tiles", tiles)
                .put("sourceId", source.sourceId).put("sourceName", source.sourceName))
        }
        prefs(profile).edit().putString("snapshot", array.toString()).apply()
    }
    private fun readCache(profile: String): List<Source> = try {
        val array = JSONArray(prefs(profile).getString("snapshot", "[]"))
        (0 until array.length()).map { index ->
            val value = array.getJSONObject(index)
            val tiles = value.getJSONArray("tiles")
            Source(value.getString("key"), value.getString("title"), value.getString("group"),
                (0 until tiles.length()).map { i ->
                    val tile = tiles.getJSONObject(i)
                    fun nullable(key: String) = if (tile.isNull(key)) null else tile.getString(key)
                    Tile(tile.getString("id"), tile.getString("type"), tile.getString("title"),
                        nullable("poster"), nullable("background"), nullable("description"), nullable("dateLabel"))
                }, value.optString("sourceId", ""), value.optString("sourceName", ""))
        }
    } catch (error: Exception) { Log.e(TAG, "Launcher cache read failed", error); emptyList() }
}
