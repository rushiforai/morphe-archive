package io.github.daydreamfix.ext;

import android.app.AutomaticZenRule;
import android.app.NotificationManager;
import android.net.Uri;
import android.os.SystemClock;
import android.service.notification.Condition;
import android.service.notification.ZenPolicy;
import java.util.Map;
import android.app.Activity;
import android.app.Application;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Stands in for the system VrManagerService, which no longer exists on recent Android.
 *
 * Without it vrcore's VrCoreListenerService is never bound, so vrcore never learns it is in VR:
 * notifications unbind at once, the capture service has no active target, and VrSysUiService never
 * gets its lifecycle. Instead of patching each symptom, this runs the real listener service inside
 * vrcore's main process and feeds it the same calls the system would make.
 *
 * Contains no Xposed code, so the Morphe build can reuse it.
 */
final class VrModeEmulator {
    private static final String TAG = "DaydreamVrMode";
    private static final String ACTION = "io.github.daydreamfix.VR_ACTIVITY";
    private static final String VRCORE = "com.google.vr.vrcore";
    private static final String LISTENER =
            "com.google.vr.vrcore.common.VrCoreListenerService";

    private static final int STATE_PAUSED = 0;
    private static final int STATE_RESUMED = 1;
    private static final int STATE_BEAT = 2;
    private static final int STATE_HOLD = 3;

    private static final long BEAT_MS = 2000;
    /** A VR activity that stops reporting has crashed or been frozen. */
    private static final long BEAT_TIMEOUT_MS = 7000;
    /** Gap allowed between one VR activity pausing and the next one resuming. */
    private static final long PAUSE_GRACE_MS = 1500;
    /** vrcore's own transition activities are not VR activities but do not end the session. */
    private static final long HOLD_GRACE_MS = 8000;

    private static final Uri ZEN_CONDITION = Uri.parse("condition://com.google.vr.vrcore/daydream_vr");
    private static final String ZEN_CONFIG_ACTIVITY =
            "com.google.vr.vrcore.modules.sysui.dashboard.DashboardActivity";

    private VrModeEmulator() {}

    // ── vrcore main process: owns the listener service ─────────────────────────

    private static Application sApp;
    private static Service sListener;
    private static ComponentName sCurrent;
    private static final Handler sMain = new Handler(Looper.getMainLooper());
    private static final Runnable sExit = VrModeEmulator::exitVr;
    /** Until then a late pause from the previous activity must not shorten a transition's grace. */
    private static long sHoldUntil;

