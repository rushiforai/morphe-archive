package software.santodan.extension.monetchannels;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.util.Log;
import java.util.LinkedHashMap;
import java.util.Map;

/** A foreground, debounced TvProvider subscription independent of Recommendations visibility. */
public final class CatalogRefresh {
    private static Session session;
    private static volatile boolean managed;
    private CatalogRefresh() {}
    static boolean active() { return managed; }

    public static synchronized void resume(Object activity) {
        pause(activity);
        try {
            managed = true;
            session = new Session((Context) activity);
            session.start();
        } catch (RuntimeException failure) {
            if (session != null) session.stop();
            session = null;
            Log.w("SantodanMonet", "Cannot start catalog refresh", failure);
        }
    }

    public static synchronized void pause(Object activity) {
        if (session == null) return;
        session.stop(); session = null;
    }

    private static final class Session {
        final Context context;
        final HandlerThread thread = new HandlerThread("SantodanMonetCatalogs");
        final Handler main = new Handler(Looper.getMainLooper());
        Handler worker;
        ContentObserver observer;
        volatile boolean stopped;
        int failures;
        final Runnable refresh = this::refresh;

        Session(Context context) {
            this.context = context.getApplicationContext();
        }
        void start() {
            thread.start(); worker = new Handler(thread.getLooper());
            observer = new ContentObserver(worker) {
                @Override public void onChange(boolean selfChange) { schedule(400); }
                @Override public void onChange(boolean selfChange, Uri uri) { schedule(400); }
            };
            context.getContentResolver().registerContentObserver(Uri.parse("content://android.media.tv/channel"), true, observer);
            context.getContentResolver().registerContentObserver(Uri.parse("content://android.media.tv/preview_program"), true, observer);
            Log.i("SantodanMonet", (NativeLayout.modern ? "Catalog content 1.1.0" : "Catalog content v2") + ": foreground subscription started");
            schedule(0);
        }
        void schedule(long delay) {
            if (stopped) return;
            worker.removeCallbacks(refresh); worker.postDelayed(refresh, delay);
        }
        void refresh() {
            if (stopped) return;
            Map<String, Object> channels = new LinkedHashMap<>();
            try (Cursor cursor = context.getContentResolver().query(Uri.parse("content://android.media.tv/channel"),
                    new String[]{"_id", "package_name", "internal_provider_id", "display_name", "type"}, null, null, null)) {
                if (cursor == null) throw new IllegalStateException("Catalog channel query returned null");
                int count = 0;
                while (!stopped && cursor.moveToNext() && count < 256) {
                    String owner = cursor.getString(1), provider = cursor.getString(2), title = cursor.getString(3);
                    if (owner == null || provider == null || !provider.startsWith("santodan-launcher/")
                            || title == null || title.trim().isEmpty() || !"TYPE_PREVIEW".equals(cursor.getString(4))) continue;
                    count++;
                    channels.put(owner + "\n" + provider, MonetCatalogChannels.channel(context, owner, provider, title, cursor.getLong(0)));
                }
                if (stopped) return;
                failures = 0;
                main.post(() -> {
                    if (stopped) return;
                    try { MonetCatalogChannels.publish(channels); }
                    catch (ReflectiveOperationException | RuntimeException failure) {
                        Log.w("SantodanMonet", "Cannot publish catalog refresh", failure);
                    }
                });
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w("SantodanMonet", "Catalog refresh failed; keeping last successful snapshot", failure);
                if (++failures <= 3) schedule(failures * 2000L);
            }
        }
        void stop() {
            stopped = true;
            if (observer != null) context.getContentResolver().unregisterContentObserver(observer);
            if (worker != null) worker.removeCallbacksAndMessages(null);
            main.removeCallbacksAndMessages(null); thread.quitSafely();
        }
    }
}
