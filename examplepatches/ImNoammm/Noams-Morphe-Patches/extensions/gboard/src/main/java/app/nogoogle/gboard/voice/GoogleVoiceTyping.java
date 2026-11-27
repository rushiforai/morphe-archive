package app.nogoogle.gboard.voice;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;

/**
 * The "Google voice typing" voice engine: the mic opens Google voice typing, the voice keyboard of
 * Speech Services by Google, as stock Gboard does when the phone is offline (its SystemAuxiliaryImeLauncher:
 * an enabled keyboard of a Google app with a "voice" subtype). The recognition happens in that app;
 * Gboard itself stays offline.
 */
public final class GoogleVoiceTyping {
    static final String SPEECH_SERVICES = "com.google.android.tts";
    private static final String STOCK_GBOARD = "com.google.android.inputmethod.latin";

    private GoogleVoiceTyping() {
    }

    /** Switches to it; false when no such keyboard is turned on (the mic uses Whisper then). */
    static boolean open(InputMethodService ime) {
        InputMethodManager imm = ime.getSystemService(InputMethodManager.class);
        InputMethodInfo info = imm == null ? null : find(imm);
        if (info == null) return false;
        InputMethodSubtype subtype = voiceSubtype(imm, info);
        if (Build.VERSION.SDK_INT >= 28) {
            ime.switchInputMethod(info.getId(), subtype);
        } else {
            imm.setInputMethodAndSubtype(ime.getWindow().getWindow().getAttributes().token, info.getId(), subtype);
        }
        return true;
    }

    /** For the settings: whether the mic can open it now. */
    public static boolean available(Context c) {
        InputMethodManager imm = c.getSystemService(InputMethodManager.class);
        return imm != null && find(imm) != null;
    }

    /** Speech Services by Google first, else another Google app's voice keyboard; never stock Gboard. */
    private static InputMethodInfo find(InputMethodManager imm) {
        InputMethodInfo found = null;
        for (InputMethodInfo info : imm.getEnabledInputMethodList()) {
            String pkg = info.getPackageName();
            if (!pkg.startsWith("com.google.android") || pkg.equals(STOCK_GBOARD) || voiceSubtype(imm, info) == null) continue;
            if (pkg.equals(SPEECH_SERVICES)) return info;
            if (found == null) found = info;
        }
        return found;
    }

    private static InputMethodSubtype voiceSubtype(InputMethodManager imm, InputMethodInfo info) {
        for (InputMethodSubtype s : imm.getEnabledInputMethodSubtypeList(info, true)) {
            if ("voice".equals(s.getMode())) return s;
        }
        return null;
    }
}
