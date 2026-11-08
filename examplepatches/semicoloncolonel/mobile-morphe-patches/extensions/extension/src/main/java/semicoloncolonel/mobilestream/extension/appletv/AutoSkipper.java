package semicoloncolonel.mobilestream.extension.appletv;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.accessibility.AccessibilityNodeProvider;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Presses Apple TV's skip buttons in the Android TV app, for the kinds the
 * patch options chose.
 *
 * The app draws its screen in Apple's native engine, which describes the
 * screen to Android as a JSON tree for screen readers. A promo for another
 * title shows a button labeled exactly "Skip", a recap "Skip Recap", and an
 * intro "Skip Intro". A chosen button is focused and pressed through the
 * app's own accessibility provider, the same way a screen reader would press
 * it. Each button gets a new id, so back-to-back promos are each skipped once.
 */
@SuppressWarnings("unused")
public final class AutoSkipper {
    private static final String TAG = "MSP-ATV-SKIP";
    private static final int ACTION_ACCESSIBILITY_FOCUS = 64;
    private static final int ACTION_CLICK = 16;
    private static final long PRESS_DELAY_MS = 600;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile int lastPressed = -1;

    private AutoSkipper() {
    }

    /**
     * Replaces Native.onScreenReaderStatusChanged. The engine only describes
     * its screen while it believes a screen reader is on. Speech still needs
     * Android's own accessibility service, so nothing is read aloud.
     */
    public static void screenReader(boolean enabled) {
        try {
            Class.forName("com.apple.atve.luna.Native")
                    .getMethod("onScreenReaderStatusChanged", boolean.class).invoke(null, true);
        } catch (Throwable t) {
            Log.w(TAG, "could not report the screen reader", t);
        }
    }

    // Overwritten by the patch options, so R8 must not fold these answers.
    public static boolean skipPromos() {
        return true;
    }

    public static boolean skipRecaps() {
        return false;
    }

    public static boolean skipIntros() {
        return false;
    }

    private static boolean chosen(String label) {
        switch (label) {
            case "Skip":
                return skipPromos();
            case "Skip Recap":
                return skipRecaps();
            case "Skip Intro":
                return skipIntros();
            default:
                return false;
        }
    }

    /** Called at the top of LunaAccessibilityNodeProvider.updateAXTree(String). */
    public static void onTree(Object provider, String json) {
        try {
            if (json == null || !json.contains("\"Skip")) return;
            int id = findSkip(new JSONObject(json).optJSONObject("tree"));
            if (id < 0 || id == lastPressed) return;
            lastPressed = id;
            final AccessibilityNodeProvider p = (AccessibilityNodeProvider) provider;
            MAIN.postDelayed(() -> {
                try {
                    p.performAction(id, ACTION_ACCESSIBILITY_FOCUS, null);
                    p.performAction(id, ACTION_CLICK, null);
                    Log.i(TAG, "pressed a skip button (" + id + ")");
                } catch (Throwable t) {
                    Log.w(TAG, "could not press Skip", t);
                }
            }, PRESS_DELAY_MS);
        } catch (Throwable t) {
            Log.w(TAG, "could not read the screen", t);
        }
    }

    private static int findSkip(JSONObject node) {
        if (node == null) return -1;
        if (chosen(node.optString("label")) && isButton(node)) {
            return node.optInt("id", -1);
        }
        JSONArray children = node.optJSONArray("children");
        if (children == null) return -1;
        for (int i = 0; i < children.length(); i++) {
            int id = findSkip(children.optJSONObject(i));
            if (id >= 0) return id;
        }
        return -1;
    }

    private static boolean isButton(JSONObject node) {
        JSONArray types = node.optJSONArray("types");
        if (types == null) return false;
        for (int i = 0; i < types.length(); i++) {
            JSONObject type = types.optJSONObject(i);
            if (type != null && "Button".equals(type.optString("type"))) return true;
        }
        return false;
    }
}
