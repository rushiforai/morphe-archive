package software.santodan.extension.nuviomerged

/** Local records overlay an immutable provider baseline. No network, metadata or Android dependencies. */
class NuvioLocalOverlay<T>(val model: Model<T>) {
    data class Key(val id: String, val type: String, val season: Int?, val episode: Int?) {
        val show get() = "$type|$id"
    }
    enum class Action { PLAY, REMOVE_PROGRESS, UNWATCH }
    data class Entry<T>(val key: Key, val action: Action, val record: T?, val at: Long, val provider: String,
                        val watched: Boolean? = null)
    interface Model<T> {
        fun key(record: T): Key
        fun updated(record: T): Long
        fun position(record: T): Long
        fun completed(record: T): Boolean
        /** A next-up anchor backed by remaining watched membership, never a resume/detail record. */
        fun anchor(template: T, episode: Pair<Int, Int>): T
    }
    companion object {
        fun key(id: String, type: String, season: Int?, episode: Int?) =
            Key(id.removePrefix("imdb:"), if (type == "tv") "series" else type, season, episode)
    }

    /** Pending user data must not be silently aged out or truncated while a provider remains stale. */
    fun compact(entries: Collection<Entry<T>>): Map<Key, Entry<T>> = entries
        .sortedBy { it.at }.associateBy { it.key }

    fun related(id: String, aliases: Map<String, Set<String>>): Set<String> {
        val normalized = id.removePrefix("imdb:")
        val siblings = aliases[id] ?: aliases[normalized].orEmpty()
        return if ("__ambiguous__" in siblings) setOf(id, normalized)
        else siblings + id + normalized
    }
    private fun matches(key: Key, other: Key, aliases: Map<String, Set<String>>) =
        key.type == other.type && other.id in related(key.id, aliases)
    fun sameEpisode(key: Key, other: Key, aliases: Map<String, Set<String>>) =
        matches(key, other, aliases) && key.season == other.season && key.episode == other.episode

    private fun group(key: Key, aliases: Map<String, Set<String>>) = "${key.type}|${related(key.id, aliases).minOrNull()}"
    private fun plays(entries: Collection<Entry<T>>, aliases: Map<String, Set<String>>): List<Entry<T>> {
        fun episode(key: Key) = "${group(key, aliases)}|${key.season}|${key.episode}"
        val removals = entries.filter { it.action != Action.PLAY }.groupBy { episode(it.key) }
            .mapValues { (_, rows) -> rows.maxOf { it.at } }
        return entries.filter { it.action == Action.PLAY && (removals[episode(it.key)] ?: Long.MIN_VALUE) < it.at }
            .groupBy { group(it.key, aliases) }.values.map { rows ->
                rows.maxWith(compareBy<Entry<T>> { it.at }.thenBy { it.key.season ?: 0 }.thenBy { it.key.episode ?: 0 })
            }
    }

    fun history(base: Map<String, Set<Pair<Int, Int>>>, entries: Collection<Entry<T>>,
                aliases: Map<String, Set<String>>): Map<String, Set<Pair<Int, Int>>> {
        val changed = LinkedHashMap<String, MutableSet<Pair<Int, Int>>>()
        for (entry in entries) {
            val k = entry.key
            val pair = if (k.season != null && k.episode != null) k.season to k.episode else continue
            val watched = when (entry.action) {
                Action.UNWATCH -> false
                Action.PLAY -> entry.watched ?: if (entry.record != null && model.completed(entry.record)) true else continue
                Action.REMOVE_PROGRESS -> entry.watched ?: continue
            }
            for (id in related(k.id, aliases)) {
                val old = changed[id] ?: base[id].orEmpty()
                if (watched != (pair in old)) {
                    val set = changed.getOrPut(id) { base[id].orEmpty().toMutableSet() }
                    if (watched) set.add(pair) else set.remove(pair)
                }
            }
        }
        return if (changed.isEmpty()) base else LinkedHashMap(base).apply { putAll(changed) }
    }

