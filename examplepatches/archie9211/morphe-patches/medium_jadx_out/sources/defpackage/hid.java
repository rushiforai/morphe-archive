package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hid implements rhd {
    public final /* synthetic */ lid a;

    public hid(lid lidVar) {
        this.a = lidVar;
    }

    @Override // defpackage.rhd
    public final void a() {
        lid lidVar = this.a;
        lidVar.q(null);
        lidVar.p(null);
    }

    @Override // defpackage.rhd
    public final void b(long j, ywb ywbVar) {
        rjd rjdVarD;
        lid lidVar = this.a;
        long jA = ixb.a(lidVar.j(true));
        kx6 kx6Var = lidVar.d;
        if (kx6Var == null || (rjdVarD = kx6Var.d()) == null) {
            return;
        }
        long jE = rjdVarD.e(jA);
        lidVar.n = jE;
        lidVar.p(new ip8(jE));
        lidVar.p = 0L;
        lidVar.q(ai5.Cursor);
        lidVar.u(false);
    }

    @Override // defpackage.rhd
    public final void c() {
        lid lidVar = this.a;
        lidVar.q(null);
        lidVar.p(null);
    }

    @Override // defpackage.rhd
    public final void e(long j) {
        rjd rjdVarD;
        li5 li5Var;
        lid lidVar = this.a;
        lidVar.p = ip8.e(lidVar.p, j);
        kx6 kx6Var = lidVar.d;
        if (kx6Var == null || (rjdVarD = kx6Var.d()) == null) {
            return;
        }
        lidVar.p(new ip8(ip8.e(lidVar.n, lidVar.p)));
        yqa yqaVar = lidVar.b;
        ip8 ip8VarG = lidVar.g();
        ip8VarG.getClass();
        int iB = rjdVarD.b(ip8VarG.a, true);
        yqaVar.c(iB);
        long jQ = lk7.q(iB, iB);
        if (bkd.b(jQ, lidVar.l().b)) {
            return;
        }
        kx6 kx6Var2 = lidVar.d;
        if ((kx6Var2 == null || ((Boolean) kx6Var2.q.getValue()).booleanValue()) && (li5Var = lidVar.j) != null) {
            ((ha9) li5Var).a(9);
        }
        lidVar.c.invoke(lid.b(lidVar.l().a, jQ));
        lidVar.v = new bkd(jQ);
    }

    @Override // defpackage.rhd
    public final void d() {
    }

    @Override // defpackage.rhd
    public final void onCancel() {
    }
}
