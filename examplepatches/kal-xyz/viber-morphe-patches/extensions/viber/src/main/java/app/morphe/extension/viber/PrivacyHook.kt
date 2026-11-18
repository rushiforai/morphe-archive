package app.morphe.extension.viber

/**
 * Runtime interception hooks for Ghost Mode (Read Receipts, Typing Indicators, Online Status).
 */
object PrivacyHook {

    /**
     * Intercepts dispatch of "Seen" / read receipt messages to the Viber server.
     * @return true to allow sending receipt, false to suppress it.
     */
    @JvmStatic
    fun shouldSendReadReceipt(): Boolean {
        // Suppress read receipts if Ghost Mode is enabled
        return !ViberModPreferences.isGhostReadReceiptsEnabled()
    }

    /**
     * Intercepts typing status broadcasts when the user is typing in a chat.
     * @return true to allow sending typing notification, false to suppress it.
     */
    @JvmStatic
    fun shouldSendTypingNotification(): Boolean {
        return !ViberModPreferences.isGhostTypingIndicatorEnabled()
    }

    /**
     * Intercepts online presence heartbeat pings.
     * @return true to send heartbeat, false to suppress it.
     */
    @JvmStatic
    fun shouldSendOnlineHeartbeat(): Boolean {
        return !ViberModPreferences.isGhostOnlineStatusEnabled()
    }
}
