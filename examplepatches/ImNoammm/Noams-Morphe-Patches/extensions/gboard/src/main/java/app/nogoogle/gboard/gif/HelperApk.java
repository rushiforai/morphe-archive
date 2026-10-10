package app.nogoogle.gboard.gif;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * The network helper app comes inside the keyboard (assets/nogoogle/gif-helper.apk, added by the
 * "GIF providers" patch). The keyboard installs it through its own installer session: the helper
 * serves the app that installed it, whatever key either was signed with.
 */
public final class HelperApk {
    public static final int MISSING = 0;
    public static final int REFUSED = 1; // installed some other way, signed with another key
    public static final int READY = 2;

    private static final String TAG = "NoGoogleGif";
    private static final String ASSET = "nogoogle/gif-helper.apk";
    private static final String STATUS = "app.nogoogle.gboard.HELPER_INSTALL_STATUS";
    private static Status receiver; // registered once per process, guarded by HelperApk.class
    private static volatile Runnable listener;

    private HelperApk() {
    }

    public static int state(Context c) {
        try {
            c.getPackageManager().getPackageInfo(GifBridge.HELPER, 0);
        } catch (PackageManager.NameNotFoundException e) {
            return MISSING;
        }
        try {
            c.getContentResolver().call(Uri.parse("content://" + GifBridge.HELPER), "check", null, null);
            return READY;
        } catch (SecurityException e) {
            return REFUSED;
        } catch (RuntimeException e) {
            Log.w(TAG, "network helper check failed", e);
            return READY; // can't tell: requests show what is wrong
        }
    }

    /** Run (on the main thread) once the helper is installed, e.g. to refresh the settings. */
    public static void setListener(Runnable r) {
        listener = r;
    }

    /**
     * Installs the helper with this app as its installer of record; Android asks the user to confirm.
     * Call it from a visible activity, which lets the confirmation screen open.
     */
    public static void install(Context context) {
        Context app = context.getApplicationContext();
        listen(app);
        PackageInstaller installer = app.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params =
                new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        params.setAppPackageName(GifBridge.HELPER);
        int id = -1;
        try {
            id = installer.createSession(params);
            try (PackageInstaller.Session session = installer.openSession(id)) {
                try (InputStream in = app.getAssets().open(ASSET); OutputStream out = session.openWrite("base.apk", 0, -1)) {
                    byte[] buf = new byte[64 << 10];
                    int n;
                    while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                    session.fsync(out);
                }
                // Mutable: the installer adds the status. Explicit, as Android requires for mutable ones.
                Intent status = new Intent(STATUS).setPackage(app.getPackageName());
                int flags = PendingIntent.FLAG_UPDATE_CURRENT | (Build.VERSION.SDK_INT >= 31 ? PendingIntent.FLAG_MUTABLE : 0);
                session.commit(PendingIntent.getBroadcast(app, id, status, flags).getIntentSender());
            }
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "network helper install failed", e);
            if (id != -1) {
                try {
                    installer.abandonSession(id);
                } catch (RuntimeException ignored) {
                }
            }
            Toast.makeText(app, "Couldn't install the network helper app", Toast.LENGTH_LONG).show();
        }
    }

    private static synchronized void listen(Context app) {
        if (receiver != null) return;
        receiver = new Status();
        IntentFilter filter = new IntentFilter(STATUS);
        if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        else app.registerReceiver(receiver, filter);
    }

    private static final class Status extends BroadcastReceiver {
        @Override
        @SuppressWarnings("deprecation")
        public void onReceive(Context c, Intent intent) {
            int status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE);
            if (status == PackageInstaller.STATUS_PENDING_USER_ACTION) {
                Intent confirm = intent.getParcelableExtra(Intent.EXTRA_INTENT);
                if (confirm != null) c.startActivity(confirm.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            } else if (status == PackageInstaller.STATUS_SUCCESS) {
                Toast.makeText(c, "Network helper app installed", Toast.LENGTH_SHORT).show();
                Runnable r = listener;
                if (r != null) r.run();
            } else if (status != PackageInstaller.STATUS_FAILURE_ABORTED) {
                String why = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                Log.w(TAG, "network helper install failed: " + status + " " + why);
                Toast.makeText(c, "Couldn't install the network helper app: " + why, Toast.LENGTH_LONG).show();
            }
        }
    }
}
