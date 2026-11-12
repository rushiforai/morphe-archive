package app.tvpatches.extension.youtubetv;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.LinearLayout;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Provider;
import java.security.Security;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

/**
 * TV version of Morphe's GmsCoreSupportPatch extension.
 *
 * Checks that MicroG-RE is installed. If it is not, shows a dialog that works with a remote and
 * offers to download the latest MicroG-RE release from GitHub and install it with Android's own
 * installer (PackageInstaller). The patch adds REQUEST_INSTALL_PACKAGES to the manifest.
 *
 * The private methods are overwritten by the patch (returnEarly) with real values.
 */
@SuppressWarnings("unused")
public final class GmsCoreSupportPatch {
    private static final String TAG = "TvPatches";
    private static final String RELEASES_API = "https://api.github.com/repos/MorpheApp/MicroG-RE/releases/latest";
    private static final String INSTALL_ACTION = "app.tvpatches.MICROG_INSTALL_RESULT";

    private static boolean dialogShown;

    private GmsCoreSupportPatch() {}

    /** Replaced by the patch with the original package name. */
    private static String getOriginalPackageName() {
        return null;
    }

    /** Replaced by the patch with the GmsCore vendor id ("app.revanced"). */
    private static String getGmsCoreVendorGroupId() {
        return "app.revanced";
    }

    private static String getGmsCorePackageName() {
        return getGmsCoreVendorGroupId() + ".android.gms";
    }

    public static boolean isPackageNameOriginal() {
        String original = getOriginalPackageName();
        return original == null;
    }

    /**
     * Injected at the start of CobaltActivity.onCreate().
     */
    public static void checkGmsCore(Activity activity) {
        try {
            if (activity == null || isPackageNameOriginal()) return;

            String gmsCore = getGmsCorePackageName();
            PackageManager pm = activity.getPackageManager();
            try {
                pm.getPackageInfo(gmsCore, 0);
                Log.i(TAG, "GmsCore found: " + gmsCore);
                keepGmsCoreAlive(activity, gmsCore);
            } catch (PackageManager.NameNotFoundException e) {
                Log.w(TAG, "GmsCore not installed: " + gmsCore);
                showMissingDialog(activity, gmsCore);
            }
        } catch (Exception ex) {
            Log.e(TAG, "checkGmsCore failure", ex);
        }
    }

    private static boolean keepAliveBound;

    /**
     * Some TVs run a memory manager that force-stops background apps that are not on its
     * whitelist (for example HiSilicon's com.hisilicon.rmservice, which protects
     * com.google.android.gms but not MicroG-RE). Force-stopping MicroG-RE also kills this app,
     * because it uses MicroG-RE's providers. A BIND_IMPORTANT connection gives MicroG-RE the
     * same priority as this app while it is open, so it is no longer treated as background.
     */
    private static void keepGmsCoreAlive(Activity activity, String gmsCore) {
        if (keepAliveBound) return;
        keepAliveBound = true;
        // MicroG-RE runs in two processes; keep one service bound in each:
        // DummyService (":unstable" process) and CheckinService (main process).
        bindImportant(activity, new Intent(gmsCore + ".accounts.ACCOUNT_SERVICE").setPackage(gmsCore));
        bindImportant(activity, new Intent(gmsCore + ".checkin.BIND_TO_SERVICE").setPackage(gmsCore));
    }

    private static void bindImportant(Activity activity, Intent intent) {
        try {
            ServiceConnection connection = new ServiceConnection() {
                @Override
                public void onServiceConnected(ComponentName name, IBinder service) {
                    Log.i(TAG, "GmsCore keep-alive connected: " + name.getShortClassName());
                }

                @Override
                public void onServiceDisconnected(ComponentName name) {
                    Log.w(TAG, "GmsCore keep-alive disconnected: " + name.getShortClassName());
                }

                @Override
                public void onNullBinding(ComponentName name) {
                    // DummyService returns no binder; the binding (and the priority) stays.
                    Log.i(TAG, "GmsCore keep-alive bound: " + name.getShortClassName());
                }
            };
            boolean bound = activity.getApplicationContext().bindService(intent, connection,
                    Context.BIND_AUTO_CREATE | Context.BIND_IMPORTANT);
            if (!bound) Log.w(TAG, "GmsCore keep-alive: cannot bind " + intent.getAction());
        } catch (Exception ex) {
            Log.e(TAG, "GmsCore keep-alive failed", ex);
        }
    }

    private static void showMissingDialog(Activity activity, String gmsCore) {
        if (dialogShown) return;
        dialogShown = true;
        activity.runOnUiThread(() -> {
            try {
                TvDialog.show(activity,
                        "MicroG-RE no está instalado",
                        "Esta app necesita MicroG-RE para iniciar sesión y reproducir videos.\n\n"
                                + "Puedes descargarlo e instalarlo ahora desde GitHub (MorpheApp/MicroG-RE).",
                        null,
                        new String[]{"Descargar e instalar", "Ahora no"},
                        true,
                        index -> {
                            if (index == 0) startDownload(activity);
                        });
            } catch (Exception ex) {
                Log.e(TAG, "Could not show dialog", ex);
            }
        });
    }

