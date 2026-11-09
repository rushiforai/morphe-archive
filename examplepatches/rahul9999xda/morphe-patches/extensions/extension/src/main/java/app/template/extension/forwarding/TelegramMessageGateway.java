package app.template.extension.forwarding;

/** Adapter implemented by version-specific hooks into Telegram's already-authenticated account. */
public interface TelegramMessageGateway {
    interface ResultCallback {
        void onSuccess();
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
