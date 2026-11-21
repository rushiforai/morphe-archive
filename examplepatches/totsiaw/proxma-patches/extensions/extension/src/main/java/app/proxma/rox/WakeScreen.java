package app.proxma.rox;

import android.app.Activity;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.PixelFormat;
import android.graphics.drawable.ColorDrawable;
import android.hardware.display.DisplayManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

import java.lang.ref.WeakReference;

/**
 * The off-screen check-in never got past a blank screen on the reporter's phone, while the same
 * check-in always works once ROX's own screen is open. So the background run now opens ROX's real
 * screen instead: shown over the lock screen with the display turned on, exactly as an alarm clock
 * does, it runs the normal check-in (AutoCheckin) and closes itself again, without unlocking the
 * phone.
 *
 * Android only lets an app open a screen from the background in a few cases. Two are used here:
 * "Appear on top" (SYSTEM_ALERT_WINDOW), which the user grants once in Settings, and a full-screen
 * notification (USE_FULL_SCREEN_INTENT), which opens the screen straight away while the phone is
 * locked or asleep and otherwise shows as a heads-up notice to tap. When neither is allowed the old
 * off-screen run is used and ROX asks once, on an app open, for "Appear on top". Since Android 15
 * "Appear on top" only counts while the app has an overlay window on screen, so a 1-pixel window
 * is put up just before the start and taken down once the screen opens.
 */
final class WakeScreen {

    private static final String TAG = "PROXMA_ROX";
    static final String EXTRA = "proxma_rox_wake";
    private static final String CHANNEL = "proxma_rox_wake";
    private static final int NOTICE_ID = 0x524f5804;
    private static final int ASK_ID = 0x524f5805;
    private static final int REQUEST_OPEN = 0x524f5806;
    private static final int REQUEST_ASK = 0x524f5807;
    static final String KEY_ASKED_AT = "wake_asked_at";
    static final String KEY_FS_ASKED_AT = "wake_fs_asked_at";
    static final String KEY_OPEN_ASKED_AT = "wake_open_asked_at";
    static final String KEY_OPENED_AT = "wake_opened_at";
    // Any ROX screen created, marked or not: tells "Android blocked the start" apart from
    // "a screen was made but not as the check-in screen".
    static final String KEY_ANY_CREATED_AT = "wake_any_created_at";
    private static final long UNMARKED_WINDOW_MS = 45_000L;
    private static final String ROUTE_OVERLAY = "appear on top";
    private static final String ROUTE_NOTICE = "full-screen notice";
    // If a direct start was blocked after all, the full-screen notice follows this much later.
    static final long BACKUP_NOTICE_MS = 20_000L;
    private static final long ASK_EVERY_MS = 3L * 24L * 60L * 60L * 1000L;

    private static final Handler sHandler = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> sWoken = new WeakReference<>(null);
    private static WeakReference<Activity> sClosing = new WeakReference<>(null);
    // The check-in screen made see-through, so the phone's user keeps seeing and using what they had.
    private static WeakReference<Activity> sHidden = new WeakReference<>(null);
    // Phone locked and nothing can open ROX over the lock screen: the check-in waits for the unlock.
    static final String KEY_UNLOCK_WAIT_DAY = "wake_unlock_wait_day";
    private static final long UNLOCK_SETTLE_MS = 2_500L;
    private static BroadcastReceiver sUnlockReceiver;

    private WakeScreen() {}

    /** The way ROX's screen can be opened from the background right now, or null for none. */
    static String route(Context context) {
        if (canAppearOnTop(context)) return ROUTE_OVERLAY;
        if (canFullScreen(context)) return ROUTE_NOTICE;
        return null;
    }

    private static boolean canAppearOnTop(Context context) {
        try {
            return Build.VERSION.SDK_INT >= 23 && Settings.canDrawOverlays(context);
        } catch (Throwable t) {
            Log.w(TAG, "WAKE overlay check failed " + t);
            return false;
        }
    }

