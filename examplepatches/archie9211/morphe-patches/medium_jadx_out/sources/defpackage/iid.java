package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iid implements rhd {
    public final /* synthetic */ lid a;
    public final /* synthetic */ boolean b;

    public iid(lid lidVar, boolean z) {
        this.a = lidVar;
        this.b = z;
    }

    @Override // defpackage.rhd
    public final void a() {
        lid lidVar = this.a;
        lidVar.q(null);
        lidVar.p(null);
        lidVar.u(true);
    }

    @Override // defpackage.rhd
    public final void c() {
        lid lidVar = this.a;
        lidVar.q(null);
        lidVar.p(null);
        lidVar.u(true);
    }

    @Override // defpackage.rhd
    public final void d() {
        rjd rjdVarD;
        boolean z = this.b;
        ai5 ai5Var = z ? ai5.SelectionStart : ai5.SelectionEnd;
        lid lidVar = this.a;
        lidVar.q(ai5Var);
        long jA = ixb.a(lidVar.j(z));
        kx6 kx6Var = lidVar.d;
        if (kx6Var == null || (rjdVarD = kx6Var.d()) == null) {
            return;
        }
        long jE = rjdVarD.e(jA);
        lidVar.n = jE;
        lidVar.p(new ip8(jE));
        lidVar.p = 0L;
        lidVar.s = -1;
        kx6 kx6Var2 = lidVar.d;
        if (kx6Var2 != null) {
            kx6Var2.q.setValue(Boolean.TRUE);
        }
        lidVar.u(false);
    }

    @Override // defpackage.rhd
    public final void e(long j) {
        lid lidVar = this.a;
        long jE = ip8.e(lidVar.p, j);
        lidVar.p = jE;
        lidVar.p(new ip8(ip8.e(lidVar.n, jE)));
        uid uidVarL = lidVar.l();
        ip8 ip8VarG = lidVar.g();
        ip8VarG.getClass();
        lidVar.v(uidVarL, ip8VarG.a, false, this.b, u3b.l, true, new mi5(9));
        lidVar.u(false);
    }

    @Override // defpackage.rhd
    public final void onCancel() {
    }

    @Override // defpackage.rhd
    public final void b(long j, ywb ywbVar) {
    }
}
