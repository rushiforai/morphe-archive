package com.openbubbles.wear.bridge

import android.content.Context
import android.util.Log
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.Wire
import com.openbubbles.wear.protocol.WireMessage
import com.openbubbles.wear.protocol.WireThread
import kotlin.math.abs

/**
 * Durable backend conversation and optimistic-send cache.
 */
class BridgeStore(context: Context) {
    private val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    private val lock = Any()
    private var threads: LinkedHashMap<String, WireThread> = load()

    init {
        synchronized(lock) { trim() }
    }

    fun snapshot(): List<WireThread> = synchronized(lock) {
        threads.values.sortedByDescending { it.lastActivity() }
    }

    fun get(threadId: String): WireThread? = synchronized(lock) { threads[threadId] }

    /**
     * Adds a notification-derived thread, keeping older messages that have already
     * scrolled out of the notification's history.
     *
     * [mergeFromId] is used when a conversation started from a raw address later
     * receives its first real notification. The temporary thread's messages are
     * folded into the notification's shortcut-based thread and the temp entry is
     * removed.
     */
    fun upsertIncoming(incoming: WireThread, mergeFromId: String? = null): WireThread =
        synchronized(lock) {
            val existing = threads[incoming.id]
            val legacy = mergeFromId
                ?.takeIf { it != incoming.id }
                ?.let { threads[it] }
            val oldMessages = mergeMessages(legacy?.messages.orEmpty(), existing?.messages.orEmpty())
            val address = incoming.address ?: existing?.address ?: legacy?.address
            val previousTitle = listOfNotNull(existing?.title, legacy?.title)
                .firstOrNull { Protocol.isMeaningfulConversationTitle(it, incoming.id, address) }
            val oldest = incoming.messages.minOfOrNull { it.timestamp }
            val retained = if (incoming.directHistory) oldMessages.filter { message ->
                message.id.startsWith(OPTIMISTIC_MESSAGE_PREFIX) ||
                    (!Protocol.isNotificationMessageId(message.id) && oldest != null && message.timestamp < oldest)
            } else oldMessages
            val messages = incoming.messages.map { message ->
                val previous = oldMessages.firstOrNull { it.id == message.id }
                    ?: if (incoming.directHistory && !incoming.isGroup) oldMessages.singleOrNull {
                        it.timestamp == message.timestamp && it.fromMe == message.fromMe &&
                            it.text == message.text && incoming.messages.count { other ->
                                other.timestamp == message.timestamp && other.fromMe == message.fromMe && other.text == message.text
                            } == 1
                    } else null
                previous?.let(message::mergeMediaFrom) ?: message
            }
            val merged = mergeMessages(retained, messages).map { it.copy(threadId = incoming.id) }
            val updated = incoming.copy(
                title = Protocol.preferredConversationTitle(incoming.title, previousTitle, incoming.id, address),
                messages = merged,
                address = address,
                updatedAt = maxOf(incoming.updatedAt, merged.lastOrNull()?.timestamp ?: 0L),
                directHistory = incoming.directHistory || existing?.directHistory == true || legacy?.directHistory == true
            )
            if (mergeFromId != null && legacy != null) threads.remove(mergeFromId)
            threads.remove(updated.id)
            threads[updated.id] = updated
            trim()
            persist()
            updated
        }

    /**
     * Merges optimistic sent messages into a thread. A fallback thread is
     * created only when imported discovery data has no cached entry yet.
     */
    fun mergeHistory(
        threadId: String,
        messages: List<WireMessage>,
        fallback: WireThread? = null
    ): WireThread? = synchronized(lock) {
        val existing = threads[threadId]
            ?: fallback?.copy(id = threadId, messages = emptyList())
            ?: return@synchronized null
        val merged = mergeMessages(existing.messages, messages)
        val address = existing.address ?: fallback?.address
        val updated = existing.copy(
            title = Protocol.preferredConversationTitle(
                fallback?.title.orEmpty(), existing.title, threadId, address
            ).ifBlank { "Conversation" },
            address = address,
            messages = merged,
            updatedAt = maxOf(
                existing.updatedAt,
                fallback?.updatedAt ?: 0L,
                merged.lastOrNull()?.timestamp ?: 0L
            )
        )
        threads.remove(threadId)
        threads[threadId] = updated
        trim()
        persist()
        updated
    }