    private static boolean canFullScreen(Context context) {
        try {
            if (context.checkSelfPermission("android.permission.USE_FULL_SCREEN_INTENT")
                != PackageManager.PERMISSION_GRANTED) return false;
            if (Build.VERSION.SDK_INT < 34) return true;
            NotificationManager manager =
                (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            return manager != null && manager.areNotificationsEnabled() && manager.canUseFullScreenIntent();
        } catch (Throwable t) {
            Log.w(TAG, "WAKE full-screen check failed " + t);
            return false;
        }
    }

    /**
     * From the background run: opens ROX's screen for the check-in. Returns the route used, or
     * null when Android allows none, in which case nothing was done.
     */
    static String open(Context context) {
        final Context app = context.getApplicationContext();
        final Intent intent = launchIntent(app);
        if (intent == null) {
            Log.w(TAG, "WAKE no launch intent");
            return null;
        }
        final long at = System.currentTimeMillis();
        final boolean overlay = canAppearOnTop(app);
        final boolean full = canFullScreen(app);
        final String phoneAtStart = phoneState(app);
        sPhoneAtStart = phoneAtStart;
        sFullFirst = false;
        String route = null;
        if (full && lockedOrDark(app)) {
            // Android hides overlay windows while the lock screen shows, so the helper window can't
            // let the start through there (r29). A full-screen notice opens the screen straight
            // away while the phone is locked or asleep, like an alarm clock.
            sFullFirst = true;
            postFullScreen(app, intent);
            route = ROUTE_NOTICE;
            Log.i(TAG, "WAKE phone " + phoneAtStart + ", full-screen notice first");
        } else if (overlay) {
            // Since Android 15 "Appear on top" only lets an app open a screen from the background
            // while one of its overlay windows is on screen; without one Android drops the start
            // silently (r28 on the reporter's phone). So put up a 1-pixel window first.
            route = ROUTE_OVERLAY;
            startOnTop(app, intent, at);
        } else if (full) {
            postFullScreen(app, intent);
            route = ROUTE_NOTICE;
        }
        if (route != null) {
            AutoCheckin.prefs(app).edit().putLong(KEY_OPEN_ASKED_AT, at).commit();
            // Android can drop a background start without saying so: check, back it up, and say why.
            sHandler.postDelayed(new Runnable() {
                @Override public void run() {
                    afterOpen(app, intent, at, overlay, full);
                }
            }, BACKUP_NOTICE_MS);
        } else {
            Log.i(TAG, "WAKE no way to open the screen from the background");
        }
        return route;
    }

    static boolean lockedOrDark(Context app) {
        try {
            KeyguardManager keyguard = (KeyguardManager) app.getSystemService(Context.KEYGUARD_SERVICE);
            PowerManager power = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            return (keyguard != null && keyguard.isKeyguardLocked()) || (power != null && !power.isInteractive());
        } catch (Throwable t) {
            Log.w(TAG, "WAKE lock check failed " + t);
            return false;
        }
    }

    private static String sPhoneAtStart = "phone state unknown";
    private static boolean sFullFirst = false;
    private static View sHelper;
    private static WindowManager sHelperWm;
    private static String sHelperState = "not used";
    private static int sStarts = 0;

    /** Puts up the helper window, then starts ROX's screen once it is on screen, and once more later. */
    private static void startOnTop(final Context app, final Intent intent, final long at) {
        sStarts = 0;
        boolean shown = showHelper(app);
        long first = shown ? 600L : 0L;
        final Runnable start = new Runnable() {
            @Override public void run() {
                if (openedSince(app, at)) return;
                sStarts++;
                if (sHelper != null) {
                    sHelperState = sHelper.isAttachedToWindow()
                        ? (sHelper.getWindowVisibility() == View.VISIBLE ? "on screen" : "added but hidden by Android")
                        : "added but never attached";
                }
                try {
                    app.startActivity(intent);
                    Log.i(TAG, "WAKE screen start " + sStarts + " asked (appear on top, helper window "
                        + sHelperState + ")");
                } catch (Throwable t) {
                    Log.w(TAG, "WAKE direct start " + sStarts + " failed " + t);
                }
            }
        };
        sHandler.postDelayed(start, first);
        sHandler.postDelayed(start, first + 4_000L);
    }

    private static boolean showHelper(Context app) {
        removeHelper();
        try {
            Context context = app;
            if (Build.VERSION.SDK_INT >= 30) {
                DisplayManager displays = (DisplayManager) app.getSystemService(Context.DISPLAY_SERVICE);
                Display display = displays != null ? displays.getDisplay(Display.DEFAULT_DISPLAY) : null;
                if (display != null) {
                    context = app.createDisplayContext(display)
                        .createWindowContext(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, null);
                }
            }
            WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
            if (wm == null) {
                sHelperState = "no window manager";
                Log.w(TAG, "WAKE helper window: no window manager");
                return false;
            }
            View view = new View(context);
            view.setBackgroundColor(0x01000000);
            @SuppressWarnings("deprecation")
            int type = Build.VERSION.SDK_INT >= 26
                ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                : WindowManager.LayoutParams.TYPE_PHONE;
            @SuppressWarnings("deprecation")
            int flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
                | WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED;
            WindowManager.LayoutParams params = new WindowManager.LayoutParams(1, 1, type, flags,
                PixelFormat.TRANSLUCENT);
            params.gravity = Gravity.TOP | Gravity.START;
            params.setTitle("ROX check-in helper");
            wm.addView(view, params);
            sHelper = view;
            sHelperWm = wm;
            sHelperState = "added";
            Log.i(TAG, "WAKE helper window added");
            return true;
        } catch (Throwable t) {
            sHelperState = "not allowed (" + t.getClass().getSimpleName() + ")";
            Log.w(TAG, "WAKE helper window failed " + t);
            return false;
        }
    }

    private static void removeHelper() {
        View view = sHelper;
        WindowManager wm = sHelperWm;
        sHelper = null;
        sHelperWm = null;
        if (view == null || wm == null) return;
        try {
            wm.removeViewImmediate(view);
            Log.i(TAG, "WAKE helper window removed");
        } catch (Throwable t) {
            Log.w(TAG, "WAKE helper window remove failed " + t);
        }
    }

    /** A while after asking: done if the screen opened, else back it up and record why it didn't. */
    private static void afterOpen(Context app, Intent intent, long at, boolean overlay, boolean full) {
        removeHelper();
        if (openedSince(app, at)) {
            Log.i(TAG, "WAKE screen opened, nothing to back up");
            return;
        }
        String phone = "at start " + sPhoneAtStart + ", now " + phoneState(app);
        long created = AutoCheckin.prefs(app).getLong(KEY_ANY_CREATED_AT, 0L);
        String made = created >= at
            ? "a ROX screen was made but not as the check-in screen"
            : "no ROX screen was made";
        String text;
        if (sFullFirst) {
            text = "posted the full-screen notice (phone locked or asleep) but ROX's screen didn't open; "
                + made + "; " + phone;
            if (overlay && !lockedOrDark(app)) {
                // The phone has been unlocked since: Appear on top can work now.
                startOnTop(app, intent, at);
                sHandler.postDelayed(new Runnable() {
                    @Override public void run() {
                        removeHelper();
                    }
                }, 8_000L);
                text += "; trying Appear on top now the phone is unlocked";
            } else if (overlay && lockedOrDark(app)) {
                // Still locked: Appear on top can't work behind the lock screen. Don't use up a try;
                // check in right after the next unlock instead.
                AutoCheckin.refundBackgroundTry(app);
                waitForUnlock(app);
                text += "; still locked, will check in after the next unlock";
            } else if (!overlay) {
                text += "; Appear on top is off for ROX";
            }
        } else if (overlay) {
            text = "asked Android " + sStarts + "x to open ROX's screen (appear on top, helper window "
                + sHelperState + ") but it didn't open; " + made + "; " + phone;
            if (full) {
                postFullScreen(app, intent);
                text += "; posted the full-screen notice instead";
            } else {
                text += "; full-screen notices aren't allowed for ROX";
            }
        } else {
            text = "posted the full-screen notice but ROX's screen didn't open on its own; " + made + "; " + phone;
        }
        Log.w(TAG, "WAKE screen didn't open: " + text);
        AutoCheckin.recordBackground(app, text);
        if (waitingForUnlock(app)) return;
        if (!(overlay && full)) Notices.needsYou(app, "ROX couldn't open itself in the background.");
        else if (sFullFirst && lockedOrDark(app)) Notices.needsYou(app, "ROX couldn't open itself while the phone was locked.");
    }

    /** Screen on but the lock screen still up: someone is most likely about to unlock the phone. */
    static boolean screenOnButLocked(Context context) {
        try {
            Context app = context.getApplicationContext();
            KeyguardManager keyguard = (KeyguardManager) app.getSystemService(Context.KEYGUARD_SERVICE);
            PowerManager power = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            return keyguard != null && keyguard.isKeyguardLocked() && power != null && power.isInteractive();
        } catch (Throwable t) {
            Log.w(TAG, "WAKE screen check failed " + t);
            return false;
        }
    }

    private static String phoneState(Context app) {
        try {
            KeyguardManager keyguard = (KeyguardManager) app.getSystemService(Context.KEYGUARD_SERVICE);
            PowerManager power = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            String locked = keyguard == null ? "lock unknown" : keyguard.isKeyguardLocked() ? "phone locked" : "phone unlocked";
            String screen = power == null ? "screen unknown" : power.isInteractive() ? "screen on" : "screen off";
            return locked + ", " + screen;
        } catch (Throwable t) {
            return "phone state unknown";
        }
    }

    static boolean openedSince(Context context, long at) {
        return AutoCheckin.prefs(context).getLong(KEY_OPENED_AT, 0L) >= at;
    }

    private static Intent launchIntent(Context app) {
        Intent intent = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
        if (intent == null) return null;
        // MainActivity is singleTop with an empty task affinity. With NEW_TASK alone, a ROX task
        // left in Recents is just brought back and its screen rebuilt from the original launcher
        // intent, so this marker was lost: the screen stayed behind the lock screen and counted
        // as "didn't open" (r28/r29). CLEAR_TASK always builds a fresh screen from this intent.
        // NO_ANIMATION: with the phone in use the screen is see-through (hide), so no slide-in either.
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK
            | Intent.FLAG_ACTIVITY_NO_ANIMATION);
        intent.putExtra(EXTRA, true);
        return intent;
    }

