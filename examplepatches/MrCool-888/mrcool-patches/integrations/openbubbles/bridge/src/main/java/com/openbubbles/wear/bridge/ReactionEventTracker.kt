package com.openbubbles.wear.bridge

/** Seed the current database state at startup; only subsequent new events can alert. */
internal class ReactionEventTracker(initialSeen: List<String>? = null) {
    private var seen: Set<String>? = initialSeen?.toSet()

    @Synchronized fun snapshot(): List<String> = seen.orEmpty().toList()

    @Synchronized
    fun newEvents(events: List<ReactionEvent>, now: Long): List<ReactionEvent> {
        val previous = seen
        seen = ((previous.orEmpty() + events.map { it.id }).toList()).takeLast(512).toSet()
        if (previous == null) return emptyList()
        return events.filter { it.id !in previous && it.timestamp in (now - 120_000L)..(now + 30_000L) }
    }
}

internal data class ReactionEvent(val id: String, val threadId: String, val timestamp: Long,
                                  val sender: String?, val text: String, val muted: Boolean = false)
