package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nv extends b76 {
    public xrd p;
    public l78 q;
    public ov r;
    public long s;

    @Override // defpackage.q28
    public final void C0() {
        this.s = -9223372034707292160L;
    }

    @Override // defpackage.b76, defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        long j2;
        t99 t99VarS = tk7Var.s(j);
        if (bl7Var.W()) {
            j2 = (((long) t99VarS.a) << 32) | (((long) t99VarS.b) & 4294967295L);
        } else {
            xrd xrdVar = this.p;
            int i = t99VarS.a;
            if (xrdVar == null) {
                long j3 = (((long) i) << 32) | (((long) t99VarS.b) & 4294967295L);
                this.s = j3;
                j2 = j3;
            } else {
                long j4 = (((long) t99VarS.b) & 4294967295L) | (((long) i) << 32);
                wrd wrdVarA = xrdVar.a(new mv(this, j4, 0), new mv(this, j4, 1));
                this.r.getClass();
                j2 = ((s46) wrdVarA.getValue()).a;
                this.s = ((s46) wrdVarA.getValue()).a;
            }
        }
        return bl7Var.q0((int) (j2 >> 32), (int) (4294967295L & j2), fy3.a, new lv(this, t99VarS, j2));
    }
}
