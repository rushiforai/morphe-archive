package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wyf extends uxf {
    public final transient Object[] c;
    public final transient int d;
    public final transient int e;

    public wyf(int i, int i2, Object[] objArr) {
        this.c = objArr;
        this.d = i;
        this.e = i2;
    }

    @Override // java.util.List
    public final Object get(int i) {
        iq7.b0(i, this.e);
        Object obj = this.c[i + i + this.d];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // defpackage.cxf
    public final boolean p() {
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.e;
    }
}
