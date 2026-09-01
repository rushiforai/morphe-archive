package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gxf extends uxf {
    public final transient int c;
    public final transient int d;
    public final /* synthetic */ uxf e;

    public gxf(uxf uxfVar, int i, int i2) {
        this.e = uxfVar;
        this.c = i;
        this.d = i2;
    }

    @Override // defpackage.cxf
    public final int e() {
        return this.e.f() + this.c + this.d;
    }

    @Override // defpackage.cxf
    public final int f() {
        return this.e.f() + this.c;
    }

    @Override // java.util.List
    public final Object get(int i) {
        iq7.b0(i, this.d);
        return this.e.get(i + this.c);
    }

    @Override // defpackage.cxf
    public final boolean p() {
        return true;
    }

    @Override // defpackage.cxf
    public final Object[] q() {
        return this.e.q();
    }

    @Override // defpackage.uxf, java.util.List
    /* JADX INFO: renamed from: r */
    public final uxf subList(int i, int i2) {
        iq7.d0(i, i2, this.d);
        int i3 = this.c;
        return this.e.subList(i + i3, i2 + i3);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.d;
    }
}
