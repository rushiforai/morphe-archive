package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hfc extends b76 {
    public wlc p;
    public long q;
    public long r;
    public boolean s;
    public final k49 t;

    public hfc(wlc wlcVar) {
        super(1);
        this.p = wlcVar;
        this.q = -9223372034707292160L;
        this.r = h72.b(0, 0, 0, 0, 15);
        this.t = qo7.u(null);
    }

    @Override // defpackage.q28
    public final void C0() {
        this.t.setValue(null);
    }

    @Override // defpackage.b76, defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS;
        char c;
        long j2;
        ffc ffcVar;
        long jD;
        ffc ffcVar2;
        if (bl7Var.W()) {
            this.r = j;
            this.s = true;
            t99VarS = tk7Var.s(j);
        } else {
            t99VarS = tk7Var.s(this.s ? this.r : j);
        }
        t99 t99Var = t99VarS;
        long j3 = (((long) t99Var.b) & 4294967295L) | (((long) t99Var.a) << 32);
        if (bl7Var.W()) {
            this.q = j3;
            c = ' ';
            jD = j3;
            j2 = jD;
        } else {
            long j4 = !s46.a(this.q, -9223372034707292160L) ? this.q : j3;
            k49 k49Var = this.t;
            ffc ffcVar3 = (ffc) k49Var.getValue();
            if (ffcVar3 != null) {
                ou ouVar = ffcVar3.a;
                c = ' ';
                j2 = j3;
                boolean z = (s46.a(j4, ((s46) ouVar.d()).a) || ouVar.e()) ? false : true;
                if (!s46.a(j4, ((s46) ouVar.e.getValue()).a) || z) {
                    ffcVar3.b = ((s46) ouVar.d()).a;
                    ffcVar2 = ffcVar3;
                    vx0.c0(u0(), null, null, new ql3(ffcVar2, j4, this, (n92) null), 3);
                } else {
                    ffcVar2 = ffcVar3;
                }
                ffcVar = ffcVar2;
            } else {
                long j5 = j4;
                c = ' ';
                j2 = j3;
                ffcVar = new ffc(new ou(new s46(j5), d46.p, new s46(4294967297L), 8), j5);
            }
            k49Var.setValue(ffcVar);
            jD = h72.d(j, ((s46) ffcVar.a.d()).a);
        }
        int i = (int) (jD >> c);
        int i2 = (int) (jD & 4294967295L);
        return bl7Var.q0(i, i2, fy3.a, new gfc(this, j2, i, i2, bl7Var, t99Var));
    }

    @Override // defpackage.q28
    public final void y0() {
        this.q = -9223372034707292160L;
        this.s = false;
    }
}
