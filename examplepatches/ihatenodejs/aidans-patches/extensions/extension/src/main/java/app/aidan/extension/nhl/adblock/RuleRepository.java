package app.aidan.extension.nhl.adblock;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.GZIPInputStream;

import javax.net.ssl.HttpsURLConnection;

/**
 * Manages filter list subscriptions, bundled snapshots, custom rules,
 * network updates, and atomic engine compilation.
 */
public final class RuleRepository {
    private static final String TAG = "AidanAdBlockRepo";
    private static final String PREFS_NAME = "aidan_nhl_adblock_rules";

    private static final String KEY_SUBSCRIPTIONS = "subscriptions_json";
    private static final String KEY_CUSTOM_RULES = "custom_rules";
    private static final String KEY_LAST_UPDATE = "last_update_ms";

    public static final int MAX_EXTERNAL_SUBSCRIPTIONS = 8;
    public static final long MAX_LIST_BYTES = 8 * 1024 * 1024L; // 8 MiB
    public static final long MAX_TOTAL_BYTES = 24 * 1024 * 1024L; // 24 MiB
    public static final int MAX_RULES_COUNT = 300_000;
    public static final int MAX_CUSTOM_RULES_BYTES = 256 * 1024; // 256 KiB

    private static volatile RuleRepository sInstance;

    private final Context mContext;
    private final SharedPreferences mPrefs;
    private final ExecutorService mExecutor;
    private final File mListsDir;
    private final File mCacheFile;

    private final ScheduledExecutorService mCleanupExecutor =
            Executors.newSingleThreadScheduledExecutor(r -> {
                Thread t = new Thread(r, "aidan-nhl-engine-cleanup");
                t.setDaemon(true);
                return t;
            });
    private final AtomicLong mActiveEngineHandle = new AtomicLong(0L);
    private final AtomicLong mGeneration = new AtomicLong(1L);
    private final AtomicBoolean mIsCompiling = new AtomicBoolean(false);
    private final Set<String> mActiveDownloads = ConcurrentHashMap.newKeySet();

    private final List<SubscriptionInfo> mSubscriptions = Collections.synchronizedList(new ArrayList<>());
    private volatile String mCustomRules = "";

    public static RuleRepository get(Context context) {
        if (sInstance == null) {
            synchronized (RuleRepository.class) {
                if (sInstance == null) {
                    sInstance = new RuleRepository(context.getApplicationContext());
                }
            }
        }
        return sInstance;
    }

    public static final class SubscriptionInfo {
        public final String id;
        public final String name;
        public final String url;
        public final boolean isBuiltin;
        public boolean enabled;
        public long lastUpdated;
        public int acceptedCount;
        public int unsupportedCount;
        public int invalidCount;
        public String etag;
        public String lastModified;
        public String lastError;

        public SubscriptionInfo(String id, String name, String url, boolean isBuiltin, boolean enabled) {
            this.id = id;
            this.name = name;
            this.url = url;
            this.isBuiltin = isBuiltin;
            this.enabled = enabled;
            this.lastUpdated = 0L;
            this.etag = "";
            this.lastModified = "";
            this.lastError = "";
        }

        public JSONObject toJson() {
            try {
                JSONObject obj = new JSONObject();
                obj.put("id", id);
                obj.put("name", name);
                obj.put("url", url);
                obj.put("builtin", isBuiltin);
                obj.put("enabled", enabled);
                obj.put("lastUpdated", lastUpdated);
                obj.put("accepted", acceptedCount);
                obj.put("unsupported", unsupportedCount);
                obj.put("invalid", invalidCount);
                obj.put("etag", etag);
                obj.put("lastModified", lastModified);
                obj.put("lastError", lastError);
                return obj;
            } catch (Exception e) {
                return new JSONObject();
            }
        }

        public static SubscriptionInfo fromJson(JSONObject obj) {
            SubscriptionInfo s = new SubscriptionInfo(
                    obj.optString("id", ""),
                    obj.optString("name", ""),
                    obj.optString("url", ""),
                    obj.optBoolean("builtin", false),
                    obj.optBoolean("enabled", true)
            );
            s.lastUpdated = obj.optLong("lastUpdated", 0L);
            s.acceptedCount = obj.optInt("accepted", 0);
            s.unsupportedCount = obj.optInt("unsupported", 0);
            s.invalidCount = obj.optInt("invalid", 0);
            s.etag = obj.optString("etag", "");
            s.lastModified = obj.optString("lastModified", "");
            s.lastError = obj.optString("lastError", "");
            return s;
        }
    }

