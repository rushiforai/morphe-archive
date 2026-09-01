package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o61 extends exd {
    public final /* synthetic */ int b;
    public final exd c;

    public /* synthetic */ o61(exd exdVar, int i) {
        this.b = i;
        this.c = exdVar;
    }

    @Override // defpackage.exd
    public boolean a() {
        switch (this.b) {
            case 0:
                return this.c.a();
            default:
                return super.a();
        }
    }

    @Override // defpackage.exd
    public boolean b() {
        switch (this.b) {
            case 0:
                return true;
            default:
                return super.b();
        }
    }

    @Override // defpackage.exd
    public final ly c(ly lyVar) {
        int i = this.b;
        exd exdVar = this.c;
        lyVar.getClass();
        switch (i) {
        }
        return exdVar.c(lyVar);
    }

    @Override // defpackage.exd
    public final xwd d(mn6 mn6Var) {
        int i = this.b;
        exd exdVar = this.c;
        switch (i) {
            case 0:
                xwd xwdVarD = exdVar.d(mn6Var);
                if (xwdVarD == null) {
                    return null;
                }
                co1 co1VarA = mn6Var.j0().a();
                return kng.l(xwdVarD, co1VarA instanceof swd ? (swd) co1VarA : null);
            default:
                return exdVar.d(mn6Var);
        }
    }

    @Override // defpackage.exd
    public final boolean e() {
        int i = this.b;
        exd exdVar = this.c;
        switch (i) {
        }
        return exdVar.e();
    }

    @Override // defpackage.exd
    public final mn6 f(mn6 mn6Var, pqe pqeVar) {
        int i = this.b;
        exd exdVar = this.c;
        mn6Var.getClass();
        pqeVar.getClass();
        switch (i) {
        }
        return exdVar.f(mn6Var, pqeVar);
    }
}
