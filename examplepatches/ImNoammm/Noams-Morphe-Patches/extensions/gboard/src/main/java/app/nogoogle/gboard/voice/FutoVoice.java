package app.nogoogle.gboard.voice;

import android.content.Context;
import android.content.pm.PackageManager;
import android.inputmethodservice.InputMethodService;
import android.util.Log;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;

import java.util.List;

/**
 * Voice typing with the FUTO Voice Input app instead of Whisper in the keyboard. The mic key hands
 * the text field to FUTO's voice keyboard, which shows its panel where Gboard was, types what was
 * said and switches back to Gboard by itself (also when cancelled). Nothing of FUTO's is bundled:
 * the app has to be installed and its keyboard turned on in Android's keyboard settings.
 */
public final class FutoVoice {
    private static final String TAG = "NoGoogleVoice";
    /** FUTO Voice Input's package (Play Store, F-Droid repo and website builds). */
    public static final String PACKAGE = "org.futo.voiceinput";

    private FutoVoice() {
    }

    /**
     * Called on the main thread when the mic key is tapped and the engine is FUTO. False when its
     * keyboard isn't turned on (the mic uses Whisper then: a toast from the keyboard isn't shown
     * while its notifications are off, Android's default).
     */
    static boolean open(InputMethodService ime) {
        InputMethodManager imm = ime.getSystemService(InputMethodManager.class);
        InputMethodInfo futo = imm == null ? null : find(imm.getEnabledInputMethodList());
        if (futo == null) return false;
        try {
            ime.switchInputMethod(futo.getId(), voiceSubtype(imm, futo));
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "switching to FUTO Voice Input failed", t);
            return false;
        }
    }

    /** For the settings: whether the mic can open it now. */
    public static boolean available(Context context) {
        InputMethodManager imm = context.getSystemService(InputMethodManager.class);
        return imm != null && find(imm.getEnabledInputMethodList()) != null;
    }

    private static InputMethodInfo find(List<InputMethodInfo> list) {
        if (list == null) return null;
        for (InputMethodInfo i : list) if (PACKAGE.equals(i.getPackageName())) return i;
        return null;
    }

    /** For the settings: installed, with its keyboard turned on or off. */
    public static boolean installed(Context context) {
        InputMethodManager imm = context.getSystemService(InputMethodManager.class);
        if (imm != null && find(imm.getInputMethodList()) != null) return true;
        try {
            context.getPackageManager().getPackageInfo(PACKAGE, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    /** FUTO's "voice" subtype, or null to let Android pick (FUTO has only that one). */
    private static InputMethodSubtype voiceSubtype(InputMethodManager imm, InputMethodInfo futo) {
        try {
            List<InputMethodSubtype> enabled = imm.getEnabledInputMethodSubtypeList(futo, true);
            if (enabled != null) {
                for (InputMethodSubtype s : enabled) if ("voice".equals(s.getMode())) return s;
            }
            for (int i = 0; i < futo.getSubtypeCount(); i++) {
                InputMethodSubtype s = futo.getSubtypeAt(i);
                if ("voice".equals(s.getMode())) return s;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
