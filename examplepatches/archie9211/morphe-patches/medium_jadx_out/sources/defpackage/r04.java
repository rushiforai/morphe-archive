package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r04 extends f52 {
    public final mn1 b;
    public final n98 c;

    public r04(mn1 mn1Var, n98 n98Var) {
        super(new f09(mn1Var, n98Var));
        this.b = mn1Var;
        this.c = n98Var;
    }

    @Override // defpackage.f52
    public final mn6 a(b38 b38Var) {
        hec hecVarT;
        b38Var.getClass();
        mn1 mn1Var = this.b;
        y28 y28VarF = d46.F(b38Var, mn1Var);
        if (y28VarF != null) {
            int i = d93.a;
            if (!d93.m(y28VarF, qn1.ENUM_CLASS)) {
                y28VarF = null;
            }
            if (y28VarF != null && (hecVarT = y28VarF.T()) != null) {
                return hecVarT;
            }
        }
        k24 k24Var = k24.ERROR_ENUM_TYPE;
        String string = mn1Var.toString();
        String str = this.c.a;
        str.getClass();
        return l24.c(k24Var, string, str);
    }

    @Override // defpackage.f52
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.b.f());
        sb.append('.');
        sb.append(this.c);
        return sb.toString();
    }
}
