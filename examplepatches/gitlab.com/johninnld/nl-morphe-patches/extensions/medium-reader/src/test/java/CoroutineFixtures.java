import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

/** Deterministic ABI contract fixtures, not an implementation/proof of the app's Kotlin runtime. */
final class CoroutineFixtures {
    static final class Context implements ho2 {
        final Executor dispatcher;
        boolean cancelled;
        final List<Runnable> hooks = new ArrayList<>();
        Context(Executor dispatcher) { this.dispatcher = dispatcher; }
        public ho2 k0(ho2 other) { return this; }
        void onCancel(Runnable hook) {
            boolean immediately;
            synchronized (this) { immediately = cancelled; if (!immediately) hooks.add(hook); }
            if (immediately) hook.run();
        }
        void cancel() {
            List<Runnable> callbacks;
            synchronized (this) { if (cancelled) return; cancelled = true; callbacks = new ArrayList<>(hooks); hooks.clear(); }
            for (Runnable callback : callbacks) callback.run();
        }
    }
    static final class Completion implements yl2 {
        final Context context;
        final CompletableFuture<Object> done = new CompletableFuture<>();
        final AtomicInteger signals = new AtomicInteger();
        Completion(Context context) { this.context = context; }
        public ho2 getContext() { return context; }
        public void resumeWith(Object result) { signals.incrementAndGet(); done.complete(result); }
    }
    static Completion start(jd5 flow, ld5 collector, Context context) {
        Completion completion = new Completion(context);
        context.dispatcher.execute(() -> {
            try {
                Object result = flow.b(collector, completion);
                if (result != so2.COROUTINE_SUSPENDED) completion.resumeWith(result);
            } catch (Throwable failure) { completion.resumeWith(new l0e(failure)); }
        });
        return completion;
    }
    static jd5 series(Object... values) {
        return (collector, completion) -> new Series(values, collector, completion).invokeSuspend(tzg.a);
    }
    private static final class Series extends am2 {
        final Object[] values; final ld5 collector; int index;
        Series(Object[] values, ld5 collector, yl2 parent) { super(parent); this.values = values; this.collector = collector; }
        public Object invokeSuspend(Object result) {
            check(result);
            while (index < values.length) {
                Object emitted = collector.a(values[index++], this);
                if (emitted == so2.COROUTINE_SUSPENDED) return emitted;
            }
            return tzg.a;
        }
    }
    static void check(Object result) { if (result instanceof l0e) CoroutineFixtures.<RuntimeException>raise(((l0e) result).a); }
    @SuppressWarnings("unchecked") static <T extends Throwable> void raise(Throwable failure) throws T { throw (T) failure; }
}

// Test classpath shadows compile-only signatures with explicit contract fixtures.
abstract class cr0 implements yl2 {
    final yl2 completion;
    public cr0(yl2 completion) { this.completion = completion; }
    public abstract Object invokeSuspend(Object result);
    public final void resumeWith(Object result) {
        Object next;
        try { next = invokeSuspend(result); }
        catch (Throwable failure) { next = new l0e(failure); }
        if (next != so2.COROUTINE_SUSPENDED) completion.resumeWith(next);
    }
}
abstract class am2 extends cr0 {
    public am2(yl2 completion) { super(completion); }
    public ho2 getContext() { return completion.getContext(); }
}
final class d4j { }
abstract class ppk {
    public static yl2 H(yl2 continuation) {
        if (!(continuation instanceof am2)) return continuation;
        CoroutineFixtures.Context context = (CoroutineFixtures.Context) continuation.getContext();
        return new yl2() {
            public ho2 getContext() { return context; }
            public void resumeWith(Object result) {
                context.dispatcher.execute(() -> continuation.resumeWith(context.cancelled ? new l0e(new CancellationException()) : result));
            }
        };
    }
}
class ra1 {
    final yl2 continuation;
    final CoroutineFixtures.Context context;
    int state; boolean suspended; Object value; d4j token; z06 handler;
    public ra1(int mode, yl2 continuation) {
        if (mode != 1) throw new IllegalArgumentException("Unexpected adapter mode");
        this.continuation = continuation; this.context = (CoroutineFixtures.Context) continuation.getContext();
    }
    public void r() { context.onCancel(this::cancel); }
    public void t(z06 callback) {
        boolean invoke;
        synchronized (this) { if (handler != null) throw new IllegalStateException("Duplicate cancellation handler"); handler = callback; invoke = state == 3; }
        if (invoke) callback.invoke(new CancellationException());
    }
    public synchronized d4j c(Object result, l16 onCancellation) {
        if (state != 0) return null;
        state = 1; value = result; token = new d4j(); return token;
    }
    public void A(Object completedToken) {
        boolean deliver; Object result;
        synchronized (this) {
            if (state != 1 || token != completedToken) throw new IllegalStateException("Invalid completion token");
            state = 2; deliver = suspended; result = value;
        }
        if (deliver) continuation.resumeWith(result);
    }
    public synchronized Object p() {
        if (context.cancelled || state == 3) throw new CancellationException();
        if (state == 2) return value;
        if (suspended) throw new IllegalStateException("Suspended twice");
        suspended = true; return so2.COROUTINE_SUSPENDED;
    }
    private void cancel() {
        boolean deliver; z06 callback;
        synchronized (this) { if (state != 0) return; state = 3; deliver = suspended; callback = handler; }
        CancellationException failure = new CancellationException();
        if (callback != null) callback.invoke(failure);
        if (deliver) continuation.resumeWith(new l0e(failure));
    }
}
