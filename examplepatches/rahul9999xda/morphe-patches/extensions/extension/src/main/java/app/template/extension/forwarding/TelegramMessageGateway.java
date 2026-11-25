package app.template.extension.forwarding;

/** Adapter implemented by version-specific hooks into Telegram's already-authenticated account. */
public interface TelegramMessageGateway {
    interface ResultCallback {
        /** Native send helper accepted the request locally; this is not server delivery. */
        void onQueued();
        /** Invoke only after Telegram reports a successful server acknowledgement. */
        void onSuccess();
        /** Invoke for a local enqueue failure or a Telegram server-side send error. */
        void onFailure(Throwable error);
    }

    void forward(int accountId, ForwardingMessage source,
                 long destinationChatId, boolean showSenderName, ResultCallback callback);

    /**
     * Sends a new message/media copy without forwarded-message attribution.
     * The adapter must preserve supported entities, captions and media metadata.
     */
    void copy(int accountId, ForwardingMessage source, long destinationChatId,
              boolean showSenderName, ResultCallback callback);
}
