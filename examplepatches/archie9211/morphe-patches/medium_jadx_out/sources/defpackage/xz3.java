package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xz3 extends b76 {
    public final wz3 A;
    public dsd p;
    public xrd q;
    public xrd r;
    public xrd s;
    public zz3 t;
    public k54 u;
    public m45 v;
    public lz3 w;
    public long x;
    public xd y;
    public final wz3 z;

    public xz3(dsd dsdVar, xrd xrdVar, xrd xrdVar2, xrd xrdVar3, zz3 zz3Var, k54 k54Var, m45 m45Var, lz3 lz3Var) {
        super(1);
        this.p = dsdVar;
        this.q = xrdVar;
        this.r = xrdVar2;
        this.s = xrdVar3;
        this.t = zz3Var;
        this.u = k54Var;
        this.v = m45Var;
        this.w = lz3Var;
        this.x = -9223372034707292160L;
        h72.b(0, 0, 0, 0, 15);
        this.z = new wz3(this, 0);
        this.A = new wz3(this, 1);
    }

    public final xd K0() {
        xd xdVar;
        xd xdVar2;
        if (this.p.f().b(jz3.PreEnter, jz3.Visible)) {
            uj1 uj1Var = this.t.a.c;
            if (uj1Var != null && (xdVar2 = uj1Var.a) != null) {
                return xdVar2;
            }
            uj1 uj1Var2 = this.u.a.c;
            if (uj1Var2 != null) {
                return uj1Var2.a;
            }
            return null;
        }
        uj1 uj1Var3 = this.u.a.c;
        if (uj1Var3 != null && (xdVar = uj1Var3.a) != null) {
            return xdVar;
        }
        uj1 uj1Var4 = this.t.a.c;
        if (uj1Var4 != null) {
            return uj1Var4.a;
        }
        return null;
    }

    @Override // defpackage.b76, defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        char c;
        wrd wrdVarA;
        if (this.p.a.o0() == this.p.d.getValue()) {
            this.y = null;
        } else if (this.y == null) {
            xd xdVarK0 = K0();
            if (xdVarK0 == null) {
                xdVarK0 = z46.d;
            }
            this.y = xdVarK0;
        }
        boolean zW = bl7Var.W();
        fy3 fy3Var = fy3.a;
        if (zW) {
            t99 t99VarS = tk7Var.s(j);
            long j2 = (((long) t99VarS.a) << 32) | (((long) t99VarS.b) & 4294967295L);
            this.x = j2;
            return bl7Var.q0((int) (j2 >> 32), (int) (4294967295L & j2), fy3Var, new xm(t99VarS, 3));
        }
        if (!((Boolean) this.v.invoke()).booleanValue()) {
            t99 t99VarS2 = tk7Var.s(j);
            return bl7Var.q0(t99VarS2.a, t99VarS2.b, fy3Var, new xm(t99VarS2, 4));
        }
        lz3 lz3Var = this.w;
        xrd xrdVar = lz3Var.a;
        xrd xrdVar2 = lz3Var.b;
        dsd dsdVar = lz3Var.c;
        zz3 zz3Var = lz3Var.d;
        k54 k54Var = lz3Var.e;
        xrd xrdVar3 = lz3Var.f;
        if (xrdVar != null) {
            c = ' ';
            wrdVarA = xrdVar.a(new mz3(zz3Var, k54Var, 0), new mz3(zz3Var, k54Var, 1));
        } else {
            c = ' ';
            wrdVarA = null;
        }
        wrd wrdVarA2 = xrdVar2 != null ? xrdVar2.a(new mz3(zz3Var, k54Var, 2), new mz3(zz3Var, k54Var, 3)) : null;
        if (dsdVar.a.o0() == jz3.PreEnter) {
            esd esdVar = k54Var.a;
        } else {
            esd esdVar2 = k54Var.a;
        }
        vt vtVar = new vt(wrdVarA, wrdVarA2, xrdVar3 != null ? xrdVar3.a(zu2.h, new vt(null, zz3Var, k54Var, 4)) : null, 3);
        t99 t99VarS3 = tk7Var.s(j);
        long j3 = (((long) t99VarS3.b) & 4294967295L) | (((long) t99VarS3.a) << c);
        long j4 = !s46.a(this.x, -9223372034707292160L) ? this.x : j3;
        xrd xrdVar4 = this.q;
        wrd wrdVarA3 = xrdVar4 != null ? xrdVar4.a(this.z, new vz3(this, j4, 0)) : null;
        if (wrdVarA3 != null) {
            j3 = ((s46) wrdVarA3.getValue()).a;
        }
        long jD = h72.d(j, j3);
        xrd xrdVar5 = this.r;
        long j5 = xrdVar5 != null ? ((k46) xrdVar5.a(zu2.k, new vz3(this, j4, 1)).getValue()).a : 0L;
        xrd xrdVar6 = this.s;
        long j6 = xrdVar6 != null ? ((k46) xrdVar6.a(this.A, new vz3(this, j4, 2)).getValue()).a : 0L;
        xd xdVar = this.y;
        return bl7Var.q0((int) (jD >> c), (int) (jD & 4294967295L), fy3Var, new uz3(t99VarS3, k46.d(xdVar != null ? xdVar.a(j4, jD, ip6.Ltr) : 0L, j6), j5, vtVar));
    }

    @Override // defpackage.q28
    public final void y0() {
        this.x = -9223372034707292160L;
    }
}