    private static void postFullScreen(Context app, Intent intent) {
        try {
            NotificationManager manager = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) return;
            if (manager.getNotificationChannel(CHANNEL) == null) {
                NotificationChannel channel = new NotificationChannel(CHANNEL, "Daily check-in wake-up (patch)",
                    NotificationManager.IMPORTANCE_HIGH);
                channel.setDescription("Opens ROX briefly so the patched daily check-in can run");
                channel.setSound(null, null);
                channel.enableVibration(false);
                manager.createNotificationChannel(channel);
            }
            PendingIntent open = PendingIntent.getActivity(app, REQUEST_OPEN, intent,
                PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            Notification notice = new Notification.Builder(app, CHANNEL)
                .setSmallIcon(app.getApplicationInfo().icon != 0
                    ? app.getApplicationInfo().icon : android.R.drawable.ic_popup_reminder)
                .setContentTitle("ROX daily check-in")
                .setContentText("Opening ROX for a moment to check in. Tap if it didn't open.")
                .setCategory(Notification.CATEGORY_ALARM)
                .setContentIntent(open)
                .setFullScreenIntent(open, true)
                .setAutoCancel(true)
                .setTimeoutAfter(30L * 60L * 1000L)
                .build();
            manager.notify(NOTICE_ID, notice);
            Log.i(TAG, "WAKE full-screen notice posted");
        } catch (Throwable t) {
            Log.w(TAG, "WAKE notice failed " + t);
        }
    }

