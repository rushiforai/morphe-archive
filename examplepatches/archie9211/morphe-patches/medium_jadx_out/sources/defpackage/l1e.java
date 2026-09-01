package defpackage;

import j$.util.DesugarCollections;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l1e extends AbstractList implements uw6, RandomAccess {
    public final tw6 a;

    public l1e(tw6 tw6Var) {
        this.a = tw6Var;
    }

    @Override // defpackage.uw6
    public final List a() {
        return DesugarCollections.unmodifiableList(this.a.b);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        return (String) this.a.get(i);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        j1e j1eVar = new j1e(1);
        j1eVar.b = this.a.iterator();
        return j1eVar;
    }

    @Override // defpackage.uw6
    public final void j(f21 f21Var) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        i1e i1eVar = new i1e(1);
        i1eVar.b = this.a.listIterator(i);
        return i1eVar;
    }

    @Override // defpackage.uw6
    public final Object o(int i) {
        return this.a.b.get(i);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.a.size();
    }

    @Override // defpackage.uw6
    public final uw6 b() {
        return this;
    }
}
