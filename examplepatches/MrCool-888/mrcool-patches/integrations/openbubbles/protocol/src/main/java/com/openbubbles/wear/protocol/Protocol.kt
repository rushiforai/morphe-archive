package com.openbubbles.wear.protocol

import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import java.util.Base64
import java.util.Locale

/**
 * Shared wire contract between the phone bridge and the Wear OS app.
 *
 * The phone is the source of truth. The watch only receives snapshots and
 * asks the phone to perform actions against the patched OpenBubbles backend.
 */
object Protocol {
    private val notificationMessageId = Regex("^m-[0-9a-f]{40}(?:-[0-9]+)?$")

    fun isNotificationMessageId(id: String): Boolean = notificationMessageId.matches(id)

    const val VERSION = 4

    const val CAPABILITY_PHONE = "openbubbles_wear_bridge"
    const val CAPABILITY_WATCH = "openbubbles_wear"

    const val BASE_PATH = "/openbubbles_wear"
    const val TEST_NOTIFICATION_THREAD_ID = "test:notification"
    const val PATH_TEST_NOTIFICATION = "$BASE_PATH/test_notification"
    const val DATA_DISMISS_PREFIX = "$BASE_PATH/notification_dismissed/"
    const val EXTRA_NOTIFICATION_THREAD = "com.openbubbles.wear.notification.THREAD_ID"
    const val EXTRA_NOTIFICATION_TIME = "com.openbubbles.wear.notification.POSTED_AT"

    @JvmStatic fun isNotificationThreadId(id: String): Boolean =
        id == TEST_NOTIFICATION_THREAD_ID ||
            (id.startsWith("chat_") && isChatGuid(id.removePrefix("chat_")))

    fun notificationDismissalDataPath(threadId: String): String =
        DATA_DISMISS_PREFIX + threadDataPath(threadId).removePrefix(DATA_THREAD_PREFIX)

    @JvmStatic fun testNotificationThread(timestamp: Long): WireThread = WireThread(
        id = TEST_NOTIFICATION_THREAD_ID, title = "Test message", unread = true,
        messages = listOf(WireMessage(id = "test-$timestamp", threadId = TEST_NOTIFICATION_THREAD_ID,
            text = "This is a test notification. No message was sent.", timestamp = timestamp,
            sender = "OpenBubbles test"))
    )

    // MessageClient paths (small, request/response payloads).
    const val PATH_PING = "$BASE_PATH/ping"
    const val PATH_PONG = "$BASE_PATH/pong"
    const val PATH_SYNC_REQUEST = "$BASE_PATH/sync_request"
    const val PATH_SYNC = "$BASE_PATH/sync"
    const val PATH_THREAD_REQUEST = "$BASE_PATH/thread_request"
    const val PATH_THREAD = "$BASE_PATH/thread"
    const val PATH_UPDATE = "$BASE_PATH/update"
    const val PATH_REPLY = "$BASE_PATH/reply"
    const val PATH_REPLY_RESULT = "$BASE_PATH/reply_result"
    const val PATH_MARK_READ = "$BASE_PATH/mark_read"
    const val PATH_ACTION_RESULT = "$BASE_PATH/action_result"
    const val PATH_OPEN_PHONE = "$BASE_PATH/open_phone"
    const val PATH_SEND = "$BASE_PATH/send"
    const val PATH_REACTION = "$BASE_PATH/reaction"
    const val PATH_REACTION_ALERT = "$BASE_PATH/reaction_alert"
    const val PATH_MEDIA_REQUEST = "$BASE_PATH/media_request"
    const val PATH_MEDIA_RESULT = "$BASE_PATH/media_result"
    const val PATH_CONTACTS_REQUEST = "$BASE_PATH/contacts_request"
    const val PATH_CONTACTS_RESULT = "$BASE_PATH/contacts_result"
    const val PATH_GROUPS_REQUEST = "$BASE_PATH/groups_request"
    const val PATH_GROUPS_RESULT = "$BASE_PATH/groups_result"

