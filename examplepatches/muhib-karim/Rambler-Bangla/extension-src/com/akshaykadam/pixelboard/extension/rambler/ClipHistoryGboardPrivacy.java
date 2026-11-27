package com.akshaykadam.pixelboard.extension.rambler;

/** Gboard's own incognito check, the one stock onPrimaryClipChanged uses before reading the clipboard. */
public final class ClipHistoryGboardPrivacy {
    private ClipHistoryGboardPrivacy() {}

    /** rc4 InputSessionNotification.f(): true while incognito. Unknown state counts as private. */
    public static boolean incognito(ClassLoader loader) {
        try {
            return (Boolean) Class.forName("aelb", false, loader).getMethod("f").invoke(null);
        } catch (Throwable unknown) { return true; }
    }
}
