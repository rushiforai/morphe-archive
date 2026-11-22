package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityOptions;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.graphics.RectF;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.service.notification.StatusBarNotification;
import android.view.Display;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.IntConsumer;

/**
 * Floating Maps window (patch "Floating Maps window", switch "floating_maps").
 * <p>
 * During guidance, while none of Maps' screens is in front (BYD's camera, another app full screen, Home), a small
 * window over the other app shows Google's compact guidance screen: LimitedMapsActivity, which Maps declares for a
 * launcher's map card (next turn, map, arrival). The card runs on a private virtual display that Maps Car owns, and the
 * window shows that display's picture.
 * <ul>
 * <li>The card is started once per guidance while a Maps screen is in front with the input focus. Starting an activity
 * on another display can move the input focus there; if Maps loses it, Maps' task is moved to the front again, so no
 * other app is left without the focus. A start the system drops is tried again on a new display, later each time.</li>
 * <li>The display has no surface until the window shows. The system stops the card while its display is off, so it
 * draws nothing in the background.</li>
 * <li>Guidance: Maps' own navigation notification, ongoing and with an action (its exit button). Maps posts the same
 * notification without actions in its driving mode, which is not guidance. The end counts only when a second look 2 s
 * later agrees, since Maps replaces the notification at times.</li>
 * <li>The window starts at the bottom right, medium size (640×540 px), 24 px from the edges. Dragging moves it, its
 * top-left corner resizes it, and both are saved. A tap opens Maps; taps do not reach the map. The X hides it until a
 * Maps screen is in front again.</li>
 * <li>On BYD, it shows only in D (M and S count as D; the owner can turn that off): not in P, R or N, so never over the
 * rear camera, and after another gear only once D has held 30 s, so it does not flicker while parking.</li>
 * <li>The owner can keep it off Home: while the home app's task is the most recent of the tasks Android lists to this
 * app (the home app's and Maps' own).</li>
 * <li>It needs "Display over other apps" (SYSTEM_ALERT_WINDOW, which the patch declares), granted on the system's page
 * from the Settings dialog. The dialog also turns the window on or off and sets its size and opacity.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class FloatingMaps {
    private static final String TAG = "MorpheFloatingMaps";
    /** Must match the activity the patch checks in the manifest. */
    static final String CARD_ACTIVITY = "com.google.android.apps.gmm.car.embedded.activity.LimitedMapsActivity";
    private static final String PREFERENCES = "morphe_floating_maps", KEY_ON = "on", KEY_RIGHT = "right", KEY_BOTTOM = "bottom",
            KEY_WIDTH = "width", KEY_HEIGHT = "height", KEY_OPACITY = "opacity", KEY_ONLY_D = "only_in_d",
            KEY_HIDE_P_R = "hide_in_p_r", KEY_NOT_OVER_HOME = "hide_over_home";
    /** The window's sizes in px: small, medium (the default), large. */
    static final int[][] SIZES = {{480, 400}, {640, 540}, {800, 680}};
    static final int DEFAULT_WIDTH = 640, DEFAULT_HEIGHT = 540, MARGIN = 24, MIN_WIDTH = 320, MIN_HEIGHT = 180;
    /** The window's opacity choices in percent; the first is the default. */
    static final int[] OPACITIES = {100, 75, 50, 25};
    private static final int CARD_DPI = 160;
    /** DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY and the hidden DESTROY_CONTENT_ON_REMOVAL (1 << 8). */
    private static final int DISPLAY_FLAGS = DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY | 1 << 8;
    /** Notification.CATEGORY_NAVIGATION (an API 29 constant). */
    private static final String NAVIGATION = "navigation";
    static final long WATCH_MS = 2000, GUIDING_WATCH_MS = 5000, QUICK_WATCH_MS = 1000, COVER_DELAY_MS = 700,
            FOCUS_CHECK_MS = 600, RELEASE_TIMEOUT_MS = 3000, CARD_START_MS = 10_000, CARD_RETRY_MAX_MS = 60_000,
            OFF_CONFIRM_MS = 2000, RECENT_GUIDANCE_MS = 10 * 60_000, D_HOLD_MS = 30_000;
    /** Failed gear readings in a row that keep the last gear before it counts as unknown. */
    static final int GEAR_MISSES = 5;
    /** Must match the report screen and its launcher entry in the manifest; it runs in its own process, outside [inFront]. */
    private static final String REPORT_ACTIVITY = "app.morphe.extension.mapsautomotive.patches.ReportActivity",
            REPORT_LAUNCHER = "app.morphe.extension.mapsautomotive.patches.ReportLauncher";

    // Main thread only.
    private static Application application;
    private static Handler main;
    private static boolean installed, guiding, dismissed, cardRequested, noCardLogged, gearTried, homeTried, lastHome;
    private static int startFailures, lastGear = BydGear.UNKNOWN, gearMisses;
    /**
     * [offSince]: when guidance was first missed (0: not missed); [retryAt]: no card start before this; [driveSince]:
     * when D (or M, S) began, 0 in other gears. Uptime.
     */
    private static long cardRequestedAt, offSince, lastGuidingAt, retryAt, driveSince;
    private static BydGear gear;
    private static String homePackage;
    /** Maps' screens that are started (visible), the card excepted. */
    private static final Set<Activity> inFront = Collections.newSetFromMap(new WeakHashMap<>());
    private static WeakReference<Activity> card;
    /** The card's display; [retiring] is the previous one, released once its card is gone. */
    private static VirtualDisplay display, retiring;
    private static View window;
    private static WindowManager.LayoutParams windowParams;
    private static SurfaceView picture;

    // For the problem report, read from another thread.
    private static volatile boolean reportGuiding, reportCard, reportShowing, reportHome;
    private static volatile int cardStarts, shown, closedByX, focusRestores, droppedStarts, taps, reportFlags = -1, reportActions;
    private static volatile String lastError, reportGear, gearStatus;

    private static final Runnable watcher = FloatingMaps::watch;
    private static final Runnable coverCheck = FloatingMaps::watch;

    private FloatingMaps() {
    }

    /** Injection point: start of MapsActivity's onCreate. */
    public static void install(Activity activity) {
        try {
            if (installed || !SafeMode.on(activity, SafeMode.FLOATING_MAPS)) return;
            installed = true;
            application = activity.getApplication();
            main = new Handler(Looper.getMainLooper());
            application.registerActivityLifecycleCallbacks(new Lifecycle());
            ReportLog.i(TAG, "Floating Maps window " + (userOn(activity) ? "on" : "off in Settings")
                    + ", display over other apps " + (Settings.canDrawOverlays(activity) ? "allowed" : "not allowed"));
        } catch (Throwable error) {
            note("not installed", error);
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
            if (isOurCard(activity)) {
                card = new WeakReference<>(activity);
                reportCard = true;
                ReportLog.i(TAG, "card created on display " + displayId(activity));
                ReportBuilder.saveSnapshot(application, true);
            }
        }

        @Override
        public void onActivityStarted(Activity activity) {
            if (isOurCard(activity)) return;
            inFront.add(activity);
            mapsInFront();
        }

        @Override
        public void onActivityStopped(Activity activity) {
            if (isOurCard(activity)) return;
            inFront.remove(activity);
            if (inFront.isEmpty()) {
                main.removeCallbacks(coverCheck);
                main.postDelayed(coverCheck, COVER_DELAY_MS);
            }
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            Activity current = card != null ? card.get() : null;
            if (current == activity) {
                card = null;
                reportCard = false;
                // A relaunch for a configuration change: the new card registers itself on the same display.
                if (activity.isChangingConfigurations()) {
                    ReportLog.i(TAG, "card relaunched for a configuration change");
                    return;
                }
                cardRequested = false;
                ReportLog.i(TAG, "card closed" + (activity.isFinishing() ? "" : " by the system"));
                hideWindow("card closed");
                releaseRetiring();
                ReportBuilder.saveSnapshot(application, true);
                return;
            }
            inFront.remove(activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            // Back from a page that only paused Maps (the system's permission page can): a look at once.
            if (!isOurCard(activity) && inFront.contains(activity)) watch();
        }
        @Override public void onActivityPaused(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    }

    // The card this class started: LimitedMapsActivity on our display (or the one being released). On another display
    // (a launcher's), it is a Maps screen like the others.
    private static boolean isOurCard(Activity activity) {
        if (card != null && card.get() == activity) return true;
        if (!CARD_ACTIVITY.equals(activity.getClass().getName())) return false;
        int shownOn = displayId(activity);
        return shownOn >= 0 && (shownOn == idOf(display) || shownOn == idOf(retiring));
    }

    private static int idOf(VirtualDisplay virtual) {
        Display shown = virtual != null ? virtual.getDisplay() : null;
        return shown != null ? shown.getDisplayId() : -2;
    }

    private static int displayId(Activity activity) {
        try {
            Display shown = activity.getWindowManager().getDefaultDisplay();
            return shown != null ? shown.getDisplayId() : -1;
        } catch (RuntimeException error) {
            return -1;
        }
    }

    private static Activity card() {
        Activity current = card != null ? card.get() : null;
        return current == null || current.isDestroyed() ? null : current;
    }

    private static void mapsInFront() {
        main.removeCallbacks(coverCheck);
        dismissed = false;
        hideWindow("Maps in front");
        watch();
    }

    // Runs while a Maps screen is in front (to see guidance start), during guidance, while a card exists, and for a while
    // after guidance while Maps is covered, so guidance seen again shows the window without Maps coming to the front.
    private static void watch() {
        main.removeCallbacks(watcher);
        try {
            if (!userOn(application)) {
                tearDown("turned off");
                return;
            }
            boolean front = !inFront.isEmpty();
            if (!Settings.canDrawOverlays(application)) {
                tearDown("not allowed");
                // Looked at again while a Maps screen is in front: the owner may be back from the system's page.
                if (front) main.postDelayed(watcher, WATCH_MS);
                return;
            }
            long now = SystemClock.uptimeMillis();
            int[] navigation = navigation();
            int flags = navigation[0], actions = navigation[1];
            boolean seen = isGuidance(flags, actions);
            if (seen) {
                lastGuidingAt = now;
                offSince = 0;
            } else if (guiding && offSince == 0) {
                offSince = now;
            }
            boolean next = keepGuiding(guiding, seen, offSince, now);
            reportFlags = flags;
            reportActions = actions;
            if (next != guiding) {
                guiding = next;
                reportGuiding = next;
                startFailures = 0;
                retryAt = 0;
                offSince = 0;
                ReportLog.i(TAG, "guidance " + (next ? "on" : "off") + " (" + notificationText(flags, actions) + ")");
                // A new guidance reads the gear afresh: its first reading counts as the first.
                lastGear = BydGear.UNKNOWN;
                gearMisses = 0;
                driveSince = 0;
                if (!next) tearDown("guidance ended");
                ReportBuilder.saveSnapshot(application, true);
            }
            if (cardRequested && card() == null && now - cardRequestedAt > CARD_START_MS) {
                // The system dropped the start: the display is released (which destroys whatever it holds), and a later
                // try gets a new one.
                startFailures++;
                droppedStarts++;
                retryAt = now + retryDelay(startFailures);
                note("card did not start (" + startFailures + ")", new IllegalStateException("no card after " + CARD_START_MS + " ms"));
                tearDown("card did not start");
            }
            // The gear at every look in guidance (Maps in front too), so D's start is known before Maps is covered.
            boolean gearKnown = guiding && gearWatched();
            if (gearKnown) readGear(now);
            boolean watchCover = false;
            if (guiding) {
                if (front) {
                    if (card() == null && !cardRequested) startCard();
                } else {
                    boolean overHome = hideOverHome(application);
                    watchCover = gearKnown || overHome;
                    String away = gearKnown && !gearAllows(lastGear, driveSince, now)
                            ? (BydGear.driving(lastGear) ? "until 30 s in D" : "gear " + BydGear.name(lastGear))
                            : screenInFront(overHome);
                    if (away != null) {
                        hideWindow(away);
                    } else if (!dismissed) {
                        showWindow();
                    }
                }
            }
            boolean recent = lastGuidingAt != 0 && now - lastGuidingAt < RECENT_GUIDANCE_MS;
            if (front || guiding || display != null || recent) {
                main.postDelayed(watcher, watchDelay(offSince != 0, guiding, front && card() == null, watchCover));
            }
        } catch (Throwable error) {
            note("watch failed", error);
        }
    }

    /** Guidance as kept: on while seen, and for OFF_CONFIRM_MS after it was first missed. Plain Java. */
    static boolean keepGuiding(boolean guiding, boolean seen, long offSince, long now) {
        return seen || guiding && offSince != 0 && now - offSince < OFF_CONFIRM_MS;
    }

    /**
     * The next look: soon to confirm a missed guidance; every second while Maps waits for its card or, over another
     * screen, the gear or Home is watched; else every 5 s in guidance and every 2 s outside. Plain Java.
     */
    static long watchDelay(boolean confirming, boolean guiding, boolean waitingForCard, boolean watchingCover) {
        if (confirming) return OFF_CONFIRM_MS;
        if (guiding && (waitingForCard || watchingCover)) return QUICK_WATCH_MS;
        return guiding ? GUIDING_WATCH_MS : WATCH_MS;
    }

    /**
     * The window may show in this gear: always without a reading; in D (or M, S) once it has held [D_HOLD_MS];
     * never in P, R or N. Plain Java.
     */
    static boolean gearAllows(int gear, long driveSince, long now) {
        if (gear == BydGear.UNKNOWN) return true;
        return BydGear.driving(gear) && now - driveSince >= D_HOLD_MS;
    }

    /**
     * The gear the rule uses after reading [read]: a failed reading (unknown) keeps [last] until [misses] failed
     * readings in a row reach GEAR_MISSES. Plain Java.
     */
    static int gearAfter(int last, int read, int misses) {
        if (read != BydGear.UNKNOWN) return read;
        return misses < GEAR_MISSES ? last : BydGear.UNKNOWN;
    }

    /**
     * When D (or M, S) began after a reading of [current]: 0 outside them; unchanged while driving; now after P, R or N;
     * already held when the first reading of the guidance is D (it started while driving). Plain Java.
     */
    static long nextDriveSince(int previous, int current, long driveSince, long now) {
        if (!BydGear.driving(current)) return 0;
        if (BydGear.driving(previous)) return driveSince;
        return previous == BydGear.UNKNOWN ? now - D_HOLD_MS : now;
    }

    /** After the [failures]th dropped card start: 10 s, 20 s, 40 s, then every 60 s. Plain Java. */
    static long retryDelay(int failures) {
        long delay = CARD_START_MS;
        for (int i = 1; i < failures && delay < CARD_RETRY_MAX_MS; i++) delay *= 2;
        return Math.min(delay, CARD_RETRY_MAX_MS);
    }

    // Maps' navigation notification for guidance, or null.
    private static Notification guidanceNotification() {
        NotificationManager notifications = (NotificationManager) application.getSystemService(Context.NOTIFICATION_SERVICE);
        if (notifications == null) return null;
        for (StatusBarNotification posted : notifications.getActiveNotifications()) {
            Notification notification = posted.getNotification();
            if (notification != null && NAVIGATION.equals(notification.category)
                    && isGuidance(notification.flags, actionCount(notification))) {
                return notification;
            }
        }
        return null;
    }

    // The flags and the number of actions of Maps' navigation notification (the guidance one first), or {-1, 0}.
    private static int[] navigation() {
        Notification guidance = guidanceNotification();
        if (guidance != null) return new int[]{guidance.flags, actionCount(guidance)};
        NotificationManager notifications = (NotificationManager) application.getSystemService(Context.NOTIFICATION_SERVICE);
        if (notifications == null) return new int[]{-1, 0};
        for (StatusBarNotification posted : notifications.getActiveNotifications()) {
            Notification notification = posted.getNotification();
            if (notification != null && NAVIGATION.equals(notification.category)) {
                return new int[]{notification.flags, actionCount(notification)};
            }
        }
        return new int[]{-1, 0};
    }

    private static int actionCount(Notification notification) {
        return notification.actions != null ? notification.actions.length : 0;
    }

    /**
     * Guidance: a navigation notification of Maps that is ongoing and has an action. In guidance Maps adds its exit
     * button (with the next road, the arrival and a turn arrow); its driving mode posts the same notification (id,
     * channel, category, 0x16a or 0x10a) with none of them. The foreground-service flag goes after a route change, so
     * it is not required. Plain Java.
     */
    static boolean isGuidance(int flags, int actions) {
        return flags >= 0 && actions > 0
                && (flags & (Notification.FLAG_ONGOING_EVENT | Notification.FLAG_FOREGROUND_SERVICE)) != 0;
    }

    private static String notificationText(int flags, int actions) {
        return flags < 0 ? "no navigation notification"
                : "navigation notification 0x" + Integer.toHexString(flags) + ", " + actions + (actions == 1 ? " action" : " actions");
    }

    // The owner's choice on, and a gear the BYD SDK reports.
    private static boolean gearWatched() {
        return onlyInDrive(application) && gearReader() != null;
    }

    // The gear now, and when D (or M, S) began.
    private static void readGear(long now) {
        BydGear reader = gearReader();
        int read = reader != null ? reader.read() : BydGear.UNKNOWN;
        gearMisses = read == BydGear.UNKNOWN ? gearMisses + 1 : 0;
        int value = gearAfter(lastGear, read, gearMisses);
        driveSince = nextDriveSince(lastGear, value, driveSince, now);
        if (value != lastGear) {
            boolean waits = BydGear.driving(value) && !BydGear.driving(lastGear) && lastGear != BydGear.UNKNOWN;
            lastGear = value;
            reportGear = BydGear.name(value);
            ReportLog.i(TAG, "gear " + reportGear + (waits ? " (the window waits 30 s)" : ""));
        }
    }

    // Over another screen: why the window stays away, or null. Maps' report screen (its own process, so not one of
    // the screens followed here) always; Home when the owner chose it.
    private static String screenInFront(boolean overHome) {
        ComponentName top = topTask();
        if (top != null && (REPORT_ACTIVITY.equals(top.getClassName()) || REPORT_LAUNCHER.equals(top.getClassName()))) {
            return "report screen in front";
        }
        String home = overHome ? homePackage() : null;
        boolean found = home != null && top != null && home.equals(top.getPackageName());
        if (overHome) {
            reportHome = found;
            if (found != lastHome) {
                lastHome = found;
                ReportLog.i(TAG, "Home in front: " + found);
            }
        }
        return found ? "Home in front" : null;
    }

    // The top activity of the most recent task Android lists to Maps (the home app's and Maps' own; the card's is
    // skipped), or null. After an app is opened from Home, Home is still the most recent of them.
    @SuppressWarnings("deprecation")
    private static ComponentName topTask() {
        try {
            ActivityManager activities = (ActivityManager) application.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningTaskInfo> tasks = activities.getRunningTasks(8);
            for (ActivityManager.RunningTaskInfo task : tasks) {
                ComponentName top = task.topActivity;
                if (top == null || CARD_ACTIVITY.equals(top.getClassName())) continue;
                return top;
            }
        } catch (Throwable error) {
            note("tasks not read", error);
        }
        return null;
    }

    // The default home app's package, resolved once; null if there is none or the system asks the user.
    private static String homePackage() {
        if (!homeTried) {
            homeTried = true;
            try {
                ResolveInfo info = application.getPackageManager().resolveActivity(
                        new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), PackageManager.MATCH_DEFAULT_ONLY);
                String name = info != null && info.activityInfo != null ? info.activityInfo.packageName : null;
                homePackage = "android".equals(name) ? null : name;
            } catch (Throwable error) {
                note("home app not resolved", error);
            }
            ReportLog.i(TAG, "home app: " + homePackage);
        }
        return homePackage;
    }

    // A tap on the window: Maps' guidance screen, as a tap on its notification opens it; else Maps' launcher entry.
    private static void openMaps() {
        try {
            Notification guidance = guidanceNotification();
            PendingIntent target = guidance != null ? guidance.contentIntent : null;
            if (target != null) {
                target.send();
            } else {
                Intent launch = application.getPackageManager().getLaunchIntentForPackage(application.getPackageName());
                if (launch == null) return;
                application.startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED));
            }
            taps++;
            ReportLog.i(TAG, "window tapped: Maps opened" + (target != null ? "" : " (launcher entry)"));
        } catch (Throwable error) {
            note("Maps not opened from the window", error);
        }
    }

    // Made once, on BYD only.
    private static BydGear gearReader() {
        if (!gearTried) {
            gearTried = true;
            if (BydBatteryPatch.isByd()) {
                BydGear reader = new BydGear();
                gearStatus = reader.init(application);
                if (reader.ready()) gear = reader;
            } else {
                gearStatus = "not BYD";
            }
            ReportLog.i(TAG, "gear for D: " + gearStatus);
        }
        return gear;
    }

    // A Maps screen in front that has the input focus, or null.
    private static Activity focusedMaps() {
        for (Activity activity : inFront) {
            if (!activity.isFinishing() && !activity.isDestroyed() && activity.hasWindowFocus()) return activity;
        }
        return null;
    }

    private static void startCard() {
        if (SystemClock.uptimeMillis() < retryAt) return;
        Activity maps = focusedMaps();
        if (maps == null) return;
        try {
            if (display == null) {
                Point size = savedSize(application);
                DisplayManager displays = (DisplayManager) application.getSystemService(Context.DISPLAY_SERVICE);
                // No surface yet: the display is off and the card stopped until the window shows.
                display = displays.createVirtualDisplay("Maps Car floating window", size.x, size.y, CARD_DPI, null, DISPLAY_FLAGS);
            }
            Display target = display.getDisplay();
            Intent intent = new Intent(Intent.ACTION_MAIN)
                    .setClassName(application.getPackageName(), CARD_ACTIVITY)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NO_ANIMATION | Intent.FLAG_ACTIVITY_NO_USER_ACTION);
            ActivityOptions options = ActivityOptions.makeBasic().setLaunchDisplayId(target.getDisplayId());
            maps.startActivity(intent, options.toBundle());
            cardRequested = true;
            cardRequestedAt = SystemClock.uptimeMillis();
            cardStarts++;
            noCardLogged = false;
            ReportLog.i(TAG, "card started on display " + target.getDisplayId() + " (" + CARD_DPI + " dpi)");
            WeakReference<Activity> starter = new WeakReference<>(maps);
            main.postDelayed(() -> keepFocus(starter.get()), FOCUS_CHECK_MS);
        } catch (Throwable error) {
            startFailures++;
            droppedStarts++;
            retryAt = SystemClock.uptimeMillis() + retryDelay(startFailures);
            note("card not started (" + startFailures + ")", error);
        }
    }

    // After the card's start: if Maps lost the input focus to the card's display, Maps' task to the front again.
    private static void keepFocus(Activity maps) {
        try {
            if (maps == null || maps.isDestroyed() || !inFront.contains(maps)) return;
            if (maps.hasWindowFocus()) {
                ReportLog.i(TAG, "Maps kept the input focus");
                return;
            }
            ActivityManager activities = (ActivityManager) application.getSystemService(Context.ACTIVITY_SERVICE);
            activities.moveTaskToFront(maps.getTaskId(), 0);
            focusRestores++;
            ReportLog.i(TAG, "the card's display took the input focus: Maps' task moved to the front again");
            main.postDelayed(() -> ReportLog.i(TAG, "Maps has the input focus: " + (!maps.isDestroyed() && maps.hasWindowFocus())),
                    FOCUS_CHECK_MS);
        } catch (Throwable error) {
            note("input focus not restored", error);
        }
    }

    private static void showWindow() {
        if (window != null) return;
        if (card() == null || display == null) {
            if (!noCardLogged) ReportLog.i(TAG, "Maps covered during guidance, no card yet (Maps was not in front with the focus)");
            noCardLogged = true;
            return;
        }
        try {
            WindowManager windows = (WindowManager) application.getSystemService(Context.WINDOW_SERVICE);
            Point screen = screenSize(windows);
            Spot spot = Spot.load(application, screen);
            WindowManager.LayoutParams params = new WindowManager.LayoutParams(spot.width, spot.height,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSLUCENT);
            params.gravity = Gravity.BOTTOM | Gravity.RIGHT;
            params.x = spot.right;
            params.y = spot.bottom;
            params.alpha = opacity(application) / 100f;
            params.setTitle("Maps Car floating window");

            Context context = application;
            float density = context.getResources().getDisplayMetrics().density;
            int button = Math.round(40 * density);
            FrameLayout root = new FrameLayout(context);
            root.setBackgroundColor(Color.BLACK);
            SurfaceView view = new SurfaceView(context);
            view.getHolder().setFixedSize(spot.width, spot.height);
            view.getHolder().addCallback(new Picture());
            root.addView(view, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            root.addView(new Border(context, density), new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            Corner close = new Corner(context, true);
            close.setOnClickListener(clicked -> {
                dismissed = true;
                closedByX++;
                hideWindow("X");
            });
            root.addView(close, new FrameLayout.LayoutParams(button, button, Gravity.TOP | Gravity.RIGHT));
            Corner grip = new Corner(context, false);
            grip.setOnTouchListener(new Drag(windows, screen, true));
            root.addView(grip, new FrameLayout.LayoutParams(button, button, Gravity.TOP | Gravity.LEFT));
            root.setOnTouchListener(new Drag(windows, screen, false));

            windows.addView(root, params);
            window = root;
            windowParams = params;
            picture = view;
            reportShowing = true;
            shown++;
            ReportLog.i(TAG, "window shown: " + spot);
            ReportBuilder.saveSnapshot(application, true);
        } catch (Throwable error) {
            window = null;
            picture = null;
            note("window not shown", error);
        }
    }

    private static void hideWindow(String reason) {
        View current = window;
        if (current == null) return;
        window = null;
        picture = null;
        reportShowing = false;
        try {
            ((WindowManager) application.getSystemService(Context.WINDOW_SERVICE)).removeView(current);
        } catch (Throwable error) {
            note("window not removed", error);
        }
        detach();
        ReportLog.i(TAG, "window hidden (" + reason + ")");
        ReportBuilder.saveSnapshot(application, false);
    }

    // The window goes, the card is finished and its display released once the card is gone (or after a timeout); a
    // new guidance gets a new display.
    private static void tearDown(String reason) {
        hideWindow(reason);
        cardRequested = false;
        if (display == null) return;
        releaseRetiring();
        retiring = display;
        display = null;
        Activity current = card();
        if (current != null) {
            try {
                current.finishAndRemoveTask();
            } catch (Throwable error) {
                note("card not finished", error);
            }
            main.postDelayed(FloatingMaps::releaseRetiring, RELEASE_TIMEOUT_MS);
        } else {
            releaseRetiring();
        }
    }

    // The display flag destroys whatever is still on it, so nothing moves to the main display.
    private static void releaseRetiring() {
        VirtualDisplay current = retiring;
        if (current == null) return;
        retiring = null;
        try {
            current.release();
            ReportLog.i(TAG, "display released");
        } catch (Throwable error) {
            note("display not released", error);
        }
    }

    private static void attach(SurfaceHolder holder) {
        VirtualDisplay current = display;
        if (current != null) current.setSurface(holder.getSurface());
    }

    private static void detach() {
        VirtualDisplay current = display;
        try {
            if (current != null) current.setSurface(null);
        } catch (Throwable error) {
            note("picture not detached", error);
        }
    }

    /** The window's surface becomes the display's: the card wakes up and draws into it, and stops when it goes. */
    private static final class Picture implements SurfaceHolder.Callback {
        @Override
        public void surfaceCreated(SurfaceHolder holder) {
            attach(holder);
        }

        @Override
        public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
            VirtualDisplay current = display;
            if (current == null || width <= 0 || height <= 0) return;
            current.resize(width, height, CARD_DPI);
            attach(holder);
        }

        @Override
        public void surfaceDestroyed(SurfaceHolder holder) {
            detach();
        }
    }

    /** Moves the window (the body) or resizes it from the top-left corner (the grip); the bottom-right corner stays. */
    private static final class Drag implements View.OnTouchListener {
        private final WindowManager windows;
        private final Point screen;
        private final boolean resize;
        private final int slop;
        private float downX, downY;
        private int startRight, startBottom, startWidth, startHeight;
        private boolean moved;

        Drag(WindowManager windows, Point screen, boolean resize) {
            this.windows = windows;
            this.screen = screen;
            this.resize = resize;
            this.slop = Math.round(8 * application.getResources().getDisplayMetrics().density);
        }

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            WindowManager.LayoutParams params = windowParams;
            View current = window;
            if (params == null || current == null) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    startRight = params.x;
                    startBottom = params.y;
                    startWidth = params.width;
                    startHeight = params.height;
                    moved = false;
                    return true;
                case MotionEvent.ACTION_MOVE: {
                    int dx = Math.round(event.getRawX() - downX), dy = Math.round(event.getRawY() - downY);
                    if (!moved && Math.abs(dx) + Math.abs(dy) < slop) return true;
                    moved = true;
                    if (resize) {
                        params.width = Spot.clamp(startWidth - dx, MIN_WIDTH, screen.x - params.x);
                        params.height = Spot.clamp(startHeight - dy, MIN_HEIGHT, screen.y - params.y);
                    } else {
                        params.x = Spot.clamp(startRight - dx, 0, screen.x - params.width);
                        params.y = Spot.clamp(startBottom - dy, 0, screen.y - params.height);
                    }
                    windows.updateViewLayout(current, params);
                    return true;
                }
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    if (!moved && !resize && event.getActionMasked() == MotionEvent.ACTION_UP
                            && event.getEventTime() - event.getDownTime() < ViewConfiguration.getLongPressTimeout()) {
                        openMaps();
                        return true;
                    }
                    if (moved) {
                        Spot spot = new Spot(params.x, params.y, params.width, params.height);
                        spot.save(application);
                        // The card is laid out again for the new size once, at the end.
                        SurfaceView shownPicture = picture;
                        if (resize && shownPicture != null) shownPicture.getHolder().setFixedSize(params.width, params.height);
                        ReportLog.i(TAG, (resize ? "window resized: " : "window moved: ") + spot);
                    }
                    return true;
                default:
                    return true;
            }
        }
    }

    /** The window's place: offsets from the right and bottom edges, and its size, in px. */
    static final class Spot {
        final int right, bottom, width, height;

        Spot(int right, int bottom, int width, int height) {
            this.right = right;
            this.bottom = bottom;
            this.width = width;
            this.height = height;
        }

        /** The saved place on a screen of [screen] px, or the default: bottom right, 640×540, 24 px from the edges. */
        static Spot load(Context context, Point screen) {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            return fit(preferences.getInt(KEY_RIGHT, MARGIN), preferences.getInt(KEY_BOTTOM, MARGIN),
                    preferences.getInt(KEY_WIDTH, DEFAULT_WIDTH), preferences.getInt(KEY_HEIGHT, DEFAULT_HEIGHT), screen.x, screen.y);
        }

        /** Kept on a screen of [screenWidth]×[screenHeight]. Plain Java. */
        static Spot fit(int right, int bottom, int width, int height, int screenWidth, int screenHeight) {
            int w = clamp(width, MIN_WIDTH, Math.max(MIN_WIDTH, screenWidth));
            int h = clamp(height, MIN_HEIGHT, Math.max(MIN_HEIGHT, screenHeight));
            return new Spot(clamp(right, 0, Math.max(0, screenWidth - w)), clamp(bottom, 0, Math.max(0, screenHeight - h)), w, h);
        }

        static int clamp(int value, int min, int max) {
            return Math.max(min, Math.min(max, value));
        }

        void save(Context context) {
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                    .putInt(KEY_RIGHT, right).putInt(KEY_BOTTOM, bottom).putInt(KEY_WIDTH, width).putInt(KEY_HEIGHT, height).apply();
        }

        @Override
        public String toString() {
            return width + "x" + height + ", right " + right + ", bottom " + bottom;
        }
    }

    private static Point savedSize(Context context) {
        WindowManager windows = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        Spot spot = Spot.load(context, screenSize(windows));
        return new Point(spot.width, spot.height);
    }

    private static Point screenSize(WindowManager windows) {
        Point size = new Point();
        windows.getDefaultDisplay().getRealSize(size);
        return size;
    }

    /** A thin frame around the picture. */
    private static final class Border extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bounds = new RectF();

        Border(Context context, float density) {
            super(context);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(2, Math.round(density * 1.5f)));
            paint.setColor(0x99FFFFFF);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float inset = paint.getStrokeWidth() / 2;
            bounds.set(inset, inset, getWidth() - inset, getHeight() - inset);
            canvas.drawRect(bounds, paint);
        }
    }

    /** The X (close) at the top right, or the resize grip at the top left. */
    private static final class Corner extends View {
        private final boolean close;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG), line = new Paint(Paint.ANTI_ALIAS_FLAG);

        Corner(Context context, boolean close) {
            super(context);
            this.close = close;
            fill.setColor(0xB3000000);
            line.setColor(Color.WHITE);
            line.setStyle(Paint.Style.STROKE);
            line.setStrokeCap(Paint.Cap.ROUND);
            line.setStrokeWidth(Math.max(2, Math.round(2.5f * context.getResources().getDisplayMetrics().density)));
            setContentDescription(close ? "Close" : "Resize");
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2;
            canvas.drawCircle(w / 2, h / 2, r * 0.8f, fill);
            float a = r * 0.35f;
            if (close) {
                canvas.drawLine(w / 2 - a, h / 2 - a, w / 2 + a, h / 2 + a, line);
                canvas.drawLine(w / 2 + a, h / 2 - a, w / 2 - a, h / 2 + a, line);
            } else {
                // Two diagonal strokes pointing to the top-left corner.
                canvas.drawLine(w / 2 - a, h / 2 + a * 0.2f, w / 2 + a * 0.2f, h / 2 - a, line);
                canvas.drawLine(w / 2 - a * 0.1f, h / 2 + a, w / 2 + a, h / 2 - a * 0.1f, line);
            }
        }
    }

    private static void note(String what, Throwable error) {
        lastError = what + ": " + error;
        ReportLog.w(TAG, what, error);
    }

    // The owner's choices, from the Settings dialog: the window on (by default), only in D (by default), kept off Home
    // (not by default), its size, opacity and place. A change applies the next time the window shows.

    static boolean userOn(Context context) {
        return preference(context, KEY_ON, true);
    }

    /** Only in D; a test build's "Hide in P and R" choice carries over until this one is set. */
    static boolean onlyInDrive(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            return preferences.getBoolean(KEY_ONLY_D, preferences.getBoolean(KEY_HIDE_P_R, true));
        } catch (RuntimeException error) {
            return true;
        }
    }

    static boolean hideOverHome(Context context) {
        return preference(context, KEY_NOT_OVER_HOME, false);
    }

    private static boolean preference(Context context, String key, boolean fallback) {
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(key, fallback);
        } catch (RuntimeException error) {
            return fallback;
        }
    }

    static int opacity(Context context) {
        try {
            return opacityChoice(context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getInt(KEY_OPACITY, OPACITIES[0]));
        } catch (RuntimeException error) {
            return OPACITIES[0];
        }
    }

    /** A stored opacity kept to the nearest choice (an earlier version's 85, 70 or 55 included). Plain Java. */
    static int opacityChoice(int stored) {
        int nearest = OPACITIES[0];
        for (int choice : OPACITIES) {
            if (Math.abs(choice - stored) < Math.abs(nearest - stored)) nearest = choice;
        }
        return nearest;
    }

    /** The size choice [width]×[height] is, or -1 for a size set by dragging. Plain Java. */
    static int sizeChoice(int width, int height) {
        for (int i = 0; i < SIZES.length; i++) {
            if (SIZES[i][0] == width && SIZES[i][1] == height) return i;
        }
        return -1;
    }

    private static void setUserOn(Activity host, boolean on) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_ON, on).apply();
        ReportLog.i(TAG, "Floating Maps window turned " + (on ? "on" : "off") + " in Settings");
        if (!installed) return;
        if (on) watch();
        else tearDown("turned off");
    }

    private static void setOnlyInDrive(Activity host, boolean only) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_ONLY_D, only).apply();
        ReportLog.i(TAG, "only in D " + (only ? "on" : "off") + " in Settings");
    }

    private static void setHideOverHome(Activity host, boolean hide) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_NOT_OVER_HOME, hide).apply();
        ReportLog.i(TAG, "hidden over Home " + (hide ? "on" : "off") + " in Settings");
    }

    private static void setSize(Activity host, int choice) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                .putInt(KEY_WIDTH, SIZES[choice][0]).putInt(KEY_HEIGHT, SIZES[choice][1]).apply();
        ReportLog.i(TAG, "window size " + SIZES[choice][0] + "x" + SIZES[choice][1] + " in Settings");
    }

    // The saved size's choice, or -1.
    private static int savedSizeChoice(Context context) {
        try {
            Point size = savedSize(context);
            return sizeChoice(size.x, size.y);
        } catch (RuntimeException error) {
            return -1;
        }
    }

    private static void setOpacity(Activity host, int percent) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putInt(KEY_OPACITY, opacityChoice(percent)).apply();
        ReportLog.i(TAG, "window opacity " + opacityChoice(percent) + "% in Settings");
    }

    private static void resetSpot(Activity host) {
        host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                .remove(KEY_RIGHT).remove(KEY_BOTTOM).remove(KEY_WIDTH).remove(KEY_HEIGHT).apply();
        ReportLog.i(TAG, "window place reset");
    }

    // Settings row. The patch adds it to Maps' Settings list.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "หน้าต่างลอย" : "Floating window";
    }

    /** Injection point: the row subtitle, the state. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.FLOATING_MAPS)) {
            return (thai ? "ปิดชั่วคราว (เปิดคืนใน " : "Off for now (back on in ") + ReportPatch.reportPlace(context, thai) + ")";
        }
        if (!userOn(context)) return thai ? "ปิด" : "Off";
        if (!Settings.canDrawOverlays(context)) {
            return thai ? "เปิด · ยังไม่ได้อนุญาต" : "On · not allowed yet";
        }
        return thai ? "เปิด" : "On";
    }

    /** Injection point: the row's click action. */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showSettings(context, container);
    }

    private static void showSettings(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the floating window settings: " + context);
            return;
        }
        Activity host = activity;
        boolean thai = UiDensityPatch.isThai(host);
        M3.Builder builder = new M3.Builder(host).setTitle(getSettingsTitle(host));
        if (!SafeMode.on(host, SafeMode.FLOATING_MAPS)) {
            builder.setMessage((thai ? "ตอนนี้ปิดอยู่ในสวิตช์ของ " : "It is switched off in ") + ReportPatch.reportPlace(host, thai)
                            + (thai ? "" : "."))
                    .setPositiveButton(thai ? "ปิดหน้าต่าง" : "Close", null)
                    .show();
            return;
        }
        // The builder's context and colors (Maps' night or day), so the views match the dialog.
        SettingsViews views = new SettingsViews(host, builder.getContext(), builder.colors());
        M3.Dialog dialog = builder.setView(views.root).setPositiveButton(thai ? "ปิดหน้าต่าง" : "Close", null).create();
        views.dialog = dialog;
        views.update();
        dialog.show();
    }

    private static Intent overlayPage(Context context) {
        return new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:" + context.getPackageName()));
    }

    /**
     * The Settings dialog: the on/off switch, "Display over other apps" while it is missing, then the window's choices
     * (only in D, off Home, size, opacity, place). Every tap applies at once. Material 3 (M3) in Maps' night or
     * day colors; sizes are for a head unit at arm's length, as in BYD battery's dialog. [primary] and [secondary] are
     * the text colors, [accent] the scheme's primary.
     */
    private static final class SettingsViews {
        final ScrollView root;
        M3.Dialog dialog;
        private final Activity host;
        private final Context themed;
        private final M3.Colors colors;
        private final boolean thai, hasPage, gearAvailable;
        private final int primary, secondary, accent;
        private final LinearLayout content, permission, windowSection;
        private final M3.Switch toggle, gearToggle, homeToggle;
        private final TextView status, gearStatusText, homeStatusText, resetCaption;
        private final TextView[] sizeChips, opacityChips;

        SettingsViews(Activity host, Context themed, M3.Colors colors) {
            this.host = host;
            this.themed = themed;
            this.colors = colors;
            thai = UiDensityPatch.isThai(host);
            primary = colors.onSurface;
            secondary = colors.onSurfaceVariant;
            accent = colors.primary;
            Intent page = overlayPage(host);
            hasPage = page.resolveActivity(host.getPackageManager()) != null;
            gearAvailable = installed && gearReader() != null;

            content = vertical();
            content.setPadding(0, px(4), 0, px(8));
            root = new ScrollView(themed);
            root.addView(content);

            // On/off. The whole row is the touch target.
            status = text(14, secondary, false);
            toggle = new M3.Switch(themed, colors);
            LinearLayout switchRow = switchRow(thai ? "แสดงระหว่างนำทาง" : "Show during guidance", 18, status, toggle,
                    () -> setUserOn(host, !userOn(host)));
            switchRow.setMinimumHeight(px(64));
            switchRow.setPadding(px(24), px(8), px(16), px(8));
            content.addView(switchRow);

            TextView intro = text(15, secondary, false);
            intro.setLineSpacing(0, 1.2f);
            intro.setPadding(px(24), px(4), px(24), px(8));
            intro.setText(thai
                    ? "เมื่อกล้อง แอปอื่น หรือหน้า Home บัง Maps หน้าต่างเล็กจะแสดงจุดเลี้ยวถัดไป แผนที่ และเวลาถึง"
                    : "When the camera, another app or Home covers Maps, a small window shows the next turn, the map and"
                    + " the arrival time.");
            content.addView(intro);

            // "Display over other apps", only while it is missing.
            permission = vertical();
            permission.setPadding(px(24), 0, px(24), px(8));
            TextView permissionText = text(15, primary, false);
            permissionText.setLineSpacing(0, 1.2f);
            permission.addView(permissionText);
            if (hasPage) {
                permissionText.setText(thai
                        ? "หน้าต่างต้องได้สิทธิ์แสดงทับแอปอื่น กด อนุญาต แล้วเปิดสวิตช์ของ Maps ในหน้าที่เปิดขึ้น"
                        : "The window needs \"Display over other apps\". Tap Allow, then turn it on for Maps on the page that opens.");
                TextView allow = text(16, accent, true);
                allow.setText(thai ? "อนุญาต" : "Allow");
                allow.setMinHeight(px(48));
                allow.setGravity(Gravity.CENTER_VERTICAL);
                selectable(allow);
                allow.setOnClickListener(view -> openPage(page));
                permission.addView(allow);
            } else {
                permissionText.setText((thai ? "หน้าต่างต้องได้สิทธิ์แสดงทับแอปอื่น สั่งครั้งเดียวผ่าน ADB:\n"
                        : "The window needs \"Display over other apps\". Run this once over ADB:\n")
                        + "adb shell appops set " + host.getPackageName() + " SYSTEM_ALERT_WINDOW allow");
                permissionText.setTextIsSelectable(true);
            }
            content.addView(permission);

            content.addView(divider());

            // The window's choices.
            windowSection = vertical();
            windowSection.setPadding(px(24), px(20), px(24), 0);
            TextView header = M3.label(themed, colors, thai ? "หน้าต่าง" : "Window");
            header.setPadding(0, 0, 0, px(8));
            windowSection.addView(header);

            gearStatusText = text(14, secondary, false);
            gearToggle = new M3.Switch(themed, colors);
            if (gearAvailable) {
                LinearLayout gearRow = switchRow(thai ? "แสดงเฉพาะเกียร์ D" : "Only in D", 16, gearStatusText, gearToggle,
                        () -> setOnlyInDrive(host, !onlyInDrive(host)));
                gearRow.setMinimumHeight(px(56));
                gearRow.setPadding(0, px(4), 0, px(4));
                windowSection.addView(gearRow);
            }

            homeStatusText = text(14, secondary, false);
            homeToggle = new M3.Switch(themed, colors);
            LinearLayout homeRow = switchRow(thai ? "ซ่อนบนหน้า Home" : "Hide over Home", 16, homeStatusText, homeToggle,
                    () -> setHideOverHome(host, !hideOverHome(host)));
            homeRow.setMinimumHeight(px(56));
            homeRow.setPadding(0, px(4), 0, px(4));
            windowSection.addView(homeRow);

            String[] sizeNames = thai ? new String[]{"เล็ก", "กลาง", "ใหญ่"} : new String[]{"Small", "Medium", "Large"};
            sizeChips = chipRow(thai ? "ขนาด" : "Size", sizeNames, choice -> setSize(host, choice));
            String[] opacityNames = new String[OPACITIES.length];
            for (int i = 0; i < OPACITIES.length; i++) opacityNames[i] = OPACITIES[i] + "%";
            opacityChips = chipRow(thai ? "ความทึบ" : "Opacity", opacityNames, choice -> setOpacity(host, OPACITIES[choice]));

            TextView reset = text(16, accent, true);
            reset.setText(thai ? "ตำแหน่งเริ่มต้น" : "Reset place");
            reset.setMinHeight(px(48));
            reset.setGravity(Gravity.CENTER_VERTICAL);
            reset.setPadding(0, px(8), 0, 0);
            selectable(reset);
            resetCaption = text(14, secondary, false);
            resetCaption.setLineSpacing(0, 1.2f);
            reset.setOnClickListener(view -> {
                resetSpot(host);
                resetCaption.setText(thai ? "หน้าต่างจะกลับไปมุมขวาล่าง ขนาดกลาง ตั้งแต่ครั้งถัดไปที่แสดง"
                        : "The window goes back to the bottom right at medium size the next time it shows.");
                update();
            });
            windowSection.addView(reset);
            windowSection.addView(resetCaption);

            TextView handling = text(14, secondary, false);
            handling.setLineSpacing(0, 1.2f);
            handling.setPadding(0, px(8), 0, 0);
            handling.setText(thai
                    ? "แตะหน้าต่างเพื่อเปิด Maps ลากเพื่อย้าย ลากมุมซ้ายบนเพื่อปรับขนาด และกด X เพื่อซ่อนจนกว่าจะกลับมาที่ Maps"
                    : "Tap the window to open Maps. Drag it to move it, drag its top-left corner to resize it, and tap X"
                    + " to hide it until you are back in Maps.");
            windowSection.addView(handling);
            content.addView(windowSection);
        }

        void update() {
            boolean on = userOn(host), allowed = Settings.canDrawOverlays(host);
            toggle.setChecked(on);
            status.setText(!on ? (thai ? "ปิด" : "Off")
                    : allowed ? (thai ? "เปิด · ขึ้นเมื่อหน้าจออื่นบัง Maps" : "On · shows when another screen covers Maps")
                    : (thai ? "เปิด · ยังไม่ได้อนุญาตให้แสดงทับแอปอื่น" : "On · not allowed to display over other apps yet"));
            permission.setVisibility(on && !allowed ? View.VISIBLE : View.GONE);
            boolean only = onlyInDrive(host);
            gearToggle.setChecked(only);
            gearStatusText.setText(only ? (thai ? "ซ่อนตอน P, R และ N · กลับมาเมื่ออยู่ D ครบ 30 วินาที"
                    : "Hidden in P, R and N; shows again after 30 s in D") : (thai ? "แสดงทุกเกียร์" : "Shown in every gear"));
            boolean offHome = hideOverHome(host);
            homeToggle.setChecked(offHome);
            homeStatusText.setText(offHome ? (thai ? "ซ่อนขณะอยู่หน้า Home" : "Hidden while Home is on screen")
                    : (thai ? "แสดงบนหน้า Home ด้วย" : "Shown over Home too"));
            paintSegments(sizeChips, savedSizeChoice(host));
            int chosen = opacity(host), chosenIndex = -1;
            for (int i = 0; i < OPACITIES.length; i++) if (OPACITIES[i] == chosen) chosenIndex = i;
            paintSegments(opacityChips, chosenIndex);
            // Off: the choices stay visible but cannot be changed.
            windowSection.setAlpha(on ? 1f : 0.4f);
            enable(windowSection, on);
        }

        private void openPage(Intent page) {
            try {
                host.startActivity(page);
                ReportLog.i(TAG, "display over other apps page opened");
                // The state shown here would be old when the owner comes back: the dialog closes.
                if (dialog != null) dialog.dismiss();
            } catch (RuntimeException error) {
                note("display over other apps page not opened", error);
            }
        }

        // A switch row: the title and [statusText] on the left, [toggle] on the right. The whole row is the touch
        // target; [flip] stores the new choice, then the dialog shows it.
        private LinearLayout switchRow(String title, int titleSp, TextView statusText, M3.Switch toggleView, Runnable flip) {
            LinearLayout row = horizontal();
            selectable(row);
            LinearLayout texts = vertical();
            TextView titleText = text(titleSp, primary, false);
            titleText.setText(title);
            texts.addView(titleText);
            texts.addView(statusText);
            row.addView(texts, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1));
            toggleView.setClickable(false);
            toggleView.setFocusable(false);
            row.addView(toggleView, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            row.setOnClickListener(view -> {
                flip.run();
                update();
            });
            return row;
        }

        // A label and a segmented button, one segment per name; [pick] stores the chosen index, then the dialog shows it.
        private TextView[] chipRow(String label, String[] names, IntConsumer pick) {
            TextView title = text(14, secondary, false);
            title.setText(label);
            title.setPadding(0, px(12), 0, 0);
            windowSection.addView(title);
            LinearLayout row = horizontal();
            TextView[] chips = new TextView[names.length];
            for (int i = 0; i < names.length; i++) {
                int choice = i;
                TextView chip = text(15, primary, false);
                chip.setGravity(Gravity.CENTER);
                chip.setMinHeight(px(48));
                chip.setPadding(px(8), px(4), px(8), px(4));
                chip.setText(names[i]);
                chip.setOnClickListener(view -> {
                    pick.accept(choice);
                    update();
                });
                // The segments share their borders: each after the first overlaps the one before by the stroke.
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.MATCH_PARENT, 1);
                params.setMargins(i == 0 ? 0 : -Math.max(1, px(1)), px(4), 0, px(4));
                row.addView(chip, params);
                chips[i] = chip;
            }
            windowSection.addView(row);
            return chips;
        }

        private void paintSegments(TextView[] segments, int selected) {
            for (int i = 0; i < segments.length; i++) {
                M3.segment(segments[i], colors, i == selected, i == 0, i == segments.length - 1);
            }
        }

        private static void enable(View view, boolean enabled) {
            view.setEnabled(enabled);
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) enable(group.getChildAt(i), enabled);
            }
        }

        private View divider() {
            View divider = M3.divider(themed, colors);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, px(1)));
            params.setMargins(0, px(8), 0, 0);
            divider.setLayoutParams(params);
            return divider;
        }

        // [medium] is M3's medium weight (the old bold).
        private TextView text(int sp, int color, boolean medium) {
            return M3.text(themed, sp, color, medium);
        }

        private LinearLayout vertical() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.VERTICAL);
            return layout;
        }

        private LinearLayout horizontal() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.HORIZONTAL);
            layout.setGravity(Gravity.CENTER_VERTICAL);
            return layout;
        }

        private void selectable(View view) {
            M3.selectable(view, colors);
        }

        private int px(int dp) {
            return Math.round(dp * themed.getResources().getDisplayMetrics().density);
        }
    }

    private static String sizeName(int choice) {
        return choice == 0 ? "small" : choice == 1 ? "medium" : choice == 2 ? "large" : "dragged";
    }

    /** For the problem report (main process). */
    static JSONObject report(Context context) throws JSONException {
        String error = lastError;
        Spot spot;
        try {
            spot = Spot.load(context, screenSize((WindowManager) context.getSystemService(Context.WINDOW_SERVICE)));
        } catch (RuntimeException failure) {
            spot = null;
        }
        return new JSONObject()
                .put("on", userOn(context))
                .put("allowed", Settings.canDrawOverlays(context))
                .put("guidance", reportGuiding)
                .put("card", reportCard)
                .put("showing", reportShowing)
                .put("card_starts", cardStarts)
                .put("dropped_starts", droppedStarts)
                .put("shown", shown)
                .put("closed_by_x", closedByX)
                .put("focus_restores", focusRestores)
                .put("notification", reportFlags >= 0 ? "0x" + Integer.toHexString(reportFlags) : JSONObject.NULL)
                .put("notification_actions", reportActions)
                .put("taps", taps)
                .put("opacity", opacity(context))
                .put("size", spot != null ? sizeName(sizeChoice(spot.width, spot.height)) : JSONObject.NULL)
                .put("only_in_d", onlyInDrive(context))
                .put("hide_over_home", hideOverHome(context))
                .put("home_in_front", reportHome)
                .put("gear", reportGear != null ? reportGear : JSONObject.NULL)
                .put("gear_reader", gearStatus != null ? gearStatus : JSONObject.NULL)
                .put("place", spot != null ? spot.toString() : JSONObject.NULL)
                .put("last_error", error != null ? error : JSONObject.NULL);
    }
}
