package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pa2 extends q28 implements xxb {
    public boolean o;
    public final boolean p;
    public x45 q;

    public pa2(boolean z, boolean z2, x45 x45Var) {
        this.o = z;
        this.p = z2;
        this.q = x45Var;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return this.p;
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        this.q.invoke(jybVar);
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return this.o;
    }
}
