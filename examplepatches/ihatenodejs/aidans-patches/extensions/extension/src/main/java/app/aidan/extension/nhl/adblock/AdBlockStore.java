package app.aidan.extension.nhl.adblock;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Storage and configuration manager for NHL ad blocking.
 * Handles SharedPreferences, aggregate statistics, site exclusions, and bounded opt-in history.
 */
public final class AdBlockStore {
    private static final String TAG = "AidanAdBlockStore";
    private static final String PREFS_NAME = "aidan_nhl_adblock";

    private static final String KEY_PROTECTION_ENABLED = "protection_enabled";
    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_COSMETIC = "cosmetic_filtering";
    private static final String KEY_AUTO_UPDATE = "auto_update";
    private static final String KEY_RECORD_HISTORY = "record_history";
    private static final String KEY_EXCLUSIONS = "site_exclusions";

    private static final String KEY_LIFETIME_CHECKED = "lifetime_checked";
    private static final String KEY_LIFETIME_BLOCKED = "lifetime_blocked";
    private static final String KEY_DAILY_RING = "daily_ring";

    private static final int MAX_HISTORY_ENTRIES = 500;
    private static final long MAX_HISTORY_AGE_MS = 24 * 60 * 60 * 1000L; // 24 hours
    private static final long MAX_HISTORY_FILE_BYTES = 512 * 1024L; // 512 KiB

    private static volatile AdBlockStore sInstance;

    private final Context mContext;
    private final SharedPreferences mPrefs;
    private final ExecutorService mIoExecutor;
    private final File mDataDir;
    private final File mHistoryFile;

    // Fast memory state
    private final AtomicBoolean mProtectionEnabled;
    private final AtomicBoolean mEnabled;
    private final AtomicBoolean mCosmeticFiltering;
    private final AtomicBoolean mAutoUpdate;
    private final AtomicBoolean mRecordHistory;
    private final Set<String> mSiteExclusions;

    // Counters
    private final AtomicLong mLifetimeChecked;
    private final AtomicLong mLifetimeBlocked;
    private final AtomicLong mSessionChecked = new AtomicLong(0);
    private final AtomicLong mSessionBlocked = new AtomicLong(0);

    // Throttle for stats persistence
    private final AtomicLong mLastStatsSaveMs = new AtomicLong(0);
    private final AtomicBoolean mSavePending = new AtomicBoolean(false);

    // Bounded in-memory history cache
    private final List<HistoryEntry> mHistoryList = new ArrayList<>();

    public static AdBlockStore get(Context context) {
        if (sInstance == null) {
            synchronized (AdBlockStore.class) {
                if (sInstance == null) {
                    sInstance = new AdBlockStore(context.getApplicationContext());
                }
            }
        }
        return sInstance;
    }

    private AdBlockStore(Context context) {
        mContext = context;
        mPrefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        mIoExecutor = Executors.newSingleThreadExecutor();

        mDataDir = new File(context.getFilesDir(), "aidan/nhl/adblock");
        if (!mDataDir.exists()) {
            mDataDir.mkdirs();
        }
        mHistoryFile = new File(mDataDir, "history.json");

        boolean defProtection = mPrefs.getBoolean(KEY_ENABLED, true);
        mProtectionEnabled = new AtomicBoolean(mPrefs.getBoolean(KEY_PROTECTION_ENABLED, defProtection));
        mEnabled = new AtomicBoolean(mPrefs.getBoolean(KEY_ENABLED, true));
        mCosmeticFiltering = new AtomicBoolean(mPrefs.getBoolean(KEY_COSMETIC, true));
        mAutoUpdate = new AtomicBoolean(mPrefs.getBoolean(KEY_AUTO_UPDATE, false));
        mRecordHistory = new AtomicBoolean(mPrefs.getBoolean(KEY_RECORD_HISTORY, false));

        Set<String> savedExclusions = mPrefs.getStringSet(KEY_EXCLUSIONS, null);
        mSiteExclusions = Collections.synchronizedSet(new HashSet<>());
        if (savedExclusions != null) {
            mSiteExclusions.addAll(savedExclusions);
        }

        mLifetimeChecked = new AtomicLong(mPrefs.getLong(KEY_LIFETIME_CHECKED, 0L));
        mLifetimeBlocked = new AtomicLong(mPrefs.getLong(KEY_LIFETIME_BLOCKED, 0L));

        if (mRecordHistory.get()) {
            loadHistoryFromDisk();
        } else {
            clearHistoryDisk();
        }
    }

    public File getDataDir() {
        return mDataDir;
    }

    public boolean isProtectionEnabled() {
        return mProtectionEnabled.get();
    }

    public void setProtectionEnabled(boolean enabled) {
        mProtectionEnabled.set(enabled);
        mPrefs.edit().putBoolean(KEY_PROTECTION_ENABLED, enabled).apply();
    }

    public boolean isEnabled() {
        return mEnabled.get();
    }