    /** From MainActivity.onCreate: a screen opened by the background run shows over the lock screen. */
    static boolean onCreate(Activity activity) {
        try {
            Intent intent = activity.getIntent();
            boolean marked = intent != null && intent.getBooleanExtra(EXTRA, false);
            SharedPreferences prefs = AutoCheckin.prefs(activity);
            long now = System.currentTimeMillis();
            prefs.edit().putLong(KEY_ANY_CREATED_AT, now).apply();
            if (!marked) {
                // Android can rebuild the screen from an older intent and drop the marker. A
                // screen created right after the background run asked for one, with none opened
                // since, is that screen.
                long asked = prefs.getLong(KEY_OPEN_ASKED_AT, 0L);
                boolean pending = asked > 0 && now - asked >= 0 && now - asked < UNMARKED_WINDOW_MS
                    && prefs.getLong(KEY_OPENED_AT, 0L) < asked;
                if (!pending) return false;
                Log.i(TAG, "WAKE screen created without the marker " + (now - asked)
                    + " ms after the background run asked, treating it as that screen");
            }
            take(activity, prefs, now, marked ? "marked" : "unmarked");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_CREATE_ERR " + t);
            return false;
        }
    }

    /**
     * From the screen's start and resume: Android can bring back a ROX screen that already exists
     * instead of making a new one, and then onCreate never runs and the marker only reaches
     * onNewIntent. That is what the r29 report shows: a ROX screen came up at 00:25, read as an
     * ordinary app open, and stayed behind the lock screen. A screen that comes up shortly after a
     * background request, with none opened since, is taken as the check-in screen here too.
     */
    static boolean onShown(Activity activity, String when) {
        try {
            if (activity == null || woken(activity) || closing(activity)) return woken(activity);
            SharedPreferences prefs = AutoCheckin.prefs(activity);
            long now = System.currentTimeMillis();
            long asked = prefs.getLong(KEY_OPEN_ASKED_AT, 0L);
            boolean pending = asked > 0 && now - asked >= 0 && now - asked < UNMARKED_WINDOW_MS
                && prefs.getLong(KEY_OPENED_AT, 0L) < asked;
            if (!pending) return false;
            prefs.edit().putLong(KEY_ANY_CREATED_AT, now).apply();
            Log.i(TAG, "WAKE existing screen brought back (" + when + ") " + (now - asked)
                + " ms after the background run asked, treating it as that screen");
            take(activity, prefs, now, "brought back, " + when);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_SHOWN_ERR " + t);
            return false;
        }
    }

