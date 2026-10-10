package app.threadripper.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.VpnService;
import android.os.Bundle;

/**
 * Routes the app through Cloudflare WARP ({@link WarpVpnService}) while it is in the foreground and
 * back to the normal connection when it goes to the background (switching apps, home, recents,
 * screen off). In the background the app usually only plays audio, which the home connection
 * handles; at peak hours the home connection to YouTube's caches is the slow part.
 *
 * The first time, Android asks for VPN permission (once per app launch until granted). If another
 * VPN already covers the app when it comes to the foreground, it is left alone.
 */
@SuppressWarnings("unused")
public final class Warp {
    /** Arbitrary; the activity ignores results it did not ask for. */
    private static final int REQUEST_VPN_PERMISSION = 0x7472;

    /** Lifecycle callbacks run on the main thread, so no synchronization. */
    private static boolean registered;
    private static int startedActivities;
    private static boolean wanted;
    private static boolean consentAsked;

    private Warp() {
    }

    /**
     * Injection point: start of MainActivity.onCreate. Registers the lifecycle callbacks before
     * the activity's onStart, so the first foreground transition is seen.
     */
    public static void onCreate(Activity activity) {
        if (registered) return;
        registered = true;
        try {
            activity.getApplication().registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Exception ex) {
            Log.e("WARP: register failure", ex);
        }
    }

    private static void foreground(Activity activity) {
        wanted = false;
        if (!Config.get().warp || WarpVpnService.running()) return;
        if (otherVpnActive(activity)) {
            Log.i("WARP: another VPN is active, left alone");
            return;
        }
        wanted = true;
        startIfPermitted(activity);
    }

    private static void startIfPermitted(Activity activity) {
        Intent consent = VpnService.prepare(activity);
        if (consent == null) {
            wanted = false;
            WarpVpnService.start(activity);
        } else if (!consentAsked) {
            // The dialog identifies the app by its caller, which only a started-for-result activity
            // has; with startActivity it closes at once. The result itself is not needed: the app
            // resumes after the dialog and onActivityResumed checks again.
            consentAsked = true;
            Log.i("WARP: asking for VPN permission");
            activity.startActivityForResult(consent, REQUEST_VPN_PERMISSION);
        }
    }

    private static void background() {
        wanted = false;
        WarpVpnService.stop();
    }

    private static boolean otherVpnActive(Context context) {
        try {
            ConnectivityManager cm = context.getSystemService(ConnectivityManager.class);
            Network network = cm.getActiveNetwork();
            NetworkCapabilities caps = network == null ? null : cm.getNetworkCapabilities(network);
            return caps != null && caps.hasTransport(NetworkCapabilities.TRANSPORT_VPN);
        } catch (Exception ex) {
            Log.e("WARP: network state failure", ex);
            return false;
        }
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityStarted(Activity activity) {
            if (startedActivities++ == 0) foreground(activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            if (wanted) startIfPermitted(activity);
        }

        @Override
        public void onActivityStopped(Activity activity) {
            // A rotation stops the activity and starts its replacement right after.
            if (--startedActivities == 0 && !activity.isChangingConfigurations()) background();
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }
}
