package patches.videoland;

import android.os.Handler;
import android.os.Looper;
import com.bedrockstreaming.component.layout.domain.core.model.*;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import y4.A1;
import y4.A1$c;

/** Transient UI subscriptions only; the current row always owns its decision. */
final class Rows {
    private static final WeakHashMap<al.s, Observer> observers = new WeakHashMap<>();
    private Rows() {}

    static int count(al.s row) {
        if (!(row.Q instanceof f8.a)) return 1;
        f8.a model = (f8.a) row.Q;
        if (!Availability.collection(model.N)) return 1;
        A1 list = model.O;
        if (list == null) {
            LayoutBlockContent content = ((Block.LayoutBlock) model.N).U;
            // The native factory creates no pager for an empty seed. A next
            // marker alone cannot load items; a later model bind is reevaluated.
            return content != null && content.Q != null && content.Q.isEmpty() ? 0 : 1;
        }
        if (!(list.k() instanceof FilteredSource)) return 1;
        FilteredSource source = (FilteredSource) list.k();
        synchronized (observers) {
            Observer existing = observers.get(row);
            if (existing == null || existing.list.get() != list) {
                Observer observer = new Observer(row, list);
                observers.put(row, observer);
                list.d(observer); // native PagedList holds a weak callback
                source.observe(observer); // retain it until the source is released
            }
        }
        if (!list.isEmpty()) { source.awaitingPublication = false; return 1; }
        return source.exhausted && !source.awaitingPublication ? 0 : 1;
    }

    static boolean changed(Xk.a$b observer) {
        Xk.a parent = observer.b;
        if (parent == null || parent.R < 0 || parent.S == null || observer.a < 0 || observer.a >= parent.S.length) return false;
        Xk.a$a section = parent.S[observer.a];
        if (section == null || section.a == null || !containsCollection(section.a, 0)) return false;
        int end = parent.R;
        for (int next = observer.a + 1; next < parent.S.length; next++) {
            if (parent.S[next] != null) { end = parent.S[next].c; break; }
        }
        if (section.a.c() == end - section.c) return false;
        // The shipped aggregator treats onChanged as a fixed-size range change.
        // Rebuild its offsets/count before forwarding a structural change.
        parent.y();
        parent.f();
        return true;
    }

    private static boolean containsCollection(androidx.recyclerview.widget.RecyclerView$a adapter, int depth) {
        if (depth > 16) return false;
        if (adapter instanceof al.s) {
            Object model = ((al.s) adapter).Q;
            return model instanceof f8.a && Availability.collection(((f8.a) model).N);
        }
        if (adapter instanceof Xk.a) {
            Xk.a$a[] children = ((Xk.a) adapter).S;
            if (children != null) for (Xk.a$a child : children)
                if (child != null && containsCollection(child.a, depth + 1)) return true;
        }
        return false;
    }

    private static final class Observer extends A1$c implements Runnable {
        final WeakReference<al.s> row;
        final WeakReference<A1> list;
        final AtomicBoolean queued = new AtomicBoolean();
        Observer(al.s row, A1 list) {
            this.row = new WeakReference<>(row);
            this.list = new WeakReference<>(list);
        }
        @Override public void a(int start, int count) { run(); }
        @Override public void b(int start, int count) { run(); }
        @Override public void c(int start, int count) { run(); }
        @Override public void run() {
            if (row.get() == null || !queued.compareAndSet(false, true)) return;
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override public void run() {
                    queued.set(false);
                    al.s current = row.get();
                    if (current != null) current.f();
                }
            });
        }
    }
}