    public void setEnabled(boolean enabled) {
        mEnabled.set(enabled);
        mPrefs.edit().putBoolean(KEY_ENABLED, enabled).apply();
    }

    public boolean isCosmeticFiltering() {
        return mCosmeticFiltering.get();
    }

    public void setCosmeticFiltering(boolean enabled) {
        mCosmeticFiltering.set(enabled);
        mPrefs.edit().putBoolean(KEY_COSMETIC, enabled).apply();
    }

    public boolean isAutoUpdate() {
        return mAutoUpdate.get();
    }

    public void setAutoUpdate(boolean enabled) {
        mAutoUpdate.set(enabled);
        mPrefs.edit().putBoolean(KEY_AUTO_UPDATE, enabled).apply();
    }

    public boolean isRecordHistory() {
        return mRecordHistory.get();
    }

    public void setRecordHistory(boolean record) {
        mRecordHistory.set(record);
        mPrefs.edit().putBoolean(KEY_RECORD_HISTORY, record).apply();
        if (!record) {
            clearHistory();
        }
    }

    public boolean isSiteExcluded(String host) {
        if (host == null || host.isEmpty()) return false;
        String normalized = host.trim().toLowerCase(Locale.ROOT);
        return mSiteExclusions.contains(normalized);
    }

    public Set<String> getSiteExclusions() {
        synchronized (mSiteExclusions) {
            return new HashSet<>(mSiteExclusions);
        }
    }

    public void addSiteExclusion(String host) {
        if (host == null) return;
        String normalized = host.trim().toLowerCase(Locale.ROOT);
        if (normalized.isEmpty() || normalized.contains("/") || normalized.contains("?") || normalized.contains("*")) {
            return;
        }
        synchronized (mSiteExclusions) {
            mSiteExclusions.add(normalized);
            mPrefs.edit().putStringSet(KEY_EXCLUSIONS, new HashSet<>(mSiteExclusions)).apply();
        }
    }

    public void removeSiteExclusion(String host) {
        if (host == null) return;
        String normalized = host.trim().toLowerCase(Locale.ROOT);
        synchronized (mSiteExclusions) {
            mSiteExclusions.remove(normalized);
            mPrefs.edit().putStringSet(KEY_EXCLUSIONS, new HashSet<>(mSiteExclusions)).apply();
        }
    }

    // --- Statistics ---

    public void recordCheck(boolean blocked) {
        mSessionChecked.incrementAndGet();
        mLifetimeChecked.incrementAndGet();
        if (blocked) {
            mSessionBlocked.incrementAndGet();
            mLifetimeBlocked.incrementAndGet();
        }
        scheduleStatsPersist();
    }

    public long getSessionChecked() { return mSessionChecked.get(); }
    public long getSessionBlocked() { return mSessionBlocked.get(); }
    public long getLifetimeChecked() { return mLifetimeChecked.get(); }
    public long getLifetimeBlocked() { return mLifetimeBlocked.get(); }

    public int getBlockedPercentage() {
        long checked = mLifetimeChecked.get();
        if (checked <= 0) return 0;
        long blocked = mLifetimeBlocked.get();
        return (int) Math.min(100, Math.max(0, (blocked * 100) / checked));
    }

    public void resetStatistics() {
        mSessionChecked.set(0);
        mSessionBlocked.set(0);
        mLifetimeChecked.set(0);
        mLifetimeBlocked.set(0);
        mPrefs.edit()
                .putLong(KEY_LIFETIME_CHECKED, 0L)
                .putLong(KEY_LIFETIME_BLOCKED, 0L)
                .remove(KEY_DAILY_RING)
                .apply();
    }

    private void scheduleStatsPersist() {
        long now = System.currentTimeMillis();
        if (now - mLastStatsSaveMs.get() > 30_000L && mSavePending.compareAndSet(false, true)) {
            mIoExecutor.execute(() -> {
                mSavePending.set(false);
                mLastStatsSaveMs.set(System.currentTimeMillis());
                mPrefs.edit()
                        .putLong(KEY_LIFETIME_CHECKED, mLifetimeChecked.get())
                        .putLong(KEY_LIFETIME_BLOCKED, mLifetimeBlocked.get())
                        .apply();
            });
        }
    }

    // --- Detailed History (Opt-In Only) ---

    public static final class HistoryEntry {
        public final long timestamp;
        public final String documentHost;
        public final String sanitizedUrl;
        public final String resourceType;
        public final String reason;

        public HistoryEntry(long timestamp, String documentHost, String sanitizedUrl, String resourceType, String reason) {
            this.timestamp = timestamp;
            this.documentHost = documentHost;
            this.sanitizedUrl = sanitizedUrl;
            this.resourceType = resourceType;
            this.reason = reason;
        }

