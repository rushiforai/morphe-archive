package local.wazemaps.themes;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.util.Log;
import java.security.MessageDigest;

/** One foreground offer per Waze installation; setup remains available in Map display. */
public final class CompanionInstaller {
    static final String PACKAGE = "local.waze.aainstaller";
    static final String SIGNER = "700b8211da6667151b3e0ee7914a405f752b91bc0ceac40d54c41ccc07e8147a";
    static final long VERSION = 1;
    private static boolean registered;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Activity foreground;
    private static Runnable pending;
    private static long generation, readySince;
    private static boolean loginCheckErrorLogged;

    static String hex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte value : bytes) result.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        return result.toString();
    }
    // -1 missing, -2 incompatible signing key, otherwise installed version.
    static long installed(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(PACKAGE, PackageManager.GET_SIGNING_CERTIFICATES);
            Signature[] signers = info.signingInfo.getApkContentsSigners();
            if (signers.length != 1 || !SIGNER.equals(hex(MessageDigest.getInstance("SHA-256").digest(signers[0].toByteArray())))) return -2;
            return info.getLongVersionCode();
        } catch (PackageManager.NameNotFoundException absent) { return -1; }
        catch (Exception error) { Log.e("MorpheAA", "Cannot verify companion", error); return -2; }
    }
    static boolean sourceReady(Context context) {
        if (Build.VERSION.SDK_INT < 30) return false;
        try {
            InstallSourceInfo source = context.getPackageManager().getInstallSourceInfo(context.getPackageName());
            return "com.android.vending".equals(source.getInstallingPackageName()) &&
                "com.google.android.packageinstaller".equals(source.getInitiatingPackageName());
        } catch (Exception error) { return false; }
    }
    public static void open(Context context) {
        try { context.startActivity(new Intent(context, CompanionSetupActivity.class)); }
        catch (Exception error) { Log.e("MorpheAA", "Cannot open setup", error); }
    }
    public static void attach(Activity activity) {
        try {
            if (registered || Build.VERSION.SDK_INT < 30) return;
            registered = true;
            activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityResumed(Activity value) {
                    if ("com.waze.MainActivity".equals(value.getClass().getName())) {
                        stopWatching();
                        foreground = value;
                        schedule(value, generation);
                    }
                }
                public void onActivityCreated(Activity a, Bundle b) {}
                public void onActivityStarted(Activity a) {}
                public void onActivityPaused(Activity a) { if (a == foreground) stopWatching(); }
                public void onActivityStopped(Activity a) {}
                public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                public void onActivityDestroyed(Activity a) { if (a == foreground) stopWatching(); }
            });
        } catch (Exception error) { Log.e("MorpheAA", "Cannot register setup offer", error); }
    }
    private static void stopWatching() {
        generation++;
        if (pending != null) MAIN.removeCallbacks(pending);
        pending = null;
        foreground = null;
        readySince = 0;
    }
    private static boolean active(Activity activity, long token) {
        return token == generation && foreground == activity && !activity.isFinishing() && !activity.isDestroyed();
    }
    private static void schedule(Activity activity, long token) {
        if (!active(activity, token)) return;
        pending = () -> { pending = null; checkLogin(activity, token); };
        MAIN.postDelayed(pending, 1200);
    }
    /** Called only on Waze's native task queue; guest sessions also report a native login. */
    private static boolean authenticated() throws Exception {
        Class<?> nativeType = Class.forName("com.waze.NativeManager");
        if (!Boolean.TRUE.equals(nativeType.getMethod("isAppStarted").invoke(null))) return false;
        Object nativeManager = nativeType.getMethod("getInstance").invoke(null);
        if (!Boolean.TRUE.equals(nativeType.getMethod("isLoggedInNTV").invoke(nativeManager))) return false;
        Class<?> accountType = Class.forName("com.waze.mywaze.MyWazeNativeManager");
        Object account = accountType.getMethod("getInstance").invoke(null);
        return Boolean.FALSE.equals(accountType.getMethod("isGuestUser").invoke(account));
    }
    private static void checkLogin(Activity activity, long token) {
        if (!active(activity, token)) return;
        if (!activity.hasWindowFocus()) { readySince = 0; schedule(activity, token); return; }
        try {
            long install = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).lastUpdateTime;
            SharedPreferences prefs = activity.getSharedPreferences("morphe_aa_setup", 0);
            if (prefs.getLong("offered_install", -1) == install ||
                (installed(activity) >= VERSION && sourceReady(activity))) { stopWatching(); return; }
            Class<?> nativeType = Class.forName("com.waze.NativeManager");
            if (!Boolean.TRUE.equals(nativeType.getMethod("isAppStarted").invoke(null))) {
                readySince = 0; schedule(activity, token); return;
            }
            Runnable check = () -> {
                boolean loggedIn = false;
                try { loggedIn = authenticated(); }
                catch (Exception error) {
                    if (!loginCheckErrorLogged) { loginCheckErrorLogged = true; Log.e("MorpheAA", "Cannot check login for setup", error); }
                }
                final boolean ready = loggedIn;
                MAIN.post(() -> finishLoginCheck(activity, token, ready, install, prefs));
            };
            Object queued = nativeType.getMethod("Post", Runnable.class).invoke(null, check);
            if (Boolean.FALSE.equals(queued)) { readySince = 0; schedule(activity, token); }
        } catch (Exception error) {
            if (!loginCheckErrorLogged) { loginCheckErrorLogged = true; Log.e("MorpheAA", "Cannot queue login check", error); }
            readySince = 0; schedule(activity, token);
        }
    }
    private static void finishLoginCheck(Activity activity, long token, boolean loggedIn, long install, SharedPreferences prefs) {
        if (!active(activity, token)) return;
        if (!loggedIn || !activity.hasWindowFocus()) { readySince = 0; schedule(activity, token); return; }
        // Allow login activities/transitions to leave the map before displaying another dialog.
        long now = SystemClock.elapsedRealtime();
        if (readySince == 0) readySince = now;
        if (now - readySince < 2400) { schedule(activity, token); return; }
        try {
                new AlertDialog.Builder(activity).setTitle("Set up Android Auto")
                    .setMessage("This patch includes Waze AA Installer. Install or open it, then use Repair Android Auto visibility. Shizuku must be running. You can also do this later in Map display → Android Auto setup.")
                    .setNegativeButton("Later", null)
                    .setPositiveButton("Set up", (dialog, which) -> open(activity)).show();
                prefs.edit().putLong("offered_install", install).apply();
                stopWatching();
        } catch (Exception error) { Log.e("MorpheAA", "Cannot show setup offer", error); stopWatching(); }
    }
}
