package app.aidan.extension.fizz;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

public final class VersionBridge {
    private static final String TAG = "FizzVersionBridge";

    public static final String WORKER_URL =
            "https://worker.patch.p0ntus.com/api/version/com.ashtoncofer.Buzz";
    public static final String DEFAULT_VERSION = "1.60.0";
    public static final String DEFAULT_BUILD_NUMBER = "400032";

    private static final String PREFS_FILE = "aidan_fizz_version_spoof";
    private static final String KEY_VERSION = "cached_version";
    private static final String KEY_BUILD_NUMBER = "cached_build_number";
    private static final String KEY_LAST_SYNC = "last_sync_timestamp";
    private static final long SYNC_INTERVAL_MS = 24 * 60 * 60 * 1000L; // 24 hours

    private static volatile String sClientVersion = DEFAULT_VERSION;
    private static volatile String sBuildNumber = DEFAULT_BUILD_NUMBER;
    private static final AtomicBoolean sSyncTriggered = new AtomicBoolean(false);

    private VersionBridge() {
    }

    /**
     * Initializes the version bridge from SharedPreferences and triggers a background
     * sync check if the cache is older than 24 hours. Guaranteed non-blocking.
     */
    public static void init(Context context) {
        if (context == null) {
            return;
        }

        try {
            Context appContext = context.getApplicationContext();
            if (appContext == null) {
                appContext = context;
            }

            final SharedPreferences prefs =
                    appContext.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE);

            String cachedVersion = prefs.getString(KEY_VERSION, null);
            if (cachedVersion != null && !cachedVersion.trim().isEmpty()) {
                sClientVersion = cachedVersion.trim();
            }

            String cachedBuildNumber = prefs.getString(KEY_BUILD_NUMBER, null);
            if (cachedBuildNumber != null && !cachedBuildNumber.trim().isEmpty()) {
                sBuildNumber = cachedBuildNumber.trim();
            }

            if (sSyncTriggered.compareAndSet(false, true)) {
                long lastSync = prefs.getLong(KEY_LAST_SYNC, 0L);
                long now = System.currentTimeMillis();

                if (now - lastSync > SYNC_INTERVAL_MS || lastSync == 0L) {
                    Thread syncThread = new Thread(new Runnable() {
                        @Override
                        public void run() {
                            syncVersionFromWorker(prefs);
                        }
                    }, "FizzVersionSync");
                    syncThread.setDaemon(true);
                    syncThread.start();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to initialize VersionBridge", t);
        }
    }

    /**
     * Synchronizes latest version info from the worker in background daemon thread.
     */
    private static void syncVersionFromWorker(SharedPreferences prefs) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(WORKER_URL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setRequestProperty("Accept", "application/json");
            conn.connect();

            int code = conn.getResponseCode();
            if (code == 200) {
                BufferedReader reader =
                        new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                reader.close();

                JSONObject json = new JSONObject(sb.toString());
                String versionName = json.optString("versionName", null);
                long versionCode = json.optLong("versionCode", 0L);

                SharedPreferences.Editor editor = prefs.edit();
                boolean changed = false;

                if (versionName != null && !versionName.trim().isEmpty()) {
                    sClientVersion = versionName.trim();
                    editor.putString(KEY_VERSION, sClientVersion);
                    changed = true;
                }

                if (versionCode > 0) {
                    sBuildNumber = String.valueOf(versionCode);
                    editor.putString(KEY_BUILD_NUMBER, sBuildNumber);
                    changed = true;
                }

                editor.putLong(KEY_LAST_SYNC, System.currentTimeMillis());
                editor.apply();

                if (changed) {
                    Log.i(TAG, "Updated spoofed Fizz version to " + sClientVersion + " (build " + sBuildNumber + ")");
                }
            } else {
                Log.w(TAG, "Worker returned HTTP " + code);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Background sync from worker failed (using cached/default version: " + sClientVersion + ")", t);
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }

    /**
     * Returns the spoofed Fizz client version string (e.g. "1.60.0").
     */
    public static String getClientVersion() {
        return sClientVersion;
    }

    /**
     * Returns the spoofed Fizz build number string (e.g. "400032").
     */
    public static String getBuildNumber() {
        return sBuildNumber;
    }
}
