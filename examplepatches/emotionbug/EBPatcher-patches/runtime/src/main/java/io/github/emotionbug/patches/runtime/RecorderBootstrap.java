package io.github.emotionbug.patches.runtime;

import android.Manifest;
import android.app.Activity;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.telecom.TelecomManager;
import android.telephony.TelephonyManager;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import rikka.shizuku.Shizuku;
import rikka.shizuku.ShizukuProvider;

/** Optional Shizuku authorization; recording remains controlled by the original dialer. */
public final class RecorderBootstrap implements Application.ActivityLifecycleCallbacks {
    public static final String RECORDER_PROCESS_SUFFIX = ":ebpatcher_recorder";
    // 14.4.0 AndroidManifest.xml: the sole original MAIN + LAUNCHER activity.
    private static final String LAUNCHER = "com.skt.prod.dialer.activities.main.MainActivity";
    private static final int REQUEST_PERMISSION = 29043;
    private static boolean installed;

    private final Application app;
    private final StartupPermissionPolicy policy = new StartupPermissionPolicy();
    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "EBPatcher-permission");
        thread.setDaemon(true);
        return thread;
    });
    private final Shizuku.OnBinderReceivedListener received = this::schedule;
    private final Shizuku.OnBinderDeadListener dead = this::schedule;
    private final BroadcastReceiver phoneState = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) { schedule(); }
    };
    // Lifecycle callbacks own resumed; the worker owns the registration flags.
    private Activity resumed;
    private boolean receivedRegistered;
    private boolean deadRegistered;
    private boolean phoneRegistered;

    private RecorderBootstrap(Application app) { this.app = app; }

    /** True only in our private service process: never run the original phone Application there. */
    public static boolean initialize(Application app) {
        final String process;
        try {
            process = Application.getProcessName();
        } catch (RuntimeException | LinkageError unavailable) {
            // No hidden process lookup or changes to unknown/ordinary app processes.
            return false;
        }
        if (process != null && process.endsWith(RECORDER_PROCESS_SUFFIX)) {
            try {
                ShizukuProvider.disableAutomaticSuiInitialization();
                ShizukuProvider.enableMultiProcessSupport(false);
                ShizukuProvider.requestBinderForNonProviderProcess(app);
            } catch (RuntimeException | LinkageError unavailable) {
                // The recorder remains unavailable; original telephony initialization is NOT a fallback.
            }
            return true;
        }
        if ((app.getPackageName() + SummaryJobService.PROCESS_SUFFIX).equals(process)
                || (app.getPackageName() + ":ebpatcher_models").equals(process)) return true;
        try {
            if (!app.getPackageName().equals(process) || installed) return false;
            installed = true;
            SummaryScheduler.initialize(app);
            ShizukuProvider.enableMultiProcessSupport(true);
            app.registerActivityLifecycleCallbacks(new RecorderBootstrap(app));
        } catch (RuntimeException | LinkageError unavailable) {
            // Optional bootstrap failures must not escape into the original Application.onCreate.
        }
        return false;
    }

    private void schedule() {
        try {
            worker.execute(this::observeEligibility);
        } catch (RejectedExecutionException finished) {
            // A callback already queued when listeners were removed has no further work.
        } catch (RuntimeException | LinkageError unavailable) {
            // Even failure to create the optional worker must not escape a lifecycle callback.
            policy.finish();
            app.unregisterActivityLifecycleCallbacks(this);
        }
    }

    private void observeEligibility() {
        long token = policy.observationToken();
        if (token < 0) {
            unwatch();
            if (policy.finished()) dispose();
            return;
        }
        try {
            if (!ExtensionSettings.automaticPermission(app)) {
                policy.finish();
                return;
            }
            watch();
            // These optional Binder calls never run on the phone application's main thread.
            boolean available = Shizuku.pingBinder();
            boolean granted = available && Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED;
            StartupPermissionPolicy.CallState state = available && !granted
                    ? readCallState(app) : StartupPermissionPolicy.CallState.UNKNOWN;
            if (policy.claimRequest(token, available, granted, state)) {
                // Claim first, including when requestPermission fails or the user denies it.
                Shizuku.requestPermission(REQUEST_PERMISSION);
            }
        } catch (RuntimeException | LinkageError unavailable) {
            // Disable only automatic authorization for this launch; Shizuku manages later grants.
            policy.finish();
        } finally {
            if (policy.finished()) dispose();
        }
    }

    @SuppressWarnings("deprecation")
    static StartupPermissionPolicy.CallState readCallState(Context context) {
        try {
            if (context.checkSelfPermission(Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED)
                return StartupPermissionPolicy.CallState.UNKNOWN;
            TelecomManager telecom = context.getSystemService(TelecomManager.class);
            TelephonyManager telephony = context.getSystemService(TelephonyManager.class);
            if (telecom == null || telephony == null) return StartupPermissionPolicy.CallState.UNKNOWN;
            // Telecom also covers connecting/outgoing calls before cellular CALL_STATE_OFFHOOK.
            if (telecom.isInCall()) return StartupPermissionPolicy.CallState.OFFHOOK;
            switch (telephony.getCallState()) {
                case TelephonyManager.CALL_STATE_IDLE: return StartupPermissionPolicy.CallState.IDLE;
                case TelephonyManager.CALL_STATE_RINGING: return StartupPermissionPolicy.CallState.RINGING;
                case TelephonyManager.CALL_STATE_OFFHOOK: return StartupPermissionPolicy.CallState.OFFHOOK;
                default: return StartupPermissionPolicy.CallState.UNKNOWN;
            }
        } catch (RuntimeException | LinkageError unavailable) {
            return StartupPermissionPolicy.CallState.UNKNOWN;
        }
    }

    private void watch() {
        if (!receivedRegistered) {
            Shizuku.addBinderReceivedListenerSticky(received);
            receivedRegistered = true;
        }
        if (!deadRegistered) {
            Shizuku.addBinderDeadListener(dead);
            deadRegistered = true;
        }
        if (!phoneRegistered) {
            IntentFilter filter = new IntentFilter(TelephonyManager.ACTION_PHONE_STATE_CHANGED);
            // Telephony broadcasts can originate from a privileged non-system UID. Their
            // extras are never trusted: every signal only schedules fresh read-only checks.
            if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(phoneState, filter, Context.RECEIVER_EXPORTED);
            else app.registerReceiver(phoneState, filter);
            phoneRegistered = true;
        }
    }

    private void unwatch() {
        if (receivedRegistered) {
            receivedRegistered = false;
            try { Shizuku.removeBinderReceivedListener(received); }
            catch (RuntimeException | LinkageError unavailable) { /* Optional SDK cleanup only. */ }
        }
        if (deadRegistered) {
            deadRegistered = false;
            try { Shizuku.removeBinderDeadListener(dead); }
            catch (RuntimeException | LinkageError unavailable) { /* Optional SDK cleanup only. */ }
        }
        if (phoneRegistered) {
            phoneRegistered = false;
            try { app.unregisterReceiver(phoneState); }
            catch (RuntimeException unavailable) { /* Already removed or framework unavailable. */ }
        }
    }

    private void dispose() {
        unwatch();
        app.unregisterActivityLifecycleCallbacks(this);
        worker.shutdown();
    }

    @Override public void onActivityResumed(Activity activity) {
        resumed = activity;
        policy.resumed(LAUNCHER.equals(activity.getClass().getName()) && !activity.isFinishing());
        schedule();
    }

    @Override public void onActivityPaused(Activity activity) {
        if (resumed != activity) return;
        resumed = null;
        policy.paused();
        schedule();
    }

    @Override public void onActivityDestroyed(Activity activity) { onActivityPaused(activity); }
    @Override public void onActivityCreated(Activity activity, Bundle saved) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle out) { }
}
