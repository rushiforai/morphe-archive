package software.santodan.extension.nuviomerged

/** Incremental storage port permits host tests of restart, ordering, acknowledgement and profile isolation. */
class NuvioPlaybackJournal<T>(private val overlay: NuvioLocalOverlay<T>, private val storage: Storage<T>) {
    interface Storage<T> {
        fun read(profile: String): Collection<NuvioLocalOverlay.Entry<T>>
        fun write(profile: String, changed: Collection<NuvioLocalOverlay.Entry<T>>, removed: Set<NuvioLocalOverlay.Key>)
    }
    private val profiles = java.util.concurrent.ConcurrentHashMap<String, Map<NuvioLocalOverlay.Key, NuvioLocalOverlay.Entry<T>>>()
    fun entries(profile: String): Collection<NuvioLocalOverlay.Entry<T>> = profiles[profile]?.values.orEmpty()
    @Synchronized fun load(profile: String) {
        if (profiles.containsKey(profile)) return
        val saved = storage.read(profile)
        val retained = overlay.compact(saved)
        val removed = saved.map { it.key }.toSet() - retained.keys
        if (removed.isNotEmpty()) storage.write(profile, emptyList(), removed)
        profiles[profile] = retained
    }
    @Synchronized fun apply(profile: String, updates: Collection<NuvioLocalOverlay.Entry<T>>, published: () -> Unit = {}) {
        load(profile)
        val old = profiles.getValue(profile)
        val next = old.toMutableMap()
        for (entry in updates) if ((next[entry.key]?.at ?: Long.MIN_VALUE) <= entry.at) {
            val previous = next[entry.key]
            if (entry.action == NuvioLocalOverlay.Action.PLAY && entry.record != null && previous?.record != null &&
                overlay.model.updated(entry.record) < overlay.model.updated(previous.record)) continue
            val watched = when (entry.action) {
                NuvioLocalOverlay.Action.UNWATCH -> false
                NuvioLocalOverlay.Action.PLAY -> if (entry.record != null && overlay.model.completed(entry.record)) true else previous?.watched
                NuvioLocalOverlay.Action.REMOVE_PROGRESS -> previous?.watched
            }
            next[entry.key] = entry.copy(watched = watched,
                record = entry.record ?: previous?.record)
        }
        val compact = overlay.compact(next.values)
        val changed = compact.filter { (key, entry) -> old[key] != entry }.values
        val removed = old.keys - compact.keys
        // Publish even if the optional journal's disk write fails; native persistence already succeeded.
        profiles[profile] = compact
        published()
        storage.write(profile, changed, removed)
    }
    @Synchronized fun reconcile(profile: String, provider: String, progress: Collection<T>, seeds: Collection<T>,
        history: Map<String, Set<Pair<Int, Int>>>, aliases: Map<String, Set<String>>, authoritative: Boolean,
        startedAt: Long, watchedAt: Map<NuvioLocalOverlay.Key, Long> = emptyMap(),
        canRetire: (NuvioLocalOverlay.Entry<T>) -> Boolean = { true }): Boolean {
        load(profile)
        val old = profiles.getValue(profile)
        val next = overlay.compact(old.values.filterNot {
            overlay.acknowledged(it, provider, progress, seeds, history, aliases, authoritative, startedAt, watchedAt) && canRetire(it)
        })
        if (old == next) return false
        profiles[profile] = next
        storage.write(profile, emptyList(), old.keys - next.keys)
        return true
    }
}
