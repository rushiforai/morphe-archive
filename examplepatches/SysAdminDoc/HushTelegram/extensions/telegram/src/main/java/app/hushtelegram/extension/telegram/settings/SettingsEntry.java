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
 * TitlePress is Hushfacebook's LogoPress at 108c05a2, modified for Telegram's chat list top bar.
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

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
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.preference.ReopenSettingsAfterRestart;
import app.hushtelegram.extension.telegram.misc.BlackTheme;
import app.hushtelegram.extension.telegram.misc.UnifiedPush;

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
 * shortcut menu at all. Inside Telegram, a long press on the "Telegram" title at the top of the chat
 * list opens it too.
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
    /**
     * The page the next open lands on, or null for the first page. Set by a restart from the
     * restart row, kept while the screen is opened again over a later activity, and dropped
     * once the person closes it or asks for it another way.
     */
    private static volatile String requestedPage;
    private static volatile boolean callbacksRegistered;
    /** The activity the screen was last shown over, while the person hasn't closed it. */
    private static WeakReference<Activity> host;
    /** Fragment transactions are queued, so a second tap can arrive before the tag exists. */
    private static WeakReference<Activity> openingHost;
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
     * release check, when it's on, asks at most once a day, on a worker, and where a UnifiedPush
     * sign-up is renewed. A start that the settings screen's restart row asked for opens the
     * screen again, on the page it was on.
     */
    public static void onApplicationCreate(Context context) {
        try {
            if (!Utils.isMainProcess()) return;
            if (context instanceof Application && !callbacksRegistered) {
                ((Application) context).registerActivityLifecycleCallbacks(new OpenWhenResumed());
                callbacksRegistered = true;
            }
            ReopenSettingsAfterRestart.reopenIfPending(SettingsEntry::reopenOn);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not watch activities", ex);
        }
        ReleaseCheck.onTelegramStart();
        UnifiedPush.onTelegramStart(context);
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
            if (!SettingsRoutes.shortcut()) {
                withdrawShortcut(manager);
                return;
            }
            String longLabel = L10n.t(app, "HushTelegram settings");
            // Set before the attempt, so a shortcut that can't be pushed isn't tried on every screen.
            publishedLabel = longLabel;
            ShortcutInfo existing = ours(manager);
            // One labelled in another language, or behind Telegram's own, is pushed again below.
            if (existing != null && existing.getRank() == 0
                    && longLabel.contentEquals(existing.getLongLabel())) return;
            for (ShortcutInfo pinned : manager.getPinnedShortcuts()) {
                if (SHORTCUT_ID.equals(pinned.getId()) && !pinned.isEnabled()) {
                    manager.enableShortcuts(Collections.singletonList(SHORTCUT_ID));
                    break;
                }
            }
            push(manager, shortcut(app, longLabel), existing != null);
            Logger.printInfo(() -> "Settings entry: launcher shortcut published");
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: could not publish the shortcut", ex);
        }
    }

    /**
     * Takes the shortcut away while its way is switched off: off the dynamic list, and disabled
     * where someone pinned a copy to a home screen, so it opens nothing. Switched on again, the next
     * publish enables the pinned copy too. Nothing happens when it isn't there.
     */
    private static void withdrawShortcut(ShortcutManager manager) {
        publishedLabel = null;
        if (ours(manager) != null) {
            manager.removeDynamicShortcuts(Collections.singletonList(SHORTCUT_ID));
            Logger.printInfo(() -> "Settings entry: launcher shortcut withdrawn");
        }
        for (ShortcutInfo pinned : manager.getPinnedShortcuts()) {
            if (SHORTCUT_ID.equals(pinned.getId()) && pinned.isEnabled()) {
                manager.disableShortcuts(Collections.singletonList(SHORTCUT_ID));
                break;
            }
        }
    }

    /**
     * Publishes or withdraws the shortcut to match its switch, on a background thread. The settings
     * screen calls it as the switch changes, so the launcher follows at once.
     */
    public static void syncShortcut(Context context) {
        if (context == null) return;
        publishShortcut(context);
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
            if (!SettingsRoutes.shortcut()) {
                withdrawShortcut(manager);
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
        BlackTheme.launchScreen(activity);
    }

    /** Injected at the start of every Telegram activity's {@code onNewIntent}. */
    public static void onNewIntent(Activity activity, Intent intent) {
        try {
            if (!noteIntent(intent) && asksForSomethingToShow(intent)) giveWay(activity, intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Settings entry: onNewIntent failure", ex);
        }
    }

    /**
     * Whether [intent] asks Telegram to show something: a link, a share, a notification's chat. A
     * tap on Telegram's icon asks for nothing, so it comes back to the screen as it was left.
     */
    private static boolean asksForSomethingToShow(Intent intent) {
        if (intent == null) return false;
        if (intent.getData() != null) return true;
        String action = intent.getAction();
        return action != null && !Intent.ACTION_MAIN.equals(action);
    }

    /**
     * Telegram opens what [intent] asked for under the screen, so the screen closes first, the way
     * the person would close it, and an open still waiting is dropped. Left up, it hid the chat a
     * link from another app had just opened.
     */
    @SuppressWarnings("deprecation") // Framework fragments, as in open().
    private static void giveWay(Activity activity, Intent intent) {
        openPending = false;
        if (activity == null) return;
        Object shown = activity.getFragmentManager().findFragmentByTag(DIALOG_TAG);
        if (!(shown instanceof SettingsDialog)) return;
        onClosedByUser();
        ((SettingsDialog) shown).dismissAllowingStateLoss();
        Logger.printInfo(() -> "Settings closed for " + intent.getAction() + " over "
                + activity.getClass().getSimpleName());
    }

    /**
     * Injected in the chat list's {@code createView}, right after Telegram makes its logo the title
     * of the chat list's top bar. Telegram's chat list has no logo button, so that "Telegram" title
     * stands in for one: a press held on it opens this screen.
     *
     * <p>The bar gets the listener, not the title. The title takes no touches of its own (only the
     * emoji status beside a name, which it keeps), so a press on it lands on the bar, and the bar's
     * buttons take their own presses before the bar sees them. Telegram gives the bar a tap, which
     * scrolls the list back to the top, and no touch listener. It builds the chat list's view again
     * after a theme change, and the new listener takes the old one's place.
     *
     * <p>No switch reads this, so Pause leaves it working: it's the way back to the switch that
     * resumes HushTelegram. Anything that goes wrong leaves the bar as Telegram made it.
     */
    public static void watchChatListTitle(View bar) {
        if (bar == null) return;
        try {
            bar.setOnTouchListener(new TitlePress());
            Logger.printInfo(() -> "Settings entry: a long press on the chat list title opens the settings");
        } catch (Throwable failure) {
            Logger.printException(() -> "Settings entry: could not watch the chat list title", failure);
        }
    }

    /**
     * Times a press on the chat list's top bar, the way Hushfacebook times a press on the Facebook
     * logo. Every touch still reaches the bar as it did, so a tap is Telegram's. A press held for
     * the phone's long-press time opens this screen, with the same vibration a long press gives,
     * and the rest of that touch is kept from the bar, so letting go isn't also a tap.
     *
     * <p>The bar has to have taken the press itself, so it's still pressed when the time is up. A
     * press the bar turned down never brings this the lift of the finger, and isn't timed out.
     */
    static final class TitlePress implements View.OnTouchListener {
        private final Runnable fire = this::fire;
        /** The bar while a press on it is being timed. */
        private View pressed;
        private float downX;
        private float downY;
        /** This touch opened the screen, so the rest of it isn't the bar's. */
        private boolean opened;

        @Override
        public boolean onTouch(View bar, MotionEvent event) {
            try {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        stop();
                        opened = false;
                        // Switched off, the title is Telegram's alone.
                        if (!SettingsRoutes.titlePress()) return false;
                        // A long press Telegram gave the bar itself stays Telegram's.
                        if (bar.isLongClickable()) return false;
                        pressed = bar;
                        downX = event.getX();
                        downY = event.getY();
                        bar.postDelayed(fire, ViewConfiguration.getLongPressTimeout());
                        return false;
                    case MotionEvent.ACTION_MOVE:
                        // The same leeway the bar gives its own press before it lets go.
                        if (pressed != null && !within(bar, event)) stop();
                        return opened;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        stop();
                        boolean ours = opened;
                        opened = false;
                        return ours;
                    default:
                        return opened;
                }
            } catch (Throwable failure) {
                Logger.printException(() -> "Settings entry: could not follow a press on the chat list title", failure);
                return false;
            }
        }

        private static boolean within(View bar, MotionEvent event) {
            float slop = ViewConfiguration.get(bar.getContext()).getScaledTouchSlop();
            float x = event.getX();
            float y = event.getY();
            return x >= -slop && y >= -slop && x < bar.getWidth() + slop && y < bar.getHeight() + slop;
        }

        private void stop() {
            View bar = pressed;
            pressed = null;
            if (bar != null) bar.removeCallbacks(fire);
        }

        private void fire() {
            View bar = pressed;
            pressed = null;
            if (bar == null || !bar.isAttachedToWindow()) return;
            // The bar turned the press down or already let go of it, so the finger's lift never
            // comes here and the press can't be followed.
            if (!bar.isPressed()) return;
            try {
                // Not asked for, and letting go is Telegram's tap, as it is on a Telegram without this.
                if (!requestFromTitle(bar)) return;
                opened = true;
                bar.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                // The bar lets go of its press here, so letting go of the screen isn't a tap on it.
                long now = SystemClock.uptimeMillis();
                MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, downX, downY, 0);
                bar.onTouchEvent(cancel);
                cancel.recycle();
            } catch (Throwable failure) {
                Logger.printException(() -> "Settings entry: the long press on the chat list title failed", failure);
            }
        }
    }

    /**
     * Asks for the screen over the chat list's activity, the way the launcher shortcut does, so it
     * waits for the activity to settle and follows it to the next screen if it goes away.
     *
     * @return whether the request was made.
     */
    static boolean requestFromTitle(View bar) {
        if (!SettingsRoutes.titlePress()) return false;
        Activity activity = activityOf(bar.getContext());
        if (activity == null) {
            Logger.printInfo(() -> "Settings entry: the chat list title isn't in an activity, so its long press is Telegram's");
            return false;
        }
        request("a long press on the chat list title");
        OpenWhenResumed.openWhenSettled(activity);
        return true;
    }

    private static Activity activityOf(Context context) {
        for (int depth = 0; context != null && depth < 10; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
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
        /** A switch or dark mode changed while Telegram was open reaches the next launch screen. */
        @Override public void onActivityStopped(Activity activity) { BlackTheme.launchScreen(activity); }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override
        public void onActivityDestroyed(Activity activity) {
            if (openingHost != null && openingHost.get() == activity) openingHost = null;
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
        static void openWhenSettled(Activity activity) {
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
        if (activity == null) return false;
        final String name = activity.getClass().getSimpleName();
        try {
            if (activity.isFinishing() || activity.isDestroyed()) {
                Logger.printInfo(() -> "Settings wait: " + name + " is finishing");
                return false;
            }
            FragmentManager fragments = activity.getFragmentManager();
            if (fragments.findFragmentByTag(DIALOG_TAG) != null) {
                onDialogShown(activity);
                return true;
            }
            if (openingHost != null && openingHost.get() == activity) return true;
            if (fragments.isStateSaved()) {
                Logger.printInfo(() -> "Settings wait: " + name + " has saved its state");
                return false;
            }
            closedByUser = false;
            openingHost = new WeakReference<>(activity);
            SettingsDialog.onPage(requestedPage).show(fragments, DIALOG_TAG);
            host = new WeakReference<>(activity);
            Logger.printInfo(() -> "Settings opened over " + name);
            return true;
        } catch (Exception ex) {
            if (openingHost != null && openingHost.get() == activity) openingHost = null;
            Logger.printException(() -> "Could not open the HushTelegram settings over " + name, ex);
            return false;
        }
    }

    /** Called only by the dedicated native self-settings row's patched click handler. */
    public static void openFromNative(Activity activity) {
        if (activity == null) return;
        request("Telegram's settings row");
        if (open(activity)) openPending = false;
    }

    /**
     * Whether the HushTelegram row is added to Telegram's Settings page. Called by the patched row
     * builder each time the page is built, so a change applies the next time the page opens.
     */
    public static boolean nativeRowShown() {
        try {
            return SettingsRoutes.settingsRow();
        } catch (Throwable failure) {
            return true;
        }
    }

    /** Uses the same five translations and language selection as the launcher shortcut. */
    public static String nativeSettingsTitle() {
        return L10n.t("HushTelegram settings");
    }

    static void onDialogShown(Activity activity) {
        if (openingHost != null && openingHost.get() == activity) openingHost = null;
        if (activity != null) host = new WeakReference<>(activity);
    }

    /** Called by the screen when the person closes it, so it isn't reopened. */
    static void onClosedByUser() {
        closedByUser = true;
        host = null;
        openingHost = null;
        requestedPage = null;
    }

    /**
     * Asks for the screen when [intent] came from the launcher shortcut or from App info. Each is
     * spent as it's read: the extra is taken off, and App info's action becomes the launcher's, so
     * an activity recreated with the same intent, after a rotation say, doesn't ask again, and
     * Telegram goes on as if it had been started from its icon.
     *
     * @return whether [intent] asked for the screen.
     */
    private static boolean noteIntent(Intent intent) {
        if (intent == null) return false;
        if (intent.getBooleanExtra(EXTRA_OPEN_SETTINGS, false)) {
            intent.removeExtra(EXTRA_OPEN_SETTINGS);
            // A copy pinned before the way was switched off opens Telegram and nothing more.
            if (!SettingsRoutes.shortcut()) return false;
            request("the launcher shortcut");
            return true;
        }
        if (Intent.ACTION_APPLICATION_PREFERENCES.equals(intent.getAction())) {
            intent.setAction(Intent.ACTION_MAIN);
            request("Android's App info page");
            return true;
        }
        return false;
    }

    private static void request(String from) {
        requestedAt = SystemClock.elapsedRealtime();
        requestedPage = null;
        openPending = true;
        Logger.printInfo(() -> "Settings requested by " + from);
    }

    /**
     * The screen again after the restart row restarted Telegram, on [page], over the first
     * Telegram screen to resume: the same open the launcher shortcut and Telegram's settings row
     * lead to.
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
