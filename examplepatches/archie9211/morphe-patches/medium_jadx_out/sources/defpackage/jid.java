package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jid implements rhd {
    public bkd b;
    public final /* synthetic */ lid d;
    public boolean a = true;
    public ywb c = u3b.i;

    public jid(lid lidVar) {
        this.d = lidVar;
    }

    @Override // defpackage.rhd
    public final void a() {
        f();
    }

    @Override // defpackage.rhd
    public final void b(long j, ywb ywbVar) {
        long j2;
        rjd rjdVarD;
        rjd rjdVarD2;
        lid lidVar = this.d;
        if (lidVar.i() && ((ai5) lidVar.q.getValue()) == null) {
            lidVar.q(ai5.SelectionEnd);
            lidVar.s = -1;
            this.a = true;
            this.c = ywbVar;
            lidVar.m();
            kx6 kx6Var = lidVar.d;
            if (kx6Var == null || (rjdVarD2 = kx6Var.d()) == null || !rjdVarD2.c(j)) {
                j2 = j;
                kx6 kx6Var2 = lidVar.d;
                if (kx6Var2 != null && (rjdVarD = kx6Var2.d()) != null) {
                    int iB = rjdVarD.b(j2, true);
                    lidVar.b.c(iB);
                    uid uidVarB = lid.b(lidVar.l().a, lk7.q(iB, iB));
                    lidVar.e(false);
                    li5 li5Var = lidVar.j;
                    if (li5Var != null) {
                        ((ha9) li5Var).a(0);
                    }
                    lidVar.c.invoke(uidVarB);
                    lidVar.v = new bkd(uidVarB.b);
                }
                this.a = false;
            } else {
                if (lidVar.l().a.b.length() == 0) {
                    return;
                }
                lidVar.e(false);
                long jV = lidVar.v(uid.a(lidVar.l(), null, bkd.b, 5), j, true, false, this.c, true, new mi5(0));
                j2 = j;
                lidVar.o = new bkd(jV);
                this.b = new bkd(jV);
            }
            lidVar.r(ci5.None);
            lidVar.n = j2;
            lidVar.p(new ip8(j2));
            lidVar.p = 0L;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0092  */
    @Override // defpackage.rhd
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(long r10) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jid.e(long):void");
    }

    public final void f() {
        lid lidVar = this.d;
        lidVar.q(null);
        lidVar.p(null);
        this.c = u3b.i;
        lidVar.u(true);
        bkd bkdVar = this.b;
        boolean zC = bkd.c(bkdVar != null ? bkdVar.a : lidVar.l().b);
        lidVar.r(zC ? ci5.Cursor : ci5.Selection);
        kx6 kx6Var = lidVar.d;
        if (kx6Var != null) {
            kx6Var.m.setValue(Boolean.valueOf(!zC && gr7.t(lidVar, true)));
        }
        kx6 kx6Var2 = lidVar.d;
        if (kx6Var2 != null) {
            kx6Var2.n.setValue(Boolean.valueOf(!zC && gr7.t(lidVar, false)));
        }
        kx6 kx6Var3 = lidVar.d;
        if (kx6Var3 != null) {
            kx6Var3.o.setValue(Boolean.valueOf(zC && gr7.t(lidVar, true)));
        }
        if (this.a) {
            lidVar.n(lidVar.o);
        }
        lidVar.o = null;
    }

    @Override // defpackage.rhd
    public final void onCancel() {
        f();
    }

    @Override // defpackage.rhd
    public final void c() {
    }

    @Override // defpackage.rhd
    public final void d() {
    }
}
