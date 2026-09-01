package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ivf extends upf {
    public static final ivf i = new ivf(0, new Object[0]);
    public final transient Object[] g;
    public final transient int h;

    public ivf(int i2, Object[] objArr) {
        super(2);
        this.g = objArr;
        this.h = i2;
    }

    @Override // java.util.List
    public final Object get(int i2) {
        ok7.L(i2, this.h);
        Object obj = this.g[i2];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // defpackage.ogf
    public final int p() {
        return this.h;
    }

    @Override // defpackage.upf, defpackage.ogf
    public final int q(Object[] objArr) {
        Object[] objArr2 = this.g;
        int i2 = this.h;
        System.arraycopy(objArr2, 0, objArr, 0, i2);
        return i2;
    }

    @Override // defpackage.ogf
    public final int r() {
        return 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.h;
    }

    @Override // defpackage.ogf
    public final Object[] w() {
        return this.g;
    }
}
