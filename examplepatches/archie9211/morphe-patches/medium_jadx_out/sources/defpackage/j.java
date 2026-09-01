package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j extends l43 {
    public final hec b;
    public final hec c;

    public j(hec hecVar, hec hecVar2) {
        hecVar.getClass();
        hecVar2.getClass();
        this.b = hecVar;
        this.c = hecVar2;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return new j(this.b.p0(uvdVar), this.c);
    }

    @Override // defpackage.l43
    public final hec s0() {
        return this.b;
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        return new j(hecVar, this.c);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: v0, reason: merged with bridge method [inline-methods] */
    public final j n0(boolean z) {
        return new j(this.b.n0(z), this.c.n0(z));
    }

    @Override // defpackage.l43
    /* JADX INFO: renamed from: w0, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final j l0(sn6 sn6Var) {
        hec hecVar = this.b;
        hecVar.getClass();
        hec hecVar2 = this.c;
        hecVar2.getClass();
        return new j(hecVar, hecVar2);
    }
}
