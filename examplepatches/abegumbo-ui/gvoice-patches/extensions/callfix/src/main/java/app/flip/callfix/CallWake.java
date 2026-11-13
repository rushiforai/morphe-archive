package app.flip.callfix;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.PixelFormat;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Lets incoming Voice calls ring when push messages come through MicroG.
 *
 * Real Play Services gives an app a short "allowed to start a foreground service" window when it
 * delivers a high-priority push; MicroG can't, so Android blocks Voice's CallForegroundService and
 * the call never rings. An app with "Appear on top" that shows an overlay window counts as visible,
 * so for incoming-call pushes this shows an invisible 1x1 overlay for a few seconds first.
 */
public class CallWake extends ContentProvider {
    private static final String TAG = "FlipCallWake";
    private static final long OVERLAY_MS = 20_000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static View overlay;

    // region Push hook.

    /** Called at the start of FirebaseMessagingService's intent handler (worker thread). */
    public static void onPush(Context context, Intent intent) {
        try {
            if (!isIncomingCall(intent)) return;
            if (Build.VERSION.SDK_INT >= 23 && !Settings.canDrawOverlays(context)) {
                Log.w(TAG, "Incoming call push, but 'Appear on top' is not allowed; the call may not ring");
                return;
            }
            final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            final CountDownLatch shown = new CountDownLatch(1);
            MAIN.post(() -> {
                try {
                    showOverlay(app);
                } catch (Throwable t) {
                    Log.e(TAG, "Overlay failed", t);
                }
                shown.countDown();
            });
            shown.await(1500, TimeUnit.MILLISECONDS);
            // Give the system a moment to see the window before Voice starts its call service.
            Thread.sleep(300);
            Log.w(TAG, "Overlay shown for incoming call");
        } catch (Throwable t) {
            Log.e(TAG, "onPush failed", t);
        }
    }

    private static boolean isIncomingCall(Intent intent) {
        if (intent == null) return false;
        Bundle extras = intent.getExtras();
        if (extras == null) return false;
        String id = String.valueOf(extras.get("notification_id"));
        return id.endsWith(":incoming") || extras.containsKey("inbound_call_src");
    }

    private static void showOverlay(Context context) {
        WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        if (overlay == null) {
            View view = new View(context);
            view.setBackgroundColor(0x01000000);
            int type = Build.VERSION.SDK_INT >= 26
                    ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                    : WindowManager.LayoutParams.TYPE_PHONE;
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                    1, 1, type,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                            | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                    PixelFormat.TRANSLUCENT);
            lp.x = 0;
            lp.y = 0;
            wm.addView(view, lp);
            overlay = view;
        }
        MAIN.removeCallbacks(REMOVE);
        MAIN.postDelayed(REMOVE, OVERLAY_MS);
    }

    private static final Runnable REMOVE = () -> {
        try {
            if (overlay != null) {
                ((WindowManager) overlay.getContext().getSystemService(Context.WINDOW_SERVICE)).removeView(overlay);
            }
        } catch (Throwable ignored) {
        }
        overlay = null;
    };

    // endregion

    // region One-time "Appear on top" prompt.

    @Override
    public boolean onCreate() {
        Context context = getContext();
        if (context instanceof Application) {
            register((Application) context);
        } else if (context != null && context.getApplicationContext() instanceof Application) {
            register((Application) context.getApplicationContext());
        }
        return true;
    }

    private static void register(Application app) {
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            private boolean asked;

            @Override
            public void onActivityResumed(Activity activity) {
                if (asked || Build.VERSION.SDK_INT < 23 || Settings.canDrawOverlays(activity)) return;
                SharedPreferences prefs = activity.getSharedPreferences("flip_callfix", Context.MODE_PRIVATE);
                long lastAsked = prefs.getLong("asked", 0);
                if (System.currentTimeMillis() - lastAsked < 24L * 60 * 60 * 1000) return;
                asked = true;
                prefs.edit().putLong("asked", System.currentTimeMillis()).apply();
                try {
                    new AlertDialog.Builder(activity)
                            .setTitle("Let calls ring")
                            .setMessage("Incoming calls need \"Appear on top\" for this app, because MicroG can't wake "
                                    + "the app for calls the way Google Play Services does. Turn it on on the next screen.")
                            .setPositiveButton("Open setting", (d, w) -> {
                                try {
                                    activity.startActivity(new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                                            Uri.parse("package:" + activity.getPackageName())));
                                } catch (Throwable t) {
                                    Log.e(TAG, "Could not open overlay setting", t);
                                }
                            })
                            .setNegativeButton("Later", null)
                            .show();
                } catch (Throwable t) {
                    Log.e(TAG, "Could not show prompt", t);
                }
            }

            @Override public void onActivityCreated(Activity a, Bundle b) { }
            @Override public void onActivityStarted(Activity a) { }
            @Override public void onActivityPaused(Activity a) { }
            @Override public void onActivityStopped(Activity a) { }
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
            @Override public void onActivityDestroyed(Activity a) { }
        });
    }

    @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri u) { return null; }
    @Override public Uri insert(Uri u, ContentValues v) { return null; }
    @Override public int delete(Uri u, String s, String[] a) { return 0; }
    @Override public int update(Uri u, ContentValues v, String s, String[] a) { return 0; }

    // endregion
}
