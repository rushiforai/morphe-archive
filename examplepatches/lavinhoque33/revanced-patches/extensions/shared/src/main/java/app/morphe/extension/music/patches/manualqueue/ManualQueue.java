/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.manualqueue;

import app.morphe.extension.music.patches.jam.JamUI;
import app.morphe.extension.music.settings.Settings;

import java.util.ArrayDeque;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.function.ToLongFunction;

/** Keeps the native request, callback, queue model and UI. Only the committed insertion index changes. */
@SuppressWarnings("unused") // Native bytecode hooks.
public final class ManualQueue {
    private static final String SOURCE_KEY = "app.morphe.rvx.music.manualQueue";
    private static final Object FLYOUT_ADD = new Object();
    private static final ThreadLocal<Dispatch> dispatching = new ThreadLocal<>();
    private static final ThreadLocal<Completion> completing = new ThreadLocal<>();

    public interface Access {
        Queue rvxManualQueue();
        void rvxManualDispatch(Object command);
    }

    public interface Queue extends ToLongFunction<Object> {
        Lane rvxManualLane();
        int rvxManualCurrent();
        boolean rvxManualLocal();
        boolean rvxManualUnshuffled();
        State rvxManualState();
        void rvxManualState(State state);
    }

    public interface Lane {
        int size();
        Object get(int index);
    }

    private ManualQueue() {}

    public static boolean enabled() {
        return Settings.FIFO_ADD_TO_QUEUE.get();
    }

    /** Called only from the original Add to queue flyout row's click dispatcher. */
    public static Map<String, Object> fromFlyout(Map<String, Object> original) {
        Map<String, Object> tagged = original == null ? new HashMap<>() : new HashMap<>(original);
        tagged.put(SOURCE_KEY, FLYOUT_ADD);
        return tagged;
    }

    public static boolean hasOrigin(Map<?, ?> extras) {
        return extras != null && enabled() && extras.get(SOURCE_KEY) == FLYOUT_ADD;
    }

    /** Called only in the native nonempty, non-Cast route, for a single-song INSERT_AT_END command. */
    public static Dispatch prepare(Access access) {
        if (!enabled() || jamOwnsQueue()) return null;

        Queue queue = access.rvxManualQueue();
        synchronized (queue) {
            if (!queue.rvxManualLocal() || !queue.rvxManualUnshuffled() || !hasCurrent(queue)) return null;

            State state = queue.rvxManualState();
            if (state == null) {
                state = new State();
                queue.rvxManualState(state);
            }
            return new Dispatch(queue, state);
        }
    }

    private static boolean hasCurrent(Queue queue) {
        int current = queue.rvxManualCurrent();
        return current >= 0 && current < queue.rvxManualLane().size();
    }

    private static boolean jamOwnsQueue() {
        return Settings.JAM_ENABLED.get() && JamUI.ownsQueue();
    }

    public static void dispatch(Access access, Object command, Dispatch request) {
        if (request == null) {
            access.rvxManualDispatch(command);
            return;
        }

        Dispatch previous = dispatching.get();
        dispatching.set(request);
        try {
            access.rvxManualDispatch(command);
        } finally {
            restore(dispatching, previous);
        }
    }

    public static void bindCallback(Object callback) {
        if (!enabled()) return;

        Dispatch request = dispatching.get();
        if (request != null) request.callback = callback;
    }

    /** The stock listener still completes with its original success or failure runnable. */
    public static Executor completionExecutor(Executor nativeExecutor) {
        if (!enabled()) return nativeExecutor;

        Dispatch request = dispatching.get();
        if (request == null || request.callback == null) return nativeExecutor;

        Completion completion = new Completion(request, nativeExecutor);
        request.state.register(completion);
        return completion;
    }

    public static int insertionIndex(Object callback, Object nativeLane, int stockIndex, Collection<?> rows) {
        if (!enabled()) return stockIndex;

        Completion completion = completing.get();
        if (completion == null || completion.request.callback != callback || rows.isEmpty()) return stockIndex;

        Queue queue = completion.request.queue;
        if (!queue.rvxManualUnshuffled() || nativeLane != queue.rvxManualLane()) return stockIndex;

        Lane lane = (Lane) nativeLane;
        int size = lane.size();
        int current = queue.rvxManualCurrent();
        if (stockIndex != size || current < 0 || current >= size) return stockIndex;

        completion.placed = true;
        return completion.request.state.order.insertionIndex(lane, current, size, queue);
    }

    public static void committed(Object callback, Collection<?> rows, boolean inserted) {
        if (!inserted || !enabled()) return;

        Completion completion = completing.get();
        if (completion == null || completion.request.callback != callback || !completion.placed) return;

        Dispatch request = completion.request;
        for (Object row : rows) request.state.order.record(request.queue.applyAsLong(row));
    }

    public static void replaced(Queue queue) {
        if (queue.rvxManualState() != null) queue.rvxManualState(null);
    }

    private static <T> void restore(ThreadLocal<T> variable, T previous) {
        if (previous == null) variable.remove();
        else variable.set(previous);
    }

    public static final class Dispatch {
        private final Queue queue;
        private final State state;
        private Object callback;

        private Dispatch(Queue queue, State state) {
            this.queue = queue;
            this.state = state;
        }
    }

    /** One native queue generation. Retires on model replacement, including in-place replacement. */
    public static final class State {
        private final ManualQueueOrder order = new ManualQueueOrder();
        private final ArrayDeque<Completion> pending = new ArrayDeque<>();
        private boolean scheduled;

        private synchronized void register(Completion completion) {
            pending.addLast(completion);
        }

        private void ready(Completion completion, Runnable task) {
            Completion next;
            synchronized (this) {
                completion.task = task;
                next = takeReady();
            }
            schedule(next);
        }

        private void finished() {
            Completion next;
            synchronized (this) {
                scheduled = false;
                next = takeReady();
            }
            schedule(next);
        }

        private Completion takeReady() {
            Completion next = pending.peekFirst();
            if (scheduled || next == null || next.task == null) return null;

            scheduled = true;
            return pending.removeFirst();
        }

        private static void schedule(Completion next) {
            if (next != null) next.executor.execute(next);
        }
    }

    private static final class Completion implements Executor, Runnable {
        private final Dispatch request;
        private final Executor executor;
        private Runnable task;
        private boolean placed;

        private Completion(Dispatch request, Executor executor) {
            this.request = request;
            this.executor = executor;
        }

        @Override
        public void execute(Runnable task) {
            request.state.ready(this, task);
        }

        @Override
        public void run() {
            try {
                Queue queue = request.queue;
                if (queue.rvxManualState() != request.state || !queue.rvxManualLocal() || jamOwnsQueue()) return;

                Completion previous = completing.get();
                completing.set(this);
                try {
                    task.run();
                } finally {
                    restore(completing, previous);
                }
            } finally {
                request.state.finished();
            }
        }
    }
}
