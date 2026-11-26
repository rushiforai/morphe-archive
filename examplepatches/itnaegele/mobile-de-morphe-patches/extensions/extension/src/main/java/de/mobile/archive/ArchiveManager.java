package de.mobile.archive;

import android.app.Application;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public final class ArchiveManager {
    private static final String TAG = "MobileArchiveMgr";
    public static final String HEADER_INTERNAL_PREFETCH = "X-Mobile-Archive-Prefetch";

    private static volatile ArchiveManager instance;

    private final Application app;
    private final ArchiveConfig config;
    private final LocalArchiveStore store;
    private final GoogleDriveSync drive;
    private final ExecutorService executor;
    private final Handler mainHandler;
    private final ConcurrentHashMap<String, Long> recentArchived = new ConcurrentHashMap<>();
    private final Set<String> prefetchQueued = ConcurrentHashMap.newKeySet();
    private final Set<String> archivedIdsCache = ConcurrentHashMap.newKeySet();
    private volatile boolean cacheSeeded = false;
    private final ConcurrentHashMap<String, Long> forceArchiveUntil = new ConcurrentHashMap<>();
    private volatile OkHttpClient apiClient;

    private ArchiveManager(Application app) {
        this.app = app;
        this.config = new ArchiveConfig(app);
        this.store = new LocalArchiveStore(app);
        this.drive = new GoogleDriveSync(config);
        this.executor = Executors.newFixedThreadPool(2);
        this.mainHandler = new Handler(Looper.getMainLooper());
        seedArchivedCacheAsync();
    }

    private void seedArchivedCacheAsync() {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    for (LocalArchiveStore.ListingMeta m : store.listAllMeta()) {
                        if (m != null && m.adId != null && !m.adId.isEmpty()) {
                            archivedIdsCache.add(m.adId);
                        }
                    }
                    cacheSeeded = true;
                    store.pruneImageCacheIfNeeded(config.getMaxImageCacheMb() * 1024L * 1024L);
                } catch (Throwable ignored) {
                    cacheSeeded = true;
                }
            }
        });
    }

    public boolean isArchivedFast(String adId) {
        if (adId == null || adId.isEmpty()) return false;
        if (archivedIdsCache.contains(adId)) return true;
        // Avoid synchronous disk I/O during RecyclerView scrolling once initial cache is seeded.
        if (cacheSeeded) return false;
        if (store.hasListing(adId)) {
            archivedIdsCache.add(adId);
            return true;
        }
        return false;
    }

    public boolean isOnUnmeteredNetwork() {
        try {
            ConnectivityManager cm = (ConnectivityManager) app.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (cm == null) return true;
            if (Build.VERSION.SDK_INT >= 23) {
                Network active = cm.getActiveNetwork();
                if (active == null) return false;
                NetworkCapabilities caps = cm.getNetworkCapabilities(active);
                if (caps == null) return false;
                return caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED)
                        || caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)
                        || caps.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET);
            }
            return !cm.isActiveNetworkMetered();
        } catch (Throwable ignored) {
            return true;
        }
    }

    private boolean allowBackgroundMediaWork() {
        return !config.isWifiOnlyMedia() || isOnUnmeteredNetwork();
    }

    public void deleteListingAsync(final String adId, final ArchiveActionCallback callback) {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                boolean ok = store.deleteListing(adId);
                if (ok) {
                    archivedIdsCache.remove(adId);
                    recentArchived.remove(adId);
                }
                notifyArchiveCallback(callback, ok, ok ? ("Inserat #" + adId + " lokal entfernt") : "Konnte nicht entfernt werden");
            }
        });
    }

    public void clearImageCacheAsync(final ArchiveActionCallback callback) {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                int removed = store.clearImageCache();
                notifyArchiveCallback(callback, true, removed + " gecachte Fotos entfernt");
            }
        });
    }

    public void requestForceArchive(String adId) {
        if (adId != null && !adId.isEmpty()) {
            forceArchiveUntil.put(adId, System.currentTimeMillis() + 20_000L);
        }
    }

    public boolean isForceArchiveActive(String adId) {
        if (adId == null || adId.isEmpty()) return false;
        Long until = forceArchiveUntil.get(adId);
        if (until == null) return false;
        if (System.currentTimeMillis() > until) {
            forceArchiveUntil.remove(adId);
            return false;
        }
        return true;
    }

    public interface ArchiveActionCallback {
        void onDone(boolean success, String message);
    }

    public void archiveNowAsync(final String adId, final ArchiveActionCallback callback) {
        if (adId == null || adId.isEmpty()) {
            if (callback != null) callback.onDone(false, "Ungueltige Inserats-ID");
            return;
        }
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    OkHttpClient client = apiClient;
                    if (client == null) {
                        notifyArchiveCallback(callback, false, "API-Client noch nicht bereit");
                        return;
                    }
                    Request req = new Request.Builder()
                            .url("https://www.mobile.de/api/a/" + adId)
                            .header(HEADER_INTERNAL_PREFETCH, "1")
                            .get()
                            .build();
                    String vipJson = null;
                    Response resp = client.newCall(req).execute();
                    try {
                        if (resp.isSuccessful() && resp.body() != null) {
                            vipJson = resp.body().string();
                        }
                    } finally {
                        resp.close();
                    }
                    if (vipJson == null || !vipJson.trim().startsWith("{")) {
                        notifyArchiveCallback(callback, false, "Inserat konnte nicht geladen werden (evtl. abgelaufen)");
                        return;
                    }
                    LocalArchiveStore.ListingMeta meta = store.saveListing(adId, vipJson, true);
                    archivedIdsCache.add(adId);

                    // Also fetch seller contact quietly
                    try {
                        Request cReq = new Request.Builder()
                                .url("https://www.mobile.de/api/a-contact/" + adId)
                                .header(HEADER_INTERNAL_PREFETCH, "1")
                                .get()
                                .build();
                        Response cResp = client.newCall(cReq).execute();
                        try {
                            if (cResp.isSuccessful() && cResp.body() != null) {
                                String cBody = cResp.body().string();
                                if (cBody != null && cBody.trim().startsWith("{")) {
                                    store.saveContact(adId, cBody);
                                }
                            }
                        } finally {
                            cResp.close();
                        }
                    } catch (Throwable ignored) {
                    }

                    syncSingleListing(adId, meta, vipJson, true);
                    notifyArchiveCallback(callback, true, "Inserat #" + adId + " archiviert");
                } catch (Throwable t) {
                    Log.e(TAG, "archiveNowAsync failed for " + adId, t);
                    notifyArchiveCallback(callback, false, "Fehler: " + t.getMessage());
                }
            }
        });
    }

    private void notifyArchiveCallback(final ArchiveActionCallback cb, final boolean ok, final String msg) {
        if (cb == null) return;
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                cb.onDone(ok, msg);
            }
        });
    }

    public static ArchiveManager init(Application app) {
        if (instance == null) {
            synchronized (ArchiveManager.class) {
                if (instance == null) {
                    instance = new ArchiveManager(app);
                }
            }
        }
        return instance;
    }

    public static ArchiveManager get() {
        return instance;
    }

    public Application getApp() {
        return app;
    }

    public ArchiveConfig getConfig() {
        return config;
    }

    public LocalArchiveStore getStore() {
        return store;
    }

    public GoogleDriveSync getDrive() {
        return drive;
    }

    public void setApiClient(OkHttpClient client) {
        this.apiClient = client;
    }

    public void showToast(final String msg) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Toast.makeText(app, msg, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public void archiveVipListingAsync(final String adId, final String json) {
        if (!config.isEnabled() || adId == null || adId.isEmpty() || json == null || json.isEmpty()) {
            return;
        }
        long now = System.currentTimeMillis();
        Long last = recentArchived.get(adId);
        if (last != null && (now - last) < 60_000L && store.hasFullVip(adId)) {
            return;
        }
        recentArchived.put(adId, now);

        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    LocalArchiveStore.ListingMeta meta = store.saveListing(adId, json, true);
                    if (meta == null) return;
                    archivedIdsCache.add(adId);
                    syncSingleListing(adId, meta, json, false);
                } catch (Throwable t) {
                    Log.e(TAG, "archiveVipListingAsync error " + adId, t);
                }
            }
        });
    }

    public void archiveParkedAdAsync(final String adId, final String adJson) {
        if (!config.isEnabled() || adId == null || adId.isEmpty() || adJson == null || adJson.isEmpty()) {
            return;
        }
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    if (!store.hasFullVip(adId)) {
                        LocalArchiveStore.ListingMeta meta = store.saveListing(adId, adJson, false);
                        if (meta != null) {
                            archivedIdsCache.add(adId);
                        }
                        if (config.isPrefetchParked() && allowBackgroundMediaWork() && apiClient != null && prefetchQueued.add(adId)) {
                            prefetchVipListing(adId);
                        } else if (meta != null && config.isDriveConfigured() && allowBackgroundMediaWork()) {
                            syncSingleListing(adId, meta, adJson, false);
                        }
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "archiveParkedAdAsync error " + adId, t);
                }
            }
        });
    }

    public void archiveContactAsync(final String adId, final String contactJson) {
        if (!config.isEnabled() || adId == null || adId.isEmpty() || contactJson == null || contactJson.isEmpty()) {
            return;
        }
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    store.saveContact(adId, contactJson);
                    String vipJson = store.getListingJson(adId);
                    LocalArchiveStore.ListingMeta meta = store.readMeta(adId);
                    if (vipJson != null && config.isDriveConfigured()) {
                        drive.uploadListing(adId, meta, vipJson, contactJson);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "archiveContactAsync error " + adId, t);
                }
            }
        });
    }

    private void prefetchVipListing(String adId) {
        OkHttpClient client = this.apiClient;
        if (client == null) return;
        try {
            Thread.sleep(600L);
            Request req = new Request.Builder()
                    .url("https://www.mobile.de/api/a/" + adId)
                    .header(HEADER_INTERNAL_PREFETCH, "1")
                    .get()
                    .build();
            Response resp = client.newCall(req).execute();
            try {
                if (resp.body() != null) {
                    resp.body().string();
                }
            } finally {
                resp.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "Prefetch failed for " + adId + ": " + t.getMessage());
        }
    }

    private void syncSingleListing(String adId, LocalArchiveStore.ListingMeta meta, String json, boolean manualTrigger) {
        boolean allowHeavy = manualTrigger || allowBackgroundMediaWork();
        String contactJson = store.getContactJson(adId);
        if (config.isDriveConfigured() && allowHeavy) {
            boolean uploaded = drive.uploadListing(adId, meta, json, contactJson);
            if (uploaded) {
                store.markSynced(adId, true);
            }
        }

        if (allowHeavy && config.isArchiveImages() && meta != null && !meta.imageUris.isEmpty()) {
            int max = config.getMaxImagesPerListing();
            int count = Math.min(max, meta.imageUris.size());
            boolean savedNewImage = false;
            for (int i = 0; i < count; i++) {
                String rawUri = meta.imageUris.get(i);
                String key = LocalArchiveStore.normalizeImageKey(rawUri);
                if (key == null) continue;
                byte[] imgBytes = store.getImage(key);
                if (imgBytes == null) {
                    String url = LocalArchiveStore.toHighResImageUrl(rawUri);
                    imgBytes = downloadBytesSimple(url);
                    if (imgBytes != null && imgBytes.length > 200) {
                        store.saveImage(key, imgBytes);
                        savedNewImage = true;
                    }
                }
                if (imgBytes != null && imgBytes.length > 200 && config.isDriveConfigured()) {
                    drive.uploadImage(adId, key, i + 1, imgBytes);
                }
            }
            if (savedNewImage) {
                store.pruneImageCacheIfNeeded(config.getMaxImageCacheMb() * 1024L * 1024L);
            }
        }
    }

    public String loadListingJsonBlocking(String adId) {
        if (adId == null || adId.isEmpty()) return null;
        String local = store.getListingJson(adId);
        if (local != null && !local.isEmpty()) {
            return local;
        }
        if (config.isDriveConfigured()) {
            GoogleDriveSync.RemoteListing remote = drive.downloadListing(adId);
            if (remote != null && remote.vipJson != null && !remote.vipJson.isEmpty()) {
                store.saveListing(adId, remote.vipJson, true);
                archivedIdsCache.add(adId);
                store.markSynced(adId, true);
                if (remote.contactJson != null && !remote.contactJson.isEmpty()) {
                    store.saveContact(adId, remote.contactJson);
                }
                return remote.vipJson;
            }
        }
        return null;
    }

    public String loadContactJsonBlocking(String adId) {
        if (adId == null || adId.isEmpty()) return null;
        String local = store.getContactJson(adId);
        if (local != null && !local.isEmpty()) {
            return local;
        }
        if (config.isDriveConfigured()) {
            GoogleDriveSync.RemoteListing remote = drive.downloadListing(adId);
            if (remote != null && remote.contactJson != null && !remote.contactJson.isEmpty()) {
                store.saveContact(adId, remote.contactJson);
                return remote.contactJson;
            }
        }
        return null;
    }

    public byte[] loadImageBlocking(String imageKey) {
        if (imageKey == null || imageKey.isEmpty()) return null;
        byte[] local = store.getImage(imageKey);
        if (local != null && local.length > 100) {
            return local;
        }
        if (config.isDriveConfigured()) {
            byte[] remote = drive.downloadImage(imageKey);
            if (remote != null && remote.length > 100) {
                store.saveImage(imageKey, remote);
                return remote;
            }
        }
        return null;
    }

    public interface SyncProgressCallback {
        void onDone(String summary);
    }

    public void syncAllToDriveAsync(final SyncProgressCallback cb) {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                if (!config.isDriveConfigured()) {
                    cb.onDone("Google Drive ist noch nicht konfiguriert.");
                    return;
                }
                List<LocalArchiveStore.ListingMeta> all = store.listAllMeta();
                int ok = 0;
                int fail = 0;
                for (LocalArchiveStore.ListingMeta m : all) {
                    String json = store.getListingJson(m.adId);
                    if (json == null) continue;
                    String contact = store.getContactJson(m.adId);
                    boolean up = drive.uploadListing(m.adId, m, json, contact);
                    if (up) {
                        store.markSynced(m.adId, true);
                        ok++;
                        if (config.isArchiveImages()) {
                            int max = config.getMaxImagesPerListing();
                            int count = Math.min(max, m.imageUris.size());
                            for (int i = 0; i < count; i++) {
                                String key = LocalArchiveStore.normalizeImageKey(m.imageUris.get(i));
                                if (key == null) continue;
                                byte[] bytes = store.getImage(key);
                                if (bytes != null && bytes.length > 200) {
                                    drive.uploadImage(m.adId, key, i + 1, bytes);
                                }
                            }
                        }
                    } else {
                        fail++;
                    }
                }
                String summary = "Sync fertig: " + ok + " hochgeladen" + (fail > 0 ? (", " + fail + " Fehler") : "");
                config.setLastStatus(summary);
                cb.onDone(summary);
            }
        });
    }

    public List<LocalArchiveStore.ListingMeta> loadCombinedListingsBlocking(boolean includeDrive) {
        Map<String, LocalArchiveStore.ListingMeta> merged = new LinkedHashMap<>();
        for (LocalArchiveStore.ListingMeta local : store.listAllMeta()) {
            merged.put(local.adId, local);
        }
        if (includeDrive && config.isDriveConfigured()) {
            for (LocalArchiveStore.ListingMeta remote : drive.listRemoteListings()) {
                LocalArchiveStore.ListingMeta existing = merged.get(remote.adId);
                if (existing == null) {
                    merged.put(remote.adId, remote);
                } else {
                    existing.syncedToDrive = true;
                }
            }
        }
        return new ArrayList<>(merged.values());
    }

    public void runAsync(Runnable task) {
        executor.execute(task);
    }

    private static byte[] downloadBytesSimple(String urlStr) {
        if (urlStr == null || urlStr.isEmpty()) return null;
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(urlStr).openConnection();
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(15000);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android " + Build.VERSION.RELEASE + ") mobile.de");
            int code = conn.getResponseCode();
            if (code >= 200 && code < 300) {
                InputStream is = conn.getInputStream();
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                int n;
                while ((n = is.read(buf)) != -1) {
                    bos.write(buf, 0, n);
                }
                is.close();
                return bos.toByteArray();
            }
        } catch (Throwable ignored) {
        } finally {
            if (conn != null) conn.disconnect();
        }
        return null;
    }
}
