package kotlin.collections;

import b70.e;
import b70.l;
import java.util.ListIterator;
import kotlin.Metadata;
import kotlin.jvm.internal.markers.KMutableListIterator;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010+\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/collections/ReversedList$listIterator$1", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ReversedList$listIterator$1 implements ListIterator<Object>, KMutableListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final ListIterator f71740a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f71741b;

    public ReversedList$listIterator$1(l lVar, int i5) {
        this.f71741b = lVar;
        this.f71740a = lVar.f17595a.listIterator(e.K0(i5, lVar));
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        ListIterator listIterator = this.f71740a;
        listIterator.add(obj);
        listIterator.previous();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f71740a.hasPrevious();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f71740a.hasNext();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        return this.f71740a.previous();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return ul.b.K(this.f71741b) - this.f71740a.previousIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return this.f71740a.next();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return ul.b.K(this.f71741b) - this.f71740a.nextIndex();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        this.f71740a.remove();
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        this.f71740a.set(obj);
    }
}
