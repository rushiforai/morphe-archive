package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wsd extends c0c {
    public final ac6 a;
    public final ch5 b;
    public final kxd c;
    public final kud d;
    public final qlb e = new qlb(this);
    public final boolean f;
    public volatile jud g;

    public wsd(ac6 ac6Var, ch5 ch5Var, kxd kxdVar, kud kudVar, boolean z) {
        this.a = ac6Var;
        this.b = ch5Var;
        this.c = kxdVar;
        this.d = kudVar;
        this.f = z;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        ac6 ac6Var = this.a;
        if (ac6Var == null) {
            jud judVarF = this.g;
            if (judVarF == null) {
                judVarF = this.b.f(this.d, this.c);
                this.g = judVarF;
            }
            return judVarF.b(gd6Var);
        }
        dc6 dc6VarK = vn7.K(gd6Var);
        if (this.f) {
            dc6VarK.getClass();
            if (dc6VarK instanceof pc6) {
                return null;
            }
        }
        return ac6Var.a(dc6VarK, this.c.d(), this.e);
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) {
        jud judVarF = this.g;
        if (judVarF == null) {
            judVarF = this.b.f(this.d, this.c);
            this.g = judVarF;
        }
        judVarF.c(yd6Var, obj);
    }

    @Override // defpackage.c0c
    public final jud d() {
        jud judVar = this.g;
        if (judVar != null) {
            return judVar;
        }
        jud judVarF = this.b.f(this.d, this.c);
        this.g = judVarF;
        return judVarF;
    }
}
