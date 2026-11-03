package semicoloncolonel.mobilestream.extension.whitehouse;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * "Hide promotions" for the White House app.
 *
 * The promotions are drawn by the app's JavaScript with no switch to turn
 * them off. After layout passes, and once a second, this looks for text views
 * whose text is one of the chosen labels and hides the button that holds it: the nearest
 * clickable view above the label, or the label itself.
 */
@SuppressWarnings("unused")
public final class PromoHider {
    private static final String TAG = "MSP-WH";
    private static final int MAX_BUTTON_DEPTH = 6;
    private static final long RESCAN_MS = 1000;

    private static Set<String> labels;

    private PromoHider() {
    }

    /** The labels to hide, separated by "|". The patch replaces this method's body. */
    private static String hiddenLabels() {
        return "";
    }

    private static Set<String> labels() {
        if (labels == null) {
            labels = new HashSet<>();
            for (String label : Arrays.asList(hiddenLabels().split("\\|"))) {
                if (!label.trim().isEmpty()) {
                    labels.add(label.trim().toLowerCase(Locale.US));
                }
            }
        }
        return labels;
    }

    /**
     * Called at the start of the activity's onCreate. The window is not touched until onCreate
     * has finished, so the activity's theme is applied first.
     */
    public static void install(final Activity activity) {
        if (labels().isEmpty()) {
            return;
        }
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        // A layout listener added this early can be dropped when the window attaches, so the
        // screen is also rescanned once a second while the activity is open.
        handler.post(new Runnable() {
            private boolean listening;

            @Override
            public void run() {
                if (activity.isDestroyed()) {
                    return;
                }
                try {
                    final View root = activity.getWindow().getDecorView();
                    if (!listening && root.isAttachedToWindow()) {
                        root.getViewTreeObserver().addOnGlobalLayoutListener(() -> scan(root));
                        listening = true;
                    }
                    scan(root);
                } catch (Throwable t) {
                    Log.w(TAG, "promotion scan failed: " + t);
                }
                handler.postDelayed(this, RESCAN_MS);
            }
        });
    }

    private static CharSequence textOf(View view) {
        if (view instanceof TextView) {
            return ((TextView) view).getText();
        }
        // React Native's PreparedLayoutTextView is a ViewGroup with a public getText().
        if (view.getClass().getSimpleName().endsWith("TextView")) {
            try {
                Method getText = view.getClass().getMethod("getText");
                Object text = getText.invoke(view);
                return text instanceof CharSequence ? (CharSequence) text : null;
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static void scan(View view) {
        if (view.getVisibility() != View.VISIBLE) {
            return;
        }
        CharSequence text = textOf(view);
        if (text != null && labels().contains(text.toString().trim().toLowerCase(Locale.US))) {
            hide(view, text.toString().trim());
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                scan(group.getChildAt(i));
            }
        }
    }

    private static void hide(View label, String text) {
        View target = label;
        View current = label;
        for (int depth = 0; depth < MAX_BUTTON_DEPTH; depth++) {
            ViewParent parent = current.getParent();
            if (!(parent instanceof View)) {
                break;
            }
            current = (View) parent;
            if (current.isClickable()) {
                target = current;
                break;
            }
        }
        target.setVisibility(View.GONE);
        Log.i(TAG, "hid \"" + text + "\"");
    }
}
