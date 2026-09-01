package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fw1 implements s44 {
    public final s44 a;
    public final q44 b;

    public fw1(s44 s44Var, q44 q44Var) {
        s44Var.getClass();
        this.a = s44Var;
        this.b = q44Var;
    }

    @Override // defpackage.s44
    public final s44 a(r44 r44Var) {
        r44Var.getClass();
        q44 q44Var = this.b;
        q44 q44VarD = q44Var.d(r44Var);
        s44 s44Var = this.a;
        if (q44VarD != null) {
            return s44Var;
        }
        s44 s44VarA = s44Var.a(r44Var);
        return s44VarA == s44Var ? this : s44VarA == by3.a ? q44Var : new fw1(s44VarA, q44Var);
    }

    @Override // defpackage.s44
    public final Object b(Object obj, p44 p44Var) {
        return p44Var.invoke(this.a.b(obj, p44Var), this.b);
    }

    @Override // defpackage.s44
    public final /* synthetic */ s44 c(s44 s44Var) {
        return ho2.c(this, s44Var);
    }

    @Override // defpackage.s44
    public final q44 d(r44 r44Var) {
        r44Var.getClass();
        while (true) {
            q44 q44VarD = this.b.d(r44Var);
            if (q44VarD != null) {
                return q44VarD;
            }
            s44 s44Var = this.a;
            if (!(s44Var instanceof fw1)) {
                return s44Var.d(r44Var);
            }
            this = (fw1) s44Var;
        }
    }
}
