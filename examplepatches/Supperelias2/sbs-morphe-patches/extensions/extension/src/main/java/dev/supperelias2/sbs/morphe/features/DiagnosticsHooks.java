package dev.supperelias2.sbs.morphe.features;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Locale;

import dev.supperelias2.sbs.morphe.MorpheSettings;

/** Local, non-interactive playback information. Never reads URI, error text or account fields. */
@SuppressWarnings("unused")
public final class DiagnosticsHooks {
    private static WeakReference<Object> owner = new WeakReference<>(null);
    private static WeakReference<Activity> displayedActivity = new WeakReference<>(null);
    private static TextView overlay;
    private static Handler handler;
    private static SharedPreferences listenedPreferences;
    private static boolean scheduled;
    private static final Runnable UPDATE = DiagnosticsHooks::update;
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGES = (preferences, key) -> {
        if ("diagnostic_overlay".equals(key)) schedule();
    };

    private DiagnosticsHooks() {}

    public static void onPlayerReady(Object manager) {
        owner = new WeakReference<>(manager);
        SharedPreferences preferences = MorpheSettings.getPreferences();
        if (preferences != null && preferences != listenedPreferences) {
            if (listenedPreferences != null) listenedPreferences.unregisterOnSharedPreferenceChangeListener(CHANGES);
            preferences.registerOnSharedPreferenceChangeListener(CHANGES);
            listenedPreferences = preferences;
        }
        schedule();
    }

    private static void schedule() {
        if (handler == null) handler = new Handler(Looper.getMainLooper());
        if (scheduled) return;
        scheduled = true;
        handler.post(UPDATE);
    }

    private static void update() {
        scheduled = false;
        if (!MorpheSettings.enabled("diagnostic_overlay", false)) { remove(); return; }
        Object manager = owner.get();
        Object player = Reflect.player(manager);
        if (player == null) { remove(); return; }
        Activity activity = MorpheSettings.getActivity();
        long state = Reflect.number(Reflect.call(player, "getPlaybackState"), 1L);
        if (activity == null || !activity.hasWindowFocus() || state == 1L || state == 4L) {
            remove();
        } else {
            if (overlay == null || displayedActivity.get() != activity) attach(activity);
            if (overlay != null) overlay.setText(summary(manager, player, state));
        }
        scheduled = true;
        handler.postDelayed(UPDATE, 1000L);
    }

    private static String summary(Object manager, Object player, long state) {
        Object viewModel = Reflect.viewModel(manager);
        Object controller = Reflect.field(viewModel, "playbackController");
        Object provider = Reflect.field(controller, "currentProvider");
        String source = provider == null ? "Unknown" : provider.getClass().getSimpleName();
        Object format = Reflect.call(player, "getVideoFormat");
        long width = Reflect.number(Reflect.field(format, "width"), 0L);
        long height = Reflect.number(Reflect.field(format, "height"), 0L);
        long bitrate = Reflect.number(Reflect.field(format, "bitrate"), 0L);
        Object codec = Reflect.field(format, "codecs");
        String codecText = codec instanceof String ? ((String) codec).replaceAll("[^A-Za-z0-9.,_-]", "") : "unknown";
        long position = Reflect.number(Reflect.call(player, "getCurrentPosition"), 0L);
        long buffered = Reflect.number(Reflect.call(player, "getBufferedPosition"), position);
        Object error = Reflect.call(player, "getPlayerError");
        long errorCode = Reflect.number(Reflect.field(error, "errorCode"), 0L);
        return String.format(Locale.US, "Morphe · %s\n%s · %d×%d · %d kbps\nBuffer %.1fs · codec %s%s",
                state == 2L ? "Buffering" : "Ready", source, Math.max(0L, width), Math.max(0L, height), Math.max(0L, bitrate) / 1000L,
                Math.max(0L, buffered - position) / 1000.0, codecText, errorCode == 0L ? "" : " · error " + errorCode);
    }

    private static void attach(Activity activity) {
        remove();
        View root = activity.getWindow().getDecorView();
        if (!(root instanceof ViewGroup)) return;
        TextView text = new TextView(activity);
        text.setTextSize(10f);
        text.setTextColor(Color.WHITE);
        text.setBackgroundColor(0xbb15121c);
        text.setPadding(dp(activity, 8), dp(activity, 5), dp(activity, 8), dp(activity, 5));
        text.setClickable(false);
        text.setFocusable(false);
        text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.START);
        layout.leftMargin = dp(activity, 8);
        layout.topMargin = dp(activity, 42);
        ((ViewGroup) root).addView(text, layout);
        overlay = text;
        displayedActivity = new WeakReference<>(activity);
    }

    private static int dp(Activity activity, int value) { return Math.round(value * activity.getResources().getDisplayMetrics().density); }

    private static void remove() {
        if (overlay != null && overlay.getParent() instanceof ViewGroup) ((ViewGroup) overlay.getParent()).removeView(overlay);
        overlay = null;
        displayedActivity.clear();
    }
}
