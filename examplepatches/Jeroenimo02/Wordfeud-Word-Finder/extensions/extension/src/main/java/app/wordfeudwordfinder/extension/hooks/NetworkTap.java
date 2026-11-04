package app.wordfeudwordfinder.extension.hooks;

import app.wordfeudwordfinder.extension.core.WordFinder;
import app.wordfeudwordfinder.extension.game.GameStore;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Entry points called from the Cronet callback proxy. Never throws. The hooks only copy bytes; parsing, replay,
 * cache writes and the first WordFinder construction run on one background thread (one thread keeps the
 * detail/move order), so the app's own callback is not delayed.
 */
public final class NetworkTap {
    private static final ResponseAssembler ASSEMBLER = new ResponseAssembler();
    private static final Object EXECUTOR_LOCK = new Object();
    private static volatile ExecutorService executor;

    /** Class and getUrl method of the last UrlResponseInfo seen (one immutable pair, swapped atomically). */
    private static final class UrlAccessor {
        final Class<?> cls;
        final Method getUrl;

        UrlAccessor(Class<?> cls, Method getUrl) {
            this.cls = cls;
            this.getUrl = getUrl;
        }
    }

    private static volatile UrlAccessor urlAccessor;

    private NetworkTap() {
    }

    public static void onStarted(Object req, Object info) {
        try {
            ASSEMBLER.started(req, urlOf(info));
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    public static void onRead(Object req, Object info, ByteBuffer b) {
        try {
            ASSEMBLER.read(req, b);
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    public static void onSucceeded(Object req, Object info) {
        try {
            final ResponseAssembler.Completed c = ASSEMBLER.succeeded(req);
            if (c == null) return;
            executor().execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        WordFinder wf = WordFinder.get();
                        if (wf == null) return;
                        route(c, wf.gameStore());
                    } catch (Throwable ignored) {
                        // background processing never affects the app
                    }
                }
            });
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    /**
     * Hands a completed response to the store. games/detail and move responses go to their own handlers (a move
     * response only there, so it is not processed twice; it throws MV-SERVER-... like the store). Any other response
     * is only parsed when its body mentions {@code game_log}, and then merged when it carries game data
     * ({@link GameStore#onGameData}); everything else is ignored.
     */
    static void route(ResponseAssembler.Completed c, GameStore store) throws Exception {
        if (c == null || c.url == null || c.body == null || store == null) return;
        String path = path(c.url);
        if (path.contains("user/games/detail/")) store.onGamesDetail(c.body, c.url);
        else if (path.contains("/move/")) store.onMoveResponse(c.body, c.url);
        else if (c.body.contains("game_log")) store.onGameData(c.body, c.url);
    }

    /** The URL without its query string. */
    static String path(String url) {
        int q = url.indexOf('?');
        return q < 0 ? url : url.substring(0, q);
    }

    /** Lazily created single daemon thread; called inside the hooks' try/catch. */
    private static ExecutorService executor() {
        ExecutorService e = executor;
        if (e != null) return e;
        synchronized (EXECUTOR_LOCK) {
            if (executor == null) {
                ThreadPoolExecutor t = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
                        new LinkedBlockingQueue<Runnable>(), r -> {
                            Thread th = new Thread(r, "wfwf-network");
                            th.setDaemon(true);
                            return th;
                        });
                executor = t;
            }
            return executor;
        }
    }

    public static void onDropped(Object req) {
        try {
            ASSEMBLER.dropped(req);
        } catch (Throwable ignored) {
            // hooks never change app behaviour
        }
    }

    private static String urlOf(Object info) throws Exception {
        if (info == null) return null;
        Class<?> cls = info.getClass();
        UrlAccessor a = urlAccessor;
        if (a == null || a.cls != cls) {
            Method m = cls.getMethod("getUrl");
            try {
                m.setAccessible(true);
            } catch (Throwable ignored) {
                // public method; accessibility tweak is best effort
            }
            a = new UrlAccessor(cls, m);
            urlAccessor = a;
        }
        Object u = a.getUrl.invoke(info);
        return u instanceof String ? (String) u : null;
    }
}