    private RuleRepository(Context context) {
        mContext = context;
        mPrefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        mExecutor = Executors.newSingleThreadExecutor();

        mListsDir = new File(context.getFilesDir(), "aidan/nhl/adblock/lists");
        if (!mListsDir.exists()) {
            mListsDir.mkdirs();
        }
        mCacheFile = new File(context.getFilesDir(), "aidan/nhl/adblock/engine.cache");

        mCustomRules = mPrefs.getString(KEY_CUSTOM_RULES, "");
        loadSubscriptions();
    }

    public long getActiveEngineHandle() {
        return mActiveEngineHandle.get();
    }

    public long getGeneration() {
        return mGeneration.get();
    }

    public boolean isCompiling() {
        return mIsCompiling.get();
    }

    public boolean isDownloading(String id) {
        return mActiveDownloads.contains(id);
    }

    public File getListsDir() {
        return mListsDir;
    }

    public List<SubscriptionInfo> getSubscriptions() {
        synchronized (mSubscriptions) {
            return new ArrayList<>(mSubscriptions);
        }
    }

    public String getCustomRules() {
        return mCustomRules;
    }

    public void setCustomRules(String rules) {
        if (rules == null) rules = "";
        if (rules.getBytes(StandardCharsets.UTF_8).length > MAX_CUSTOM_RULES_BYTES) {
            throw new IllegalArgumentException("Custom rules exceed 256 KiB limit");
        }
        mCustomRules = rules;
        mPrefs.edit().putString(KEY_CUSTOM_RULES, rules).apply();
        recompileAsync(null);
    }

    public void setSubscriptionEnabled(String id, boolean enabled) {
        setSubscriptionEnabled(id, enabled, null);
    }

    public void setSubscriptionEnabled(String id, boolean enabled, Runnable onComplete) {
        SubscriptionInfo target = null;
        synchronized (mSubscriptions) {
            for (SubscriptionInfo s : mSubscriptions) {
                if (s.id.equals(id)) {
                    s.enabled = enabled;
                    target = s;
                    break;
                }
            }
        }
        saveSubscriptions();

        if (target != null && enabled) {
            File f = new File(mListsDir, target.id + ".txt");
            if ((!f.exists() || f.length() == 0) && !"nhl-default".equals(target.id)) {
                updateSubscriptionAsync(target, onComplete);
                return;
            }
        }
        recompileAsync(onComplete);
    }

    public void deleteSubscriptionFile(String id) {
        if ("nhl-default".equals(id)) return;
        synchronized (mSubscriptions) {
            for (SubscriptionInfo s : mSubscriptions) {
                if (s.id.equals(id)) {
                    s.acceptedCount = 0;
                    s.unsupportedCount = 0;
                    s.invalidCount = 0;
                    s.lastUpdated = 0L;
                    s.etag = "";
                    s.lastModified = "";
                    s.lastError = "";
                    break;
                }
            }
        }
        File file = new File(mListsDir, id + ".txt");
        if (file.exists()) file.delete();
        saveSubscriptions();
        recompileAsync(null);
    }

    public void addSubscription(String name, String url) {
        if (url == null || !url.startsWith("https://")) {
            throw new IllegalArgumentException("Subscriptions must use HTTPS");
        }
        synchronized (mSubscriptions) {
            int externalCount = 0;
            for (SubscriptionInfo s : mSubscriptions) {
                if (!s.isBuiltin) externalCount++;
                if (s.url.equalsIgnoreCase(url)) {
                    throw new IllegalArgumentException("Subscription already exists");
                }
            }
            if (externalCount >= MAX_EXTERNAL_SUBSCRIPTIONS) {
                throw new IllegalStateException("Maximum of " + MAX_EXTERNAL_SUBSCRIPTIONS + " external subscriptions allowed");
            }
            String id = "user_" + System.currentTimeMillis();
            mSubscriptions.add(new SubscriptionInfo(id, name, url, false, true));
        }
        saveSubscriptions();
        updateSubscriptionAsync(mSubscriptions.get(mSubscriptions.size() - 1));
    }