        public JSONObject toJson() {
            try {
                JSONObject obj = new JSONObject();
                obj.put("t", timestamp);
                obj.put("dh", documentHost);
                obj.put("u", sanitizedUrl);
                obj.put("rt", resourceType);
                obj.put("r", reason);
                return obj;
            } catch (Exception e) {
                return new JSONObject();
            }
        }

        public static HistoryEntry fromJson(JSONObject obj) {
            return new HistoryEntry(
                    obj.optLong("t", 0L),
                    obj.optString("dh", ""),
                    obj.optString("u", ""),
                    obj.optString("rt", "other"),
                    obj.optString("r", "Filter rule")
            );
        }
    }

    public void recordBlockedRequest(String documentUrl, String requestUrl, String resourceType) {
        if (!mRecordHistory.get()) return;

        long now = System.currentTimeMillis();
        String docHost = "";
        try {
            Uri dUri = Uri.parse(documentUrl);
            docHost = dUri.getHost() != null ? dUri.getHost() : "";
        } catch (Exception ignored) {}

        String sanitizedUrl = sanitizeUrl(requestUrl);
        HistoryEntry entry = new HistoryEntry(now, docHost, sanitizedUrl, resourceType, "Filter rule");

        synchronized (mHistoryList) {
            mHistoryList.add(0, entry);
            // Evict if beyond limit
            while (mHistoryList.size() > MAX_HISTORY_ENTRIES) {
                mHistoryList.remove(mHistoryList.size() - 1);
            }
        }

        mIoExecutor.execute(this::saveHistoryToDisk);
    }

    public List<HistoryEntry> getHistory() {
        if (!mRecordHistory.get()) return Collections.emptyList();
        synchronized (mHistoryList) {
            return new ArrayList<>(mHistoryList);
        }
    }

    public void clearHistory() {
        synchronized (mHistoryList) {
            mHistoryList.clear();
        }
        mIoExecutor.execute(this::clearHistoryDisk);
    }

    private void clearHistoryDisk() {
        try {
            if (mHistoryFile.exists()) {
                mHistoryFile.delete();
            }
        } catch (Exception e) {
            Log.w(TAG, "Failed to delete history file", e);
        }
    }

    private static byte[] readFully(File file) throws IOException {
        long length = file.length();
        if (length > MAX_HISTORY_FILE_BYTES) {
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

    private void loadHistoryFromDisk() {
        mIoExecutor.execute(() -> {
            if (!mHistoryFile.exists() || mHistoryFile.length() > MAX_HISTORY_FILE_BYTES) {
                return;
            }
            try {
                byte[] bytes = readFully(mHistoryFile);
                String jsonStr = new String(bytes, StandardCharsets.UTF_8);
                JSONArray array = new JSONArray(jsonStr);
                long cutoff = System.currentTimeMillis() - MAX_HISTORY_AGE_MS;
                List<HistoryEntry> loaded = new ArrayList<>();
                for (int i = 0; i < array.length() && loaded.size() < MAX_HISTORY_ENTRIES; i++) {
                    HistoryEntry entry = HistoryEntry.fromJson(array.getJSONObject(i));
                    if (entry.timestamp >= cutoff) {
                        loaded.add(entry);
                    }
                }
                synchronized (mHistoryList) {
                    mHistoryList.clear();
                    mHistoryList.addAll(loaded);
                }
            } catch (Exception e) {
                Log.w(TAG, "Failed to load history from disk", e);
            }
        });
    }

    private void saveHistoryToDisk() {
        if (!mRecordHistory.get()) return;
        try {
            JSONArray array = new JSONArray();
            long cutoff = System.currentTimeMillis() - MAX_HISTORY_AGE_MS;
            synchronized (mHistoryList) {
                for (HistoryEntry e : mHistoryList) {
                    if (e.timestamp >= cutoff) {
                        array.put(e.toJson());
                    }
                }
            }
            byte[] bytes = array.toString().getBytes(StandardCharsets.UTF_8);
            if (bytes.length > MAX_HISTORY_FILE_BYTES) {
                return; // Guard disk limit
            }
            File tmpFile = new File(mDataDir, "history.json.tmp");
            try (FileOutputStream fos = new FileOutputStream(tmpFile)) {
                fos.write(bytes);
            }
            tmpFile.renameTo(mHistoryFile);
        } catch (Exception e) {
            Log.w(TAG, "Failed to save history to disk", e);
        }
    }

    private String sanitizeUrl(String rawUrl) {
        if (rawUrl == null) return "";
        try {
            Uri uri = Uri.parse(rawUrl);
            String scheme = uri.getScheme() != null ? uri.getScheme() : "https";
            String host = uri.getHost() != null ? uri.getHost() : "";
            String path = uri.getPath() != null ? uri.getPath() : "";
            if (path.length() > 256) {
                path = path.substring(0, 256) + "...";
            }
            return scheme + "://" + host + path;
        } catch (Exception e) {
            return rawUrl.length() > 64 ? rawUrl.substring(0, 64) + "..." : rawUrl;
        }
    }
}
