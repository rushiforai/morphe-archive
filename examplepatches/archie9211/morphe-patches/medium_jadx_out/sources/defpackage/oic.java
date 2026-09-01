package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class oic {
    public sic a;
    public long b;
    public boolean c;
    public int d;

    public oic(long j, sic sicVar) {
        int iA;
        int iNumberOfTrailingZeros;
        this.a = sicVar;
        this.b = j;
        dsb dsbVar = uic.a;
        if (j != 0) {
            sic sicVarD = d();
            long j2 = sicVarD.c;
            long[] jArr = sicVarD.d;
            if (jArr != null) {
                j = jArr[0];
            } else {
                long j3 = sicVarD.b;
                if (j3 != 0) {
                    iNumberOfTrailingZeros = Long.numberOfTrailingZeros(j3);
                } else {
                    long j4 = sicVarD.a;
                    if (j4 != 0) {
                        j2 += 64;
                        iNumberOfTrailingZeros = Long.numberOfTrailingZeros(j4);
                    }
                }
                j = ((long) iNumberOfTrailingZeros) + j2;
            }
            synchronized (uic.c) {
                iA = uic.f.a(j);
            }
        } else {
            iA = -1;
        }
        this.d = iA;
    }

    public static void q(oic oicVar) {
        uic.b.E(oicVar);
    }

    public final void a() {
        synchronized (uic.c) {
            b();
            p();
        }
    }

    public void b() {
        uic.d = uic.d.f(g());
    }

    public abstract void c();

    public sic d() {
        return this.a;
    }

    public abstract x45 e();

    public abstract boolean f();

    public long g() {
        return this.b;
    }

    public int h() {
        return 0;
    }

    public abstract x45 i();

    public final oic j() {
        vwa vwaVar = uic.b;
        oic oicVar = (oic) vwaVar.m();
        vwaVar.E(this);
        return oicVar;
    }

    public abstract void k();

    public abstract void l();

    public abstract void m();

    public abstract void n(dqc dqcVar);

    public final void o() {
        int i = this.d;
        if (i >= 0) {
            uic.u(i);
            this.d = -1;
        }
    }

    public void p() {
        o();
    }

    public void r(sic sicVar) {
        this.a = sicVar;
    }

    public void s(long j) {
        this.b = j;
    }

    public void t(int i) {
        throw new IllegalStateException("Updating write count is not supported for this snapshot");
    }

    public abstract oic u(x45 x45Var);
}
