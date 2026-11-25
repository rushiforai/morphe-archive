package com.akshaykadam.pixelboard.extension.updater;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;

import com.akshaykadam.pixelboard.extension.BuildConfig;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Coordinates pre-release Beta testing builds, animated APK downloads,
 * emoji-free testing feature notes, and experimental feature opt-in state.
 */
public final class GboardBetaManager {

    private static final String TAG = "GboardProBeta";
    public static final String GITHUB_RELEASES_LIST_API =
            "https://api.github.com/repos/smartworldarafath/Gboard_Pro/releases?per_page=15";
    public static final String BETA_MARKER_TAG = "[BETA-TEST-APK]";

    public static final String PREF_NAME = "gboard_pro_beta_prefs";
    private static final String KEY_NEW_FEATURES_SLIDER = "beta_new_features_slider_enabled";
    private static final String KEY_LAST_NOTIFIED_BETA_TAG = "last_notified_beta_tag";
    private static final String KEY_LAST_NOTIFIED_FEATURES_SIG = "last_notified_beta_features_sig";

    public enum DownloadState {
        IDLE,
        CHECKING,
        AVAILABLE,
        NO_ACTIVE_BETA,
        DOWNLOADING,
        COMPLETED,
        ERROR
    }

    public static final class BetaBuildInfo {
        public final String tagName;
        public final String version;
        public final String title;
        public final String apkDownloadUrl;
        public final String apkFileName;
        public final long apkSizeBytes;
        public final List<String> testingFeatures;

        public BetaBuildInfo(
                String tagName,
                String version,
                String title,
                String apkDownloadUrl,
                String apkFileName,
                long apkSizeBytes,
                List<String> testingFeatures) {
            this.tagName = tagName != null ? tagName : "";
            this.version = version != null ? version : "";
            this.title = title != null ? title : "";
            this.apkDownloadUrl = apkDownloadUrl != null ? apkDownloadUrl : "";
            this.apkFileName = apkFileName != null ? apkFileName : "";
            this.apkSizeBytes = apkSizeBytes;
            this.testingFeatures = testingFeatures != null ? testingFeatures : Collections.emptyList();
        }
    }

    public static final class BetaFeatureItem {
        public final String title;
        public final String summary;

        public BetaFeatureItem(String title, String summary) {
            this.title = title != null ? title : "";
            this.summary = summary != null ? summary : "";
        }
    }

