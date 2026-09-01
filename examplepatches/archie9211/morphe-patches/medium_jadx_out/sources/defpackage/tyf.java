package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tyf extends gyf {
    public final transient yyf d;
    public final transient wyf e;

    public tyf(yyf yyfVar, wyf wyfVar) {
        this.d = yyfVar;
        this.e = wyfVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.d.get(obj) != null;
    }

    @Override // defpackage.cxf
    public final int d(Object[] objArr) {
        return this.e.d(objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return this.e.listIterator(0);
    }

    @Override // defpackage.gyf, defpackage.cxf
    public final uxf m() {
        return this.e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.d.f;
    }
}
