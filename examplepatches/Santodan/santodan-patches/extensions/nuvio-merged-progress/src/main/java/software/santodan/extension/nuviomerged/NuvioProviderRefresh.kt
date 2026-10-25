package software.santodan.extension.nuviomerged

import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import kotlin.coroutines.resume
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.flow.drop
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.flatMapLatest
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.emitAll
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.mapNotNull
import kotlinx.coroutines.flow.merge

/** Await the native refresh before sampling flows that can emit cached values immediately. */
object NuvioProviderRefresh {
    /** Observe small progress/seed/readiness projections, not every WatchedItem model. */
    suspend fun observeProgress(provider: Any, progress: String, ready: String, changed: () -> Unit) =
        observe(provider, listOf(progress, "f", ready), changed)
    /** Playback readiness does not mean canonical watched-show history has loaded. */
    suspend fun historyReady(loaded: () -> Boolean) {
        while (!loaded()) kotlinx.coroutines.delay(25)
    }
    /** A cold provider may return placeholder empty lists before its disk hydration finishes. */
    @Suppress("UNCHECKED_CAST")
    suspend fun ready(provider: Any, accessor: String) {
        val method = provider.javaClass.methods.single { it.name == accessor && it.parameterCount == 0 }
        (method.invoke(provider) as Flow<Any?>).first { it == true }
    }

    /** Saved episode membership must not start a bulk metadata batch during startup. */
    fun badgeCacheHit(nativeHit: Boolean, enabled: Boolean, ready: Boolean,
                      playback: Boolean, retry: Boolean): Boolean = when {
        !enabled -> nativeHit
        !ready || playback -> true
        retry -> false
        else -> nativeHit
    }

    /** Move only cached snapshots; never discard the source before a durable copy. */
    fun migrateSnapshots(legacy: Map<String, *>, contains: (String) -> Boolean,
        store: (Map<String, String>) -> Boolean, remove: (Set<String>) -> Boolean): Boolean {
        val snapshots = legacy.entries.filter { (key, value) ->
            key.startsWith("snapshot_v2_") && value is String && value.startsWith("{")
        }.associate { it.key to (it.value as String) }
        if (snapshots.isEmpty()) return true
        // A previous migration may have copied data but failed to remove its
        // source. Never overwrite a newer destination with that stale source.
        val missing = snapshots.filterKeys { !contains(it) }
        if (!store(missing)) return false
        return remove(snapshots.keys)
    }

    /** Proven beta.8 ComponentActivity/FullyDrawnReporter contract. */
    fun afterPresentation(owner: Any, presented: () -> Unit) {
        val reporter = owner.javaClass.getMethod("getFullyDrawnReporter").invoke(owner)
        val type = reporter.javaClass
        val lock = type.getDeclaredField("c").apply { isAccessible = true }.get(reporter)
        synchronized(lock) {
            if (type.getDeclaredField("f").apply { isAccessible = true }.getBoolean(reporter)) presented()
            else {
                @Suppress("UNCHECKED_CAST")
                val callbacks = type.getDeclaredField("g").apply { isAccessible = true }.get(reporter) as MutableList<Any>
                callbacks.add(presented)
            }
        }
    }

    /** Never expose the placeholder empty flow before disk hydration completes. */
    fun hydratedSnapshot(merged: StateFlow<List<Any>>, prepare: suspend () -> Unit): Flow<List<Any>> = flow {
        prepare()
        emitAll(merged)
    }

    /** Shared by the aggregate's progress and next-up readers. */
    fun retainedSnapshot(native: Flow<Any?>?, merged: StateFlow<List<Any>>,
        ready: StateFlow<Boolean>, allowNative: () -> Boolean): Flow<List<Any>> = flow {
        // Empty is a valid completed snapshot. MDBList/Simkl cold flows can
        // refresh on collection, so racing them against ready.first() is unsafe:
        // first() still waits for cancellation of the native startup operation.
        if (native == null || ready.value || !allowNative()) {
            emitAll(merged)
            return@flow
        }
        val initial = merged.value.takeIf { it.isNotEmpty() } ?: merge(
            native.mapNotNull { (it as? Collection<*>)?.filterNotNull()?.takeIf { values -> values.isNotEmpty() } },
            ready.filter { it }.map { merged.value },
        ).first()
        emit(initial)
        emitAll(merged)
    }

    @OptIn(kotlinx.coroutines.ExperimentalCoroutinesApi::class)
    fun route(revisions: Flow<Long>, resolve: () -> Flow<Any?>): Flow<Any?> =
        revisions.flatMapLatest { resolve() }

    /** Some native refresh methods signal background work rather than await its completion. */
    @Suppress("UNCHECKED_CAST")
    suspend fun observe(provider: Any, accessors: List<String>, changed: () -> Unit) = coroutineScope {
        accessors.forEach { name ->
            launch {
                val method = provider.javaClass.methods.single { it.name == name && it.parameterCount == 0 }
                val updates = method.invoke(provider) as Flow<Any?>
                updates.distinctUntilChanged().drop(1).collect { changed() }
            }
        }
    }

    suspend fun await(provider: Any, methodName: String, manual: Boolean = false) {
        val method = provider.javaClass.methods.single {
            it.name == methodName && it.parameterCount == 2
        }
        val intent = requireNotNull(method.parameterTypes[0].enumConstants).single {
            (it as Enum<*>).name == if (manual) "USER_INITIATED" else "AUTOMATIC"
        }
        suspendCancellableCoroutine<Any?> { completion ->
            val result = method.invoke(provider, intent, NuvioSourceContinuation(completion))
            if (result !== COROUTINE_SUSPENDED) completion.resume(result)
        }
    }
}