    public void removeSubscription(String id) {
        synchronized (mSubscriptions) {
            for (int i = 0; i < mSubscriptions.size(); i++) {
                SubscriptionInfo s = mSubscriptions.get(i);
                if (s.id.equals(id) && !s.isBuiltin) {
                    mSubscriptions.remove(i);
                    File file = new File(mListsDir, s.id + ".txt");
                    if (file.exists()) file.delete();
                    break;
                }
            }
        }
        saveSubscriptions();
        recompileAsync(null);
    }

    public void updateAllSubscriptionsAsync(Runnable onComplete) {
        mExecutor.execute(() -> {
            List<SubscriptionInfo> list = getSubscriptions();
            for (SubscriptionInfo s : list) {
                if (s.enabled && !"nhl-default".equals(s.id)) {
                    fetchSubscription(s);
                }
            }
            compileInternal();
            if (onComplete != null) onComplete.run();
        });
    }

    public void updateSubscriptionAsync(SubscriptionInfo info) {
        updateSubscriptionAsync(info, null);
    }

    public void updateSubscriptionAsync(SubscriptionInfo info, Runnable onComplete) {
        mExecutor.execute(() -> {
            try {
                fetchSubscription(info);
                compileInternal();
            } finally {
                if (onComplete != null) onComplete.run();
            }
        });
    }

    public void recompileAsync(Runnable onComplete) {
        mExecutor.execute(() -> {
            compileInternal();
            if (onComplete != null) onComplete.run();
        });
    }

    /**
     * Initializes the repository on first launch by copying bundled rule snapshots and compiling.
     */
    public void ensureInitialized() {
        ensureInitialized(null);
    }

    public void ensureInitialized(Runnable onComplete) {
        mExecutor.execute(() -> {
            try {
                copyBundledAssetsIfMissing();
                synchronized (mSubscriptions) {
                    boolean changed = false;
                    for (SubscriptionInfo s : mSubscriptions) {
                        if (s.isBuiltin && (s.acceptedCount == 0 || (s.lastError != null && !s.lastError.isEmpty()))) {
                            File f = new File(mListsDir, s.id + ".txt");
                            if (f.exists() && f.length() > 0) {
                                parseDiagnosticsForFile(f, s);
                                changed = true;
                            }
                        }
                    }
                    if (changed) {
                        saveSubscriptions();
                    }
                }
                compileInternal();
            } finally {
                if (onComplete != null) {
                    onComplete.run();
                }
            }
        });
    }
    private void copyBundledAssetsIfMissing() {
        String[] bundled = new String[] { "nhl-default.txt" };
        for (String filename : bundled) {
            File dest = new File(mListsDir, filename);
            if (!dest.exists()) {
                try {
                    // Try copying from APK assets/aidan/nhl/adblock/ or classpath resources
                    InputStream is = null;
                    try {
                        is = mContext.getAssets().open("aidan/nhl/adblock/" + filename);
                    } catch (Exception ignored) {
                        is = getClass().getResourceAsStream("/nhl/adblock/" + filename);
                    }
                    if (is != null) {
                        try (FileOutputStream fos = new FileOutputStream(dest)) {
                            byte[] buf = new byte[8192];
                            int read;
                            while ((read = is.read(buf)) != -1) {
                                fos.write(buf, 0, read);
                            }
                        }
                        is.close();
                    }
                } catch (Exception e) {
                    Log.e(TAG, "Failed to copy bundled asset: " + filename, e);
                }
            }
        }
    }

    private void compileInternal() {
        if (!NativeEngine.isAvailable()) {
            Log.w(TAG, "Native engine not available; skipping compilation");
            return;
        }

        mIsCompiling.set(true);
        try {
            copyBundledAssetsIfMissing();

            List<String> validPaths = new ArrayList<>();
            long totalBytes = 0L;

            synchronized (mSubscriptions) {
                for (SubscriptionInfo s : mSubscriptions) {
                    if (!s.enabled) continue;
                    File f = new File(mListsDir, s.isBuiltin ? s.id + ".txt" : s.id + ".txt");
                    if (f.exists() && f.length() > 0 && f.length() <= MAX_LIST_BYTES) {
                        totalBytes += f.length();
                        validPaths.add(f.getAbsolutePath());
                    }
                }
            }

            // Write custom rules to staging file
            if (!mCustomRules.trim().isEmpty()) {
                File customFile = new File(mListsDir, "custom.txt");
                try (FileOutputStream fos = new FileOutputStream(customFile)) {
                    fos.write(mCustomRules.getBytes(StandardCharsets.UTF_8));
                }
                validPaths.add(customFile.getAbsolutePath());
            }

            if (totalBytes > MAX_TOTAL_BYTES) {
                Log.e(TAG, "Total filter lists size exceeds 24 MiB limit: " + totalBytes);
                return;
            }

            long newHandle = NativeEngine.compile(
                    validPaths.toArray(new String[0]),
                    mCacheFile.getAbsolutePath()
            );

            if (newHandle != 0L) {
                long oldHandle = mActiveEngineHandle.getAndSet(newHandle);
                mGeneration.incrementAndGet();
                if (oldHandle != 0L) {
                    mCleanupExecutor.schedule(() -> {
                        NativeEngine.release(oldHandle);
                    }, 5000L, TimeUnit.MILLISECONDS);
                }
                Log.i(TAG, "Successfully compiled adblock engine generation " + mGeneration.get());
            }
        } catch (Exception e) {
            Log.e(TAG, "Engine compilation failed", e);
        } finally {
            mIsCompiling.set(false);
        }
    }

