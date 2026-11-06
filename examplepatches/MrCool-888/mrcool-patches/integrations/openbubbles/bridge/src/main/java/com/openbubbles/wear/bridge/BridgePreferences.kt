package com.openbubbles.wear.bridge

import android.content.Context
import com.openbubbles.wear.protocol.Protocol

class BridgePreferences(context: Context) {
    private val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    val relayEnabled: Boolean
        get() = EmbeddedRuntime.enabled()

    var lastPublishAt: Long
        get() = prefs.getLong(KEY_LAST_PUBLISH, 0L)
        set(value) {
            prefs.edit().putLong(KEY_LAST_PUBLISH, value).apply()
        }

    var lastSeenWatchName: String
        get() = prefs.getString(KEY_LAST_WATCH, "").orEmpty()
        set(value) {
            prefs.edit().putString(KEY_LAST_WATCH, value).apply()
        }

    var lastNotificationAt: Long
        get() = prefs.getLong(KEY_LAST_NOTIFICATION, 0L)
        set(value) {
            prefs.edit().putLong(KEY_LAST_NOTIFICATION, value).apply()
        }

    /** Last automatic shortcut/channel refresh, used to avoid hammering dumpsys. */
    var lastChatDiscoveryAt: Long
        get() = prefs.getLong(KEY_LAST_CHAT_DISCOVERY, 0L)
        set(value) {
            prefs.edit().putLong(KEY_LAST_CHAT_DISCOVERY, value).apply()
        }

    fun readAt(threadId: String): Long =
        prefs.getLong(KEY_READ_AT + threadId, 0L)

    fun markReadAt(threadId: String, timestamp: Long = System.currentTimeMillis()) {
        prefs.edit().putLong(KEY_READ_AT + threadId, timestamp).apply()
    }

    fun quickReplies(): List<String> = Protocol.DEFAULT_QUICK_REPLIES

    /** Removes cached messages. Used by the "clear cache" action in the phone app. */
    fun clearCachedMessages() {
        prefs.edit().remove(KEY_LAST_PUBLISH).apply()
    }

    private companion object {
        const val PREFS_NAME = "openbubbles_wear_bridge"
        const val KEY_RELAY_ENABLED = "relay_enabled"
        const val KEY_LAST_PUBLISH = "last_publish"
        const val KEY_LAST_WATCH = "last_watch"
        const val KEY_LAST_NOTIFICATION = "last_notification"
        const val KEY_LAST_CHAT_DISCOVERY = "last_chat_discovery"
        const val KEY_READ_AT = "read_at:"
    }
}
