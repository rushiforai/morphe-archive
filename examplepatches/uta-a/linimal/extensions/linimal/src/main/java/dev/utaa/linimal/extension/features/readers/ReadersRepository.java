package dev.utaa.linimal.extension.features.readers;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 既読者の読み取りを 1 本の worker thread に集め、結果を main thread へ返します。
 *
 * <p>行の bind は頻繁に起きるため、メッセージと既読ラベルの文言の組ごとに結果を覚えます。
 * LINE が既読数を更新すると文言が変わり、次の bind で読み直します。</p>
 */
final class ReadersRepository {
    interface Callback {
        void onLoaded(ReadersSnapshot snapshot);
    }

    interface SyncCallback {
        void onSynced(boolean success);
    }

    private static final int CACHE_SIZE = 256;
    /** 同じトークの同期を短時間に繰り返さないための間隔。 */
    private static final long SYNC_INTERVAL_MILLIS = 30_000L;

    private static volatile ReadersRepository shared;

    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "linimal-readers");
        thread.setDaemon(true);
        return thread;
    });
    private final ExecutorService network = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "linimal-readers-sync");
        thread.setDaemon(true);
        return thread;
    });
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Context context;
    private final ReadersDataSource source;
    private final Map<String, Cached> cache =
            new LinkedHashMap<String, Cached>(CACHE_SIZE, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Cached> eldest) {
                    return size() > CACHE_SIZE;
                }
            };

    /** 読み取った結果と、その時刻（{@link SystemClock#elapsedRealtime()}）。 */
    private static final class Cached {
        final ReadersSnapshot snapshot;
        final long loadedAt;

        Cached(ReadersSnapshot snapshot, long loadedAt) {
            this.snapshot = snapshot;
            this.loadedAt = loadedAt;
        }
    }
    private final Map<String, Long> lastSyncAt = new LinkedHashMap<>();
    private final Map<String, List<Callback>> pending = new LinkedHashMap<>();

    private ReadersRepository(Context context) {
        this.context = context.getApplicationContext();
        this.source = new LineDatabaseReadersSource(this.context);
    }

    static ReadersRepository get(Context context) {
        ReadersRepository repository = shared;
        if (repository == null) {
            synchronized (ReadersRepository.class) {
                repository = shared;
                if (repository == null) {
                    repository = new ReadersRepository(context);
                    shared = repository;
                }
            }
        }
        return repository;
    }

    /** main thread からのみ呼びます。キャッシュがあれば即座に返します。 */
    ReadersSnapshot cached(String key) {
        synchronized (cache) {
            Cached cached = cache.get(key);
            return cached == null ? null : cached.snapshot;
        }
    }

    /** キャッシュが [maxAgeMillis] より古いか、存在しないかどうか。 */
    boolean isStale(String key, long maxAgeMillis) {
        synchronized (cache) {
            Cached cached = cache.get(key);
            return cached == null || SystemClock.elapsedRealtime() - cached.loadedAt > maxAgeMillis;
        }
    }

    /**
     * 読み取りを予約します。同じ key の読み取りが進行中なら、その結果をまとめて受け取ります。
     * callback は main thread で呼ばれます。
     */
    void load(String key, String chatId, long messageId, String senderMid, Callback callback) {
        synchronized (pending) {
            List<Callback> waiting = pending.get(key);
            if (waiting != null) {
                waiting.add(callback);
                return;
            }
            waiting = new ArrayList<>();
            waiting.add(callback);
            pending.put(key, waiting);
        }
        worker.execute(() -> {
            ReadersSnapshot snapshot = null;
            try {
                snapshot = ReadersResolver.resolve(source, chatId, messageId, excluded(context, senderMid));
            } catch (Throwable ignored) {
                snapshot = null;
            }
            if (snapshot != null && key != null) {
                synchronized (cache) {
                    cache.put(key, new Cached(snapshot, SystemClock.elapsedRealtime()));
                }
            }
            List<Callback> callbacks;
            synchronized (pending) {
                callbacks = pending.remove(key);
            }
            ReadersSnapshot result = snapshot;
            if (callbacks != null) {
                main.post(() -> {
                    for (Callback each : callbacks) {
                        try {
                            each.onLoaded(result);
                        } catch (Throwable ignored) {
                            // 他の callback は続けます。
                        }
                    }
                });
            }
        });
    }

    /**
     * LINE 自身の同期処理で 1 トーク分の既読範囲を取り直します。直前に同期したトークは省き、
     * そのまま成功として扱います。callback は main thread で呼ばれます。
     */
    void sync(String chatId, SyncCallback callback) {
        long now = SystemClock.elapsedRealtime();
        synchronized (lastSyncAt) {
            Long previous = lastSyncAt.get(chatId);
            if (previous != null && now - previous < SYNC_INTERVAL_MILLIS) {
                main.post(() -> deliver(callback, true));
                return;
            }
        }
        network.execute(() -> {
            boolean success = false;
            try {
                success = ReadReceiptReadersBridge.requestSync(context, chatId);
            } catch (Throwable ignored) {
                success = false;
            }
            if (success) {
                synchronized (lastSyncAt) {
                    lastSyncAt.put(chatId, SystemClock.elapsedRealtime());
                }
                invalidate(chatId);
            }
            boolean result = success;
            main.post(() -> deliver(callback, result));
        });
    }

    private static void deliver(SyncCallback callback, boolean success) {
        try {
            callback.onSynced(success);
        } catch (Throwable ignored) {
            // 一覧の更新に失敗しても LINE の main thread へ例外を出しません。
        }
    }

    /** 同期で記録が変わったトークの結果を捨てます。 */
    private void invalidate(String chatId) {
        String prefix = chatId + '\n';
        synchronized (cache) {
            cache.keySet().removeIf(key -> key.startsWith(prefix));
        }
    }

    static String key(String chatId, long messageId, CharSequence label) {
        return chatId + '\n' + messageId + '\n' + (label == null ? "" : label.toString());
    }

    private static List<String> excluded(Context context, String senderMid) {
        List<String> excluded = new ArrayList<>(2);
        if (ReadersChat.isMid(senderMid)) {
            excluded.add(senderMid);
        }
        String self = ReadersSelf.mid(context);
        if (ReadersChat.isMid(self)) {
            excluded.add(self);
        }
        return excluded;
    }
}
