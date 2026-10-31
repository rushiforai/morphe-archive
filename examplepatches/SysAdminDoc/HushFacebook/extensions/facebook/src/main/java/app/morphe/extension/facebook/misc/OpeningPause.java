/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.ShimmerTitle;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Opening pause. With its switch on, opening Facebook from its icon puts a cover over its first
 * screen that counts down five or ten seconds before Open now works, a moment to decide whether
 * to open it at all. Close, or Back, sends Facebook to the background.
 *
 * <p>A return is the first main process screen to start after none was started. It pauses when
 * it starts Facebook fresh, or brings it back after a minute or more away from the screen. One
 * that opens a link, a notification or a share (any intent but the icon's), the start after a
 * settings restart, and a return within the minute open straight away. A rotation isn't a
 * return, and the screen going off with Facebook in front isn't time away.
 *
 * <p>A pause that's owed stays owed until Open now, a link or the switch going off, so closing
 * Facebook and opening it again starts the count over. While the app lock covers Facebook the
 * pause waits, and comes up after the unlock.
 */
public final class OpeningPause {
    /** How long Facebook can be away from the screen and come back without a pause. */
    static final long AWAY_MS = 60_000;

    private static final long NEVER = -1;

    /** How long the cover counts down. */
    public enum Length {
        FIVE_SECONDS(5, "5_seconds"),
        TEN_SECONDS(10, "10_seconds");

        public final int seconds;

        /** What a settings file holds for this choice. It never changes once written. */
        public final String fileValue;

        Length(int seconds, String fileValue) {
            this.seconds = seconds;
            this.fileValue = fileValue;
        }

        /** The choice a settings file names, or null for anything else. */
        @Nullable
        public static Length fromFile(@Nullable Object value) {
            if (!(value instanceof String)) return null;
            for (Length length : values()) {
                if (length.fileValue.equals(value)) return length;
            }
            return null;
        }
    }

    /** Main process screens between their start and their stop. */
    private static int started;
    /** A return began and its first resume hasn't judged it yet. */
    private static boolean deciding;
    /** The return being judged opens a link, a notification or a share. */
    private static boolean straightIn;
    /** The next return is the start after a settings restart. */
    private static boolean restarting;
    /** Facebook was on screen uncovered once in this process. */
    private static boolean opened;
    /** A cover is owed, until Open now, a link or the switch going off. */
    private static boolean pending;
    /** When Facebook last left the screen uncovered, by elapsedRealtime, or NEVER while it's on it. */
    private static long leftAt = NEVER;
    /** When Open now starts working, by uptimeMillis, or NEVER before a cover counts down. */
    private static long readyAt = NEVER;
    private static final Map<Activity, Cover> covers = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Runnable tick = OpeningPause::tick;

    /** The application this process's callbacks went on, so a second start of the hook adds none. */
    private static WeakReference<Application> watching = new WeakReference<>(null);

    private OpeningPause() {
    }

    /** From the settings entry's application hook, in the main process, after the app lock's. */
    public static void watch(Context context) {
        if (!(context instanceof Application)) return;
        Application application = (Application) context;
        if (watching.get() == application) return;
        application.registerActivityLifecycleCallbacks(new Watcher());
        watching = new WeakReference<>(application);
    }

    static final class Watcher implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityCreated(Activity activity, @Nullable Bundle state) { created(activity, state); }
        @Override public void onActivityStarted(Activity activity) { started(activity); }
        @Override public void onActivityResumed(Activity activity) { resumed(activity); }
        @Override public void onActivityPaused(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { stopped(activity); }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override public void onActivityDestroyed(Activity activity) { destroyed(activity); }
    }

    /** Whether [intent] is a plain start from Facebook's icon, the only kind that pauses. */
    static boolean fromIcon(@Nullable Intent intent) {
        return intent != null && Intent.ACTION_MAIN.equals(intent.getAction())
                && intent.hasCategory(Intent.CATEGORY_LAUNCHER) && intent.getData() == null;
    }

    /**
     * A fresh screen with nothing started begins a return, judged by its intent. Facebook's icon
     * screen hands the same intent on to the main screen, and only the first one counts.
     */
    static void created(Activity activity, @Nullable Bundle state) {
        if (started > 0 || deciding) return;
        deciding = true;
        straightIn = state == null && !fromIcon(activity.getIntent());
    }

    static void started(Activity activity) {
        if (started++ == 0 && !deciding) {
            deciding = true;
            straightIn = false;
        }
    }

    /**
     * From the settings entry's new intent hook: a link, a notification or a share delivered to a
     * screen Facebook already had, as it comes back, opens it straight away. One Facebook sends
     * its own screen while it's in front, as a cover counts down, changes nothing.
     */
    public static void newIntent(@Nullable Intent intent) {
        if (fromIcon(intent) || (started > 0 && !deciding)) return;
        deciding = true;
        straightIn = true;
    }

    /** From the settings entry's application hook: this start is a settings restart's. */
    public static void restarted() {
        restarting = true;
    }

    static void resumed(Activity activity) {
        try {
            if (deciding) decide();
            if (!pending) {
                if (!covers.isEmpty()) closeCovers();
                return;
            }
            if (!switchedOn()) {
                Logger.printDebug(() -> "Opening pause: switched off, so Facebook opens");
                open();
                return;
            }
            // The lock's cover comes first, and this one after the unlock (unlocked).
            if (AppLock.covering()) return;
            cover(activity);
        } catch (Throwable failure) {
            Logger.printException(() -> "Opening pause: could not judge a screen", failure);
        }
    }

    private static void decide() {
        deciding = false;
        boolean link = straightIn, restart = restarting;
        straightIn = false;
        restarting = false;
        if (link || restart || !switchedOn()) {
            pending = false;
        } else if (!opened || (leftAt != NEVER && SystemClock.elapsedRealtime() - leftAt >= AWAY_MS)) {
            pending = true;
        }
        if (!pending) {
            opened = true;
            leftAt = NEVER;
        }
        boolean owed = pending;
        Logger.printDebug(() -> "Opening pause: " + (owed ? "a pause is owed"
                : link ? "a link, notification or share opens straight away"
                : restart ? "a settings restart opens straight away" : "no pause"));
    }

    static void stopped(Activity activity) {
        try {
            if (started > 0) started--;
            if (started > 0 || activity.isChangingConfigurations()) return;
            // Away from the screen: the count starts over on the way back.
            readyAt = NEVER;
            main.removeCallbacks(tick);
            if (pending) return;
            PowerManager power = activity.getSystemService(PowerManager.class);
            if (power != null && !power.isInteractive()) return;
            leftAt = SystemClock.elapsedRealtime();
        } catch (Throwable failure) {
            Logger.printException(() -> "Opening pause: could not tell whether Facebook was left", failure);
        }
    }

    static void destroyed(Activity activity) {
        Cover cover = covers.remove(activity);
        if (cover != null) cover.close();
    }

    /** From the app lock, as it unlocks with [activity] in front: the pause owed comes up now. */
    public static void unlocked(Activity activity) {
        try {
            if (pending && switchedOn() && !activity.isFinishing()) cover(activity);
        } catch (Throwable failure) {
            Logger.printException(() -> "Opening pause: could not cover after the unlock", failure);
        }
    }

    /** Whether a pause cover is up. */
    static boolean covering() {
        for (Cover cover : covers.values()) {
            if (cover.isShowing()) return true;
        }
        return false;
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.OPENING_PAUSE.get();
    }

    private static void cover(Activity activity) {
        if (activity.isFinishing()) return;
        if (readyAt == NEVER) {
            readyAt = SystemClock.uptimeMillis() + Settings.OPENING_PAUSE_LENGTH.get().seconds * 1000L;
        }
        Cover cover = covers.get(activity);
        if (cover == null) {
            try {
                cover = new Cover(activity);
                covers.put(activity, cover);
            } catch (RuntimeException failure) {
                // A pause that can't be shown leaves Facebook as it is.
                Logger.printException(() -> "Opening pause: could not cover " + activity.getClass().getSimpleName(), failure);
                return;
            }
        }
        if (!cover.isShowing()) cover.show();
        tick();
    }

    /** Shows the time left on every cover, and comes back at the next whole second until none is. */
    static void tick() {
        main.removeCallbacks(tick);
        if (!pending || readyAt == NEVER) return;
        long left = readyAt - SystemClock.uptimeMillis();
        for (Cover cover : new ArrayList<>(covers.values())) cover.showLeft(left);
        if (left > 0) main.postDelayed(tick, (left - 1) % 1000 + 1);
    }

    /** Open now: Facebook shows, and no pause is owed until it's away again. */
    static void open() {
        pending = false;
        readyAt = NEVER;
        leftAt = NEVER;
        opened = true;
        main.removeCallbacks(tick);
        closeCovers();
    }

    private static void closeCovers() {
        for (Cover cover : new ArrayList<>(covers.values())) cover.close();
        covers.clear();
    }

    /**
     * An opaque window over a Facebook screen, with the time left, Open now once it's up, and
     * Close. It takes every touch, and Back sends Facebook to the background.
     */
    private static final class Cover extends Dialog {
        private final Activity activity;
        private final TextView left;
        private final Button openNow;

        Cover(Activity activity) {
            super(activity, android.R.style.Theme_DeviceDefault_NoActionBar);
            this.activity = activity;
            setCancelable(false);
            setCanceledOnTouchOutside(false);
            float density = activity.getResources().getDisplayMetrics().density;
            int gap = Math.round(24 * density);

            LinearLayout column = new LinearLayout(activity);
            column.setOrientation(LinearLayout.VERTICAL);
            column.setGravity(Gravity.CENTER);
            column.setPadding(gap, gap, gap, gap);
            column.setBackgroundColor(Color.BLACK);

            TextView title = new TextView(activity);
            title.setText(L10n.t("Still want to open Facebook?"));
            ShimmerTitle.wear(title, Color.BLACK);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            title.setGravity(Gravity.CENTER);
            title.setAccessibilityHeading(true);
            column.addView(title);
            // What a screen reader speaks as the cover comes up, rather than the app's name.
            setTitle(title.getText());

            left = new TextView(activity);
            left.setTextColor(0xFFB0B3B8);
            left.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            left.setGravity(Gravity.CENTER);
            left.setPadding(0, gap / 2, 0, gap);
            column.addView(left);

            // Both at least 48dp tall, a touch target TalkBack and a thumb can find.
            int target = Math.round(48 * density);
            openNow = new Button(getContext());
            openNow.setText(L10n.t("Open now"));
            openNow.setMinHeight(target);
            openNow.setOnClickListener(view -> {
                if (pending && readyAt != NEVER && SystemClock.uptimeMillis() >= readyAt) open();
            });
            column.addView(openNow);

            Button close = new Button(getContext());
            close.setText(L10n.t("Close"));
            close.setMinHeight(target);
            close.setOnClickListener(view -> activity.moveTaskToBack(true));
            column.addView(close);

            setContentView(column, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));
            Window window = getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                window.setWindowAnimations(0);
            }
            showLeft(readyAt == NEVER ? 0 : readyAt - SystemClock.uptimeMillis());
        }

        /** [millis] left before Open now works. */
        void showLeft(long millis) {
            if (millis > 0) {
                long seconds = (millis + 999) / 1000;
                left.setText(L10n.quantity(seconds, "You can open it in %1$d second.",
                        "You can open it in %1$d seconds.", seconds));
                openNow.setEnabled(false);
                return;
            }
            // Spoken once, when the wait is over, rather than at every second of it.
            left.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            left.setText(L10n.t("Open it, or close it and do something else."));
            openNow.setEnabled(true);
        }

        /**
         * Back, as a key or as the back callback. Facebook targets API 36, so on Android 16 Back
         * never arrives as a key: the dialog's own callback calls this instead.
         */
        @Override
        public void onBackPressed() {
            activity.moveTaskToBack(true);
        }

        void close() {
            try {
                dismiss();
            } catch (RuntimeException gone) {
                // Its screen's window is already gone, and the cover with it.
            }
        }
    }

    /** Forgets this process's screens, covers and any pause owed. */
    static void forgetForTests() {
        started = 0;
        deciding = false;
        straightIn = false;
        restarting = false;
        opened = false;
        pending = false;
        leftAt = NEVER;
        readyAt = NEVER;
        main.removeCallbacks(tick);
        closeCovers();
    }
}
