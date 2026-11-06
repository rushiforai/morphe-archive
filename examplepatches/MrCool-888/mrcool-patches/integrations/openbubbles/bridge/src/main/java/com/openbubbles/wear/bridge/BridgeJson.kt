package com.openbubbles.wear.bridge

import android.net.Uri
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.MessageReaction
import com.openbubbles.wear.protocol.MessageReference
import com.openbubbles.wear.protocol.ThreadSummary
import com.openbubbles.wear.protocol.WireMessage
import com.openbubbles.wear.protocol.WireThread
import org.json.JSONObject

/**
 * Maps the patched OpenBubbles service's JSON to the wire models. The service
 * returns raw backend chat GUIDs; the rest of the bridge keeps using the
 * notification shortcut convention, chat_<GUID>.
 */
internal object BridgeJson {
    private const val PREFIX = "chat_"
    private val DELIVERY_STATUSES = setOf("sending", "sent", "delivered", "read", "failed")
    private val AVATAR_ID = Regex("avatar-[0-9a-f]{64}")

    fun canonicalId(raw: String?): String? {
        val value = raw?.trim().orEmpty()
        if (value.isEmpty()) return null
        return if (value.startsWith(PREFIX)) value else PREFIX + value
    }

    fun thread(json: JSONObject?): WireThread? {
        if (json == null) return null
        val id = canonicalId(json.optString("id")) ?: return null
        val messages = json.optJSONArray("messages")?.let { array ->
            (0 until array.length()).mapNotNull { index ->
                message(array.optJSONObject(index), id)
            }
        }.orEmpty()
        val isGroup = json.optBoolean("isGroup")
        val address = if (isGroup) null else address(json)
        val lastTimestamp = json.optLong("lastTimestamp", 0L)
        return WireThread(
            id = id,
            title = title(json, isGroup, address),
            isGroup = isGroup,
            participants = participants(json),
            messages = messages,
            unread = json.optBoolean("unread"),
            canReply = true,
            canMarkRead = true,
            canSend = true,
            address = address,
            updatedAt = maxOf(lastTimestamp, messages.maxOfOrNull { it.timestamp } ?: 0L),
            lastPreview = json.optString("lastPreview").take(800),
            directHistory = json.has("messages"),
            avatarId = json.optString("avatarId").takeIf(AVATAR_ID::matches)
        )
    }

    fun summary(json: JSONObject?): ThreadSummary? {
        if (json == null) return null
        val id = canonicalId(json.optString("id")) ?: return null
        val isGroup = json.optBoolean("isGroup")
        val address = if (isGroup) null else address(json)
        return ThreadSummary(
            id = id,
            title = title(json, isGroup, address),
            isGroup = isGroup,
            unread = json.optBoolean("unread"),
            canReply = true,
            canMarkRead = true,
            canSend = true,
            lastTimestamp = json.optLong("lastTimestamp", 0L),
            lastPreview = json.optString("lastPreview").take(800),
            participants = participants(json),
            address = address,
            avatarId = json.optString("avatarId").takeIf(AVATAR_ID::matches)
        )
    }

    fun message(json: JSONObject?, threadId: String): WireMessage? {
        if (json == null) return null
        val text = json.optString("text").take(800)
        val attachment = json.optBoolean("attachment")
        if (text.isBlank() && !attachment) return null
        val timestamp = json.optLong("timestamp", 0L)
        val sender = json.optString("sender").takeIf { it.isNotBlank() }
        val id = json.optString("id").takeIf { it.isNotBlank() }
            ?: Protocol.messageId(threadId, timestamp, sender, text)
        val mime = Protocol.normalizeMimeType(json.optString("mediaMime"))
            ?.takeIf(Protocol::isImageMimeType)
        val uri = mediaUri(json.optString("mediaUri"))?.takeIf { mime != null }
        return WireMessage(
            id = id,
            threadId = threadId,
            text = text,
            timestamp = timestamp,
            sender = sender,
            fromMe = json.optBoolean("fromMe"),
            status = json.optString("status").takeIf {
                json.optBoolean("fromMe") && it in DELIVERY_STATUSES
            },
            attachment = attachment,
            mediaId = if (uri != null && mime != null) Protocol.mediaId(id, mime) else null,
            mediaMime = if (uri != null) mime else null,
            sourceUri = uri?.toString(),
            canReact = json.optBoolean("canReact"),
            canReply = json.optBoolean("canReply"),
            replyCount = json.optInt("replyCount", 0).coerceAtLeast(0),
            reactions = json.optJSONArray("reactions")?.let { items ->
                (0 until items.length()).mapNotNull { index ->
                    val reaction = items.optJSONObject(index) ?: return@mapNotNull null
                    val type = reaction.optString("type").takeIf { it.isNotBlank() && it.length <= 32 }
                        ?: return@mapNotNull null
                    val count = reaction.optInt("count")
                    val part = reaction.optInt("partIndex", 0)
                    if (count <= 0 || part !in 0..1024) return@mapNotNull null
                    MessageReaction(type, count, reaction.optBoolean("fromMe"), part)
                }
            }.orEmpty(),
            replyTo = json.optJSONObject("replyTo")?.let { quote ->
                val target = quote.optString("messageId").takeIf { it.isNotBlank() && it.length <= 512 }
                    ?: return@let null
                MessageReference(target, quote.optString("text").take(160),
                    quote.optString("sender").takeIf { it.isNotBlank() }?.take(254),
                    quote.optBoolean("fromMe"), quote.optInt("partIndex", 0).coerceIn(0, 1024))
            }
        )
    }

    fun mediaUri(raw: String?): Uri? = raw?.takeIf { it.isNotBlank() }?.let(Uri::parse)?.takeIf {
        it.scheme == "content" && it.authority == "com.openbubbles.messaging.wear.media" &&
            it.query == null && it.fragment == null && it.pathSegments.size == 2 &&
            it.pathSegments.first() == "attachment" &&
            it.pathSegments.last().matches(Regex("[A-Za-z0-9][A-Za-z0-9_-]{0,199}"))
    }

    private fun title(json: JSONObject, isGroup: Boolean, address: String?): String {
        val title = json.optString("title").trim()
        return title.take(160)
            .ifBlank { address ?: if (isGroup) "Group" else "Conversation" }
    }

    private fun address(json: JSONObject): String? =
        Protocol.normalizeAddress(json.optString("address")) ?: json.optString("address")
            .takeIf { it.isNotBlank() }

    private fun participants(json: JSONObject): List<String> {
        val array = json.optJSONArray("participants") ?: return emptyList()
        return (0 until array.length())
            .mapNotNull { array.optString(it).takeIf(String::isNotBlank) }
    }
}
