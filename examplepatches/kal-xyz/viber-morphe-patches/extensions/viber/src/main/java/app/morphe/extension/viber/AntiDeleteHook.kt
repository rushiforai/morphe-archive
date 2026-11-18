package app.morphe.extension.viber

/**
 * Runtime interception hooks for Anti-Delete messages.
 * Prevents remote revocation/deletion requests from wiping incoming messages locally.
 */
object AntiDeleteHook {

    /**
     * Called when a message delete / retract packet arrives from the server.
     * @param messageId Unique ID of the message.
     * @param originalText Original message body if available.
     * @return true to process deletion normally, false to block deletion and preserve the message.
     */
    @JvmStatic
    fun shouldProcessMessageDeletion(messageId: String?, originalText: String?): Boolean {
        if (!ViberModPreferences.isAntiDeleteEnabled()) {
            return true // Allow normal deletion
        }
        // Block deletion so the local message database keeps the original text
        return false
    }

    /**
     * Formats retained deleted messages with an indicator.
     */
    @JvmStatic
    fun formatDeletedMessage(content: String?): String {
        if (content == null) return "[Deleted message]"
        if (content.startsWith("[Deleted] ")) return content
        return "[Deleted] $content"
    }
}
