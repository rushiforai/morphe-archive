package io.github.daydreamfix.ext;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Parcel;
import android.service.notification.NotificationListenerService;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewManager;
import android.view.WindowManager;

import java.lang.reflect.Method;

/**
 * Called from the patched apps. Stands in for what the root build does with Xposed hooks on
 * framework classes: those can't be patched here, so every call site in the app is redirected.
 */
public final class Daydream {
    static final String TAG = "DuskDream";
    private static final String HOME = "com.google.android.vr.home";
    private static final String VRCORE = "com.google.vr.vrcore";
    private static final String YOUTUBE_VR = "com.google.android.apps.youtube.vr";
    private static final String LAUNCHER = "com.google.vr.app.Launcher.Launcher";
    /** vr.home's VR Play Store, in its own process. */
    private static final String PLAY_STORE = "com.google.android.apps.vr.playstore.PlayStoreActivity";
    private static final String DASHBOARD =
            "com.google.vr.vrcore.modules.sysui.dashboard.DashboardActivity";
    private static final Uri SETTINGS =
            Uri.parse("content://com.google.vr.vrcore.settings/boolean_settings");

    private Daydream() {}

    // ── Application start ───────────────────────────────────────────────────

    static Application app;

    public static void onApplicationCreate(Application application) {
        app = application;
        try {
            exemptHiddenApis();
            app.registerActivityLifecycleCallbacks(new Lifecycle(app.getPackageName()));
            if (VRCORE.equals(Application.getProcessName())) VrModeEmulator.install(app);
            Log.i(TAG, "installed in " + Application.getProcessName());
        } catch (Throwable t) {
            Log.e(TAG, "start failed", t);
        }
    }