    /** Makes the screen the check-in screen: over the lock screen, display on, notice and helper gone. */
    private static void take(Activity activity, SharedPreferences prefs, long now, String how) {
        try {
            sWoken = new WeakReference<>(activity);
            if (Build.VERSION.SDK_INT >= 27) {
                activity.setShowWhenLocked(true);
                activity.setTurnScreenOn(true);
                activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            } else {
                activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
                    | WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED
                    | WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
            }
            cancelNotice(activity);
            removeHelper();
            if (lockedOrDark(activity)) {
                Log.i(TAG, "WAKE screen opened by the background run (" + how + "), shown over the lock screen");
            } else {
                // r32: with the phone in use ROX came up over what the user was doing and they had
                // to go back by hand. Make it see-through and let touches pass to the app behind.
                boolean hidden = hide(activity);
                Log.i(TAG, "WAKE screen opened by the background run (" + how + "), phone in use, "
                    + (hidden ? "made see-through" : "couldn't make it see-through, shown as is"));
            }
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_TAKE_ERR " + t);
        } finally {
            prefs.edit().putLong(KEY_OPENED_AT, now).commit();
        }
    }

    static boolean woken(Activity activity) {
        return activity != null && sWoken.get() == activity;
    }

    /** True while a screen the background run opened is about to close; it starts no new session. */
    static boolean closing(Activity activity) {
        return activity != null && sClosing.get() == activity;
    }

    /** Closes a screen the background run opened, after the given delay. */
    static void close(final Activity activity, long delayMs) {
        if (!woken(activity) || closing(activity)) return;
        sClosing = new WeakReference<>(activity);
        sHandler.postDelayed(new Runnable() {
            @Override public void run() {
                try {
                    if (sWoken.get() == activity) sWoken = new WeakReference<>(null);
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                    if (Build.VERSION.SDK_INT >= 27) {
                        activity.setTurnScreenOn(false);
                        activity.setShowWhenLocked(false);
                    }
                    boolean wasHidden = sHidden.get() == activity;
                    activity.finishAndRemoveTask();
                    if (wasHidden) {
                        sHidden = new WeakReference<>(null);
                        noAnimation(activity);
                    }
                    Log.i(TAG, "WAKE screen closed" + (wasHidden ? " (it was see-through)" : ""));
                } catch (Throwable t) {
                    Log.w(TAG, "WAKE_CLOSE_ERR " + t);
                }
            }
        }, delayMs);
    }

