/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
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
package app.hushtumblr.extension.tumblr.settings;

import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
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
import android.view.View;

import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.tumblr.ui.TextSize;
import app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart;

/**
 * How the HushTumblr screen is reached.
 *
 * <p>Inside Tumblr, a long press on the Tumblr logo at the top of the dashboard opens it over that
 * screen (see {@link #onDashboardLogo}), and so does the HushTumblr row in Tumblr's own Settings.
 *
 * <p>From the home screen, a long-press shortcut on Tumblr's launcher icon opens Tumblr's launcher
 * activity with {@link #EXTRA_OPEN_SETTINGS}. From Android's App info page for Tumblr, "Additional
 * settings in the app" opens it too: the patch adds an activity alias for
 * {@link Intent#ACTION_APPLICATION_PREFERENCES} that points at the same launcher activity. Every
 * Tumblr activity reports its intent here from {@code onCreate} and {@code onNewIntent}, and the
 * next Tumblr activity to resume shows the screen as a full screen dialog. The shortcut is kept
 * first among Tumblr's own, because a launcher shows only the first few, and some launchers have no
 * shortcut menu at all.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    public static final String EXTRA_OPEN_SETTINGS = "app.hushtumblr.extension.tumblr.OPEN_SETTINGS";
    static final String SHORTCUT_ID = "hushtumblr_settings";

    /**
     * How the shortcut starts Tumblr. A new task alone left a hole. A Tumblr task the shortcut
     * started keeps the shortcut's intent as its own, so the next tap matched it, Android only
     * brought that task forward, and no activity was created to ask for the screen. Clearing the
     * task starts the launcher activity afresh on every tap, however the task began, which is what
     * the platform's shortcut guide says a dynamic shortcut should do. Whatever Tumblr had open in
     * that task closes with it, a post being written included, so only Tumblr's own draft saving
     * keeps that.
     */
    static final int SHORTCUT_FLAGS = Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK;

    /**
     * Tumblr's exported launcher activity. The patch's App info alias points at it too, so both
     * ways in arrive at the activity Tumblr itself starts from the icon.
     */
    static final String LAUNCHER_ACTIVITY = "com.tumblr.ui.activity.JumpoffActivity";
    private static final String DIALOG_TAG = "hushtumblr_settings";

    /** A request older than this is dropped rather than opened over some later screen. */
    private static final long REQUEST_LIFETIME_MS = 30_000;

    private static final View.OnLongClickListener LOGO_PRESS = SettingsEntry::openFromLogo;
    /** Logos that already open the screen, so a top bar bound again doesn't read ours as Tumblr's. */
    private static final Set<View> watchedLogos = Collections.newSetFromMap(new WeakHashMap<>());

    private static volatile boolean openPending;
    private static volatile long requestedAt;
    /**
     * The page the next open lands on, or null for the first page. Set by a restart from the
     * restart row, kept while the screen is opened again over a later activity, and dropped
     * once the person closes it or asks for it another way.
     */
    private static volatile String requestedPage;
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
     * Injected before each return of the application's {@code onCreate}, after Tumblr's own
     * startup. It takes no register: Tumblr's compiler reuses the {@code this} register for other
     * values near the end of that method (a String in 46.5.0.109), so the application comes from
     * the context the start of the same method stored.
     */
    public static void onApplicationCreate() {
        Context context = Utils.getContext();
        if (context == null) return;
        Context application = context.getApplicationContext();
        onApplicationCreate(application != null ? application : context);
    }

    /**
     * Watches every Tumblr activity, so a pending open lands on whichever one resumes next:
     * signed out, the launcher hands straight over to the login screen. Also where the release
     * check, when it's on, asks at most once a day, on a worker. A start that the settings
     * screen's restart row asked for opens the screen again, on the page it was on.
     */
    static void onApplicationCreate(Context context) {
        try {
            if (!Utils.isMainProcess()) return;
            if (context instanceof Application && !callbacksRegistered) {
                ((Application) context).registerActivityLifecycleCallbacks(new OpenWhenResumed());
                callbacksRegistered = true;
            }
            TextSize.application(context);
            // Before the settings are ready, reading the marker would load them with no context.
            if (Utils.settingsReady()) ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not watch activities", ex);
        }
        ReleaseCheck.onTumblrStart();
        publishShortcut(context);
    }

    private static void publishShortcut(Context context) {
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Utils.runOnBackgroundThread(() -> publishShortcutNow(app));
    }

    /**
     * Labels the shortcut again once Tumblr has set its own language. That happens after the
     * application starts, so a label published then is in the phone's language, and it stayed
     * that way next to a screen in Tumblr's. A string compare while the label still matches.
     */
    static void relabelIfStale(Context context) {
        try {
            if (!L10n.t(context, "HushTumblr settings").equals(publishedLabel)) publishShortcut(context);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not check the shortcut's label", ex);
        }
    }

    /**
     * Publishes the launcher shortcut, labels it again when Tumblr's language has changed, or puts
     * it back in front when Tumblr's own went ahead of it, on the thread it's called on.
     * Package-visible for tests.
     */
    static void publishShortcutNow(Context app) {
        try {
            ShortcutManager manager = app.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            String longLabel = L10n.t(app, "HushTumblr settings");
            // Set before the attempt, so a shortcut that can't be pushed isn't tried on every screen.
            publishedLabel = longLabel;
            ShortcutInfo existing = ours(manager);
            // One labelled in another language, behind Tumblr's own, or published before the
            // shortcut cleared the task, is pushed again below.
            if (existing != null && existing.getRank() == 0 && startsAfresh(existing)
                    && longLabel.contentEquals(existing.getLongLabel())) return;
            push(manager, shortcut(app, longLabel), existing != null);
            Logger.printInfo(() -> "Settings entry: launcher shortcut published");
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not publish the shortcut", ex);
        }
    }

    /**
     * Puts the shortcut back in front of Tumblr's own, keeping the label it has, or publishes it
     * when Tumblr's call removed it. The label is kept because the process Tumblr pushes from may
     * not have Tumblr's language yet, and the next screen relabels it anyway. Package-visible for
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
            push(manager, shortcut(app, label != null ? label : L10n.t(app, "HushTumblr settings")), true);
            Logger.printInfo(() -> "Settings entry: launcher shortcut moved back in front from rank " + rank);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not put the shortcut back in front", ex);
        }
    }

    /**
     * Publishes [shortcut] at the front. From Android 11 a push evicts the lowest-ranked dynamic
     * shortcut when Tumblr's own fill the limit. Android 10 has no push, so an add does the same:
     * it updates the shortcut in place when [present], and otherwise makes room first by
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

    /** Whether [shortcut] carries {@link #SHORTCUT_FLAGS}, as one published by this build does. */
    private static boolean startsAfresh(ShortcutInfo shortcut) {
        Intent intent = shortcut.getIntent();
        return intent != null && (intent.getFlags() & SHORTCUT_FLAGS) == SHORTCUT_FLAGS;
    }

    /** The HushTumblr shortcut among the dynamic ones, or null. */
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
                .addFlags(SHORTCUT_FLAGS);
        return new ShortcutInfo.Builder(app, SHORTCUT_ID)
                .setShortLabel("HushTumblr")
                .setLongLabel(longLabel)
                .setIcon(Icon.createWithAdaptiveBitmap(shortcutIcon()))
                .setIntent(intent)
                // The platform puts the newest push first among equal ranks.
                .setRank(0)
                .build();
    }

    // Tumblr's own calls that change its dynamic shortcuts come here instead: the patch sends each
    // ShortcutManager call of these names to the method of the same name here, the manager first.
    // Tumblr pushes its own shortcuts at rank 0, and the platform puts the newest push first, so
    // the HushTumblr shortcut sank to the end of the list, where a launcher showing three or four
    // cut it off. Tumblr's call runs as it did, with the same answer and the same exceptions, and
    // then the HushTumblr shortcut goes back in front.

    /**
     * ShortcutManager's push exists from Android 11 only, so Tumblr's own call, which this stands
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

    /** Replaces every dynamic shortcut, the HushTumblr one too, which is published again after. */
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
     * Checks the shortcut on a background thread, once however many of Tumblr's calls ask. The
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
            Logger.printException(() -> "Settings entry: could not check the shortcut after Tumblr's own", t);
        }
    }

    /** Injected at the start of every Tumblr activity's {@code onCreate}. */
    public static void onActivityCreate(Activity activity) {
        try {
            noteIntent(activity.getIntent());
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onActivityCreate failure", ex);
        }
    }

    /** Injected at the start of every Tumblr activity's {@code onNewIntent}. */
    public static void onNewIntent(Activity activity, Intent intent) {
        try {
            noteIntent(intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onNewIntent failure", ex);
        }
    }

    /**
     * Injected right after Tumblr gives the dashboard's "t" logo its tap, with the logo. A long press
     * on it then opens the screen while a tap stays Tumblr's. Tumblr gives the logo no long press of
     * its own; in a build where it does, the logo stays Tumblr's. It works while HushTumblr is
     * paused, since it's a way back in.
     */
    public static void onDashboardLogo(View logo) {
        try {
            if (logo != null) watchLogo(logo);
        } catch (Throwable t) {
            Logger.printException(() -> "Settings entry: could not watch the Tumblr logo", t);
        }
    }

    static void watchLogo(View logo) {
        synchronized (watchedLogos) {
            if (watchedLogos.contains(logo)) return;
            if (logo.isLongClickable()) {
                Logger.printInfo(() -> "Settings entry: Tumblr handles long presses on its logo here, so they stay Tumblr's");
                return;
            }
            logo.setOnLongClickListener(LOGO_PRESS);
            watchedLogos.add(logo);
        }
        Logger.printInfo(() -> "Settings entry: a long press on the Tumblr logo opens the settings");
    }

    /**
     * The logo's long press: the screen over the logo's own activity, on its first page even when a
     * restart left another page waiting. Once it shows, a request still waiting is spent, so it
     * can't open the screen again over the next screen to resume. False leaves the press as it was.
     */
    static boolean openFromLogo(View logo) {
        try {
            Activity activity = activityOf(logo.getContext());
            if (activity == null) {
                Logger.printInfo(() -> "Settings entry: the Tumblr logo isn't in an activity");
                return false;
            }
            requestedAt = SystemClock.elapsedRealtime();
            requestedPage = null;
            Logger.printInfo(() -> "Settings requested by a long press on the Tumblr logo");
            boolean shown = open(activity);
            if (shown) openPending = false;
            return shown;
        } catch (Throwable t) {
            Logger.printException(() -> "Settings entry: the long press on the Tumblr logo failed", t);
            return false;
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }

    static final class OpenWhenResumed implements Application.ActivityLifecycleCallbacks {
        /** The Tumblr screen in front right now, if any. */
        private WeakReference<Activity> resumed;

        @Override
        public void onActivityResumed(Activity activity) {
            resumed = new WeakReference<>(activity);
            Utils.setActivity(activity);
            TextSize.activity(activity);
            if (openPending) openWhenSettled(activity);
            relabelIfStale(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (resumed != null && resumed.get() == activity) resumed = null;
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {
            TextSize.activity(activity);
        }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override
        public void onActivityDestroyed(Activity activity) {
            if (Utils.getActivity() == activity) Utils.setActivity(null);
            TextSize.destroyed(activity);
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
            // Signed out, the launcher activity hands over to Tumblr's login screen this way.
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
                    Logger.printInfo(() -> "Settings request expired before a Tumblr screen could show it");
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
            SettingsDialog.onPage(requestedPage).show(fragments, DIALOG_TAG);
            host = new WeakReference<>(activity);
            Logger.printInfo(() -> "Settings opened over " + name);
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "Could not open the HushTumblr settings over " + name, ex);
            return false;
        }
    }

    /** Called by the screen when the person closes it, so it isn't reopened. */
    static void onClosedByUser() {
        closedByUser = true;
        host = null;
        requestedPage = null;
    }

    /**
     * Asks for the screen when [intent] came from the launcher shortcut or from App info. Each is
     * spent as it's read: the extra is taken off, and App info's action becomes the launcher's, so
     * an activity recreated with the same intent, after a rotation say, doesn't ask again, and
     * Tumblr goes on as if it had been started from its icon.
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
        requestedPage = null;
        openPending = true;
        Logger.printInfo(() -> "Settings requested by " + from);
    }

    /**
     * The screen again after the restart row restarted Tumblr, on [page], over the first Tumblr
     * screen to resume: the same open the launcher shortcut and App info lead to.
     */
    static void reopenOn(String page) {
        request("a restart from the settings screen");
        requestedPage = page;
    }

    /** The page the next open lands on. Package-visible for tests. */
    static String requestedPage() {
        return requestedPage;
    }

    /**
     * A disc in the screen's accent blue with a white "H" on black, drawn so the shortcut needs no
     * resource in Tumblr's APK.
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
