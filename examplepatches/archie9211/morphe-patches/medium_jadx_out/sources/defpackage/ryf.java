package defpackage;

import j$.util.SortedSet;
import java.util.Collections;
import java.util.Comparator;
import java.util.NavigableSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ryf extends fyf implements NavigableSet, Iterable, SortedSet {
    public final transient Comparator h;
    public transient ryf i;

    public ryf(Comparator comparator) {
        super(3);
        this.h = comparator;
    }

    public static wzf E(Comparator comparator) {
        if (czf.b == comparator) {
            return wzf.k;
        }
        hxf hxfVar = ayf.f;
        return new wzf(hzf.i, comparator);
    }

    @Override // java.util.NavigableSet
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final ryf descendingSet() {
        ryf ryfVarE = this.i;
        if (ryfVarE == null) {
            wzf wzfVar = (wzf) this;
            Comparator comparatorReverseOrder = Collections.reverseOrder(wzfVar.h);
            ryfVarE = wzfVar.isEmpty() ? E(comparatorReverseOrder) : new wzf(wzfVar.j.y(), comparatorReverseOrder);
            this.i = ryfVarE;
            ryfVarE.i = this;
        }
        return ryfVarE;
    }

    @Override // java.util.NavigableSet
    /* JADX INFO: renamed from: D, reason: merged with bridge method [inline-methods] */
    public final wzf subSet(Object obj, boolean z, Object obj2, boolean z2) {
        obj.getClass();
        obj2.getClass();
        if (this.h.compare(obj, obj2) > 0) {
            lg8.r();
            return null;
        }
        wzf wzfVar = (wzf) this;
        wzf wzfVarH = wzfVar.H(wzfVar.G(obj, z), wzfVar.j.size());
        return wzfVarH.H(0, wzfVarH.F(obj2, z2));
    }

    public final void addFirst(Object obj) {
        throw new UnsupportedOperationException();
    }

    public final void addLast(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.SortedSet
    public final Comparator comparator() {
        return this.h;
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
    public final java.util.SortedSet headSet(Object obj) {
        obj.getClass();
        wzf wzfVar = (wzf) this;
        return wzfVar.H(0, wzfVar.F(obj, false));
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
    public final /* bridge */ /* synthetic */ java.util.SortedSet subSet(Object obj, Object obj2) {
        return subSet(obj, true, obj2, false);
    }

    @Override // java.util.NavigableSet, java.util.SortedSet
    public final java.util.SortedSet tailSet(Object obj) {
        obj.getClass();
        wzf wzfVar = (wzf) this;
        return wzfVar.H(wzfVar.G(obj, true), wzfVar.j.size());
    }

    @Override // java.util.NavigableSet
    public final NavigableSet headSet(Object obj, boolean z) {
        obj.getClass();
        wzf wzfVar = (wzf) this;
        return wzfVar.H(0, wzfVar.F(obj, z));
    }

    @Override // java.util.NavigableSet
    public final NavigableSet tailSet(Object obj, boolean z) {
        obj.getClass();
        wzf wzfVar = (wzf) this;
        return wzfVar.H(wzfVar.G(obj, z), wzfVar.j.size());
    }
}
