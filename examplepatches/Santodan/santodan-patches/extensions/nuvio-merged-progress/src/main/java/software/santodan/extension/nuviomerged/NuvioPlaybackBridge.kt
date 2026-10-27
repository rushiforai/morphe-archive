package software.santodan.extension.nuviomerged

import android.util.Log
import java.lang.reflect.InvocationTargetException
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicLong
import kotlin.coroutines.Continuation
import kotlinx.coroutines.flow.MutableStateFlow
import org.json.JSONObject

/** A coalesced local journal. Its worker never collects providers or decodes the merged history cache. */
internal object NuvioPlaybackBridge {
    val revision = MutableStateFlow(0L)
    private val eventTime = AtomicLong()
    private val publications = AtomicLong()
    private class Pending {
        val entries = LinkedHashMap<NuvioLocalOverlay.Key, NuvioLocalOverlay.Entry<Any>>()
        val completions = ArrayList<Continuation<Any?>>()
    }
    private val pending = LinkedHashMap<String, Pending>()
    private val scheduled = AtomicBoolean()
    private val anchors = java.util.Collections.synchronizedMap(java.util.WeakHashMap<Any, Boolean>())
    private val worker = java.util.concurrent.Executors.newSingleThreadExecutor { task ->
        Thread(task, "SantodanPlaybackOverlay").apply { isDaemon = true }
    }
    val overlay = NuvioLocalOverlay(object : NuvioLocalOverlay.Model<Any> {
        override fun key(record: Any) = NuvioMergedProgress.playbackKey(record)
        override fun updated(record: Any) = NuvioMergedProgress.playbackNumber(record, "getLastWatched")
        override fun position(record: Any) = NuvioMergedProgress.playbackNumber(record, "getPosition")
        override fun completed(record: Any) = NuvioMergedProgress.playbackCompleted(record)
        override fun anchor(template: Any, episode: Pair<Int, Int>) = NuvioMergedProgress.playbackAnchor(template, episode)
            .also { anchors[it] = true }
    })
    private val journal = NuvioPlaybackJournal(overlay, object : NuvioPlaybackJournal.Storage<Any> {
        override fun read(profile: String): Collection<NuvioLocalOverlay.Entry<Any>> =
            NuvioMergedProgress.playbackPreferences(profile).all.values.mapNotNull { raw ->
                runCatching {
                    val json = JSONObject(raw as String)
                    val k = NuvioLocalOverlay.key(json.getString("id"), json.getString("type"),
                        if (json.isNull("season")) null else json.getInt("season"),
                        if (json.isNull("episode")) null else json.getInt("episode"))
                    NuvioLocalOverlay.Entry(k, NuvioLocalOverlay.Action.valueOf(json.getString("action")),
                        if (json.isNull("record")) null else NuvioMergedProgress.decodePlayback(json.getString("record")),
                        json.getLong("at"), json.getString("provider"),
                        if (json.isNull("watched")) null else json.getBoolean("watched"))
                }.onFailure { Log.w("SantodanMergedProgress", "Malformed local overlay entry ignored", it) }.getOrNull()
            }
        override fun write(profile: String, changed: Collection<NuvioLocalOverlay.Entry<Any>>, removed: Set<NuvioLocalOverlay.Key>) {
            if (changed.isEmpty() && removed.isEmpty()) return
            val edit = NuvioMergedProgress.playbackPreferences(profile).edit()
            for (key in removed) edit.remove(storageKey(key))
            for (entry in changed) {
                val key = entry.key
                edit.putString(storageKey(key), JSONObject().put("id", key.id).put("type", key.type)
                    .put("season", key.season ?: JSONObject.NULL).put("episode", key.episode ?: JSONObject.NULL)
                    .put("action", entry.action.name).put("at", entry.at).put("provider", entry.provider)
                    .put("watched", entry.watched ?: JSONObject.NULL)
                    .put("record", entry.record?.let(NuvioMergedProgress::encodePlayback) ?: JSONObject.NULL).toString())
            }
            check(edit.commit()) { "Could not persist local playback overlay" }
        }
    })

    private fun storageKey(key: NuvioLocalOverlay.Key) = "${key.type}|${key.id}|${key.season}|${key.episode}"
    fun entries(profile: String) = journal.entries(profile)
    fun load(profile: String) { journal.load(profile) }
    fun changed() { revision.value = publications.incrementAndGet() }
    private var historyBase: Map<String, Set<Pair<Int, Int>>>? = null
    private var historyAliases: Map<String, Set<String>>? = null
    private var historyProfile: String? = null
    private var historyFlags: List<Pair<NuvioLocalOverlay.Key, Boolean>> = emptyList()
    private var historyResult: Map<String, Set<Pair<Int, Int>>> = emptyMap()
    @Synchronized fun history(profile: String, base: Map<String, Set<Pair<Int, Int>>>, aliases: Map<String, Set<String>>): Map<String, Set<Pair<Int, Int>>> {
        val entries = entries(profile)
        val flags = entries.mapNotNull { entry ->
            val watched = if (entry.action == NuvioLocalOverlay.Action.UNWATCH) false else entry.watched
                ?: entry.record?.takeIf { overlay.model.completed(it) }?.let { true }
            watched?.let { entry.key to it }
        }
        if (base === historyBase && aliases === historyAliases && profile == historyProfile && flags == historyFlags) return historyResult
        historyResult = overlay.history(base, entries, aliases)
        historyBase = base; historyAliases = aliases; historyProfile = profile; historyFlags = flags
        return historyResult
    }
    fun localSeed(profile: String, record: Any): Boolean = anchors[record] == true || entries(profile).any {
        it.action == NuvioLocalOverlay.Action.PLAY && it.record != null &&
            it.key == overlay.model.key(record) && overlay.model.updated(it.record) == overlay.model.updated(record)
    }

