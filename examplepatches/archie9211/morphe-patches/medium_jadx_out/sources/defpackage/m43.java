package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class m43 extends l43 {
    public final hec b;

    public m43(hec hecVar) {
        this.b = hecVar;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        return z == k0() ? this : this.b.n0(z).p0(i0());
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return uvdVar != i0() ? new kec(this, uvdVar) : this;
    }

    @Override // defpackage.l43
    public final hec s0() {
        return this.b;
    }
}
