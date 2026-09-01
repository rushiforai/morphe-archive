package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class asf extends tpf {
    public static final asf i = new asf(0, new Object[0]);
    public final transient Object[] g;
    public final transient int h;

    public asf(int i2, Object[] objArr) {
        super(1);
        this.g = objArr;
        this.h = i2;
    }

    @Override // java.util.List
    public final Object get(int i2) {
        ek7.S(i2, this.h);
        Object obj = this.g[i2];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // defpackage.ogf
    public final Object[] s() {
        return this.g;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.h;
    }

    @Override // defpackage.ogf
    public final int t() {
        return 0;
    }

    @Override // defpackage.ogf
    public final int u() {
        return this.h;
    }

    @Override // defpackage.tpf, defpackage.ogf
    public final int x(Object[] objArr) {
        Object[] objArr2 = this.g;
        int i2 = this.h;
        System.arraycopy(objArr2, 0, objArr, 0, i2);
        return i2;
    }
}
