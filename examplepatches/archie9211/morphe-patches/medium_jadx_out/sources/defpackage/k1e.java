package defpackage;

import j$.util.DesugarCollections;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class k1e extends AbstractList implements RandomAccess, vw6 {
    public final sw6 a;

    public k1e(sw6 sw6Var) {
        this.a = sw6Var;
    }

    @Override // defpackage.vw6
    public final List a() {
        return DesugarCollections.unmodifiableList(this.a.a);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        return (String) this.a.get(i);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        j1e j1eVar = new j1e(0);
        j1eVar.b = this.a.iterator();
        return j1eVar;
    }

    @Override // defpackage.vw6
    public final g21 k(int i) {
        return this.a.k(i);
    }

    @Override // defpackage.vw6
    public final void l(c57 c57Var) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        i1e i1eVar = new i1e(0);
        i1eVar.b = this.a.listIterator(i);
        return i1eVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.a.size();
    }

    @Override // defpackage.vw6
    public final k1e b() {
        return this;
    }
}
