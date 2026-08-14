package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore;

import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function5;

/** One-shot bridge between confirmed internal-player navigation and Nuvio's native restoration. */
public final class SourceSelectionRestoreRuntime {
    private static final int IDLE = 0;
    private static final int ARMED = 1;
    private static final int PLAYER_ENTERED = 2;
    private static final int RETURNING = 3;
    private static final AtomicInteger RESTORE_STATE = new AtomicInteger(IDLE);
    private static final AtomicInteger RESTORE_INDEX = new AtomicInteger(0);
    private static final AtomicBoolean VIEWPORT_SCHEDULED = new AtomicBoolean(false);
    private static volatile Method requestScrollMethod;

    private SourceSelectionRestoreRuntime() {}

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Function1 wrapSelectionCallback(Function1 callback) {
        if (callback == null || callback instanceof SelectionCallback) return callback;
        return new SelectionCallback(callback);
    }

    private static void markPlayerEntered() {
        RESTORE_STATE.compareAndSet(ARMED, PLAYER_ENTERED);
    }

    private static void markPlayerReturning() {
        RESTORE_STATE.compareAndSet(PLAYER_ENTERED, RETURNING);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Function5 wrapPlayerBackCallback(Function5 callback) {
        markPlayerEntered();
        if (callback == null || callback instanceof PlayerBackCallback) return callback;
        return new PlayerBackCallback(callback);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Function0 wrapPlayerErrorBackCallback(Function0 callback) {
        markPlayerEntered();
        if (callback == null || callback instanceof PlayerErrorBackCallback) return callback;
        return new PlayerErrorBackCallback(callback);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Function0 wrapRestoreHandledCallback(Function0 callback) {
        if (callback == null || callback instanceof RestoreHandledCallback) return callback;
        return new RestoreHandledCallback(callback);
    }

    public static boolean shouldRestoreSelection(boolean nativeRestore, int selectedIndex) {
        if (nativeRestore) {
            if (RESTORE_STATE.get() != RETURNING) resetRestoreState();
            return true;
        }
        if (!SourceSelectionRestoreSettings.isEnabled()) {
            resetRestoreState();
            return false;
        }
        if (selectedIndex <= 0) {
            resetRestoreState();
            return false;
        }
        if (RESTORE_STATE.get() != RETURNING) return false;
        RESTORE_INDEX.set(selectedIndex);
        return true;
    }

    /** Queues a non-suspending LazyListState viewport request after Compose finishes the frame. */
    public static void scheduleViewportRestore(Object lazyListState) {
        int index = RESTORE_INDEX.get();
        if (lazyListState == null || RESTORE_STATE.get() != RETURNING || index <= 0 ||
            !VIEWPORT_SCHEDULED.compareAndSet(false, true)) return;

        Runnable request = () -> requestScrollToItem(lazyListState, index);
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(request);
        handler.postDelayed(request, 16L);
    }

    private static void requestScrollToItem(Object lazyListState, int index) {
        try {
            Method method = requestScrollMethod;
            if (method == null || method.getDeclaringClass() != lazyListState.getClass()) {
                method = null;
                for (Method candidate : lazyListState.getClass().getDeclaredMethods()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (candidate.getReturnType() == Void.TYPE && parameters.length == 2 &&
                        parameters[0] == Integer.TYPE && parameters[1] == Integer.TYPE) {
                        candidate.setAccessible(true);
                        method = candidate;
                        requestScrollMethod = candidate;
                        break;
                    }
                }
            }
            if (method != null) method.invoke(lazyListState, index, 0);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Nuvio's native focus path remains active; unsupported targets fail without a crash.
        }
    }

    private static void completeRestore() {
        if (RESTORE_STATE.compareAndSet(RETURNING, IDLE)) {
            RESTORE_INDEX.set(0);
            VIEWPORT_SCHEDULED.set(false);
        }
    }

    private static void resetRestoreState() {
        RESTORE_STATE.set(IDLE);
        RESTORE_INDEX.set(0);
        VIEWPORT_SCHEDULED.set(false);
    }

    static boolean isRestorePendingForTesting() {
        return RESTORE_STATE.get() != IDLE;
    }

    static boolean isPlayerEnteredForTesting() {
        return RESTORE_STATE.get() == PLAYER_ENTERED;
    }

    static boolean isPlayerReturningForTesting() {
        return RESTORE_STATE.get() == RETURNING;
    }

    static void resetForTesting() {
        resetRestoreState();
    }

    @SuppressWarnings("rawtypes")
    private static final class SelectionCallback implements Function1 {
        private final Function1 delegate;

        SelectionCallback(Function1 delegate) {
            this.delegate = delegate;
        }

        @Override
        public Object invoke(Object playbackInfo) {
            if (SourceSelectionRestoreSettings.isEnabled()) {
                RESTORE_STATE.set(ARMED);
                RESTORE_INDEX.set(0);
                VIEWPORT_SCHEDULED.set(false);
            } else {
                resetRestoreState();
            }
            try {
                return delegate.invoke(playbackInfo);
            } catch (RuntimeException | Error failure) {
                resetRestoreState();
                throw failure;
            }
        }
    }

    @SuppressWarnings("rawtypes")
    private static final class PlayerBackCallback implements Function5 {
        private final Function5 delegate;

        PlayerBackCallback(Function5 delegate) {
            this.delegate = delegate;
        }

        @Override
        public Object invoke(Object videoId, Object season, Object episode, Object autoPlay, Object completed) {
            markPlayerReturning();
            return delegate.invoke(videoId, season, episode, autoPlay, completed);
        }
    }

    @SuppressWarnings("rawtypes")
    private static final class PlayerErrorBackCallback implements Function0 {
        private final Function0 delegate;

        PlayerErrorBackCallback(Function0 delegate) {
            this.delegate = delegate;
        }

        @Override
        public Object invoke() {
            markPlayerReturning();
            return delegate.invoke();
        }
    }

    @SuppressWarnings("rawtypes")
    private static final class RestoreHandledCallback implements Function0 {
        private final Function0 delegate;

        RestoreHandledCallback(Function0 delegate) {
            this.delegate = delegate;
        }

        @Override
        public Object invoke() {
            completeRestore();
            return delegate.invoke();
        }
    }
}
