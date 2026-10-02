/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;

import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;

/**
 * How the HushTelegram screen is reached.
 *
 * <p>From the home screen, a long-press shortcut on Telegram's launcher icon opens Telegram's launcher
 * activity with {@link #EXTRA_OPEN_SETTINGS}. From Android's App info page for Telegram, "Additional
 * settings in the app" opens it too: the patch adds an activity alias for
 * {@link Intent#ACTION_APPLICATION_PREFERENCES} that points at the same launcher activity. Every
 * Telegram activity reports its intent here from {@code onCreate} and {@code onNewIntent}, and the
 * next Telegram activity to resume shows the screen as a full screen dialog. The shortcut is kept
 * first among Telegram's own, because a launcher shows only the first few, and some launchers have no
 * shortcut menu at all.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    public static final String EXTRA_OPEN_SETTINGS = "app.hushtelegram.extension.telegram.OPEN_SETTINGS";
    static final String SHORTCUT_ID = "hushtelegram_settings";

    /**
     * Telegram's exported launcher activity. The patch's App info alias points at it too, so both
     * ways in arrive at the activity Telegram itself starts from the icon.
     */
    static final String LAUNCHER_ACTIVITY = "org.telegram.ui.LaunchActivity";
    private static final String DIALOG_TAG = "hushtelegram_settings";

    /** A request older than this is dropped rather than opened over some later screen. */
    private static final long REQUEST_LIFETIME_MS = 30_000;

    private static volatile boolean openPending;
    private static volatile long requestedAt;
    private static volatile boolean callbacksRegistered;
    /** The activity the screen was last shown over, while the person hasn't closed it. */
    private static WeakReference<Activity> host;
    private static volatile boolean closedByUser;
    /** The long label last pushed, or found already on the shortcut, in this process. */
    private static volatile String publishedLabel;
    /** A check of the shortcut's place is waiting for the background thread. */
    private static final AtomicBoolean keepFirstQueued = new AtomicBoolean();

    private SettingsEntry() {
    }

    /**
     * Injected before each return of the application's {@code onCreate}, after Telegram's own
     * startup. Watches every Telegram activity, so a pending open lands on whichever one resumes
     * next: signed out, the launcher hands straight over to the login screen. Also where the
     * release check, when it's on, asks at most once a day, on a worker.
     */
    public static void onApplicationCreate(Context context) {
        try {
            if (!Utils.isMainProcess()) return;
            if (context instanceof Application && !callbacksRegistered) {
                ((Application) context).registerActivityLifecycleCallbacks(new OpenWhenResumed());
                callbacksRegistered = true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not watch activities", ex);
        }
        ReleaseCheck.onTelegramStart();
        publishShortcut(context);
    }

    private static void publishShortcut(Context context) {
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Utils.runOnBackgroundThread(() -> publishShortcutNow(app));
    }

    /**
     * Labels the shortcut again once Telegram has set its own language. That happens after the
     * application starts, so a label published then is in the phone's language, and it stayed
     * that way next to a screen in Telegram's. A string compare while the label still matches.
     */
    static void relabelIfStale(Context context) {
        try {
            if (!L10n.t(context, "HushTelegram settings").equals(publishedLabel)) publishShortcut(context);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not check the shortcut's label", ex);
        }
    }

    /**
     * Publishes the launcher shortcut, labels it again when Telegram's language has changed, or puts
     * it back in front when Telegram's own went ahead of it, on the thread it's called on.
     * Package-visible for tests.
     */
    static void publishShortcutNow(Context app) {
        try {
            ShortcutManager manager = app.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            String longLabel = L10n.t(app, "HushTelegram settings");
            // Set before the attempt, so a shortcut that can't be pushed isn't tried on every screen.
            publishedLabel = longLabel;
            ShortcutInfo existing = ours(manager);
            // One labelled in another language, or behind Telegram's own, is pushed again below.
            if (existing != null && existing.getRank() == 0
                    && longLabel.contentEquals(existing.getLongLabel())) return;
            push(manager, shortcut(app, longLabel), existing != null);
            Logger.printInfo(() -> "Settings entry: launcher shortcut published");
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not publish the shortcut", ex);
        }
    }

    /**
     * Puts the shortcut back in front of Telegram's own, keeping the label it has, or publishes it
     * when Telegram's call removed it. The label is kept because the process Telegram pushes from may
     * not have Telegram's language yet, and the next screen relabels it anyway. Package-visible for
     * tests.
     */
    static void keepFirstNow(Context app) {
        try {
            ShortcutManager manager = app.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            ShortcutInfo existing = ours(manager);
            if (existing == null) {
                publishShortcutNow(app);
                return;
            }
            final int rank = existing.getRank();
            if (rank == 0) return;
            CharSequence label = existing.getLongLabel();
            push(manager, shortcut(app, label != null ? label : L10n.t(app, "HushTelegram settings")), true);
            Logger.printInfo(() -> "Settings entry: launcher shortcut moved back in front from rank " + rank);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not put the shortcut back in front", ex);
        }
    }

    /**
     * Publishes [shortcut] at the front. From Android 11 a push evicts the lowest-ranked dynamic
     * shortcut when Telegram's own fill the limit. Android 9 and 10 have no push, so an add does the
     * same: it updates the shortcut in place when [present], and otherwise makes room first by
     * taking off the last one, as a push would, since an add past the limit throws.
     */
    private static void push(ShortcutManager manager, ShortcutInfo shortcut, boolean present) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            manager.pushDynamicShortcut(shortcut);
            return;
        }
        if (!present) {
            List<ShortcutInfo> shown = manager.getDynamicShortcuts();
            if (shown.size() >= manager.getMaxShortcutCountPerActivity()) {
                ShortcutInfo last = null;
                for (ShortcutInfo candidate : shown) {
                    if (last == null || candidate.getRank() >= last.getRank()) last = candidate;
                }
                if (last != null) manager.removeDynamicShortcuts(Collections.singletonList(last.getId()));
            }
        }
        manager.addDynamicShortcuts(Collections.singletonList(shortcut));
    }

    /** The HushTelegram shortcut among the dynamic ones, or null. */
    private static ShortcutInfo ours(ShortcutManager manager) {
        for (ShortcutInfo existing : manager.getDynamicShortcuts()) {
            if (SHORTCUT_ID.equals(existing.getId())) return existing;
        }
        return null;
    }

    private static ShortcutInfo shortcut(Context app, CharSequence longLabel) {
        Intent intent = new Intent(Intent.ACTION_VIEW)
                .setComponent(new ComponentName(app.getPackageName(), LAUNCHER_ACTIVITY))
                .putExtra(EXTRA_OPEN_SETTINGS, true)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return new ShortcutInfo.Builder(app, SHORTCUT_ID)
                .setShortLabel("HushTelegram")
                .setLongLabel(longLabel)
                .setIcon(Icon.createWithAdaptiveBitmap(shortcutIcon()))
                .setIntent(intent)
                // The platform puts the newest push first among equal ranks.
                .setRank(0)
                .build();
    }

    // Telegram's own calls that change its dynamic shortcuts come here instead: the patch sends each
    // ShortcutManager call of these names to the method of the same name here, the manager first.
    // Telegram pushes its own shortcuts at rank 0, and the platform puts the newest push first, so
    // the HushTelegram shortcut sank to the end of the list, where a launcher showing three or four
    // cut it off. Telegram's call runs as it did, with the same answer and the same exceptions, and
    // then the HushTelegram shortcut goes back in front.

    /**
     * ShortcutManager's push exists from Android 11 only, so Telegram's own call, which this stands
     * in for, never runs on anything older.
     */
    @RequiresApi(Build.VERSION_CODES.R)
    public static void pushDynamicShortcut(ShortcutManager manager, ShortcutInfo shortcut) {
        manager.pushDynamicShortcut(shortcut);
        keepFirst();
    }

    public static boolean addDynamicShortcuts(ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        boolean added = manager.addDynamicShortcuts(shortcuts);
        keepFirst();
        return added;
    }

    /** Replaces every dynamic shortcut, the HushTelegram one too, which is published again after. */
    public static boolean setDynamicShortcuts(ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        boolean set = manager.setDynamicShortcuts(shortcuts);
        keepFirst();
        return set;
    }

    public static boolean updateShortcuts(ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        boolean updated = manager.updateShortcuts(shortcuts);
        keepFirst();
        return updated;
    }

    public static void removeAllDynamicShortcuts(ShortcutManager manager) {
        manager.removeAllDynamicShortcuts();
        keepFirst();
    }

    /**
     * Checks the shortcut on a background thread, once however many of Telegram's calls ask. The
     * flag drops as the check starts, so a call that lands during it asks for another.
     */
    private static void keepFirst() {
        try {
            Context context = Utils.getContext();
            if (context == null || !keepFirstQueued.compareAndSet(false, true)) return;
            final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            boolean queued = Utils.runOnBackgroundThread(() -> {
                keepFirstQueued.set(false);
                keepFirstNow(app);
            });
            if (!queued) keepFirstQueued.set(false);
        } catch (Throwable t) {
            keepFirstQueued.set(false);
            Logger.printException(() -> "Settings entry: could not check the shortcut after Telegram's own", t);
        }
    }

    /** Injected at the start of every Telegram activity's {@code onCreate}. */
    public static void onActivityCreate(Activity activity) {
        try {
            noteIntent(activity.getIntent());
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onActivityCreate failure", ex);
        }
    }

    /** Injected at the start of every Telegram activity's {@code onNewIntent}. */
    public static void onNewIntent(Activity activity, Intent intent) {
        try {
            noteIntent(intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onNewIntent failure", ex);
        }
    }

    static final class OpenWhenResumed implements Application.ActivityLifecycleCallbacks {
        /** The Telegram screen in front right now, if any. */
        private WeakReference<Activity> resumed;

        @Override
        public void onActivityResumed(Activity activity) {
            resumed = new WeakReference<>(activity);
            if (openPending) openWhenSettled(activity);
            relabelIfStale(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (resumed != null && resumed.get() == activity) resumed = null;
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) { }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override
        public void onActivityDestroyed(Activity activity) {
            // The screen can land on an activity just before it clears itself for the next one.
            // If its host goes away before the person closed it, ask again.
            WeakReference<Activity> shownOver = host;
            if (shownOver == null || shownOver.get() != activity) return;
            host = null;
            if (closedByUser) return;
            if (SystemClock.elapsedRealtime() - requestedAt > REQUEST_LIFETIME_MS) return;
            openPending = true;
            Logger.printInfo(() -> "Settings host " + activity.getClass().getSimpleName()
                    + " went away; opening again over the next screen");
            // Android resumes the next screen before it destroys the one it replaced, so that
            // screen is usually in front already and won't resume again to pick the request up.
            // Signed out, the launcher activity hands over to Telegram's login screen this way.
            Activity current = resumed == null ? null : resumed.get();
            if (current != null && current != activity) openWhenSettled(current);
        }

        /**
         * Posted, so the activity has finished resuming before a fragment is committed. The
         * request stays pending until a screen is actually shown: signed out, the launcher
         * activity resumes for a moment while it clears itself for the login screen, and a
         * request spent on it would be lost.
         */
        private static void openWhenSettled(Activity activity) {
            Utils.runOnMainThread(() -> {
                if (!openPending) return;
                if (SystemClock.elapsedRealtime() - requestedAt > REQUEST_LIFETIME_MS) {
                    openPending = false;
                    Logger.printInfo(() -> "Settings request expired before a Telegram screen could show it");
                    return;
                }
                if (open(activity)) openPending = false;
            });
        }
    }

    /**
     * Shows the screen over the given activity.
     *
     * @return whether the screen is showing (or already was) over this activity.
     */
    @SuppressWarnings("deprecation") // Framework fragments are what the shared preference code builds on.
    public static boolean open(Activity activity) {
        final String name = activity.getClass().getSimpleName();
        try {
            if (activity.isFinishing() || activity.isDestroyed()) {
                Logger.printInfo(() -> "Settings wait: " + name + " is finishing");
                return false;
            }
            FragmentManager fragments = activity.getFragmentManager();
            if (fragments.findFragmentByTag(DIALOG_TAG) != null) return true;
            if (fragments.isStateSaved()) {
                Logger.printInfo(() -> "Settings wait: " + name + " has saved its state");
                return false;
            }
            closedByUser = false;
            new SettingsDialog().show(fragments, DIALOG_TAG);
            host = new WeakReference<>(activity);
            Logger.printInfo(() -> "Settings opened over " + name);
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "Could not open the HushTelegram settings over " + name, ex);
            return false;
        }
    }

    /** Called by the screen when the person closes it, so it isn't reopened. */
    static void onClosedByUser() {
        closedByUser = true;
        host = null;
    }

    /**
     * Asks for the screen when [intent] came from the launcher shortcut or from App info. Each is
     * spent as it's read: the extra is taken off, and App info's action becomes the launcher's, so
     * an activity recreated with the same intent, after a rotation say, doesn't ask again, and
     * Telegram goes on as if it had been started from its icon.
     */
    private static void noteIntent(Intent intent) {
        if (intent == null) return;
        if (intent.getBooleanExtra(EXTRA_OPEN_SETTINGS, false)) {
            intent.removeExtra(EXTRA_OPEN_SETTINGS);
            request("the launcher shortcut");
        } else if (Intent.ACTION_APPLICATION_PREFERENCES.equals(intent.getAction())) {
            intent.setAction(Intent.ACTION_MAIN);
            request("Android's App info page");
        }
    }

    private static void request(String from) {
        requestedAt = SystemClock.elapsedRealtime();
        openPending = true;
        Logger.printInfo(() -> "Settings requested by " + from);
    }

    /**
     * A disc in the screen's accent blue with a white "H" on black, drawn so the shortcut needs no
     * resource in Telegram's APK.
     */
    private static Bitmap shortcutIcon() {
        final int size = 432; // Adaptive icon canvas: 108dp at xxxhdpi.
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawColor(Color.BLACK);
        Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
        disc.setColor(0xFF236BE7);
        canvas.drawCircle(size / 2f, size / 2f, size * 0.30f, disc);
        Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        text.setColor(Color.WHITE);
        text.setTextAlign(Paint.Align.CENTER);
        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setTextSize(size * 0.24f);
        Paint.FontMetrics metrics = text.getFontMetrics();
        canvas.drawText("H", size / 2f, size / 2f - (metrics.ascent + metrics.descent) / 2f, text);
        return bitmap;
    }
}