    // DataApi paths (durable snapshots for when the watch app is not running).
    const val DATA_SYNC = "$BASE_PATH/sync"
    const val DATA_THREAD_PREFIX = "$BASE_PATH/thread/"
    const val DATA_MEDIA_PREFIX = "$BASE_PATH/media/"
    const val DATA_KEY_JSON = "json"
    const val DATA_KEY_MIME = "mime"
    const val DATA_KEY_WIDTH = "width"
    const val DATA_KEY_HEIGHT = "height"
    const val DATA_KEY_SIZE = "size"
    const val DATA_KEY_ASSET = "asset"
    const val DATA_KEY_MEDIA_PUBLISHED_AT = "published_at"

    const val ACTION_REPLY = "reply"
    const val ACTION_MARK_READ = "mark_read"
    const val ACTION_OPEN_PHONE = "open_phone"
    const val ACTION_SEND = "send"
    const val ACTION_REACTION = "reaction"
    const val ACTION_MEDIA = "media"

    val DEFAULT_QUICK_REPLIES: List<String> = listOf(
        "On my way",
        "Yes",
        "No",
        "Can't talk right now",
        "Thanks!",
        "👍"
    )

    /**
     * Thread IDs come from notification shortcut IDs, which can contain slashes,
     * spaces and other characters that are not safe in a DataApi path segment.
     */
    fun threadDataPath(threadId: String): String {
        val encoded = Base64.getUrlEncoder()
            .withoutPadding()
            .encodeToString(threadId.toByteArray(StandardCharsets.UTF_8))
        return DATA_THREAD_PREFIX + encoded
    }

    fun threadIdFromDataPath(path: String): String? {
        if (!path.startsWith(DATA_THREAD_PREFIX)) return null
        val encoded = path.removePrefix(DATA_THREAD_PREFIX)
        if (encoded.isEmpty()) return null
        val padded = when (encoded.length % 4) {
            0 -> encoded
            2 -> "$encoded=="
            3 -> "$encoded="
            else -> return null
        }
        return runCatching {
            String(Base64.getUrlDecoder().decode(padded), StandardCharsets.UTF_8)
        }.getOrNull()
    }

    /** Media IDs are hashes, so they are safe to use directly in a data path. */
    fun mediaDataPath(mediaId: String): String = DATA_MEDIA_PREFIX + mediaId

    fun mediaIdFromDataPath(path: String): String? {
        if (!path.startsWith(DATA_MEDIA_PREFIX)) return null
        return path.removePrefix(DATA_MEDIA_PREFIX)
            .takeIf { it.isNotEmpty() && !it.contains('/') }
    }

    /**
     * Stable ID for a cached attachment. It is derived from the message's own
     * stable ID and the normalized MIME type so repeated notification updates
     * resolve to the same cached file.
     */
    fun mediaId(messageId: String, mimeType: String): String {
        val raw = messageId + "\u0001" + (normalizeMimeType(mimeType) ?: "application/octet-stream")
        val digest = MessageDigest.getInstance("SHA-1")
            .digest(raw.toByteArray(StandardCharsets.UTF_8))
        return "media-" + digest.joinToString(separator = "") {
            "%02x".format(it.toInt() and 0xff)
        }
    }

    fun normalizeMimeType(raw: String?): String? {
        val value = raw
            ?.substringBefore(';')
            ?.trim()
            ?.lowercase(Locale.ROOT)
            ?.takeIf { it.isNotEmpty() }
            ?: return null
        return when (value) {
            "image/jpg", "image/pjpeg" -> "image/jpeg"
            "image/x-png" -> "image/png"
            "image/x-gif" -> "image/gif"
            else -> value
        }
    }

    fun isImageMimeType(mimeType: String?): Boolean =
        normalizeMimeType(mimeType)?.startsWith("image/") == true

    /**
     * Normalizes a phone number or email address so a notification address and
     * an address typed on the watch resolve to the same conversation. Returns
     * null for values that do not look like either.
     */
    fun normalizeAddress(raw: String?): String? {
        val value = raw?.trim().orEmpty()
        if (value.isEmpty()) return null
        var address = value
        val lower = address.lowercase(Locale.ROOT)
        address = when {
            lower.startsWith("tel:") -> address.substring(4)
            lower.startsWith("mailto:") -> address.substring(7)
            lower.startsWith("sms:") -> address.substring(4)
            lower.startsWith("smsto:") -> address.substring(6)
            else -> address
        }
        if (address.contains(";-;")) address = address.substringAfterLast(";-;")
        address = address.substringBefore('?').substringBefore(';').trim()
        val chatId = address.removePrefix("chat_")
        if (nativeChatGuid.matches(chatId) || nativeHexChatGuid.matches(chatId)) return null
        return when {
            address.contains('@') && address.length >= 3 ->
                address.lowercase(Locale.ROOT)
            address.count { it.isDigit() } >= 5 ->
                address.filter { it.isDigit() || it == '+' }
            else -> null
        }
    }

