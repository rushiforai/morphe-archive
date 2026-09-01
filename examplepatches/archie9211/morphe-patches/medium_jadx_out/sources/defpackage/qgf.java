package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qgf extends rgf {
    public final transient int g;
    public final transient int h;
    public final /* synthetic */ rgf i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qgf(rgf rgfVar, int i, int i2) {
        super(0);
        this.i = rgfVar;
        this.g = i;
        this.h = i2;
    }

    @Override // defpackage.ogf
    public final int e() {
        return this.i.f() + this.g + this.h;
    }

    @Override // defpackage.ogf
    public final int f() {
        return this.i.f() + this.g;
    }

    @Override // java.util.List
    public final Object get(int i) {
        br7.l(i, this.h);
        return this.i.get(i + this.g);
    }

    @Override // defpackage.ogf
    public final Object[] m() {
        return this.i.m();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.h;
    }

    @Override // defpackage.rgf, java.util.List
    /* JADX INFO: renamed from: y */
    public final rgf subList(int i, int i2) {
        br7.m(i, i2, this.h);
        int i3 = this.g;
        return this.i.subList(i + i3, i2 + i3);
    }
}
