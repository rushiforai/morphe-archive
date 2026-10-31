package mh;

import java.util.Collections;
import java.util.Comparator;
import java.util.NavigableSet;
import java.util.SortedSet;

/* loaded from: classes3.dex */
public abstract class p extends l implements NavigableSet, z {

    /* renamed from: d, reason: collision with root package name */
    public final transient Comparator f76367d;

    /* renamed from: e, reason: collision with root package name */
    public transient p f76368e;

    public p(Comparator comparator) {
        this.f76367d = comparator;
    }

    public static w l(Comparator comparator) {
        if (s.f76375b.equals(comparator)) {
            return w.f76396g;
        }
        g gVar = j.f76346b;
        return new w(u.f76380e, comparator);
    }

    public final void addFirst(Object obj) {
        throw new UnsupportedOperationException();
    }

    public final void addLast(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.SortedSet
    public final Comparator comparator() {
        return this.f76367d;
    }

    @Override // java.util.SortedSet
    public abstract Object first();

    public final Object getFirst() {
        return first();
    }

    public final Object getLast() {
        return last();
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet headSet(Object obj) {
        obj.getClass();
        w wVar = (w) this;
        return wVar.p(0, wVar.n(obj, false));
    }

    @Override // java.util.NavigableSet
    /* renamed from: j, reason: merged with bridge method [inline-methods] */
    public final p descendingSet() {
        p pVarL = this.f76368e;
        if (pVarL == null) {
            w wVar = (w) this;
            Comparator comparatorReverseOrder = Collections.reverseOrder(wVar.f76367d);
            pVarL = wVar.isEmpty() ? l(comparatorReverseOrder) : new w(wVar.f76397f.g(), comparatorReverseOrder);
            this.f76368e = pVarL;
            pVarL.f76368e = this;
        }
        return pVarL;
    }

    @Override // java.util.NavigableSet
    /* renamed from: k, reason: merged with bridge method [inline-methods] */
    public final w subSet(Object obj, boolean z11, Object obj2, boolean z12) {
        obj.getClass();
        obj2.getClass();
        if (this.f76367d.compare(obj, obj2) > 0) {
            throw new IllegalArgumentException();
        }
        w wVar = (w) this;
        w wVarP = wVar.p(wVar.o(obj, z11), wVar.f76397f.size());
        return wVarP.p(0, wVarP.n(obj2, z12));
    }

    @Override // java.util.SortedSet
    public abstract Object last();

    @Override // java.util.NavigableSet
    public final Object pollFirst() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet
    public final Object pollLast() {
        throw new UnsupportedOperationException();
    }

    public final Object removeFirst() {
        throw new UnsupportedOperationException();
    }

    public final Object removeLast() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final /* bridge */ /* synthetic */ SortedSet subSet(Object obj, Object obj2) {
        return subSet(obj, true, obj2, false);
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final SortedSet tailSet(Object obj) {
        obj.getClass();
        w wVar = (w) this;
        return wVar.p(wVar.o(obj, true), wVar.f76397f.size());
    }

    @Override // java.util.NavigableSet
    public final NavigableSet headSet(Object obj, boolean z11) {
        obj.getClass();
        w wVar = (w) this;
        return wVar.p(0, wVar.n(obj, z11));
    }

    @Override // java.util.NavigableSet
    public final NavigableSet tailSet(Object obj, boolean z11) {
        obj.getClass();
        w wVar = (w) this;
        return wVar.p(wVar.o(obj, z11), wVar.f76397f.size());
    }
}
