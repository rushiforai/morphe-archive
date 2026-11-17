package app.tiktoktweaks;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/** Remembers playback speed and clear display between videos. Both are always on. */
public final class Playback {
    private static final String TAG = "TikTokCustom";
    // Obfuscated TikTok 47.7.1 classes; their names are not valid Java identifiers.
    private static final String SPEED_HELPER = "X.0A4l";
    private static final String CLEAR_EVENT = "X.0BvL";

    private static final String OPEN_ON_MUTE = "com.ss.android.ugc.aweme.feed.assem.music.mute.OpenOnMuteImpl";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<TextView> MUTE_BUTTONS = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<View> MUTE_ROOTS = Collections.newSetFromMap(new WeakHashMap<>());
    private static final String MUTE_TAG = "tiktok_tweaks_mute";
    private static volatile boolean canMute;

    private static Method setSpeed;
    private static Constructor<?> clearEvent;
    private static boolean applying;

    private Playback() {}

    public static void rememberSpeed(float speed) {
        if (!applying) Prefs.speed(speed);
    }

    public static void applySpeed(Aweme aweme, String enterFrom) {
        float speed = Prefs.speed();
        if (aweme == null || speed == 1f) return;
        try {
            if (setSpeed == null) {
                setSpeed = Class.forName(SPEED_HELPER)
                    .getMethod("LJ", float.class, Aweme.class, String.class, String.class);
            }
            applying = true;
            setSpeed.invoke(null, speed, aweme, enterFrom, null);
        } catch (Throwable t) {
            Log.w(TAG, "applySpeed failed", t);
        } finally {
            applying = false;
        }
    }

    /** Called from the feed panel's onViewCreated. */
    public static void attachMute(View root) {
        if (root == null || !Prefs.bool(Prefs.REMUTE, true)) return;
        MUTE_ROOTS.add(root);
        root.post(() -> installMute(root));
    }

    private static void installMute(View root) {
        Context context = root.getContext();
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            context = ((ContextWrapper) context).getBaseContext();
        }
        if (!(context instanceof Activity)) return;
        FrameLayout content = ((Activity) context).findViewById(android.R.id.content);
        if (content == null) return;
        if (content.findViewWithTag(MUTE_TAG) == null) {
            TextView button = muteButton(content.getContext());
            button.setTag(MUTE_TAG);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.END);
            params.rightMargin = dp(content.getContext(), 12);
            params.topMargin = dp(content.getContext(), 96);
            content.addView(button, params);
            MUTE_BUTTONS.add(button);
            content.getViewTreeObserver().addOnGlobalLayoutListener(() -> show(button));
        }
        refreshMute();
    }

    private static TextView muteButton(Context context) {
        TextView button = new TextView(context);
        button.setText("🔇");
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        int pad = dp(context, 9);
        button.setPadding(pad, pad, pad, pad);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(Color.argb(115, 0, 0, 0));
        shape.setShape(GradientDrawable.OVAL);
        button.setBackground(shape);
        button.setVisibility(View.GONE);
        button.setOnClickListener(view -> mute());
        return button;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static void show(TextView button) {
        if (button == null) return;
        boolean feedShown = false;
        for (View root : MUTE_ROOTS) {
            if (root.isShown()) { feedShown = true; break; }
        }
        int wanted = canMute && feedShown ? View.VISIBLE : View.GONE;
        if (button.getVisibility() != wanted) button.setVisibility(wanted);
    }

    /** Called whenever TikTok pushes a mute state to the video engine. */
    public static void refreshMute() {
        MAIN.post(() -> {
            try {
                Object spi = muteSpi();
                boolean startsMuted = (boolean) spi.getClass().getMethod("LJIILL").invoke(spi);
                boolean muted = (boolean) spi.getClass().getMethod("LJIIL").invoke(spi);
                canMute = startsMuted && !muted;
            } catch (Throwable t) {
                Log.w(TAG, "refreshMute failed", t);
                canMute = false;
            }
            for (TextView button : MUTE_BUTTONS) show(button);
        });
    }

    private static Object muteSpi() throws Exception {
        return Class.forName("X.07SL").getField("LIZIZ").get(null);
    }

    /** Mirrors TikTok's own toggleUnmute, setting the session flag back to muted. */
    private static void mute() {
        try {
            Field state = Class.forName("X.07Sa").getDeclaredField("LJ");
            state.setAccessible(true);
            state.setBoolean(null, true);
            Class.forName(OPEN_ON_MUTE).getMethod("LJIJJ").invoke(null);
            Object event = Class.forName("X.0A7h").getConstructor(boolean.class).newInstance(true);
            Class<?> type = Class.forName("com.ss.android.ugc.governance.eventbus.IEvent");
            Class.forName("X.096p").getMethod("LIZ", type).invoke(null, event);
        } catch (Throwable t) {
            Log.w(TAG, "mute failed", t);
        }
        refreshMute();
    }

    public static void rememberClear(boolean enabled) {
        Prefs.put(Prefs.CLEAR, enabled);
    }

    public static void restoreClear() {
        if (!Prefs.bool(Prefs.CLEAR, false)) return;
        try {
            if (clearEvent == null) {
                clearEvent = Class.forName(CLEAR_EVENT)
                    .getDeclaredConstructor(boolean.class, int.class, String.class, String.class);
                clearEvent.setAccessible(true);
            }
            Object event = clearEvent.newInstance(true, 0, "", "long_press");
            event.getClass().getMethod("post").invoke(event);
        } catch (Throwable t) {
            Log.w(TAG, "restoreClear failed", t);
        }
    }
}