    static void install(Application app) {
        sApp = app;
        IntentFilter filter = new IntentFilter(ACTION);
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override public void onReceive(Context c, Intent i) {
                String flat = i.getStringExtra("component");
                ComponentName comp = flat == null ? null : ComponentName.unflattenFromString(flat);
                if (comp != null) onReport(comp, i.getIntExtra("state", STATE_PAUSED));
            }
        };
        app.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
        // A crash during a session must not leave the phone in Do Not Disturb.
        setPopupsHidden(false);
        Log.i(TAG, "emulator installed in " + app.getPackageName());
    }

    private static void onReport(ComponentName comp, int state) {
        switch (state) {
            case STATE_RESUMED:
                sHoldUntil = 0;
                enterVr(comp);
                armExit(BEAT_TIMEOUT_MS);
                break;
            case STATE_BEAT:
                // A beat only refreshes the session: it may be older than a newer resume. It
                // starts one only if vrcore restarted and lost its state.
                if (sListener == null) enterVr(comp);
                if (comp.equals(sCurrent)) armExit(BEAT_TIMEOUT_MS);
                break;
            case STATE_HOLD:
                if (sListener != null) {
                    sHoldUntil = SystemClock.uptimeMillis() + HOLD_GRACE_MS;
                    armExit(HOLD_GRACE_MS);
                }
                break;
            default:
                if (comp.equals(sCurrent)) {
                    armExit(Math.max(PAUSE_GRACE_MS, sHoldUntil - SystemClock.uptimeMillis()));
                }
                break;
        }
    }

    private static void armExit(long delayMs) {
        sMain.removeCallbacks(sExit);
        sMain.postDelayed(sExit, delayMs);
    }

    private static void enterVr(ComponentName comp) {
        try {
            if (sListener == null) {
                sListener = createListener();
                setPopupsHidden(true);
            }
            if (comp.equals(sCurrent)) return;
            Log.i(TAG, "VR activity: " + sCurrent + " -> " + comp);
            sCurrent = comp;
            Method changed = sListener.getClass().getMethod(
                    "onCurrentVrActivityChanged", ComponentName.class);
            changed.invoke(sListener, comp);
        } catch (Throwable t) {
            Log.e(TAG, "enterVr failed", t);
        }
    }

    private static void exitVr() {
        if (sListener == null) return;
        Log.i(TAG, "leaving VR, last activity " + sCurrent);
        Service listener = sListener;
        sListener = null;
        sCurrent = null;
        setPopupsHidden(false);
        try {
            listener.onUnbind(new Intent());
            listener.onDestroy();
        } catch (Throwable t) {
            Log.e(TAG, "exitVr failed", t);
        }
    }

    /**
     * Real Daydream had the system hide notification popups in VR. Android only applies "hide
     * popups" to notifications it silences, so messages are silenced for the session; calls, alarms
     * and media still go through, and everything stays in the shade and in the O menu.
     */
    private static void setPopupsHidden(boolean hidden) {
        try {
            NotificationManager nm = sApp.getSystemService(NotificationManager.class);
            if (!nm.isNotificationPolicyAccessGranted()) {
                if (hidden) Log.w(TAG, "no Do Not Disturb access, notification popups stay visible");
                return;
            }
            String id = null;
            for (Map.Entry<String, AutomaticZenRule> e : nm.getAutomaticZenRules().entrySet()) {
                if (ZEN_CONDITION.equals(e.getValue().getConditionId())) id = e.getKey();
            }
            if (id == null) {
                if (!hidden) return;
                ZenPolicy policy = new ZenPolicy.Builder()
                        .allowAlarms(true).allowMedia(true).allowSystem(true)
                        .allowCalls(ZenPolicy.PEOPLE_TYPE_ANYONE).allowRepeatCallers(true)
                        .allowMessages(ZenPolicy.PEOPLE_TYPE_NONE)
                        .allowConversations(ZenPolicy.CONVERSATION_SENDERS_NONE)
                        .allowReminders(false).allowEvents(false)
                        .showPeeking(false).showFullScreenIntent(true)
                        .showStatusBarIcons(true).showBadges(true).showInNotificationList(true)
                        .build();
                id = nm.addAutomaticZenRule(new AutomaticZenRule("Daydream VR", null,
                        new ComponentName(sApp, ZEN_CONFIG_ACTIVITY), ZEN_CONDITION, policy,
                        NotificationManager.INTERRUPTION_FILTER_PRIORITY, true));
            }
            nm.setAutomaticZenRuleState(id, new Condition(ZEN_CONDITION, "Daydream VR",
                    hidden ? Condition.STATE_TRUE : Condition.STATE_FALSE));
            Log.i(TAG, "notification popups hidden: " + hidden);
        } catch (Throwable t) {
            Log.e(TAG, "could not change notification popups", t);
        }
    }

    /** Builds the service the way ActivityThread would, then runs what a system bind runs. */
    private static Service createListener() throws Exception {
        // The first entry would open a "grant special permissions" activity inside the headset.
        PreferenceManager.getDefaultSharedPreferences(sApp).edit()
                .putLong("SpecialPermissionRequestTimeMillis::", System.currentTimeMillis())
                .apply();
        Class<?> cls = sApp.getClassLoader().loadClass(LISTENER);
        Service service = (Service) cls.getDeclaredConstructor().newInstance();
        Method attach = ContextWrapper.class.getDeclaredMethod("attachBaseContext", Context.class);
        attach.setAccessible(true);
        attach.invoke(service, sApp);
        Field application = Service.class.getDeclaredField("mApplication");
        application.setAccessible(true);
        application.set(service, sApp);
        service.onCreate();
        service.onBind(new Intent("android.service.vr.VrListenerService"));
        Log.i(TAG, "listener service started");
        return service;
    }

    // ── every VR client process: reports which VR activity is on top ───────────

    private static final Map<Activity, Boolean> sVrActivities =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static Activity sResumed;
    private static Runnable sBeat;

    static void onVrModeSet(Activity activity, boolean enabled) {
        sVrActivities.put(activity, enabled);
        if (activity != sResumed) return;
        if (enabled) {
            report(activity, STATE_RESUMED);
            startBeat(activity);
        } else {
            stopBeat();
            report(activity, STATE_PAUSED);
        }
    }

    static void onResumed(Activity activity) {
        sResumed = activity;
        if (Boolean.TRUE.equals(sVrActivities.get(activity))) {
            report(activity, STATE_RESUMED);
            startBeat(activity);
        } else if (isTransition(activity)) {
            report(activity, STATE_HOLD);
        }
    }

    static void onPaused(Activity activity) {
        if (sResumed == activity) sResumed = null;
        stopBeat();
        if (Boolean.TRUE.equals(sVrActivities.get(activity))) {
            report(activity, STATE_PAUSED);
        } else if (isTransition(activity)) {
            report(activity, STATE_HOLD);
        }
    }

    private static boolean isTransition(Activity activity) {
        String name = activity.getClass().getName();
        return name.equals("com.google.vr.vrcore.daydream.DonPrepareActivity")
                || name.equals("com.google.vr.vrcore.transition.TransitionViewActivity")
                || name.equals("com.google.vr.vrcore.controller.util.DirectPairTransitionActivity");
    }

    private static void startBeat(Activity activity) {
        stopBeat();
        sBeat = new Runnable() {
            @Override public void run() {
                report(activity, STATE_BEAT);
                sMain.postDelayed(this, BEAT_MS);
            }
        };
        sMain.postDelayed(sBeat, BEAT_MS);
    }

    private static void stopBeat() {
        if (sBeat != null) sMain.removeCallbacks(sBeat);
        sBeat = null;
    }

    private static void report(Activity activity, int state) {
        try {
            activity.getApplicationContext().sendBroadcast(new Intent(ACTION)
                    .setPackage(VRCORE)
                    .putExtra("component", activity.getComponentName().flattenToString())
                    .putExtra("state", state));
        } catch (Throwable t) {
            Log.e(TAG, "report failed", t);
        }
    }
}
