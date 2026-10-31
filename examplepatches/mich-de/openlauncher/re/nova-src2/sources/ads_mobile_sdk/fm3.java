package ads_mobile_sdk;

import java.util.ListIterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class fm3 implements ListIterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ListIterator f3436a;

    public fm3(ListIterator delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f3436a = delegate;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f3436a.hasNext();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f3436a.hasPrevious();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        return this.f3436a.next();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f3436a.nextIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return this.f3436a.previous();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f3436a.previousIndex();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
