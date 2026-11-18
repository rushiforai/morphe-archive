package io.github.sabopura.morphe.extension.twitch.original;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Keeps a raid from taking you to another channel; a pill offers the move instead. */
public final class RaidHold {
    public static final String KEY = "raid_hold";
    private static final long SHOW_MS = 20_000;

    private static final Runnable DISMISS = RaidHold::dismiss;
    private static WeakReference<View> pill = new WeakReference<>(null);
    /** A move is only offered until the pill goes away, so these are cleared with it. */
    private static Object heldRouter, heldActivity, heldDestination;
    private static Object released;

    private RaidHold() {
    }

    /**
     * Injection point: Twitch about to open a theatre, on the main thread.
     *
     * @return true to stop the move
     */
    public static boolean onNavigate(Object router, Object activity, Object destination) {
        try {
            if (raidId(destination) == null) return false;
            if (destination == released) {
                released = null;
                return false;
            }
            if (!enabled()) return false;
            String name = displayName(stream(destination));
            Original.onMain(() -> offer(router, activity, destination, name));
            return true;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.raid-hold", e);
            return false;
        }
    }

    private static boolean enabled() {
        SharedPreferences prefs = Original.prefs();
        return Features.has(Feature.RAID_HOLD) && prefs != null && prefs.getBoolean(KEY, false);
    }

    private static String displayName(Object stream) {
        try {
            Object name = stream.getClass().getMethod("getChannelDisplayName").invoke(stream);
            return name == null ? "" : name.toString();
        } catch (ReflectiveOperationException | RuntimeException e) {
            Diagnostics.note("original.raid-hold-name", e);
            return "";
        }
    }

    private static void offer(Object router, Object activity, Object destination, String name) {
        dismiss();
        heldRouter = router;
        heldActivity = activity;
        heldDestination = destination;
        Activity on = activity instanceof Activity ? (Activity) activity : Original.activity();
        if (on == null || on.isFinishing() || on.getWindow() == null) return;
        ViewGroup root = (ViewGroup) on.getWindow().getDecorView();
        View view = build(on, root, name);
        root.addView(view);
        pill = new WeakReference<>(view);
        view.setAlpha(0f);
        view.setTranslationY(-Ui.dp(on, 12));
        view.animate().alpha(1f).translationY(0f).setDuration(220).start();
    }

    /** Stays for {@link #SHOW_MS} once the window is visible again, so time away from the app does not count. */
    private static final class Pill extends TextView {
        Pill(Activity activity) {
            super(activity);
        }

        @Override
        protected void onWindowVisibilityChanged(int visibility) {
            super.onWindowVisibilityChanged(visibility);
            removeCallbacks(DISMISS);
            if (visibility == VISIBLE) postDelayed(DISMISS, SHOW_MS);
        }
    }

    private static View build(Activity activity, ViewGroup root, String name) {
        int padX = Ui.dp(activity, 16), padY = Ui.dp(activity, 11);
        TextView text = new Pill(activity);
        text.setText(name.isEmpty() ? label("レイドが始まりました: 移動する", "A raid started: Go")
                : label(name + " へレイド中: 移動する", name + " is raiding: Go"));
        text.setTextColor(0xFFFFFFFF);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setPadding(padX, padY, padX, padY);
        text.setGravity(Gravity.CENTER);
        text.setMaxLines(2);
        GradientDrawable face = Ui.rounded(activity, 0xE69146FF, 22);
        text.setBackground(face);
        text.setElevation(Ui.dp(activity, 6));
        text.setContentDescription(text.getText());
        text.setOnClickListener(v -> go());
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        WindowInsets insets = root.getRootWindowInsets();
        params.topMargin = (insets == null ? 0 : insets.getSystemWindowInsetTop()) + Ui.dp(activity, 12);
        text.setLayoutParams(params);
        return text;
    }

    private static void go() {
        Object router = heldRouter, activity = heldActivity, destination = heldDestination;
        dismiss();
        if (router == null || destination == null) return;
        released = destination;
        try {
            navigate(router, activity, destination);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.raid-hold-go", e);
            released = null;
        }
    }

    private static void dismiss() {
        heldRouter = heldActivity = heldDestination = null;
        View view = pill.get();
        pill = new WeakReference<>(null);
        if (view == null) return;
        view.removeCallbacks(DISMISS);
        view.animate().cancel();
        ViewGroup parent = (ViewGroup) view.getParent();
        if (parent != null) parent.removeView(view);
    }

    /** Replaced at patch time: the raid this theatre destination belongs to, or null. */
    private static String raidId(Object destination) {
        return null;
    }

    /** Replaced at patch time: the stream this destination opens. */
    private static Object stream(Object destination) {
        return null;
    }

    /** Replaced at patch time: Twitch's router opening the held screen. */
    private static void navigate(Object router, Object activity, Object destination) {
    }
}
