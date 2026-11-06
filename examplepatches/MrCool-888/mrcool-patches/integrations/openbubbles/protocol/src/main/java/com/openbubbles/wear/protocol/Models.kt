package com.openbubbles.wear.protocol

import kotlinx.serialization.Serializable

@Serializable
data class WireMessage(
    val id: String,
    val threadId: String,
    val text: String,
    val timestamp: Long,
    val sender: String? = null,
    val fromMe: Boolean = false,
    val attachment: Boolean = false,
    /** Cached media identifier on the phone and watch, when the attachment is viewable. */
    val mediaId: String? = null,
    /** MIME type of the cached media, for example image/jpeg or image/gif. */
    val mediaMime: String? = null,
    val mediaWidth: Int = 0,
    val mediaHeight: Int = 0,
    val mediaSize: Long = 0L,
    val status: String? = null,
    /** Authenticated phone-side media provider URI; the watch fetches bytes through the Data Layer. */
    val sourceUri: String? = null,
    val reactions: List<MessageReaction> = emptyList(),
    /** Only the updated phone bridge can resolve this message as a reaction target. */
    val canReact: Boolean = false,
    val canReply: Boolean = false,
    val replyTo: MessageReference? = null,
    val replyCount: Int = 0
) {
    val displayText: String
        get() = when {
            text.isNotBlank() -> text
            mediaMime == "image/gif" -> "GIF"
            attachment -> "Photo"
            else -> "Message"
        }

    /**
     * Notification refreshes can omit image data temporarily, and restored
     * cache entries may predate media support. Keep media metadata that was
     * already known rather than degrading an attachment to a placeholder.
     */
    fun mergeMediaFrom(previous: WireMessage): WireMessage {
        if (mediaId == null && previous.mediaId != null) {
            return copy(
                attachment = true,
                mediaId = previous.mediaId,
                mediaMime = previous.mediaMime,
                mediaWidth = previous.mediaWidth,
                mediaHeight = previous.mediaHeight,
                mediaSize = previous.mediaSize,
                sourceUri = sourceUri ?: previous.sourceUri
            )
        }
        if (!attachment && previous.attachment) return copy(attachment = true)
        if (sourceUri == null && mediaId == previous.mediaId && previous.sourceUri != null)
            return copy(sourceUri = previous.sourceUri)
        return this
    }
}

@Serializable
data class MessageReaction(
    val type: String,
    val count: Int = 1,
    val fromMe: Boolean = false,
    val partIndex: Int = 0
)

@Serializable
data class MessageReference(
    val messageId: String,
    val text: String = "",
    val sender: String? = null,
    val fromMe: Boolean = false,
    val partIndex: Int = 0
)

enum class Tapback(val type: String, val symbol: String, val label: String) {
    LOVE("love", "❤️", "Love"),
    LIKE("like", "👍", "Like"),
    DISLIKE("dislike", "👎", "Dislike"),
    LAUGH("laugh", "😂", "Laugh"),
    EMPHASIS("emphasize", "‼️", "Emphasis"),
    QUESTION("question", "❓", "Question");

    companion object {
        fun fromType(type: String): Tapback? = entries.firstOrNull { it.type == type }
    }
}

@Serializable
data class ReactionRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val threadId: String,
    val messageId: String,
    val reaction: String,
    val remove: Boolean = false,
    val partIndex: Int = 0
)

@Serializable
data class ReactionAlert(
    val version: Int = Protocol.VERSION,
    val thread: WireThread,
    val event: WireMessage,
    val hidePreview: Boolean = false
)

@Serializable
data class WireThread(
    val id: String,
    val title: String,
    val isGroup: Boolean = false,
    val participants: List<String> = emptyList(),
    val messages: List<WireMessage> = emptyList(),
    val unread: Boolean = false,
    val canReply: Boolean = false,
    val canMarkRead: Boolean = false,
    val canSend: Boolean = false,
    /** Phone number or email address for a one-to-one chat, when available. */
    val address: String? = null,
    val updatedAt: Long = 0L,
    /** Backend directory preview, available before the message history is loaded. */
    val lastPreview: String = "",
    /** Message IDs/history are authoritative backend data, not notification-derived hashes. */
    val directHistory: Boolean = false,
    /** Content-addressed chat/contact photo transferred through the existing media channel. */
    val avatarId: String? = null
) {
    fun latestMessage(): WireMessage? = messages.maxByOrNull { it.timestamp }

    fun lastActivity(): Long = maxOf(latestMessage()?.timestamp ?: 0L, updatedAt)

    fun preview(): String = latestMessage()?.displayText ?: "No messages"

    fun toSummary(): ThreadSummary {
        val latest = latestMessage()
        return ThreadSummary(
            id = id,
            title = title,
            isGroup = isGroup,
            unread = unread,
            canReply = canReply,
            canMarkRead = canMarkRead,
            canSend = canSend,
            lastTimestamp = lastActivity(),
            lastPreview = if (lastPreview.isNotBlank() && updatedAt > (latest?.timestamp ?: 0L))
                lastPreview else latest?.displayText ?: lastPreview,
            messageCount = messages.size,
            participants = participants,
            address = address,
            avatarId = avatarId
        )
    }
}

@Serializable
data class ThreadSummary(
    val id: String,
    val title: String,
    val isGroup: Boolean = false,
    val unread: Boolean = false,
    val canReply: Boolean = false,
    val canMarkRead: Boolean = false,
    val canSend: Boolean = false,
    val lastTimestamp: Long = 0L,
    val lastPreview: String = "",
    val messageCount: Int = 0,
    val participants: List<String> = emptyList(),
    val address: String? = null,
    val avatarId: String? = null
)

