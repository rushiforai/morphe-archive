package app.tikkamasalla.stremio.progress;

import java.lang.reflect.Method;

/**
 * Phase 2 of the external-progress recovery: Stremio was started cold (both apps were killed, the
 * TV rebooted) with an outstanding handoff. The core stores a position only through
 * Player/TimeChanged on a loaded Player model (there is no library action that sets a time
 * offset: ActionCtx has AddToLibrary, RemoveFromLibrary, RewindLibraryItem, MarkAsWatched only).
 * So the Player model is loaded once, headless, from the six PlayerFragment args saved at launch
 * (the same call PlayerFragment.onCreate makes), the journal position goes in through the same
 * UpdateProgress path as a normal result, and the model is released again.
 *
 * The decision logic is pure and unit tested; StockLoader is the reflective glue to the stock
 * classes (Koin -> StremioApi, StreamingServerApi -> PlayerViewModelImpl).
 */
final class ColdRecovery {
    static final int MAX_TRIES = 3;
    static final long POLL_MS = 500L;
    static final long LOAD_TIMEOUT_MS = 30000L;
    /** The core applies TimeChanged asynchronously: keep the model this long before releasing it. */
    static final long SETTLE_MS = 3000L;

    static final int WAITING = 0;
    static final int DONE = 1;
    static final int FAILED = 2;

    private ColdRecovery() {
    }

    /** What a session needs from the app: reflective in production, a fake in tests. */
    interface Loader {
        /** Builds a headless Player view model and starts loading the six args. */
        Object load(String[] args) throws Exception;

        /** Id of the episode the model holds now, "" until loaded. */
        String videoIdOf(Object vm);

        /** The stock UpdateProgress path (never marks watched by itself). */
        void progress(Object vm, long positionMs, long durationMs);

        void watched(Object vm, long positionMs, long durationMs, String reason);

        /** A real player screen holds (or is loading) a Player model: never touch the core's. */
        boolean realPlayerPresent();

        /** Unloads the headless model. */
        void release(Object vm);
    }

    /** null when a cold load may be tried, else the reason it is skipped (logged, record kept). */
    static String skipReason(String[] args, int tries, boolean sessionOpen, boolean realPlayer,
                             boolean running) {
        if (running) return "running";
        if (sessionOpen) return "session-open";
        if (realPlayer) return "player-open";
        if (args == null || args.length != 6 || args[0] == null || args[0].length() == 0) return "no-load-args";
        if (tries >= MAX_TRIES) return "gave-up";
        return null;
    }

    /** One cold load: poll tick() until it returns DONE or FAILED. */
    static final class Session {
        private final Loader loader;
        private final String[] args;
        private final String videoId;
        private final long position, duration;
        private final String watchedReason;
        private Object vm;
        private long startedAt, appliedAt;
        private boolean applied;
        String failure = "";

        Session(Loader loader, String[] args, String videoId, long position, long duration,
                String watchedReason) {
            this.loader = loader;
            this.args = args;
            this.videoId = videoId;
            this.position = position;
            this.duration = duration;
            this.watchedReason = watchedReason;
        }

        boolean applied() {
            return applied;
        }

        int tick(long now) {
            try {
                if (vm == null) {
                    if (loader.realPlayerPresent()) return fail("player-open", false);
                    vm = loader.load(args);
                    startedAt = now;
                    return WAITING;
                }
                if (loader.realPlayerPresent()) return fail("player-opened", false);
                if (applied) {
                    if (now - appliedAt < SETTLE_MS) return WAITING;
                    loader.release(vm);
                    vm = null;
                    return DONE;
                }
                if (videoId.equals(loader.videoIdOf(vm))) {
                    loader.progress(vm, position, duration);
                    if (watchedReason != null) loader.watched(vm, position, duration, watchedReason);
                    applied = true;
                    appliedAt = now;
                    return WAITING;
                }
                if (now - startedAt > LOAD_TIMEOUT_MS || now < startedAt) return fail("load-timeout", true);
                return WAITING;
            } catch (Throwable error) {
                return fail("error " + error.getClass().getSimpleName() + ": " + error.getMessage(), true);
            }
        }

        private int fail(String why, boolean release) {
            failure = why;
            if (release && vm != null) {
                try {
                    loader.release(vm);
                } catch (Throwable ignored) {
                }
            }
            vm = null;
            return FAILED;
        }
    }

    /** Reflective glue to the stock app (1.6.12 class names): headless Player view model, started loading. */
    static Object stockLoad(String[] args) throws Exception {
        ClassLoader loader = ColdRecovery.class.getClassLoader();
        Class<?> platform = Class.forName("org.koin.mp.KoinPlatform", false, loader);
        Object koin = platform.getMethod("getKoin").invoke(platform.getField("INSTANCE").get(null));
        Class<?> apiClass = Class.forName("com.stremio.common.api.StremioApi", false, loader);
        Class<?> serverClass = Class.forName("com.stremio.common.api.StreamingServerApi", false, loader);
        Class<?> implClass = Class.forName("com.stremio.common.viewmodels.PlayerViewModelImpl", false, loader);
        Object vm = implClass.getConstructor(apiClass, serverClass)
                .newInstance(koinGet(koin, apiClass), koinGet(koin, serverClass));
        Method init = implClass.getMethod("initiateState", String.class, String.class, String.class,
                String.class, String.class, String.class);
        init.invoke(vm, (Object[]) args);
        return vm;
    }

    private static Object koinGet(Object koin, Class<?> type) throws Exception {
        Object kClass = Class.forName("kotlin.jvm.internal.Reflection")
                .getMethod("getOrCreateKotlinClass", Class.class).invoke(null, type);
        for (Method m : koin.getClass().getMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (m.getName().equals("get") && p.length == 3 && p[0].getName().equals("kotlin.reflect.KClass")) {
                return m.invoke(koin, kClass, null, null);
            }
        }
        throw new NoSuchMethodException("Koin.get(KClass, Qualifier, Function0)");
    }

    /**
     * ViewModel.onCleared() is protected; PlayerViewModelImpl overrides it to clear the core's
     * Player state, which is what unloads the headless model.
     */
    static void stockRelease(Object vm) {
        try {
            Class<?> type = vm.getClass();
            while (type != null) {
                try {
                    Method m = type.getDeclaredMethod("onCleared");
                    m.setAccessible(true);
                    m.invoke(vm);
                    return;
                } catch (NoSuchMethodException next) {
                    type = type.getSuperclass();
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
