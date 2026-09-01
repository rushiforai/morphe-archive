package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dk3 extends q28 implements ssd, fp6 {
    public dk3 o;
    public dk3 p;
    public long q;

    @Override // defpackage.q28
    public final void A0() {
        this.p = null;
        this.o = null;
    }

    public final boolean I0() {
        dk3 dk3Var = this.o;
        if (dk3Var != null) {
            return dk3Var.I0();
        }
        dk3 dk3Var2 = this.p;
        if (dk3Var2 != null) {
            return dk3Var2.I0();
        }
        return false;
    }

    public final void J0() {
        dk3 dk3Var = this.p;
        if (dk3Var != null) {
            dk3Var.J0();
            return;
        }
        dk3 dk3Var2 = this.o;
        if (dk3Var2 != null) {
            dk3Var2.J0();
        }
    }

    public final void K0() {
        dk3 dk3Var = this.p;
        if (dk3Var != null) {
            dk3Var.K0();
        }
        dk3 dk3Var2 = this.o;
        if (dk3Var2 != null) {
            dk3Var2.K0();
        }
        this.o = null;
    }

    public final void L0(md5 md5Var) {
        ssd ssdVar;
        dk3 dk3Var;
        dk3 dk3Var2 = this.o;
        if (dk3Var2 == null || !kyd.L(dk3Var2, o7f.y(md5Var))) {
            if (this.a.n) {
                rya ryaVar = new rya();
                br7.C(this, new vt(ryaVar, this, md5Var, 2));
                ssdVar = (ssd) ryaVar.a;
            } else {
                ssdVar = null;
            }
            dk3Var = (dk3) ssdVar;
        } else {
            dk3Var = dk3Var2;
        }
        if (dk3Var != null && dk3Var2 == null) {
            dk3Var.J0();
            dk3Var.L0(md5Var);
            dk3 dk3Var3 = this.p;
            if (dk3Var3 != null) {
                dk3Var3.K0();
            }
        } else if (dk3Var == null && dk3Var2 != null) {
            dk3 dk3Var4 = this.p;
            if (dk3Var4 != null) {
                dk3Var4.J0();
                dk3Var4.L0(md5Var);
            }
            dk3Var2.K0();
        } else if (!g76.L(dk3Var, dk3Var2)) {
            if (dk3Var != null) {
                dk3Var.J0();
                dk3Var.L0(md5Var);
            }
            if (dk3Var2 != null) {
                dk3Var2.K0();
            }
        } else if (dk3Var != null) {
            dk3Var.L0(md5Var);
        } else {
            dk3 dk3Var5 = this.p;
            if (dk3Var5 != null) {
                dk3Var5.L0(md5Var);
            }
        }
        this.o = dk3Var;
    }

    public final void M0() {
        dk3 dk3Var = this.p;
        if (dk3Var != null) {
            dk3Var.M0();
            return;
        }
        dk3 dk3Var2 = this.o;
        if (dk3Var2 != null) {
            dk3Var2.M0();
        }
    }

    @Override // defpackage.ssd
    public final Object m() {
        return zi5.c;
    }

    @Override // defpackage.fl7
    public final void p(long j) {
        this.q = j;
    }

    @Override // defpackage.fp6
    public final void l(hp6 hp6Var) {
    }
}
