package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sgf extends rgf {
    public static final sgf h = new sgf(new Object[0]);
    public final transient Object[] g;

    public sgf(Object[] objArr) {
        super(0);
        this.g = objArr;
    }

    @Override // defpackage.rgf, defpackage.ogf
    public final int d(Object[] objArr) {
        System.arraycopy(this.g, 0, objArr, 0, 0);
        return 0;
    }

    @Override // defpackage.ogf
    public final int e() {
        return 0;
    }

    @Override // defpackage.ogf
    public final int f() {
        return 0;
    }

    @Override // java.util.List
    public final Object get(int i) {
        br7.l(i, 0);
        Object obj = this.g[i];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // defpackage.ogf
    public final Object[] m() {
        return this.g;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return 0;
    }
}
