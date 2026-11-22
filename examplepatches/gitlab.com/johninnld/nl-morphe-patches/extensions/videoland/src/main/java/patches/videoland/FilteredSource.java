package patches.videoland;

import tv.c;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import y4.V1;
import y4.V1$a;
import y4.V1$a$a;
import y4.V1$a$c;
import y4.V1$b$a;
import y4.V1$b$c;
import y4.W1;

/** Filters materialized pages after the native source has computed its raw keys. */
public final class FilteredSource extends V1 {
    final V1 delegate;
    volatile boolean exhausted;
    volatile boolean awaitingPublication;
    private final List<Runnable> stateObservers = new ArrayList<>();

    public FilteredSource(V1 source) {
        delegate = Objects.requireNonNull(source);
        source.a.b(new Invalidation(this));
        a.b(new Invalidation(source));
    }

    @Override public Object b(W1 state) {
        // Visible anchors are not raw positional offsets. Native default refresh
        // starts at its first key, retaining all available earlier content.
        return null;
    }

    @Override public Object d(V1$a params, c caller) {
        Operation operation = new Operation(this, params, caller);
        Object result = delegate.d(params, operation);
        return result == sv.a.N ? result : operation.process(result);
    }

    void seed(V1$b$c original) {
        exhausted = original.P == null;
        awaitingPublication = false;
    }

    synchronized void observe(Runnable observer) {
        if (!stateObservers.contains(observer)) stateObservers.add(observer);
    }

    void pageReady(boolean end, boolean nonempty) {
        awaitingPublication = nonempty;
        boolean changed = exhausted != end;
        exhausted = end;
        if (changed) {
            List<Runnable> observers;
            synchronized (this) { observers = new ArrayList<>(stateObservers); }
            for (Runnable observer : observers) observer.run();
        }
    }

    private static final class Invalidation implements Bv.a {
        private final V1 peer;
        Invalidation(V1 peer) { this.peer = peer; }
        @Override public Object invoke() { peer.c(); return nv.M.a; }
    }

    private static final class Operation extends c {
        private final FilteredSource owner;
        private V1$a params;
        private final boolean prepend;
        private boolean first = true;
        private Object firstPrevious;
        private Object firstNext;
        private final HashSet<Object> visited = new HashSet<>();

        Operation(FilteredSource owner, V1$a params, c caller) {
            super(caller);
            this.owner = owner;
            this.params = params;
            prepend = params instanceof V1$a$c;
            if (params.a() != null) visited.add(params.a());
        }

        @Override public Object invokeSuspend(Object value) { return process(value); }

        Object process(Object value) {
            while (true) {
                lb.B.m(value); // Preserve cancellation/exceptional completion.
                if (!(value instanceof V1$b$c)) return value;
                V1$b$c raw = (V1$b$c) value;
                if (first) {
                    firstPrevious = raw.O;
                    firstNext = raw.P;
                    first = false;
                }
                List visible = Availability.filter(raw.N);
                Object next = prepend ? raw.O : raw.P;
                if (!visible.isEmpty() || next == null) {
                    Object previousKey = prepend ? raw.O : firstPrevious;
                    Object nextKey = prepend ? firstNext : raw.P;
                    if (!prepend) owner.pageReady(nextKey == null, !visible.isEmpty());
                    // Raw placeholder counts cannot describe a compact list.
                    return new V1$b$c(visible, previousKey, nextKey);
                }
                if (!visited.add(next)) {
                    return new V1$b$a(new IllegalStateException("Content page key did not advance"));
                }
                params = prepend
                    ? new V1$a$c(next, params.a, params.b)
                    : new V1$a$a(next, params.a, params.b);
                value = owner.delegate.d(params, this);
                if (value == sv.a.N) return value;
            }
        }
    }
}
