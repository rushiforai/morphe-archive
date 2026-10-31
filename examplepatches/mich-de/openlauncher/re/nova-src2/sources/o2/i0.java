package o2;

import java.util.Iterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class i0 implements Iterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f79281a;

    public i0(j0 j0Var) {
        this.f79281a = j0Var.f79308j.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f79281a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return (l0) this.f79281a.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