@Serializable
data class SyncPayload(
    val version: Int = Protocol.VERSION,
    val generatedAt: Long,
    val phoneName: String,
    val bridgeVersion: String,
    val relayEnabled: Boolean = true,
    /** True when Android is showing a secure keyguard; shown for information only. */
    val phoneLocked: Boolean = false,
    val phoneAwake: Boolean = true,
    val conversations: List<ThreadSummary> = emptyList(),
    val contactsAccess: Boolean? = null,
    /** True when the patched OpenBubbles IPC service answered on the phone. */
    val directBridge: Boolean = false,
    /** Actionable backend status, such as why the patched OB service is unavailable. */
    val backendState: String = ""
)

@Serializable
data class ThreadPayload(
    val version: Int = Protocol.VERSION,
    val thread: WireThread? = null,
    val error: String? = null,
    val requestedThreadId: String? = null
)

@Serializable
data class UpdatePayload(
    val version: Int = Protocol.VERSION,
    val thread: WireThread,
    /** Exact backend message ID that caused this live update, if it is a new incoming message. */
    val alertMessageId: String? = null,
    val hideAlertPreview: Boolean = false
)

@Serializable
data class NotificationDismissal(
    val version: Int = Protocol.VERSION,
    val threadId: String,
    val postedAt: Long
) {
    fun isValid(): Boolean = version == Protocol.VERSION && postedAt > 0L &&
        Protocol.isNotificationThreadId(threadId)
}

@Serializable
data class SyncRequest(
    val version: Int = Protocol.VERSION,
    val sentAt: Long = System.currentTimeMillis(),
    val watchName: String = ""
)

@Serializable
data class ThreadRequest(
    val version: Int = Protocol.VERSION,
    val threadId: String,
    val sentAt: Long = System.currentTimeMillis()
)

@Serializable
data class PingPayload(
    val version: Int = Protocol.VERSION,
    val sentAt: Long = System.currentTimeMillis(),
    val watchName: String = ""
)

@Serializable
data class PongPayload(
    val version: Int = Protocol.VERSION,
    val sentAt: Long = System.currentTimeMillis(),
    val receivedAt: Long = System.currentTimeMillis(),
    val phoneName: String = "",
    val bridgeVersion: String = "",
    val relayEnabled: Boolean = true,
    val phoneLocked: Boolean = false,
    val phoneAwake: Boolean = true,
    val trackedConversations: Int = 0,
    val quickReplies: List<String> = Protocol.DEFAULT_QUICK_REPLIES,
    val contactsAccess: Boolean? = null,
    /** True when the patched OpenBubbles IPC service answered on the phone. */
    val directBridge: Boolean = false,
    /** Actionable backend status, such as why the patched OB service is unavailable. */
    val backendState: String = ""
)

@Serializable
data class ReplyRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val threadId: String,
    val text: String,
    val sentAt: Long = System.currentTimeMillis()
)

@Serializable
data class MarkReadRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val threadId: String,
    val sentAt: Long = System.currentTimeMillis()
)

@Serializable
data class OpenPhoneRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val threadId: String? = null,
    val sentAt: Long = System.currentTimeMillis()
)

/** Sends text through the patched OpenBubbles backend. */
@Serializable
data class SendRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val threadId: String,
    val text: String,
    /** Address for a chat the watch started from Contacts, before it has a GUID. */
    val address: String? = null,
    val sentAt: Long = System.currentTimeMillis(),
    val replyToMessageId: String? = null,
    val replyToPartIndex: Int = 0
)

/** Asks the phone to publish one cached image or GIF over the Data Layer. */
@Serializable
data class MediaRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val mediaId: String,
    val sentAt: Long = System.currentTimeMillis()
)

@Serializable
data class MediaPayload(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val mediaId: String,
    val ok: Boolean,
    val mimeType: String? = null,
    val width: Int = 0,
    val height: Int = 0,
    val size: Long = 0L,
    val error: String? = null,
    val completedAt: Long = System.currentTimeMillis()
)

@Serializable
data class ActionResult(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val action: String,
    val ok: Boolean,
    val threadId: String? = null,
    val error: String? = null,
    /** The action did no work and can be retried later. */
    val retryable: Boolean = false,
    val completedAt: Long = System.currentTimeMillis(),
    val message: WireMessage? = null
)

@Serializable
data class BridgeError(
    val version: Int = Protocol.VERSION,
    val requestId: String? = null,
    val error: String
)

@Serializable
data class ContactAddress(val address: String, val label: String = "")

@Serializable
data class WatchContact(
    val id: String,
    val name: String,
    val addresses: List<ContactAddress> = emptyList(),
    val avatarId: String? = null
)

@Serializable
data class ContactsRequest(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val query: String = "",
    val offset: Int = 0
)

@Serializable
data class ContactsPage(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val query: String = "",
    val offset: Int = 0,
    val contacts: List<WatchContact> = emptyList(),
    val nextOffset: Int? = null,
    val contactsAccess: Boolean = false,
    val error: String? = null
)

@Serializable
data class GroupsRequest(val version: Int = Protocol.VERSION, val requestId: String, val offset: Int = 0)

@Serializable
data class GroupsResult(
    val version: Int = Protocol.VERSION,
    val requestId: String,
    val offset: Int = 0,
    val nextOffset: Int? = null,
    /** Groups only, kept for 1.5.0 watches. */
    val groups: List<ThreadSummary> = emptyList(),
    /** One-to-one chats found without a notification. */
    val chats: List<ThreadSummary> = emptyList(),
    val error: String? = null,
    val note: String? = null
)
