package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vf3 extends exd {
    public final exd b;
    public final exd c;

    public vf3(exd exdVar, exd exdVar2) {
        this.b = exdVar;
        this.c = exdVar2;
    }

    @Override // defpackage.exd
    public final boolean a() {
        return this.b.a() || this.c.a();
    }

    @Override // defpackage.exd
    public final boolean b() {
        return this.b.b() || this.c.b();
    }

    @Override // defpackage.exd
    public final ly c(ly lyVar) {
        lyVar.getClass();
        return this.c.c(this.b.c(lyVar));
    }

    @Override // defpackage.exd
    public final xwd d(mn6 mn6Var) {
        xwd xwdVarD = this.b.d(mn6Var);
        return xwdVarD == null ? this.c.d(mn6Var) : xwdVarD;
    }

    @Override // defpackage.exd
    public final mn6 f(mn6 mn6Var, pqe pqeVar) {
        mn6Var.getClass();
        pqeVar.getClass();
        return this.c.f(this.b.f(mn6Var, pqeVar), pqeVar);
    }
}
