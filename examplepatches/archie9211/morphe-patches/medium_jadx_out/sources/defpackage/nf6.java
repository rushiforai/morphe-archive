package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nf6 implements u93 {
    public final te6 a;
    public final te6 b;
    public final h1b c;

    public nf6(h1b h1bVar, e6a e6aVar, lf6 lf6Var, boolean z, t93 t93Var) {
        h1bVar.getClass();
        e6aVar.getClass();
        lf6Var.getClass();
        t93Var.getClass();
        te6 te6Var = new te6(te6.e(e0b.a(h1bVar.a)));
        ym6 ym6Var = h1bVar.b;
        te6 te6VarC = null;
        String str = ((xm6) ym6Var.d) != xm6.MULTIFILE_CLASS_PART ? null : ym6Var.b;
        if (str != null && str.length() > 0) {
            te6VarC = te6.c(str);
        }
        this.a = te6Var;
        this.b = te6VarC;
        this.c = h1bVar;
        o75 o75Var = gg6.m;
        o75Var.getClass();
        Integer num = (Integer) il7.z(e6aVar, o75Var);
        if (num != null) {
            lf6Var.getString(num.intValue());
        }
    }

    @Override // defpackage.u93
    public final String A() {
        return ev6.z(new StringBuilder("Class '"), a().a().a.a, '\'');
    }

    public final mn1 a() {
        y05 y05Var;
        te6 te6Var = this.a;
        String str = te6Var.a;
        int iLastIndexOf = str.lastIndexOf("/");
        if (iLastIndexOf == -1) {
            y05Var = y05.c;
            if (y05Var == null) {
                te6.a(9);
                throw null;
            }
        } else {
            y05Var = new y05(str.substring(0, iLastIndexOf).replace('/', '.'));
        }
        String strD = te6Var.d();
        strD.getClass();
        return new mn1(y05Var, n98.e(muc.t0('/', strD, strD)));
    }

    public final String toString() {
        return nf6.class.getSimpleName() + ": " + this.a;
    }
}
