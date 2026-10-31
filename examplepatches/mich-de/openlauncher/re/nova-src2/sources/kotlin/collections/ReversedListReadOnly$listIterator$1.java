package kotlin.collections;

import b70.e;
import b70.m;
import java.util.ListIterator;
import kotlin.Metadata;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010*\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/collections/ReversedListReadOnly$listIterator$1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ReversedListReadOnly$listIterator$1 implements ListIterator<Object>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final ListIterator f71742a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f71743b;

    public ReversedListReadOnly$listIterator$1(m mVar, int i5) {
        this.f71743b = mVar;
        this.f71742a = mVar.f17596b.listIterator(e.K0(i5, mVar));
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f71742a.hasPrevious();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f71742a.hasNext();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        return this.f71742a.previous();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return ul.b.K(this.f71743b) - this.f71742a.previousIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return this.f71742a.next();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return ul.b.K(this.f71743b) - this.f71742a.nextIndex();
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
