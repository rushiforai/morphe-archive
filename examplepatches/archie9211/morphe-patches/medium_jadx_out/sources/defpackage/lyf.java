package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lyf extends uxf {
    public static final lyf e = new lyf(0, new Object[0]);
    public final transient Object[] c;
    public final transient int d;

    public lyf(int i, Object[] objArr) {
        this.c = objArr;
        this.d = i;
    }

    @Override // defpackage.uxf, defpackage.cxf
    public final int d(Object[] objArr) {
        Object[] objArr2 = this.c;
        int i = this.d;
        System.arraycopy(objArr2, 0, objArr, 0, i);
        return i;
    }

    @Override // defpackage.cxf
    public final int e() {
        return this.d;
    }

    @Override // defpackage.cxf
    public final int f() {
        return 0;
    }

    @Override // java.util.List
    public final Object get(int i) {
        iq7.b0(i, this.d);
        Object obj = this.c[i];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // defpackage.cxf
    public final boolean p() {
        return false;
    }

    @Override // defpackage.cxf
    public final Object[] q() {
        return this.c;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.d;
    }
}
