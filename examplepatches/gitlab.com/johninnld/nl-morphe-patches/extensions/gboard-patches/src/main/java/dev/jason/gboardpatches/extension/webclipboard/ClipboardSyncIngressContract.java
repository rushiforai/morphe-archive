package dev.jason.gboardpatches.extension.webclipboard;

public final class ClipboardSyncIngressContract {
    public static final String ACTION_SUBMIT_PHONE_CLIPBOARD =
            "dev.jason.gboardpatches.extension.webclipboard.action.SUBMIT_PHONE_CLIPBOARD";
    public static final String EXTRA_TEXT = "text";
    public static final String WEB_CLIPBOARD_LABEL = "Web Clipboard";
    public static final String RECEIVER_CLASS_NAME =
            "dev.jason.gboardpatches.extension.webclipboard.ClipboardSyncIngressReceiver";
    public static final String SERVICE_CLASS_NAME =
            "dev.jason.gboardpatches.extension.webclipboard.ClipboardSyncService";

    private ClipboardSyncIngressContract() {
    }
}