    private void fetchSubscription(SubscriptionInfo s) {
        if ("nhl-default".equals(s.id)) return;
        mActiveDownloads.add(s.id);
        try {
            URL currentUrl = new URL(s.url);
            int redirects = 0;
            HttpsURLConnection conn = null;

            while (redirects < 3) {
                if (!currentUrl.getProtocol().equalsIgnoreCase("https")) {
                    throw new IllegalArgumentException("Redirect to non-HTTPS URL disallowed: " + currentUrl);
                }

                // DNS resolution check: reject non-public IPs
                InetAddress addr = InetAddress.getByName(currentUrl.getHost());
                if (addr.isLoopbackAddress() || addr.isSiteLocalAddress() || addr.isLinkLocalAddress() || addr.isAnyLocalAddress()) {
                    throw new SecurityException("Host resolves to private or loopback IP: " + addr);
                }

                conn = (HttpsURLConnection) currentUrl.openConnection();
                conn.setInstanceFollowRedirects(false);
                conn.setConnectTimeout(10_000);
                conn.setReadTimeout(30_000);
                conn.setRequestProperty("User-Agent", "NHL-AdBlock/1.0");
                conn.setRequestProperty("Accept-Encoding", "gzip");
                if (s.lastUpdated > 0L && !s.etag.isEmpty()) {
                    conn.setRequestProperty("If-None-Match", s.etag);
                }

                int code = conn.getResponseCode();
                if (code == HttpURLConnection.HTTP_NOT_MODIFIED) {
                    s.lastUpdated = System.currentTimeMillis();
                    s.lastError = "";
                    return;
                }
                if (code == HttpURLConnection.HTTP_MOVED_PERM || code == HttpURLConnection.HTTP_MOVED_TEMP || code == 307 || code == 308) {
                    String loc = conn.getHeaderField("Location");
                    if (loc == null) break;
                    currentUrl = new URL(currentUrl, loc);
                    redirects++;
                    continue;
                }
                if (code == HttpURLConnection.HTTP_OK) {
                    break;
                }
                throw new IllegalStateException("HTTP error " + code);
            }

            if (conn == null) throw new IllegalStateException("Connection failed");

            String encoding = conn.getContentEncoding();
            InputStream is = conn.getInputStream();
            if ("gzip".equalsIgnoreCase(encoding)) {
                is = new GZIPInputStream(is);
            }

            File targetFile = new File(mListsDir, s.id + ".txt");
            File tmpFile = new File(mListsDir, s.id + ".txt.tmp");

            long written = 0L;
            try (FileOutputStream fos = new FileOutputStream(tmpFile)) {
                byte[] buf = new byte[8192];
                int read;
                while ((read = is.read(buf)) != -1) {
                    written += read;
                    if (written > MAX_LIST_BYTES) {
                        tmpFile.delete();
                        throw new IllegalStateException("Subscription exceeds 8 MiB limit");
                    }
                    fos.write(buf, 0, read);
                }
            } finally {
                is.close();
            }

            // Atomic rename
            tmpFile.renameTo(targetFile);

            s.etag = conn.getHeaderField("ETag") != null ? conn.getHeaderField("ETag") : "";
            s.lastModified = conn.getHeaderField("Last-Modified") != null ? conn.getHeaderField("Last-Modified") : "";
            s.lastUpdated = System.currentTimeMillis();
            s.lastError = "";

            // Parse diagnostics
            parseDiagnosticsForFile(targetFile, s);
        } catch (Exception e) {
            s.lastError = e.getMessage() != null ? e.getMessage() : e.toString();
            Log.w(TAG, "Failed to update subscription " + s.url, e);
        } finally {
            mActiveDownloads.remove(s.id);
            saveSubscriptions();
        }
    }
    private static byte[] readFully(File file) throws IOException {
        long length = file.length();
        if (length > MAX_LIST_BYTES) {
            throw new IOException("File exceeds maximum allowed size: " + file.getAbsolutePath());
        }
        byte[] buffer = new byte[(int) length];
        try (FileInputStream fis = new FileInputStream(file)) {
            int offset = 0;
            int numRead;
            while (offset < buffer.length && (numRead = fis.read(buffer, offset, buffer.length - offset)) >= 0) {
                offset += numRead;
            }
            if (offset < buffer.length) {
                byte[] exact = new byte[offset];
                System.arraycopy(buffer, 0, exact, 0, offset);
                return exact;
            }
            return buffer;
        }
    }

