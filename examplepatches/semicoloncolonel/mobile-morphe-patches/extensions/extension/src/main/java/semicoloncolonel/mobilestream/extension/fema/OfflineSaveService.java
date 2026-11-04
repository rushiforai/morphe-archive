package semicoloncolonel.mobilestream.extension.fema;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Runs the two shortcuts from the app's long-press menu:
 *
 * - Save everything: downloads every Prepare and Recover feed in English and
 *   Spanish, then every image the saved pages use.
 * - Refresh saved content: downloads every saved page again, then any image
 *   those pages now use that is not saved yet.
 *
 * Each page and image replaces its saved copy only after it downloads
 * completely. Nothing is deleted, so a failed or interrupted run keeps
 * everything that was already saved.
 */
@SuppressWarnings("unused")
public final class OfflineSaveService extends Service {
    static final String ACTION_SAVE_ALL = "semicoloncolonel.mobilestream.fema.SAVE_ALL";
    static final String ACTION_REFRESH = "semicoloncolonel.mobilestream.fema.REFRESH";

    private static final String TAG = OfflineStore.TAG;
    private static final String CHANNEL = "msp_offline_content";
    private static final int NOTIFICATION = 7301;

    // Every feed the app reads for its Prepare, Recover, and home screens.
    private static final String[] FEEDS = {
            "https://m.fema.gov/prepare-slideshows-en",
            "https://m.fema.gov/prepare-slideshows-es",
            "https://m.fema.gov/prepare-featured-categories-en",
            "https://m.fema.gov/prepare-featured-categories-es",
            "https://m.fema.gov/fema-mobile-home-page-feature-en",
            "https://m.fema.gov/fema-mobile-home-page-feature-es",
            "https://m.fema.gov/feeds/callout-prepare",
            "https://m.fema.gov/es/feeds/callout-prepare",
            "https://m.fema.gov/feeds/callout-recover",
            "https://m.fema.gov/es/feeds/callout-recover",
            "https://m.fema.gov/feeds/callout-contact",
            "https://m.fema.gov/es/feeds/callout-contact",
            "https://m.fema.gov/feeds/callout-alerts",
            "https://m.fema.gov/es/feeds/callout-alerts",
            "https://m.fema.gov/feeds/callout-settings",
            "https://m.fema.gov/es/feeds/callout-settings",
            "https://m.fema.gov/whats-new",
            "https://www.fema.gov/fema-mobile-home-page-features-en",
            "https://www.fema.gov/fema-mobile-home-page-features-es",
            "https://www.fema.gov/fema-mobile-faq-en",
            "https://www.fema.gov/fema-mobile-faq-es",
            "https://www.fema.gov/fema-mobile-disasters-counties",
            "https://www.fema.gov/es/fema-mobile-disasters-counties-es",
    };

    private static volatile boolean running;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        String action = intent == null ? null : intent.getAction();
        boolean refresh = ACTION_REFRESH.equals(action);
        Notification notification = progress(refresh ? "Refreshing saved content" : "Saving content", 0, 0);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(NOTIFICATION, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
        } else {
            startForeground(NOTIFICATION, notification);
        }
        if (running) return START_NOT_STICKY;
        running = true;

        new Thread(() -> {
            String result;
            try {
                result = refresh ? refresh() : saveAll();
            } catch (Exception ex) {
                Log.e(TAG, "save failure", ex);
                result = "Could not finish. Content that was already saved is kept.";
            }
            finish(result);
        }, "msp-offline-save").start();
        return START_NOT_STICKY;
    }

    private String saveAll() {
        if (!online()) return "No connection. Content that was already saved is kept.";
        List<String[]> requests = new ArrayList<>();
        for (String feed : FEEDS) requests.add(new String[]{feed, null});
        // Pages saved while browsing, such as FAQ searches, are refreshed too.
        requests.addAll(OfflineStore.savedRequests(this));
        int pages = savePages(requests, "Saving pages");
        int images = saveImages();
        return "Saved " + pages + " pages and " + images + " new images for offline use.";
    }

    private String refresh() {
        if (!online()) return "No connection. Content that was already saved is kept.";
        List<String[]> requests = OfflineStore.savedRequests(this);
        if (requests.isEmpty()) return "Nothing is saved yet. Use Save everything first.";
        int pages = savePages(requests, "Refreshing pages");
        int images = saveImages();
        return "Refreshed " + pages + " of " + requests.size() + " pages and saved " + images + " new images.";
    }

    private int savePages(List<String[]> requests, String title) {
        int saved = 0;
        int done = 0;
        Set<String> seen = new HashSet<>();
        for (String[] request : requests) {
            String key = OfflineStore.key(request[0], request[1]);
            done++;
            if (!seen.add(key)) continue;
            notify(progress(title, done, requests.size()));
            try {
                String response = OfflineStore.fetchPage(request[0], request[1]);
                if (response != null) {
                    OfflineStore.savePage(this, key, request[0], request[1], response);
                    saved++;
                }
            } catch (Exception ex) {
                Log.w(TAG, "could not save " + request[0], ex);
            }
        }
        return saved;
    }

    // Images not saved yet. Saved images are kept, since FEMA rarely changes them.
    private int saveImages() {
        Set<String> urls = OfflineStore.referencedImages(this);
        List<String> missing = new ArrayList<>();
        for (String url : urls) {
            if (!OfflineStore.image(this, url).isFile()) missing.add(url);
        }
        int saved = 0;
        for (int i = 0; i < missing.size(); i++) {
            if (i % 10 == 0) notify(progress("Saving images", i, missing.size()));
            if (OfflineStore.fetchImage(this, missing.get(i))) saved++;
        }
        return saved;
    }

    private boolean online() {
        ConnectivityManager connectivity = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkCapabilities capabilities = connectivity.getNetworkCapabilities(connectivity.getActiveNetwork());
        return capabilities != null && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
    }

    private void finish(String result) {
        running = false;
        Log.i(TAG, result);
        stopForeground(STOP_FOREGROUND_DETACH);
        notify(builder().setContentTitle("Offline content").setContentText(result)
                .setStyle(new Notification.BigTextStyle().bigText(result))
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setOngoing(false).setAutoCancel(true).build());
        stopSelf();
    }

    private Notification progress(String title, int done, int total) {
        Notification.Builder builder = builder().setContentTitle(title)
                .setSmallIcon(android.R.drawable.stat_sys_download).setOngoing(true).setOnlyAlertOnce(true);
        if (total > 0) {
            builder.setContentText(done + " of " + total).setProgress(total, done, false);
        } else {
            builder.setProgress(0, 0, true);
        }
        return builder.build();
    }

    private Notification.Builder builder() {
        NotificationManager manager = getSystemService(NotificationManager.class);
        if (manager.getNotificationChannel(CHANNEL) == null) {
            manager.createNotificationChannel(new NotificationChannel(
                    CHANNEL, "Offline content", NotificationManager.IMPORTANCE_LOW));
        }
        return new Notification.Builder(this, CHANNEL);
    }

    private void notify(Notification notification) {
        getSystemService(NotificationManager.class).notify(NOTIFICATION, notification);
    }
}
