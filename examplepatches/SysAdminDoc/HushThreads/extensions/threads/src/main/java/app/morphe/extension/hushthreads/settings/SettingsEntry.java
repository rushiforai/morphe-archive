/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

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

import app.morphe.extension.hushthreads.download.SaveLeftovers;
import app.morphe.extension.hushthreads.feed.ReturnRefresh;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart;

/**
 * How the HushThreads screen is reached.
 *
 * <p>From the home screen, a long-press shortcut on Threads' launcher icon opens Threads' launcher
 * activity with {@link #EXTRA_OPEN_SETTINGS}. From Android's App info page for Threads, "Additional
 * settings in the app" opens it too: the patch adds an activity alias for
 * {@link Intent#ACTION_APPLICATION_PREFERENCES} that points at the same launcher activity. Every
 * Threads activity reports its intent here from {@code onCreate} and {@code onNewIntent}, and the
 * next Threads activity to resume shows the screen as a full screen dialog. The shortcut is kept
 * first among Threads' own, because a launcher shows only the first few, and some launchers have no
 * shortcut menu at all. Inside Threads, a HushThreads row above More settings in Threads' own
 * settings opens it over the screen in front ({@link ThreadsSettingsRow}), and so does a long press
 * on the Threads logo at the top of the home feed ({@link ThreadsLogo}). Each of those three has a
 * switch on the Pause, backup and diagnostics page, and one of them always stays on ({@link #wayOn}).
 * App info's way in has none: it's Android's, and it's the one left if a launcher has no menu.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    public static final String EXTRA_OPEN_SETTINGS = "app.morphe.extension.hushthreads.OPEN_SETTINGS";
    static final String SHORTCUT_ID = "hushthreads_settings";

    /**
     * Threads' exported launcher activity. The patch's App info alias points at it too, so both
     * ways in arrive at the activity Threads itself starts from the icon.
     */
    static final String LAUNCHER_ACTIVITY = "com.instagram.barcelona.mainactivity.BarcelonaActivity";
    private static final String DIALOG_TAG = "hushthreads_settings";

    /** A request older than this is dropped rather than opened over some later screen. */
    private static final long REQUEST_LIFETIME_MS = 30_000;

    /**
     * Where the screen goes in a Threads activity's own saved state. Threads takes Android's
     * fragment state out of every activity it recreates (IgFragmentActivity's internalOnCreate
     * removes "android:fragments"), so a font size or theme change, or Android ending Threads in
     * the background, closed the screen for good. It saves itself here instead.
     */
    static final String RECREATED_SCREEN = "hushthreads_settings_screen";
    /** The screen as a recreated activity saved it, for the next open to put back. */
    @SuppressWarnings("deprecation")
    private static volatile android.app.Fragment.SavedState recreatedScreen;
    /**
     * The recreated activity that screen belongs to. It gets it whenever it resumes, past the
     * request's lifetime: Android 9 resumes only the focused side of a split screen, so a Threads
     * recreated in the other side can wait any time for a tap.
     */
    private static WeakReference<Activity> recreatedHost;

    private static volatile boolean openPending;
    private static volatile long requestedAt;
    private static volatile boolean callbacksRegistered;
    /** The activity the screen was last shown over, while the person hasn't closed it. */
    private static WeakReference<Activity> host;
    private static volatile boolean closedByUser;
    /**
     * The page the next open lands on, or null for the first page. Set by a restart from the
     * restart row, kept while the screen is opened again over a later activity, and dropped once
     * the person closes it or asks for it another way.
     */
    private static volatile String requestedPage;
    /** The long label last pushed, or found already on the shortcut, in this process. */
    private static volatile String publishedLabel;
    /** A check of the shortcut's place is waiting for the background thread. */
    private static final AtomicBoolean keepFirstQueued = new AtomicBoolean();

    private SettingsEntry() {
    }

    /**
     * Injected before each return of the application's {@code onCreate}, after Threads' own
     * startup. Watches every Threads activity, so a pending open lands on whichever one resumes
     * next: signed out, the launcher hands straight over to the login screen. Also where the
     * release check, when it's on, asks at most once a day, on a worker, and where a restart from
     * the restart row asks for the screen again, on the page it was tapped on.
     */
    public static void onApplicationCreate(Context context) {
        try {
            if (!Utils.isMainProcess()) return;
            if (context instanceof Application && !callbacksRegistered) {
                ((Application) context).registerActivityLifecycleCallbacks(new OpenWhenResumed());
                callbacksRegistered = true;
            }
            // The marker is in the settings store, which can't be read before the settings are ready.
            if (Utils.settingsReady()) ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn);
            // This build's receipt of its families and defaults, for the next build to compare.
            if (Utils.settingsReady()) SettingsUpgrade.onThreadsStarted();
            // A crash kept later in the first minute lists the switches, as the export does, without
            // the settings screen having opened first. Registering twice keeps one.
            if (Utils.settingsReady()) PatchFamily.registerDiagnostics();
            // SettingsStatus rather than PatchFamily: a plain answer, with no settings read this early.
            if (SettingsStatus.returnRefresh()) ReturnRefresh.register(context);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not watch activities", ex);
        }
        // A save Android stopped halfway left a pending gallery row, a work file or a notification.
        // Whatever the switch says now: it may have been on when the save started.
        if (SettingsStatus.saveMedia()) SaveLeftovers.sweepAfterStart(context);
        // A process that ended between a settings file's pick and its read kept access to that file.
        SettingsFileGrants.sweepAfterStart(context);
        ReleaseCheck.onThreadsStart();
        publishShortcut(context);
    }

    private static void publishShortcut(Context context) {
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Utils.runOnBackgroundThread(() -> publishShortcutNow(app));
    }

    /**
     * Labels the shortcut again once Threads has set its own language. That happens after the
     * application starts, so a label published then is in the phone's language, and it stayed
     * that way next to a screen in Threads'. A string compare while the label still matches.
     */
    static void relabelIfStale(Context context) {
        try {
            if (!L10n.t(context, "HushThreads settings").equals(publishedLabel)) publishShortcut(context);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not check the shortcut's label", ex);
        }
    }

    /**
     * Publishes the launcher shortcut, labels it again when Threads' language has changed, or puts
     * it back in front when Threads' own went ahead of it, on the thread it's called on.
     * Package-visible for tests.
     */
    static void publishShortcutNow(Context app) {
        try {
            // Nothing to go by until the settings are read: the shortcut stays as the last start left it.
            if (!Utils.settingsReady()) return;
            ShortcutManager manager = app.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            String longLabel = L10n.t(app, "HushThreads settings");
            // Set before the attempt, so a shortcut that can't be pushed isn't tried on every screen.
            publishedLabel = longLabel;
            if (!shortcutOn()) {
                removeShortcut(manager);
                return;
            }
            ShortcutInfo existing = ours(manager);
            // One labelled in another language, or behind Threads' own, is pushed again below.
            if (existing != null && existing.getRank() == 0
                    && longLabel.contentEquals(existing.getLongLabel())) return;
            push(manager, shortcut(app, longLabel), existing != null);
            Logger.printInfo(() -> "Settings entry: launcher shortcut published");
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not publish the shortcut", ex);
        }
    }

    /**
     * Puts the shortcut back in front of Threads' own, keeping the label it has, or publishes it
     * when Threads' call removed it. The label is kept because the process Threads pushes from may
     * not have Threads' language yet, and the next screen relabels it anyway. Package-visible for
     * tests.
     */
    static void keepFirstNow(Context app) {
        try {
            if (!Utils.settingsReady()) return;
            ShortcutManager manager = app.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            // Switched off, Threads' calls neither bring it back nor rank it.
            if (!shortcutOn()) {
                removeShortcut(manager);
                return;
            }
            ShortcutInfo existing = ours(manager);
            if (existing == null) {
                publishShortcutNow(app);
                return;
            }
            final int rank = existing.getRank();
            if (rank == 0) return;
            CharSequence label = existing.getLongLabel();
            push(manager, shortcut(app, label != null ? label : L10n.t(app, "HushThreads settings")), true);
            Logger.printInfo(() -> "Settings entry: launcher shortcut moved back in front from rank " + rank);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not put the shortcut back in front", ex);
        }
    }

    /**
     * Publishes [shortcut] at the front. From Android 11 a push evicts the lowest-ranked dynamic
     * shortcut when Threads' own fill the limit. Android 9 and 10 have no push, so an add does the
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

    /**
     * The settings shortcut switch changed: off takes the shortcut out of the launcher's menu now,
     * on puts it back in front, both on a background thread. Threads' own shortcuts stay.
     */
    static void shortcutSwitchChanged(Context context) {
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Utils.runOnBackgroundThread(() -> publishShortcutNow(app));
    }

    /** Takes the HushThreads shortcut out of the launcher's menu, if it's there. */
    private static void removeShortcut(ShortcutManager manager) {
        if (ours(manager) == null) return;
        manager.removeDynamicShortcuts(Collections.singletonList(SHORTCUT_ID));
        Logger.printInfo(() -> "Settings entry: launcher shortcut removed, its switch is off");
    }

    /** The HushThreads shortcut among the dynamic ones, or null. */
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
                .setShortLabel("HushThreads")
                .setLongLabel(longLabel)
                .setIcon(Icon.createWithAdaptiveBitmap(shortcutIcon()))
                .setIntent(intent)
                // The platform puts the newest push first among equal ranks.
                .setRank(0)
                .build();
    }

    // Threads' own calls that change its dynamic shortcuts come here instead: the patch sends each
    // ShortcutManager call of these names to the method of the same name here, the manager first.
    // Threads pushes its own shortcuts at rank 0, and the platform puts the newest push first, so
    // the HushThreads shortcut sank to the end of the list, where a launcher showing three or four
    // cut it off. Threads' call runs as it did, with the same answer and the same exceptions, and
    // then the HushThreads shortcut goes back in front.

    /**
     * ShortcutManager's push exists from Android 11 only, so Threads' own call, which this stands
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

    /** Replaces every dynamic shortcut, the HushThreads one too, which is published again after. */
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
     * Checks the shortcut on a background thread, once however many of Threads' calls ask. The
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
            Logger.printException(() -> "Settings entry: could not check the shortcut after Threads' own", t);
        }
    }

    /** Injected at the start of every Threads activity's {@code onCreate}. */
    public static void onActivityCreate(Activity activity) {
        try {
            noteIntent(activity.getIntent());
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onActivityCreate failure", ex);
        }
    }

    /** Injected at the start of every Threads activity's {@code onNewIntent}. */
    public static void onNewIntent(Activity activity, Intent intent) {
        try {
            noteIntent(intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onNewIntent failure", ex);
        }
    }

    static final class OpenWhenResumed implements Application.ActivityLifecycleCallbacks {
        /** The Threads screen in front right now, if any. */
        private static volatile WeakReference<Activity> resumed;

        @Override
        public void onActivityResumed(Activity activity) {
            // HushThreads' own see-through screen for the file picker, gone again at once: the
            // settings never open over it, and it isn't the Threads screen in front.
            if (activity instanceof SettingsFilePicker) return;
            resumed = new WeakReference<>(activity);
            if (SettingsStatus.saveMedia()) SaveLeftovers.showInterrupted(activity);
            if (openPending) openWhenSettled(activity);
            relabelIfStale(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (resumed != null && resumed.get() == activity) resumed = null;
        }

        @Override
        @SuppressWarnings("deprecation")
        public void onActivityCreated(Activity activity, Bundle state) {
            try {
                android.app.Fragment.SavedState screen = state == null ? null : state.getParcelable(RECREATED_SCREEN);
                if (screen != null) reopenRecreated(activity, screen);
            } catch (Exception ex) {
                Logger.printException(() -> "Settings entry: could not read the screen back from a recreated activity", ex);
            }
        }

        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }

        @Override
        @SuppressWarnings("deprecation")
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            try {
                // This activity's own copy, if it has one. A copy the person closed is gone by now,
                // since the activity runs pending fragment changes before this. The closed flag
                // is one for every copy, so closing a copy over another activity used to stop this
                // one being saved.
                FragmentManager fragments = activity.getFragmentManager();
                android.app.Fragment shown = fragments.findFragmentByTag(DIALOG_TAG);
                if (shown == null || shown.isRemoving()) return;
                android.app.Fragment.SavedState screen = fragments.saveFragmentInstanceState(shown);
                if (screen != null) state.putParcelable(RECREATED_SCREEN, screen);
            } catch (Exception ex) {
                Logger.printException(() -> "Settings entry: could not save the screen with its activity", ex);
            }
        }
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
            // Signed out, the launcher activity hands over to Threads' login screen this way.
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
                    Activity waiting = recreatedHost == null ? null : recreatedHost.get();
                    if (waiting != null && waiting != activity && !waiting.isFinishing() && !waiting.isDestroyed()) return;
                    if (waiting != activity) {
                        openPending = false;
                        Logger.printInfo(() -> "Settings request expired before a Threads screen could show it");
                        return;
                    }
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
            if (fragments.findFragmentByTag(DIALOG_TAG) != null) {
                // A host that keeps fragment state put the screen back itself.
                recreatedScreen = null;
                recreatedHost = null;
                return true;
            }
            if (fragments.isStateSaved()) {
                Logger.printInfo(() -> "Settings wait: " + name + " has saved its state");
                return false;
            }
            closedByUser = false;
            SettingsDialog dialog = SettingsDialog.onPage(requestedPage);
            android.app.Fragment.SavedState screen = recreatedScreen;
            recreatedScreen = null;
            recreatedHost = null;
            if (screen != null) dialog.setInitialSavedState(screen);
            dialog.show(fragments, DIALOG_TAG);
            host = new WeakReference<>(activity);
            Logger.printInfo(() -> "Settings opened over " + name);
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "Could not open the HushThreads settings over " + name, ex);
            return false;
        }
    }

    /** Called by the screen when the person closes it, so it isn't reopened. */
    static void onClosedByUser() {
        closedByUser = true;
        host = null;
        requestedPage = null;
        recreatedScreen = null;
        recreatedHost = null;
    }

    /**
     * Asks for the screen when [intent] came from the launcher shortcut or from App info. Each is
     * spent as it's read: the extra is taken off, and App info's action becomes the launcher's, so
     * an activity recreated with the same intent, after a rotation say, doesn't ask again, and
     * Threads goes on as if it had been started from its icon.
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

    /** Whether the launcher shortcut is offered: its switch, or every way in this build switched off. */
    static boolean shortcutOn() {
        return wayOn(BaseSettings.SETTINGS_SHORTCUT);
    }

    /** Whether the row in Threads' settings is drawn: its switch, or every way in this build switched off. */
    static boolean rowOn() {
        return wayOn(BaseSettings.SETTINGS_ROW);
    }

    /** Whether a long press on the Threads logo opens the screen: its switch, or every way in this build off. */
    static boolean logoPressOn() {
        return wayOn(BaseSettings.SETTINGS_LOGO_PRESS);
    }

    /**
     * One way in always stays: the screen won't turn the last one off, and a store that has every
     * way in this build off anyway (an older build's, or one edited by hand) gets them all back.
     * Before the settings are read, everything stays where it is.
     */
    private static boolean wayOn(BooleanSetting way) {
        if (!Utils.settingsReady()) return true;
        return way.get() || waysOn() == 0;
    }

    /**
     * The ways in this build carries that are switched on. The launcher shortcut is in every build;
     * the row and the logo's long press count only when the settings patch could put them in, and
     * the row only when Threads has an icon to draw it with.
     */
    static int waysOn() {
        int on = BaseSettings.SETTINGS_SHORTCUT.get() ? 1 : 0;
        if (ThreadsSettingsRow.shows() && BaseSettings.SETTINGS_ROW.get()) on++;
        if (ThreadsLogo.inBuild() && BaseSettings.SETTINGS_LOGO_PRESS.get()) on++;
        return on;
    }

    /** Whether [way] is the last way in that's on, which the screen keeps on. */
    static boolean isLastWayIn(BooleanSetting way) {
        return way.get() && waysOn() <= 1;
    }

    /** The HushThreads row in Threads' own settings was tapped, over the screen in front. */
    static void openFromThreadsSettings() {
        openOverFront("the row in Threads' settings");
    }

    /**
     * The Threads logo at the top of the home feed was long-pressed. Like the row, it opens the
     * screen while HushThreads is paused, since the screen is where it's resumed.
     */
    static void openFromLogo() {
        openOverFront("a long press on the Threads logo");
    }

    /** The Threads screen in front right now, or null when none is resumed. */
    public static Activity frontActivity() {
        WeakReference<Activity> front = OpenWhenResumed.resumed;
        return front == null ? null : front.get();
    }

    /** Asks for the screen and shows it over the Threads screen in front, once that has settled. */
    private static void openOverFront(String from) {
        request(from);
        WeakReference<Activity> front = OpenWhenResumed.resumed;
        Activity current = front == null ? null : front.get();
        if (current != null) OpenWhenResumed.openWhenSettled(current);
    }

    private static void request(String from) {
        requestedAt = SystemClock.elapsedRealtime();
        openPending = true;
        requestedPage = null;
        recreatedScreen = null;
        recreatedHost = null;
        Logger.printInfo(() -> "Settings requested by " + from);
    }

    /**
     * A Threads activity that had the screen open was recreated: asks for the screen again, put
     * back as it was saved (page, search and place in the list), over the first Threads screen to
     * resume, which is usually the recreated one. That one still gets it after the request's
     * lifetime, however long it waits to resume.
     */
    @SuppressWarnings("deprecation")
    static void reopenRecreated(Activity activity, android.app.Fragment.SavedState screen) {
        request("a Threads screen recreated with it open");
        recreatedScreen = screen;
        recreatedHost = new WeakReference<>(activity);
    }

    /**
     * Threads just restarted from the restart row: asks for the screen on [page], the one the row
     * was tapped on. The first Threads screen to resume shows it, like any other request.
     */
    static void reopenOn(String page) {
        request("a restart from the settings screen");
        requestedPage = page;
    }

    /** The page the next open lands on, or null for the first page. */
    static String requestedPage() {
        return requestedPage;
    }

    /**
     * A disc in the screen's accent blue with a white "H" on black, drawn so the shortcut needs no
     * resource in Threads' APK.
     */
    private static Bitmap shortcutIcon() {
        final int size = 432; // Adaptive icon canvas: 108dp at xxxhdpi.
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawColor(ScreenColors.DEFAULT.background);
        Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
        disc.setColor(ScreenColors.DEFAULT.accent);
        canvas.drawCircle(size / 2f, size / 2f, size * 0.30f, disc);
        Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        text.setColor(ScreenColors.DEFAULT.onAccent);
        text.setTextAlign(Paint.Align.CENTER);
        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setTextSize(size * 0.24f);
        Paint.FontMetrics metrics = text.getFontMetrics();
        canvas.drawText("H", size / 2f, size / 2f - (metrics.ascent + metrics.descent) / 2f, text);
        return bitmap;
    }
}