    private void parseDiagnosticsForFile(File targetFile, SubscriptionInfo s) {
        if (!targetFile.exists() || targetFile.length() == 0) {
            s.lastError = "Rule file missing or empty";
            return;
        }
        if (!NativeEngine.isAvailable()) {
            s.lastError = "Native adblock engine unavailable";
            return;
        }
        try {
            byte[] b = readFully(targetFile);
            String diagJson = NativeEngine.parseDiagnostics(new String(b, StandardCharsets.UTF_8));
            if (diagJson != null && !diagJson.isEmpty()) {
                JSONObject dObj = new JSONObject(diagJson);
                if (dObj.has("accepted_count")) {
                    s.acceptedCount = dObj.getInt("accepted_count");
                    s.unsupportedCount = dObj.optInt("unsupported_count", 0);
                    s.invalidCount = dObj.optInt("invalid_count", 0);
                    s.lastError = "";
                } else {
                    s.lastError = "Missing accepted_count in diagnostics";
                }
            } else {
                s.lastError = "Empty diagnostics response";
            }
        } catch (Exception e) {
            s.lastError = e.getMessage() != null ? e.getMessage() : e.toString();
            Log.w(TAG, "Failed to parse diagnostics for " + targetFile.getName(), e);
        }
    }


    private void loadSubscriptions() {
        String jsonStr = mPrefs.getString(KEY_SUBSCRIPTIONS, null);
        List<SubscriptionInfo> list = new ArrayList<>();
        if (jsonStr != null) {
            try {
                JSONArray array = new JSONArray(jsonStr);
                for (int i = 0; i < array.length(); i++) {
                    list.add(SubscriptionInfo.fromJson(array.getJSONObject(i)));
                }
            } catch (Exception e) {
                Log.w(TAG, "Failed to parse saved subscriptions", e);
            }
        }

        // Ensure built-in lists are always present
        ensureBuiltin(list, "nhl-default", "Aidan's NHL Rules", "https://github.com/ihatenodejs/aidans-patches", true);
        ensureBuiltin(list, "easylist", "EasyList", "https://easylist.to/easylist/easylist.txt", false);
        ensureBuiltin(list, "easyprivacy", "EasyPrivacy", "https://easylist.to/easylist/easyprivacy.txt", false);

        for (SubscriptionInfo s : list) {
            if (("easylist".equals(s.id) || "easyprivacy".equals(s.id)) && s.lastUpdated == 0L) {
                File f = new File(mListsDir, s.id + ".txt");
                if (!f.exists() || f.length() == 0) {
                    s.enabled = false;
                }
            }
        }

        mSubscriptions.clear();
        mSubscriptions.addAll(list);
    }

    private void ensureBuiltin(List<SubscriptionInfo> list, String id, String name, String url, boolean defEnabled) {
        for (SubscriptionInfo s : list) {
            if (s.id.equals(id)) return;
        }
        list.add(new SubscriptionInfo(id, name, url, true, defEnabled));
    }

    private void saveSubscriptions() {
        try {
            JSONArray array = new JSONArray();
            synchronized (mSubscriptions) {
                for (SubscriptionInfo s : mSubscriptions) {
                    array.put(s.toJson());
                }
            }
            mPrefs.edit().putString(KEY_SUBSCRIPTIONS, array.toString()).apply();
        } catch (Exception e) {
            Log.e(TAG, "Failed to save subscriptions", e);
        }
    }
}
