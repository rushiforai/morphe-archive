package wk;

import java.util.AbstractQueue;
import java.util.Iterator;
import xk.z2;

/* loaded from: classes.dex */
public final class f extends AbstractQueue {
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return z2.f96074j.j();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        return null;
    }

    @Override // java.util.Queue
    public final Object poll() {
        return null;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return 0;
    }
}