    private static void cancelNotice(Context context) {
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager != null) manager.cancel(NOTICE_ID);
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_CANCEL_ERR " + t);
        }
    }

    /**
     * Makes the check-in screen see-through and lets touches go to the app behind it. Flutter keeps
     * drawing and its semantics tree keeps working, because the screen is still resumed and on
     * screen (alpha just above zero, so the system still counts it as shown). Only when Android
     * agrees to make the screen translucent; otherwise it stays as in r32.
     */
    private static boolean hide(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT < 30) return false;
            if (!activity.setTranslucent(true)) {
                Log.i(TAG, "WAKE see-through refused by Android");
                return false;
            }
            Window window = activity.getWindow();
            window.setBackgroundDrawable(new ColorDrawable(0));
            WindowManager.LayoutParams params = window.getAttributes();
            params.alpha = 0.01f;
            params.dimAmount = 0f;
            window.setAttributes(params);
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.addFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE);
            sHidden = new WeakReference<>(activity);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_HIDE_ERR " + t);
            return false;
        }
    }

    static boolean hidden(Activity activity) {
        return activity != null && sHidden.get() == activity;
    }

    /**
     * A see-through check-in screen that goes away before it is done (the user switched app, a
     * call came in) is made a normal screen again, so ROX is never left invisible.
     */
    static void reveal(Activity activity) {
        if (!hidden(activity)) return;
        // Closing after the check-in also pauses it: keep it see-through on the way out.
        if (activity.isFinishing() || closing(activity)) return;
        sHidden = new WeakReference<>(null);
        try {
            Window window = activity.getWindow();
            window.clearFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE);
            WindowManager.LayoutParams params = window.getAttributes();
            params.alpha = 1f;
            window.setAttributes(params);
            if (Build.VERSION.SDK_INT >= 30) activity.setTranslucent(false);
            Log.i(TAG, "WAKE see-through screen made normal again");
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_REVEAL_ERR " + t);
        }
    }

    @SuppressWarnings("deprecation")
    private static void noAnimation(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT >= 34) {
                activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE, 0, 0);
            }
            activity.overridePendingTransition(0, 0);
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_NOANIM_ERR " + t);
        }
    }

    /**
     * Phone locked (or asleep), full-screen notices not allowed, Appear on top allowed: Android
     * hides overlay windows behind the lock screen, so any start now is dropped (the r32 report:
     * "when my phone is locked it doesn't work"). Wait for the unlock instead.
     */
    static boolean shouldWaitForUnlock(Context context) {
        Context app = context.getApplicationContext();
        return lockedOrDark(app) && !canFullScreen(app) && canAppearOnTop(app);
    }

    static boolean waitingForUnlock(Context context) {
        return AutoCheckin.today().equals(AutoCheckin.prefs(context).getString(KEY_UNLOCK_WAIT_DAY, ""))
            && !AutoCheckin.doneToday(context);
    }

    static void clearUnlockWait(Context context) {
        AutoCheckin.prefs(context).edit().remove(KEY_UNLOCK_WAIT_DAY).apply();
        unregisterUnlock(context.getApplicationContext());
    }

    /**
     * Marks today as waiting for the unlock (CheckinJobService then tries every half hour instead
     * of every two hours, without using up tries) and, while this process lives, starts the
     * check-in a moment after the user unlocks the phone.
     */
    static void waitForUnlock(Context context) {
        final Context app = context.getApplicationContext();
        AutoCheckin.prefs(app).edit().putString(KEY_UNLOCK_WAIT_DAY, AutoCheckin.today()).commit();
        if (sUnlockReceiver != null) {
            Log.i(TAG, "WAKE already waiting for the unlock");
            return;
        }
        try {
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context c, Intent i) {
                    Log.i(TAG, "WAKE phone unlocked, check-in in " + UNLOCK_SETTLE_MS + " ms");
                    unregisterUnlock(app);
                    sHandler.postDelayed(new Runnable() {
                        @Override public void run() {
                            try {
                                if (AutoCheckin.doneToday(app)) {
                                    Log.i(TAG, "WAKE unlock: already done today");
                                    return;
                                }
                                // A job that was holding for this unlock has already started the
                                // check-in and cleared the wait; a second start would open ROX twice.
                                if (!waitingForUnlock(app)) {
                                    Log.i(TAG, "WAKE unlock: check-in already started by the job");
                                    return;
                                }
                                CheckinJobService.runNow(app);
                            } catch (Throwable t) {
                                Log.w(TAG, "WAKE_UNLOCK_RUN_ERR " + t);
                            }
                        }
                    }, UNLOCK_SETTLE_MS);
                }
            };
            IntentFilter filter = new IntentFilter(Intent.ACTION_USER_PRESENT);
            if (Build.VERSION.SDK_INT >= 26) {
                // RECEIVER_NOT_EXPORTED (4): only the system's unlock broadcast reaches it.
                app.registerReceiver(receiver, filter, 4);
            } else {
                app.registerReceiver(receiver, filter);
            }
            sUnlockReceiver = receiver;
            Log.i(TAG, "WAKE waiting for the unlock");
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_UNLOCK_REG_ERR " + t);
        }
    }

    private static void unregisterUnlock(Context app) {
        BroadcastReceiver receiver = sUnlockReceiver;
        sUnlockReceiver = null;
        if (receiver == null) return;
        try {
            app.unregisterReceiver(receiver);
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_UNLOCK_UNREG_ERR " + t);
        }
    }

    /**
     * On an app open: when Android allows no way to open the screen from the background, ask (at
     * most every three days) for "Appear on top", which is what lets the check-in run unattended.
     */
    static void askIfNeeded(Context context) {
        try {
            Context app = context.getApplicationContext();
            // "Appear on top" is on but full-screen notices aren't: those are what open ROX while
            // the phone is locked, where Android hides the helper window. Ask once in a while too.
            boolean askFullScreen = Build.VERSION.SDK_INT >= 34 && canAppearOnTop(app) && !canFullScreen(app);
            String askKey = askFullScreen ? KEY_FS_ASKED_AT : KEY_ASKED_AT;
            if (route(app) != null && !askFullScreen) {
                NotificationManager manager = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
                if (manager != null) manager.cancel(ASK_ID);
                return;
            }
            SharedPreferences prefs = AutoCheckin.prefs(app);
            long now = System.currentTimeMillis();
            if (now - prefs.getLong(askKey, 0L) < ASK_EVERY_MS) return;
            NotificationManager manager = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null || !manager.areNotificationsEnabled()) return;
            Intent settings;
            if (askFullScreen) {
                settings = new Intent("android.settings.MANAGE_APP_USE_FULL_SCREEN_INTENT",
                    Uri.parse("package:" + app.getPackageName()));
                if (settings.resolveActivity(app.getPackageManager()) == null) {
                    settings = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                        Uri.parse("package:" + app.getPackageName()));
                }
            } else if (Build.VERSION.SDK_INT >= 23) {
                settings = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    Uri.parse("package:" + app.getPackageName()));
            } else {
                settings = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                    Uri.parse("package:" + app.getPackageName()));
            }
            settings.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if (manager.getNotificationChannel("proxma_rox_checkin") == null) {
                NotificationChannel channel = new NotificationChannel("proxma_rox_checkin", "Daily check-in (patch)",
                    NotificationManager.IMPORTANCE_LOW);
                channel.setDescription("Result of the patched background daily check-in");
                manager.createNotificationChannel(channel);
            }
            String text = askFullScreen
                ? "To check in while the phone is locked, ROX needs to show full-screen notifications. "
                    + "Tap here and allow \"Full screen notifications\" for ROX."
                : "To check in while you're away, ROX needs to open itself for a moment. "
                    + "Tap here and turn on \"Appear on top\" (\"Display over other apps\") for ROX.";
            Notification notice = new Notification.Builder(app, "proxma_rox_checkin")
                .setSmallIcon(app.getApplicationInfo().icon != 0
                    ? app.getApplicationInfo().icon : android.R.drawable.ic_popup_reminder)
                .setContentTitle("ROX patch: one setting needed")
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setContentIntent(PendingIntent.getActivity(app, REQUEST_ASK, settings,
                    PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT))
                .setAutoCancel(true)
                .build();
            manager.notify(ASK_ID, notice);
            prefs.edit().putLong(askKey, now).apply();
            Log.i(TAG, askFullScreen ? "WAKE asked for full-screen notices" : "WAKE asked for appear on top");
        } catch (Throwable t) {
            Log.w(TAG, "WAKE_ASK_ERR " + t);
        }
    }
}