    public interface BetaCheckCallback {
        void onResult(BetaBuildInfo activeBuild, String errorMessage);
    }

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "GboardProBetaWorker");
        t.setDaemon(true);
        return t;
    });

    private static volatile GboardBetaManager sInstance;

    public static GboardBetaManager getInstance() {
        if (sInstance == null) {
            synchronized (GboardBetaManager.class) {
                if (sInstance == null) {
                    sInstance = new GboardBetaManager();
                }
            }
        }
        return sInstance;
    }

    private volatile DownloadState downloadState = DownloadState.NO_ACTIVE_BETA;
    private volatile BetaBuildInfo activeBetaBuild = null;
    private volatile int progressPercent = 0;
    private volatile long downloadedBytes = 0L;
    private volatile long totalBytes = 0L;
    private volatile float speedMbps = 0f;
    private volatile Uri downloadedApkUri = null;
    private volatile String lastError = null;

    private long activeDownloadId = -1L;
    private long lastSpeedTimeMs = 0L;
    private long lastSpeedBytes = 0L;
    private Handler progressHandler;
    private Runnable progressRunnable;
    private BroadcastReceiver downloadReceiver;

    private GboardBetaManager() {
    }

    public DownloadState getDownloadState() {
        return downloadState;
    }

    public BetaBuildInfo getActiveBetaBuild() {
        return activeBetaBuild;
    }

    public int getProgressPercent() {
        return progressPercent;
    }

    public long getDownloadedBytes() {
        return downloadedBytes;
    }

    public long getTotalBytes() {
        return totalBytes;
    }

    public float getSpeedMbps() {
        return speedMbps;
    }

    public Uri getDownloadedApkUri() {
        return downloadedApkUri;
    }

    public String getLastError() {
        return lastError;
    }

    public static boolean isBetaVersionInstalled(Context context) {
        String patchVer = BuildConfig.PATCH_VERSION != null ? BuildConfig.PATCH_VERSION : "";
        if (patchVer.toLowerCase(Locale.US).contains("beta")) {
            return true;
        }
        if (context != null) {
            try {
                PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                if (info != null && info.versionName != null
                        && info.versionName.toLowerCase(Locale.US).contains("beta")) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    public static String getInstalledBetaLabel(Context context) {
        String patchVer = BuildConfig.PATCH_VERSION != null ? BuildConfig.PATCH_VERSION : "";
        if (!patchVer.isEmpty()) {
            return "v" + patchVer;
        }
        if (context != null) {
            try {
                PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                if (info != null && !TextUtils.isEmpty(info.versionName)) {
                    return info.versionName;
                }
            } catch (Throwable ignored) {
            }
        }
        return "Stable";
    }

    public static boolean isBetaFeaturesSliderEnabled(Context context) {
        if (context == null) return false;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            if (prefs != null && prefs.contains(KEY_NEW_FEATURES_SLIDER)) {
                return prefs.getBoolean(KEY_NEW_FEATURES_SLIDER, false);
            }
        } catch (Throwable ignored) {
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    SharedPreferences dpsPrefs = dps.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
                    if (dpsPrefs != null && dpsPrefs.contains(KEY_NEW_FEATURES_SLIDER)) {
                        return dpsPrefs.getBoolean(KEY_NEW_FEATURES_SLIDER, false);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(context);
            if (defPrefs != null && defPrefs.contains(KEY_NEW_FEATURES_SLIDER)) {
                return defPrefs.getBoolean(KEY_NEW_FEATURES_SLIDER, false);
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static void setBetaFeaturesSliderEnabled(Context context, boolean enabled) {
        if (context == null) return;
        try {
            context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                    .edit().putBoolean(KEY_NEW_FEATURES_SLIDER, enabled).commit();
        } catch (Throwable ignored) {
        }
        try {
            PreferenceManager.getDefaultSharedPreferences(context)
                    .edit().putBoolean(KEY_NEW_FEATURES_SLIDER, enabled).commit();
        } catch (Throwable ignored) {
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !context.isDeviceProtectedStorage()) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    dps.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                            .edit().putBoolean(KEY_NEW_FEATURES_SLIDER, enabled).commit();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Returns currently testing experimental beta features that are staged for future stable releases.
     * Currently empty until new experimental features are explicitly registered.
     */
    public static List<BetaFeatureItem> getActiveExperimentalBetaFeatures(Context context) {
        return Collections.emptyList();
    }

    public void checkForActiveBetaApk(final Context context, final BetaCheckCallback callback) {
        checkForActiveBetaApk(context, true, callback);
    }

    public void checkForActiveBetaApk(final Context context, boolean showCheckingState, final BetaCheckCallback callback) {
        if (context == null) return;
        if (showCheckingState) {
            downloadState = DownloadState.CHECKING;
        }
        lastError = null;
        EXECUTOR.execute(() -> {
            BetaBuildInfo found = fetchRemoteBetaApk();
            activeBetaBuild = found;
            if (downloadState != DownloadState.DOWNLOADING && downloadState != DownloadState.COMPLETED) {
                downloadState = found != null ? DownloadState.AVAILABLE : DownloadState.NO_ACTIVE_BETA;
            }
            postToMain(() -> {
                if (callback != null) {
                    callback.onResult(found, lastError);
                }
            });
        });
    }

    public static void checkRemoteBetaReleaseInBackground(Context context) {
        if (context == null) return;
        try {
            BetaBuildInfo betaBuild = fetchRemoteBetaApkStatic();
            SharedPreferences prefs = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            if (betaBuild != null && !TextUtils.isEmpty(betaBuild.tagName)) {
                String lastNotified = prefs.getString(KEY_LAST_NOTIFIED_BETA_TAG, "");
                if (!betaBuild.tagName.equals(lastNotified)) {
                    prefs.edit().putString(KEY_LAST_NOTIFIED_BETA_TAG, betaBuild.tagName).apply();
                    StringBuilder summary = new StringBuilder();
                    for (String feat : betaBuild.testingFeatures) {
                        summary.append("- ").append(feat).append('\n');
                    }
                    GboardNotificationHelper.showBetaApkNotification(
                            context, betaBuild.version, betaBuild.title, summary.toString().trim());
                }
            }

            List<BetaFeatureItem> activeFeatures = getActiveExperimentalBetaFeatures(context);
            if (!activeFeatures.isEmpty()) {
                StringBuilder sig = new StringBuilder();
                for (BetaFeatureItem item : activeFeatures) {
                    sig.append(item.title).append(';');
                }
                String sigStr = sig.toString();
                String prevSig = prefs.getString(KEY_LAST_NOTIFIED_FEATURES_SIG, "");
                if (!sigStr.equals(prevSig)) {
                    prefs.edit().putString(KEY_LAST_NOTIFIED_FEATURES_SIG, sigStr).apply();
                    GboardNotificationHelper.showNewBetaFeaturesNotification(
                            context, activeFeatures.size(), activeFeatures.get(0).title);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Background beta check error", t);
        }
    }

    private BetaBuildInfo fetchRemoteBetaApk() {
        try {
            return fetchRemoteBetaApkStatic();
        } catch (Throwable t) {
            lastError = t.getMessage() != null ? t.getMessage() : "Unable to check beta builds";
            return null;
        }
    }

    private static BetaBuildInfo fetchRemoteBetaApkStatic() throws Exception {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(GITHUB_RELEASES_LIST_API);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Gboard-Pro-Android-App");
            conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoInput(true);

            int code = conn.getResponseCode();
            if (code != 200) {
                throw new Exception("GitHub returned HTTP " + code);
            }

            InputStream in = conn.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
            }
            reader.close();

            JSONArray arr = new JSONArray(sb.toString());
            for (int i = 0; i < arr.length(); i++) {
                JSONObject rel = arr.optJSONObject(i);
                if (rel == null) continue;
                boolean draft = rel.optBoolean("draft", false);
                boolean prerelease = rel.optBoolean("prerelease", false);
                if (draft || !prerelease) continue;

                String tagName = rel.optString("tag_name", "");
                String name = rel.optString("name", "");
                String body = rel.optString("body", "");
                boolean markedForBetaTesting = body.contains(BETA_MARKER_TAG)
                        || tagName.toLowerCase(Locale.US).contains("beta-test")
                        || name.toLowerCase(Locale.US).contains("beta testing");
                if (!markedForBetaTesting) {
                    continue;
                }

                String apkUrl = "";
                String apkName = "";
                long apkSize = 0L;
                JSONArray assets = rel.optJSONArray("assets");
                if (assets != null) {
                    for (int a = 0; a < assets.length(); a++) {
                        JSONObject asset = assets.optJSONObject(a);
                        if (asset == null) continue;
                        String assetName = asset.optString("name", "");
                        if (assetName.endsWith(".apk")) {
                            apkUrl = asset.optString("browser_download_url", "");
                            apkName = assetName;
                            apkSize = asset.optLong("size", 0L);
                            break;
                        }
                    }
                }
                if (apkUrl.isEmpty()) {
                    continue;
                }

                String version = tagName.startsWith("v") ? tagName.substring(1) : tagName;
                List<String> features = extractBulletFeaturesWithoutEmojis(body);
                return new BetaBuildInfo(tagName, version, stripEmojis(name), apkUrl, apkName, apkSize, features);
            }
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    public static List<String> extractBulletFeaturesWithoutEmojis(String body) {
        if (TextUtils.isEmpty(body)) {
            return Collections.emptyList();
        }
        List<String> items = new ArrayList<>();
        String[] lines = body.replace("\r", "").split("\n");
        for (String raw : lines) {
            String t = raw.trim();
            if (t.isEmpty() || t.equals(BETA_MARKER_TAG)) continue;
            if (t.startsWith("- ") || t.startsWith("* ") || t.startsWith("• ")) {
                String clean = stripEmojis(t.substring(2)).trim();
                if (!clean.isEmpty()) {
                    items.add(clean);
                }
            }
        }
        return items;
    }

    public static String stripEmojis(String input) {
        if (input == null || input.isEmpty()) return "";
        StringBuilder out = new StringBuilder(input.length());
        int len = input.length();
        for (int i = 0; i < len; ) {
            int cp = input.codePointAt(i);
            int charCount = Character.charCount(cp);
            boolean skip = (cp >= 0x1F000 && cp <= 0x1FAFF)
                    || (cp >= 0x2600 && cp <= 0x27BF)
                    || (cp >= 0xFE00 && cp <= 0xFE0F)
                    || cp == 0x200D
                    || cp == 0x20E3;
            if (!skip) {
                out.appendCodePoint(cp);
            }
            i += charCount;
        }
        return out.toString().replaceAll("  +", " ").trim();
    }

    public void downloadBetaApk(Activity activity, BetaBuildInfo info, Runnable onStateChanged) {
        if (activity == null || info == null || TextUtils.isEmpty(info.apkDownloadUrl)) {
            return;
        }
        Context appContext = activity.getApplicationContext();
        DownloadManager dm = (DownloadManager) appContext.getSystemService(Context.DOWNLOAD_SERVICE);
        if (dm == null) {
            lastError = "DownloadManager unavailable";
            downloadState = DownloadState.ERROR;
            if (onStateChanged != null) postToMain(onStateChanged);
            return;
        }

        try {
            String fileName = !TextUtils.isEmpty(info.apkFileName)
                    ? info.apkFileName
                    : ("Gboard_Pro_Beta_" + info.version + ".apk");

            DownloadManager.Request req = new DownloadManager.Request(Uri.parse(info.apkDownloadUrl));
            req.setTitle("Downloading Beta " + info.version);
            req.setDescription(fileName);
            req.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
            req.setMimeType("application/vnd.android.package-archive");
            req.allowScanningByMediaScanner();
            try {
                req.setDestinationInExternalFilesDir(appContext, Environment.DIRECTORY_DOWNLOADS, fileName);
            } catch (Throwable t) {
                req.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName);
            }

            activeDownloadId = dm.enqueue(req);
            downloadedApkUri = null;
            progressPercent = 0;
            downloadedBytes = 0L;
            totalBytes = info.apkSizeBytes;
            speedMbps = 0f;
            lastSpeedTimeMs = System.currentTimeMillis();
            lastSpeedBytes = 0L;
            downloadState = DownloadState.DOWNLOADING;

            registerReceiver(appContext, activeDownloadId, onStateChanged);
            startTrackingProgress(appContext, dm, activeDownloadId, onStateChanged);
            if (onStateChanged != null) postToMain(onStateChanged);
        } catch (Throwable t) {
            lastError = t.getMessage() != null ? t.getMessage() : "Download error";
            downloadState = DownloadState.ERROR;
            if (onStateChanged != null) postToMain(onStateChanged);
        }
    }

    private void startTrackingProgress(
            final Context appContext,
            final DownloadManager dm,
            final long id,
            final Runnable onStateChanged) {
        stopTrackingProgress();
        progressHandler = new Handler(Looper.getMainLooper());
        progressRunnable = new Runnable() {
            @Override
            public void run() {
                if (downloadState != DownloadState.DOWNLOADING) {
                    return;
                }
                DownloadManager.Query q = new DownloadManager.Query();
                q.setFilterById(id);
                try (Cursor c = dm.query(q)) {
                    if (c != null && c.moveToFirst()) {
                        int stIdx = c.getColumnIndex(DownloadManager.COLUMN_STATUS);
                        int dlIdx = c.getColumnIndex(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR);
                        int totIdx = c.getColumnIndex(DownloadManager.COLUMN_TOTAL_SIZE_BYTES);
                        int status = c.getInt(stIdx);
                        if (status == DownloadManager.STATUS_RUNNING || status == DownloadManager.STATUS_PENDING) {
                            long cur = Math.max(0L, c.getLong(dlIdx));
                            long tot = c.getLong(totIdx);
                            downloadedBytes = cur;
                            if (tot > 0L) {
                                totalBytes = tot;
                                progressPercent = (int) Math.min(100L, (cur * 100L) / tot);
                            }
                            long now = System.currentTimeMillis();
                            long dt = now - lastSpeedTimeMs;
                            if (dt >= 250L) {
                                long db = cur - lastSpeedBytes;
                                if (db >= 0L) {
                                    float inst = (float) ((db * 8.0) / ((dt / 1000.0) * 1_000_000.0));
                                    speedMbps = speedMbps <= 0.05f ? inst : (speedMbps * 0.6f + inst * 0.4f);
                                }
                                lastSpeedBytes = cur;
                                lastSpeedTimeMs = now;
                            }
                            if (onStateChanged != null) onStateChanged.run();
                        }
                    }
                } catch (Throwable ignored) {
                }
                if (downloadState == DownloadState.DOWNLOADING && progressHandler != null) {
                    progressHandler.postDelayed(this, 180L);
                }
            }
        };
        progressHandler.post(progressRunnable);
    }

    private void stopTrackingProgress() {
        if (progressHandler != null && progressRunnable != null) {
            progressHandler.removeCallbacks(progressRunnable);
            progressRunnable = null;
        }
    }

    private void registerReceiver(final Context appContext, final long targetId, final Runnable onStateChanged) {
        if (downloadReceiver != null) {
            try {
                appContext.unregisterReceiver(downloadReceiver);
            } catch (Throwable ignored) {
            }
            downloadReceiver = null;
        }
        downloadReceiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                if (intent == null || !DownloadManager.ACTION_DOWNLOAD_COMPLETE.equals(intent.getAction())) {
                    return;
                }
                long completedId = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1L);
                if (completedId != targetId) return;
                stopTrackingProgress();
                DownloadManager dm = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
                if (dm == null) return;
                DownloadManager.Query q = new DownloadManager.Query();
                q.setFilterById(targetId);
                try (Cursor c = dm.query(q)) {
                    if (c != null && c.moveToFirst()) {
                        int status = c.getInt(c.getColumnIndex(DownloadManager.COLUMN_STATUS));
                        if (status == DownloadManager.STATUS_SUCCESSFUL) {
                            downloadedApkUri = dm.getUriForDownloadedFile(targetId);
                            progressPercent = 100;
                            downloadState = DownloadState.COMPLETED;
                            if (onStateChanged != null) postToMain(onStateChanged);
                            if (downloadedApkUri != null) {
                                PixelBoardUpdateManager.promptInstallApk(context, downloadedApkUri);
                            }
                        } else if (status == DownloadManager.STATUS_FAILED) {
                            downloadState = DownloadState.ERROR;
                            lastError = "Beta APK download failed";
                            if (onStateChanged != null) postToMain(onStateChanged);
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Error finishing beta APK download", t);
                } finally {
                    try {
                        appContext.unregisterReceiver(this);
                    } catch (Throwable ignored) {
                    }
                    downloadReceiver = null;
                }
            }
        };
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            appContext.registerReceiver(downloadReceiver,
                    new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE),
                    Context.RECEIVER_EXPORTED);
        } else {
            appContext.registerReceiver(downloadReceiver,
                    new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE));
        }
    }

    private static void postToMain(Runnable r) {
        if (r == null) return;
        try {
            Looper main = Looper.getMainLooper();
            if (main != null) {
                new Handler(main).post(r);
                return;
            }
        } catch (Throwable ignored) {
        }
        r.run();
    }
}