    /** VrModeEmulator builds a service by hand, which needs a hidden Service field. */
    private static void exemptHiddenApis() {
        try {
            Method forName = Class.class.getDeclaredMethod("forName", String.class);
            Method getMethod = Class.class.getDeclaredMethod(
                    "getDeclaredMethod", String.class, Class[].class);
            Class<?> runtime = (Class<?>) forName.invoke(null, "dalvik.system.VMRuntime");
            Method getRuntime = (Method) getMethod.invoke(runtime, "getRuntime", null);
            Method exempt = (Method) getMethod.invoke(runtime, "setHiddenApiExemptions",
                    new Class<?>[] {String[].class});
            exempt.invoke(getRuntime.invoke(null), (Object) new String[] {"L"});
        } catch (Throwable t) {
            Log.w(TAG, "hidden API exemption unavailable: " + t);
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        private final boolean home;
        private final boolean youtube;

        Lifecycle(String pkg) {
            home = HOME.equals(pkg);
            youtube = YOUTUBE_VR.equals(pkg);
        }

        private boolean isLauncher(Activity a) {
            return home && a.getClass().getName().equals(LAUNCHER);
        }

        @Override public void onActivityPreResumed(Activity a) {
            if (isLauncher(a)) onLauncherResume(a);
        }

        @Override public void onActivityResumed(Activity a) {
            allowUserBrightness(a);
            if (isLauncher(a) && !Controller.vrModeActive()) onLauncherResume(a);
            VrModeEmulator.onResumed(a);
        }

        @Override public void onActivityPaused(Activity a) {
            VrModeEmulator.onPaused(a);
            if (isLauncher(a)) Controller.setVrModeActive(false);
        }

        @Override public void onActivityStopped(Activity a) {
            if (isLauncher(a)) {
                a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
            }
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {
            String name = a.getClass().getName();
            if (youtube || isLauncher(a) || name.equals(DASHBOARD) || name.equals(PLAY_STORE)) coverCutout(a);
        }
        @Override public void onActivityStarted(Activity a) { }
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
        @Override public void onActivityDestroyed(Activity a) { }
    }

    /**
     * These apps' old target SDK keeps their windows beside the camera cutout. GVR draws for the
     * whole display, so the image would be cut short and shifted off the lenses.
     */
    private static void coverCutout(Activity a) {
        android.view.Window window = a.getWindow();
        if (window == null) return;
        WindowManager.LayoutParams attrs = window.getAttributes();
        attrs.layoutInDisplayCutoutMode =
                WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        window.setAttributes(attrs);
    }

    /** VrAppActivity forces full brightness in onCreate; the user's own setting should apply. */
    private static void allowUserBrightness(Activity a) {
        android.view.Window window = a.getWindow();
        if (window == null) return;
        android.view.WindowManager.LayoutParams attrs = window.getAttributes();
        if (attrs.screenBrightness < 0f) return;
        attrs.screenBrightness = android.view.WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE;
        window.setAttributes(attrs);
    }

    private static boolean sessionWritten;

    private static void onLauncherResume(Activity a) {
        Controller.setVrModeActive(true);
        // Written once: each insert restarts VrSysUiService, whose new overlay swallows 2D touches.
        if (!sessionWritten) {
            try {
                ContentValues cv = new ContentValues();
                cv.put("name", "is_in_vr_session");
                cv.put("value", "true");
                a.getContentResolver().insert(SETTINGS, cv);
                sessionWritten = true;
            } catch (Throwable t) {
                Log.w(TAG, "is_in_vr_session insert failed", t);
            }
        }
        a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        Controller.reinjectConnected();
    }

    // ── Call site replacements ──────────────────────────────────────────────

    private static boolean isVrFeature(String name) {
        return "android.software.vr.mode".equals(name)
                || "android.hardware.vr.high_performance".equals(name)
                || "android.hardware.vr.headtracking".equals(name);
    }

    /** Keyboard getString calls: answers the Swiss entries' made-up ids, see SwissKeyboard. */
    public static String getString(android.content.Context context, int id) {
        String text = SwissKeyboard.text(id);
        return text != null ? text : context.getString(id);
    }

    public static String getString(android.app.Fragment fragment, int id) {
        String text = SwissKeyboard.text(id);
        return text != null ? text : fragment.getString(id);
    }

    public static java.util.List<android.content.pm.ResolveInfo> queryIntentActivities(
            PackageManager pm, android.content.Intent intent, int flags) {
        return OpenXrApps.query(pm, intent, flags);
    }

    public static boolean hasSystemFeature(PackageManager pm, String name) {
        return isVrFeature(name) || pm.hasSystemFeature(name);
    }

    public static boolean hasSystemFeature(PackageManager pm, String name, int version) {
        return isVrFeature(name) || pm.hasSystemFeature(name, version);
    }

    /** The system has no VR manager to tell, and refuses the call on a device without VR features. */
    public static void setVrModeEnabled(Activity activity, boolean enabled, ComponentName service) {
        VrModeEmulator.onVrModeSet(activity, enabled);
    }

    private static Cursor fakeSession(Uri uri) {
        if (uri == null || !uri.toString().contains("boolean_settings")) return null;
        MatrixCursor fake = new MatrixCursor(new String[] {"name", "value"});
        fake.addRow(new Object[] {"is_in_vr_session", "true"});
        return fake;
    }

    public static Cursor query(ContentResolver r, Uri uri, String[] projection, String selection,
            String[] args, String order) {
        Cursor fake = fakeSession(uri);
        return fake != null ? fake : r.query(uri, projection, selection, args, order);
    }

    public static Cursor query(ContentResolver r, Uri uri, String[] projection, Bundle args,
            CancellationSignal cancel) {
        Cursor fake = fakeSession(uri);
        return fake != null ? fake : r.query(uri, projection, args, cancel);
    }

    public static void readException(Parcel parcel) {
        try {
            parcel.readException();
        } catch (BadParcelableException e) {
            String msg = e.getMessage();
            if (msg == null || !msg.contains("not fully consumed")) throw e;
            parcel.setDataPosition(parcel.dataSize());
        } catch (NullPointerException e) {
            StackTraceElement[] st = e.getStackTrace();
            if (st.length == 0 || !st[0].getClassName().contains("Parcel")) throw e;
        } catch (SecurityException e) {
            // Play services refuses re-signed apps. The GMS client rethrows SecurityException and
            // crashes, but treats a RemoteException as "service unavailable", which apps handle.
            String msg = e.getMessage();
            if (msg == null || !msg.contains("PackageVerificationRslt")) throw e;
            Log.w(TAG, "Play services refused this app");
            Daydream.<RuntimeException>sneakyThrow(new android.os.RemoteException("refused by Play services"));
        }
    }

    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void sneakyThrow(Throwable t) throws T {
        throw (T) t;
    }

    /** vrcore's old target SDK keeps windows out of the cutout, which shifts the stereo image. */
    public static void addView(ViewManager wm, View view, ViewGroup.LayoutParams params) {
        if (params instanceof WindowManager.LayoutParams && params.width == -1
                && params.height == -1) {
            WindowManager.LayoutParams lp = (WindowManager.LayoutParams) params;
            lp.layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
            lp.setFitInsetsTypes(0);
        }
        wm.addView(view, params);
    }

    /** vrcore skips what Do Not Disturb silences, and VR's own rule silences messages on purpose. */
    public static boolean matchesInterruptionFilter(NotificationListenerService.Ranking ranking) {
        return true;
    }
}
