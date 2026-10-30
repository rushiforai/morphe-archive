package app.nogoogle.gboard;

import android.view.inputmethod.EditorInfo;

import java.lang.ref.WeakReference;

/**
 * "Always use incognito mode": every text field asks for Gboard's incognito mode, as private browser tabs do.
 * Gboard's clipboard skips copied text in incognito; "Keep the clipboard" lets it in again, but only for
 * fields that are incognito because of this switch, not for those that ask for it themselves.
 */
public final class Incognito {
    private static volatile WeakReference<EditorInfo> marked = new WeakReference<>(null);
    private static volatile boolean forced; // the current field is incognito only because of the switch

    private Incognito() {
    }

    /** Patched in at the start of Gboard's onStartInput and onStartInputView (both get the same EditorInfo). */
    public static void apply(EditorInfo info) {
        if (info == null) return;
        if (!NoGoogleSettings.bool(NoGoogleSettings.ALWAYS_INCOGNITO)) {
            forced = false;
        } else if ((info.imeOptions & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) == 0) {
            info.imeOptions |= EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING;
            marked = new WeakReference<>(info);
            forced = true;
        } else {
            forced = marked.get() == info;
        }
    }

    /** Patched over Gboard's incognito check when the clipboard changes: true skips the copied text. */
    public static boolean clipboardBlocked(boolean incognito) {
        return incognito && !(forced && NoGoogleSettings.bool(NoGoogleSettings.INCOGNITO_CLIPBOARD));
    }
}