    /** OpenBubbles conversation IDs, not arbitrary shortcut labels. */
    fun isChatGuid(id: String): Boolean {
        val raw = id.removePrefix("chat_")
        return nativeChatGuid.matches(raw) || nativeHexChatGuid.matches(raw) || legacyChatGuid.matches(raw)
    }

    // Native OB 2.x stores Chat.guid as UUID.randomUUID().toString(). Merged
    // chats use UUID+UUID, which is intentionally unsupported by this validator.
    private val nativeChatGuid = Regex("^[0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}$")
    private val nativeHexChatGuid = Regex("^(?:[0-9a-fA-F]{64}|[0-9a-fA-F]{72})$")
    private val legacyChatGuid = Regex("^(iMessage|SMS|RCS);[+-];[^\\s\\p{Cntrl};:/?#]{1,512}$")
    private val chatIdentifier = Regex("(?i)^chat[_-]?[0-9a-f-]{5,}$")
    private val addressTitlePhone = Regex("(?i)^(?:tel:|sms:|smsto:)?[+0-9 ().-]+$")
    private val addressTitleEmail = Regex("(?i)^(?:mailto:)?[^\\s@<>]+@[^\\s@<>]+$")
    private val genericTitles = setOf("conversation", "group", "chat", "unknown")

    /** Opaque native IDs carry no group metadata; only legacy GUIDs encode it. */
    fun isGroupGuid(id: String): Boolean {
        val raw = id.removePrefix("chat_")
        return legacyChatGuid.matches(raw) && raw.substringAfter(';').startsWith("+;")
    }

    fun isMeaningfulConversationTitle(title: String, id: String, address: String?): Boolean {
        val value = title.trim()
        if (value.isEmpty() || value.lowercase(Locale.ROOT) in genericTitles) return false
        if (value == id || value == id.removePrefix("chat_") || isChatGuid(value) || chatIdentifier.matches(value)) return false
        if (value == address || isAddressTitle(value)) return false
        val parts = value.split(',').map(String::trim)
        return parts.size == 1 || !parts.all(::isAddressTitle)
    }

    fun preferredConversationTitle(incoming: String, previous: String?, id: String, address: String?): String = when {
        isMeaningfulConversationTitle(incoming, id, address) -> incoming.trim()
        previous != null && isMeaningfulConversationTitle(previous, id, address) -> previous.trim()
        else -> incoming.trim().ifBlank { previous.orEmpty() }
    }

    private fun isAddressTitle(value: String): Boolean =
        addressTitlePhone.matches(value) && value.count(Char::isDigit) >= 5 ||
            addressTitleEmail.matches(value)

    /**
     * Stable ID for a message discovered inside a notification. OpenBubbles does
     * not put a message GUID in the MessagingStyle message extras, so identity is
     * derived from the timestamp, sender and content. Attachment state is
     * deliberately excluded: the same message can appear with or without its
     * image data as notifications are refreshed, and it must not become a
     * duplicate when that happens. This ID is stable across repeated notification
     * updates and is the same on the phone and the watch.
     */
    fun messageId(
        threadId: String,
        timestamp: Long,
        sender: String?,
        text: String
    ): String {
        val raw = buildString {
            append(threadId)
            append('\u0001')
            append(timestamp)
            append('\u0001')
            append(sender.orEmpty())
            append('\u0001')
            append(text)
        }
        val digest = MessageDigest.getInstance("SHA-1")
            .digest(raw.toByteArray(StandardCharsets.UTF_8))
        return "m-" + digest.joinToString(separator = "") {
            "%02x".format(it.toInt() and 0xff)
        }
    }
}
