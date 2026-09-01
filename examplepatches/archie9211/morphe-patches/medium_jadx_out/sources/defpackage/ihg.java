package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ihg extends vgg {
    public final transient khg d;
    public final transient jhg e;

    public ihg(khg khgVar, jhg jhgVar) {
        this.d = khgVar;
        this.e = jhgVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.d.get(obj) != null;
    }

    @Override // defpackage.agg
    public final ugf d() {
        return this.e.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return this.e.listIterator(0);
    }

    @Override // defpackage.agg
    public final boolean p() {
        return true;
    }

    @Override // defpackage.agg
    public final int q(Object[] objArr) {
        return this.e.q(objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.d.f;
    }
}
