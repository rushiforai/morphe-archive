package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q06 extends exd {
    public final swd[] b;
    public final xwd[] c;
    public final boolean d;

    public q06(swd[] swdVarArr, xwd[] xwdVarArr, boolean z) {
        swdVarArr.getClass();
        xwdVarArr.getClass();
        this.b = swdVarArr;
        this.c = xwdVarArr;
        this.d = z;
    }

    @Override // defpackage.exd
    public final boolean b() {
        return this.d;
    }

    @Override // defpackage.exd
    public final xwd d(mn6 mn6Var) {
        co1 co1VarA = mn6Var.j0().a();
        swd swdVar = co1VarA instanceof swd ? (swd) co1VarA : null;
        if (swdVar != null) {
            int index = swdVar.getIndex();
            swd[] swdVarArr = this.b;
            if (index < swdVarArr.length && g76.L(swdVarArr[index].n(), swdVar.n())) {
                return this.c[index];
            }
        }
        return null;
    }

    @Override // defpackage.exd
    public final boolean e() {
        return this.c.length == 0;
    }
}