    @Suppress("UNCHECKED_CAST")
    fun invoke(owner: Any, name: String, completion: Any, args: Array<Any?>, saved: (Continuation<Any?>) -> Any?): Any? {
        // Original R8 state machines re-enter the wrapper with placeholder arguments.
        val state = mapOf("C" to "pb", "D" to "qb", "A" to "nb", "B" to "ob")[name]
        val resume = state != null && completion.javaClass.name == "com.nuvio.tv.data.local.$state"
        val callback = if (!NuvioMergedProgress.playbackEnabled() || resume) completion else
            NuvioLocalWriteContinuation(completion as Continuation<Any?>) { persisted ->
                runCatching { if (NuvioMergedProgress.playbackEnabled()) saved(persisted) else kotlin.Unit }
                    .onFailure { Log.w("SantodanMergedProgress", "Local playback overlay notification failed", it) }.getOrDefault(kotlin.Unit)
            }
        val method = NuvioMergedProgress.playbackMethod(owner, "santodanLocal$name", args.size + 1)
        val result = try { method.invoke(owner, *args, callback) }
        catch (error: InvocationTargetException) { throw (error.cause ?: error) }
        return if (callback is NuvioLocalWriteContinuation && !resume) callback.inlineResult(result) else result
    }

    fun save(profile: String, records: Any?, provider: String, completion: Continuation<Any?>): Any {
        val values = if (records is Collection<*>) records.filterNotNull() else listOfNotNull(records)
        val time = eventTime.updateAndGet { previous -> maxOf(previous + 1, System.currentTimeMillis()) }
        val rows = values.filter { NuvioMergedProgress.acceptPlaybackRecord(it, profile) }.map { record ->
            NuvioLocalOverlay.Entry(overlay.model.key(record), NuvioLocalOverlay.Action.PLAY, record, time, provider)
        }
        return enqueue(profile, rows, completion)
    }
    fun remove(profile: String, id: String, episodes: List<Pair<Int?, Int?>>, unwatch: Boolean, provider: String,
               completion: Continuation<Any?>): Any {
        val time = eventTime.updateAndGet { previous -> maxOf(previous + 1, System.currentTimeMillis()) }
        return enqueue(profile, episodes.map { (season, episode) ->
            NuvioLocalOverlay.Entry(NuvioLocalOverlay.key(id, if (season == null) "movie" else "series", season, episode),
                if (unwatch) NuvioLocalOverlay.Action.UNWATCH else NuvioLocalOverlay.Action.REMOVE_PROGRESS, null, time, provider)
        }, completion)
    }
    private fun enqueue(profile: String, updates: List<NuvioLocalOverlay.Entry<Any>>, completion: Continuation<Any?>): Any {
        if (updates.isEmpty()) return kotlin.Unit
        synchronized(pending) {
            val batch = pending.getOrPut(profile) { Pending() }
            for (entry in updates) if ((batch.entries[entry.key]?.at ?: Long.MIN_VALUE) <= entry.at) batch.entries[entry.key] = entry
            batch.completions.add(completion)
        }
        schedule()
        return kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
    }
    private fun schedule() {
        if (!scheduled.compareAndSet(false, true)) return
        worker.execute {
            try {
                while (true) {
                    val batch = synchronized(pending) {
                        if (pending.isEmpty()) null else pending.entries.first().let {
                            (it.key to it.value).also { row -> pending.remove(row.first) }
                        }
                    } ?: break
                    try { journal.apply(batch.first, batch.second.entries.values, ::changed) }
                    catch (error: Exception) { Log.w("SantodanMergedProgress", "Local playback journal write failed; native local record retained", error) }
                    finally { batch.second.completions.forEach { completion ->
                        runCatching { completion.resumeWith(Result.success(kotlin.Unit)) }
                            .onFailure { Log.w("SantodanMergedProgress", "Native local-write continuation dispatch failed", it) }
                    } }
                }
            } finally {
                scheduled.set(false)
                if (synchronized(pending) { pending.isNotEmpty() }) schedule()
            }
        }
    }
    fun reconcile(profile: String, provider: String, progress: Collection<Any>, seeds: Collection<Any>,
        history: Map<String, Set<Pair<Int, Int>>>, aliases: Map<String, Set<String>>, authoritative: Boolean, started: Long,
        watchedItems: Collection<Any>, visibleProgress: Collection<Any>, visibleSeeds: Collection<Any>,
        visibleHistory: Map<String, Set<Pair<Int, Int>>>, visibleWatchedItems: Collection<Any>) {
        val timestamps = watchedItems.associate { overlay.model.key(it) to NuvioMergedProgress.playbackNumber(it, "getWatchedAt") }
        val visibleTimestamps = visibleWatchedItems.associate { overlay.model.key(it) to NuvioMergedProgress.playbackNumber(it, "getWatchedAt") }
        try {
            if (journal.reconcile(profile, provider, progress, seeds, history, aliases, authoritative, started, timestamps) {
                // A receipt from the destination must not expose an older winning snapshot from another source.
                overlay.acknowledged(it, provider, visibleProgress, visibleSeeds, visibleHistory, aliases,
                    authoritative, started, visibleTimestamps)
            }) changed()
        } catch (error: kotlinx.coroutines.CancellationException) { throw error }
        catch (error: Exception) {
            changed()
            Log.w("SantodanMergedProgress", "Local playback receipt could not be persisted; provider snapshot remains usable", error)
        }
    }
}
