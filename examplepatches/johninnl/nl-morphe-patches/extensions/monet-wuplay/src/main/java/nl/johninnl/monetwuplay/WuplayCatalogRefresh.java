package nl.johninnl.monetwuplay;

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

/** Wuplay-only foreground TvProvider subscription, independent of Recommendations.
 * Derived from Santodan/santodan-patches under GPL-3.0; see NOTICE. */
public final class WuplayCatalogRefresh {
    private static Session session;
    private WuplayCatalogRefresh() {}

    public static synchronized void resume(Object activity) {
        pause(activity);
        try {
            session = new Session((Context) activity);
            session.start();
        } catch (RuntimeException failure) {
            if (session != null) session.stop();
            session = null;
            Log.w("MonetWuplay", "Cannot start catalog refresh", failure);
        }
    }

    public static synchronized void pause(Object activity) {
        if (session == null) return;
        session.stop(); session = null;
    }

    private static final class Session {
        final Context context;
        final HandlerThread thread = new HandlerThread("MonetWuplayCatalogs");
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
            Log.i("MonetWuplay", "Wuplay catalog rows 1.1.0" + ": foreground subscription started");
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
                    if (!WuplayCatalogPolicy.accepts(owner, provider, title, cursor.getString(4))) continue;
                    count++;
                    channels.put(owner + "\n" + provider, MonetWuplayCatalogs.channel(context, owner, provider, title, cursor.getLong(0)));
                }
                if (stopped) return;
                failures = 0;
                main.post(() -> {
                    if (stopped) return;
                    try { MonetWuplayCatalogs.publish(channels); }
                    catch (ReflectiveOperationException | RuntimeException failure) {
                        Log.w("MonetWuplay", "Cannot publish catalog refresh", failure);
                    }
                });
            } catch (ReflectiveOperationException | RuntimeException failure) {
                Log.w("MonetWuplay", "Catalog refresh failed; keeping last successful snapshot", failure);
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