    fun update(thread: WireThread) = synchronized(lock) {
        threads[thread.id] = thread
        trim()
        persist()
    }

    fun markRead(threadId: String) = synchronized(lock) {
        val existing = threads[threadId] ?: return@synchronized
        threads[threadId] = existing.copy(unread = false)
        persist()
    }

    fun clear() = synchronized(lock) {
        threads = linkedMapOf()
        prefs.edit().remove(KEY_THREADS).apply()
    }

    private fun mergeMessages(old: List<WireMessage>, new: List<WireMessage>): List<WireMessage> {
        val byId = LinkedHashMap<String, WireMessage>(old.size + new.size)
        old.forEach { byId[it.id] = it }
        new.forEach { incoming ->
            if (incoming.fromMe) {
                // An optimistic send is replaced by the real message when the
                // next notification sees it.
                val optimistic = byId.values.firstOrNull { candidate ->
                    candidate.id.startsWith(OPTIMISTIC_MESSAGE_PREFIX) &&
                        candidate.fromMe &&
                        candidate.text == incoming.text &&
                        candidate.replyTo?.messageId == incoming.replyTo?.messageId &&
                        candidate.replyTo?.partIndex == incoming.replyTo?.partIndex &&
                        abs(candidate.timestamp - incoming.timestamp) <= AUTO_MATCH_WINDOW_MS
                }
                if (optimistic != null) byId.remove(optimistic.id)
            }
            val previous = byId[incoming.id]
            byId[incoming.id] = previous?.let(incoming::mergeMediaFrom) ?: incoming
        }
        return byId.values
            .sortedBy { it.timestamp }
            .takeLast(MAX_MESSAGES)
    }

    private fun trim() {
        // Keep real conversations and discovery placeholders in separate
        // budgets. Importing a large channel list must never evict a chat that
        // has actual message history.
        var messageThreads = threads.values.filterNot { it.isPlaceholder() }
        while (messageThreads.size > MAX_THREADS) {
            val oldest = messageThreads.minByOrNull { it.lastActivity() } ?: break
            threads.remove(oldest.id)
            messageThreads = messageThreads.filterNot { it.id == oldest.id }
        }
        var placeholders = threads.values.filter { it.isPlaceholder() }
        while (placeholders.size > MAX_PLACEHOLDERS) {
            // Placeholders have no timestamp. Remove the earliest imported one.
            val oldest = placeholders.firstOrNull() ?: break
            threads.remove(oldest.id)
            placeholders = placeholders.drop(1)
        }
        threads.values.forEach { thread ->
            if (thread.messages.size > MAX_MESSAGES) {
                threads[thread.id] = thread.copy(messages = thread.messages.takeLast(MAX_MESSAGES))
            }
        }
    }

    private fun WireThread.isPlaceholder(): Boolean =
        messages.isEmpty()

    private fun load(): LinkedHashMap<String, WireThread> {
        val raw = prefs.getString(KEY_THREADS, null) ?: return linkedMapOf()
        val decoded = Wire.decode<List<WireThread>>(raw) ?: return linkedMapOf()
        val map = LinkedHashMap<String, WireThread>()
        decoded
            .sortedByDescending { it.lastActivity() }
            .forEach { map[it.id] = it }
        return map
    }

    private fun persist() {
        val list = threads.values
            .sortedByDescending { it.lastActivity() }
        runCatching {
            prefs.edit().putString(KEY_THREADS, Wire.encode(list)).apply()
        }.onFailure {
            Log.w(TAG, "Unable to persist bridge cache", it)
        }
    }

    companion object {
        private const val TAG = "OBWearStore"
        private const val PREFS_NAME = "openbubbles_wear_store"
        private const val KEY_THREADS = "threads"
        const val OPTIMISTIC_MESSAGE_PREFIX = "auto-"
        private const val AUTO_MATCH_WINDOW_MS = 2 * 60_000L
        /** Conversations with message history or a live notification. */
        const val MAX_THREADS = 40
        /** Discovery-only chats with no cached messages yet. */
        const val MAX_PLACEHOLDERS = 60
        const val MAX_MESSAGES = 240
    }
}