    /** One current local playback intent per show. Completed episodes never become resume cards. */
    fun progress(base: List<T>, entries: Collection<Entry<T>>, aliases: Map<String, Set<String>>): List<T> {
        if (entries.isEmpty()) return base
        val latest = plays(entries, aliases)
        val result = base.filter { record ->
            val key = model.key(record)
            latest.none { matches(it.key, key, aliases) && it.action == Action.PLAY } &&
                entries.none { it.action != Action.PLAY && sameEpisode(it.key, key, aliases) }
        }.toMutableList()
        latest.filter { it.action == Action.PLAY }.mapNotNull { it.record }
            .filterNot(model::completed).forEach(result::add)
        return result.sortedByDescending(model::updated)
    }

    /** Native next-up consumes the completed episode itself and advances it exactly once. */
    fun seeds(base: List<T>, entries: Collection<Entry<T>>, history: Map<String, Set<Pair<Int, Int>>>,
              aliases: Map<String, Set<String>>): List<T> {
        if (entries.isEmpty()) return base
        val result = base.toMutableList()
        val latest = plays(entries, aliases)
        for (entry in latest) {
            if (entry.action == Action.PLAY && entry.record != null) {
                result.removeAll { matches(entry.key, model.key(it), aliases) }
                result.add(entry.record)
            }
        }
        for (entry in entries.filter { it.action == Action.UNWATCH }) {
            val existing = result.firstOrNull { sameEpisode(entry.key, model.key(it), aliases) } ?: continue
            if (latest.none { it.at > entry.at && sameEpisode(it.key, entry.key, aliases) }) {
                result.remove(existing)
                val remaining = related(entry.key.id, aliases).firstNotNullOfOrNull { history[it] }.orEmpty()
                remaining.maxWithOrNull(compareBy<Pair<Int, Int>> { it.first }.thenBy { it.second })
                    ?.let { result.add(model.anchor(existing, it)) }
            }
        }
        return result.sortedByDescending(model::updated)
    }

    fun details(base: Map<Pair<Int, Int>, T>, id: String, entries: Collection<Entry<T>>,
                aliases: Map<String, Set<String>>): Map<Pair<Int, Int>, T> {
        val selected = entries.filter { id.removePrefix("imdb:") in related(it.key.id, aliases) }
        if (selected.isEmpty()) return base
        val result = base.toMutableMap()
        for (entry in selected) {
            val k = entry.key
            if (k.season == null || k.episode == null) continue
            val pair = k.season to k.episode
            if (entry.action == Action.PLAY && entry.record != null) result[pair] = entry.record
            else result.remove(pair)
        }
        return result
    }

    /** Only the write destination can acknowledge an overlay; other included sources cannot erase it. */
    fun acknowledged(entry: Entry<T>, provider: String, progress: Collection<T>, seeds: Collection<T>,
                     history: Map<String, Set<Pair<Int, Int>>>, aliases: Map<String, Set<String>>,
                     authoritative: Boolean, startedAt: Long, watchedAt: Map<Key, Long> = emptyMap()): Boolean {
        if (entry.provider != provider || entry.at > startedAt) return false
        val actual = (progress + seeds).filter { sameEpisode(entry.key, model.key(it), aliases) }
        val showActivity = (progress + seeds).filter { matches(entry.key, model.key(it), aliases) }
        val timestamps = watchedAt.filterKeys { sameEpisode(entry.key, it, aliases) }.values
        val watched = timestamps.isNotEmpty() || related(entry.key.id, aliases).any {
            entry.key.season to entry.key.episode in history[it].orEmpty()
        }
        val record = entry.record
        if (authoritative && showActivity.any { model.updated(it) > entry.at }) return true
        val membershipMatches = entry.watched == null || entry.watched == watched
        return when (entry.action) {
            Action.PLAY -> record != null && if (model.completed(record)) {
                watched && (showActivity.any { model.updated(it) >= model.updated(record) } ||
                    timestamps.any { it >= model.updated(record) })
            } else membershipMatches && (showActivity.any { model.updated(it) > model.updated(record) } || actual.any {
                model.updated(it) >= model.updated(record) &&
                    (model.completed(it) || model.position(it) >= model.position(record))
            })
            Action.UNWATCH -> authoritative && !watched && actual.isEmpty()
            Action.REMOVE_PROGRESS -> authoritative && progress.none { sameEpisode(entry.key, model.key(it), aliases) }
        }
    }
}