    // ---- download and install --------------------------------------------------------------

    /** Thin rounded bar in FaroTV amber, like YouTube TV's progress bars. */
    private static final class Bar {
        final LinearLayout view;
        final View fill;
        final View rest;

        Bar(Activity activity, int height) {
            view = new LinearLayout(activity);
            view.setOrientation(LinearLayout.HORIZONTAL);
            GradientDrawable track = new GradientDrawable();
            track.setColor(0x33FFFFFF);
            track.setCornerRadius(height / 2f);
            view.setBackground(track);
            view.setMinimumHeight(height);
            fill = new View(activity);
            GradientDrawable amber = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT,
                    new int[]{0xFFFFB43A, 0xFFFF9F1C});
            amber.setCornerRadius(height / 2f);
            fill.setBackground(amber);
            rest = new View(activity);
            view.addView(fill, new LinearLayout.LayoutParams(0, height, 0f));
            view.addView(rest, new LinearLayout.LayoutParams(0, height, 100f));
        }

        void set(int percent) {
            ((LinearLayout.LayoutParams) fill.getLayoutParams()).weight = percent;
            ((LinearLayout.LayoutParams) rest.getLayoutParams()).weight = 100 - percent;
            view.requestLayout();
        }
    }

    private static void startDownload(Activity activity) {
        float u = Math.max(activity.getResources().getDisplayMetrics().widthPixels,
                activity.getResources().getDisplayMetrics().heightPixels) / 1280f;
        Bar bar = new Bar(activity, Math.max(4, Math.round(6 * u)));
        TvDialog progress = TvDialog.show(activity,
                "Descargando MicroG-RE",
                "Buscando la última versión…",
                bar.view,
                new String[0],
                false,
                null);

        Handler ui = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            try {
                String[] asset = findAsset();
                Log.i(TAG, "MicroG-RE download: " + asset[0]);
                ui.post(() -> progress.message.setText(asset[0]));
                install(activity, asset[1], percent -> ui.post(() -> {
                    if (percent < 0) return;
                    bar.set(percent);
                    progress.message.setText(asset[0] + "\n" + percent + " %");
                }));
                ui.post(progress::dismiss);
            } catch (Exception ex) {
                Log.e(TAG, "MicroG-RE download failed", ex);
                ui.post(() -> {
                    progress.dismiss();
                    showError(activity, ex);
                });
            }
        }, "MicroG-RE download").start();
    }

    private static void showError(Activity activity, Exception ex) {
        activity.runOnUiThread(() -> {
            try {
                TvDialog.show(activity,
                        "No se pudo instalar MicroG-RE",
                        "Revisa la conexión a internet e inténtalo de nuevo.\n\n" + ex.getMessage(),
                        null,
                        new String[]{"Reintentar", "Cerrar"},
                        true,
                        index -> {
                            if (index == 0) startDownload(activity);
                        });
            } catch (Exception ignored) {
            }
        });
    }

    interface Progress {
        void update(int percent);
    }

    /** Returns {fileName, downloadUrl} of the APK that fits this device. */
    private static String[] findAsset() throws Exception {
        JSONObject release = new JSONObject(readText(RELEASES_API));
        JSONArray assets = release.getJSONArray("assets");
        // Preferred: the split APK for the device's ABI, with launcher icon. Fallback: universal.
        for (String abi : Build.SUPPORTED_ABIS) {
            for (int i = 0; i < assets.length(); i++) {
                JSONObject a = assets.getJSONObject(i);
                String name = a.getString("name");
                if (name.endsWith("-icon-" + abi + ".apk")) {
                    return new String[]{name, a.getString("browser_download_url")};
                }
            }
        }
        for (int i = 0; i < assets.length(); i++) {
            JSONObject a = assets.getJSONObject(i);
            String name = a.getString("name");
            if (name.matches("microg-[0-9.]+\\.apk")) {
                return new String[]{name, a.getString("browser_download_url")};
            }
        }
        throw new IllegalStateException("No hay un APK de MicroG-RE para " + Build.SUPPORTED_ABIS[0]);
    }

    private static SSLSocketFactory platformSocketFactory;

    /**
     * YouTube registers its own SSLContext provider first, and it refuses connections until
     * Google Play Services has updated the security provider ("Blocked unpatched use of SSL
     * stack"). Without MicroG-RE that never happens, so use Android's own TLS provider.
     */
    static SSLSocketFactory platformSocketFactory() throws Exception {
        if (platformSocketFactory != null) return platformSocketFactory;
        Provider chosen = Security.getProvider("AndroidOpenSSL");
        if (chosen == null || chosen.getService("SSLContext", "TLS") == null) {
            chosen = null;
            for (Provider p : Security.getProviders()) {
                String cls = p.getClass().getName();
                if (p.getService("SSLContext", "TLS") != null
                        && (cls.contains("conscrypt") || cls.startsWith("com.android."))) {
                    chosen = p;
                    break;
                }
            }
        }
        if (chosen == null) throw new IllegalStateException("No hay proveedor TLS de Android");
        SSLContext context = SSLContext.getInstance("TLS", chosen);
        context.init(null, null, null);
        platformSocketFactory = context.getSocketFactory();
        Log.i(TAG, "TLS provider for MicroG-RE download: " + chosen.getName());
        return platformSocketFactory;
    }

    private static HttpURLConnection open(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        if (c instanceof HttpsURLConnection) {
            ((HttpsURLConnection) c).setSSLSocketFactory(platformSocketFactory());
        }
        c.setConnectTimeout(15000);
        c.setReadTimeout(30000);
        c.setInstanceFollowRedirects(true);
        c.setRequestProperty("User-Agent", "FaroTV");
        int code = c.getResponseCode();
        if (code != 200) throw new IllegalStateException("HTTP " + code);
        return c;
    }

    private static String readText(String url) throws Exception {
        HttpURLConnection c = open(url);
        try (InputStream in = c.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return out.toString("UTF-8");
        } finally {
            c.disconnect();
        }
    }

    /** Streams the APK straight into a PackageInstaller session and commits it. */
    private static void install(Activity activity, String url, Progress progress) throws Exception {
        PackageInstaller installer = activity.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params =
                new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        int sessionId = installer.createSession(params);
        PackageInstaller.Session session = installer.openSession(sessionId);
        try {
            HttpURLConnection c = open(url);
            long total = c.getContentLengthLong();
            try (InputStream in = c.getInputStream();
                 OutputStream out = session.openWrite("microg.apk", 0, total > 0 ? total : -1)) {
                byte[] buf = new byte[64 * 1024];
                long done = 0;
                int last = -1, n;
                while ((n = in.read(buf)) > 0) {
                    out.write(buf, 0, n);
                    done += n;
                    int percent = total > 0 ? (int) (done * 100 / total) : -1;
                    if (percent != last) {
                        last = percent;
                        progress.update(percent);
                    }
                }
                session.fsync(out);
            } finally {
                c.disconnect();
            }

            registerResultReceiver(activity);
            Intent intent = new Intent(INSTALL_ACTION).setPackage(activity.getPackageName());
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 31) flags |= PendingIntent.FLAG_MUTABLE;
            PendingIntent pending = PendingIntent.getBroadcast(activity, sessionId, intent, flags);
            session.commit(pending.getIntentSender());
        } catch (Exception ex) {
            session.abandon();
            throw ex;
        } finally {
            session.close();
        }
    }

    private static boolean receiverRegistered;

    private static void registerResultReceiver(Activity activity) {
        if (receiverRegistered) return;
        receiverRegistered = true;
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                int status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE);
                Log.i(TAG, "MicroG-RE install status: " + status);
                if (status == PackageInstaller.STATUS_PENDING_USER_ACTION) {
                    // Android asks the user to confirm (and, the first time, to allow this app
                    // to install apps).
                    Intent confirm = intent.getParcelableExtra(Intent.EXTRA_INTENT);
                    if (confirm != null) {
                        confirm.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        context.startActivity(confirm);
                    }
                } else if (status == PackageInstaller.STATUS_SUCCESS) {
                    showDone(activity);
                } else {
                    String message = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                    showError(activity, new IllegalStateException(
                            "El instalador respondió: " + (message != null ? message : "estado " + status)));
                }
            }
        };
        IntentFilter filter = new IntentFilter(INSTALL_ACTION);
        if (Build.VERSION.SDK_INT >= 33) {
            activity.getApplicationContext().registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            activity.getApplicationContext().registerReceiver(receiver, filter);
        }
    }

    private static void showDone(Activity activity) {
        activity.runOnUiThread(() -> {
            try {
                TvDialog.show(activity,
                        "MicroG-RE instalado",
                        "Listo. Reinicia la app para empezar a usarla.",
                        null,
                        new String[]{"Reiniciar la app"},
                        false,
                        index -> restartApp(activity));
            } catch (Exception ignored) {
            }
        });
    }

    /** Starts the app's launcher activity in a new task and ends this process. */
    static void restartApp(Activity activity) {
        try {
            PackageManager pm = activity.getPackageManager();
            Intent launch = pm.getLeanbackLaunchIntentForPackage(activity.getPackageName());
            if (launch == null) launch = pm.getLaunchIntentForPackage(activity.getPackageName());
            if (launch != null && launch.getComponent() != null) {
                Intent restart = Intent.makeRestartActivityTask(launch.getComponent());
                activity.startActivity(restart);
            }
        } catch (Exception ex) {
            Log.e(TAG, "restart failed", ex);
        }
        activity.finishAffinity();
        Runtime.getRuntime().exit(0);
    }
}
