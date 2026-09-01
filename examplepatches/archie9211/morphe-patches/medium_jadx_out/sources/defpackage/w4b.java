package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w4b implements cy6 {
    public final /* synthetic */ ux6 a;
    public final /* synthetic */ rya b;
    public final /* synthetic */ sb2 c;
    public final /* synthetic */ ux6 d;
    public final /* synthetic */ x51 e;
    public final /* synthetic */ a98 f;
    public final /* synthetic */ b55 g;

    public w4b(ux6 ux6Var, rya ryaVar, sb2 sb2Var, ux6 ux6Var2, x51 x51Var, a98 a98Var, b55 b55Var) {
        this.a = ux6Var;
        this.b = ryaVar;
        this.c = sb2Var;
        this.d = ux6Var2;
        this.e = x51Var;
        this.f = a98Var;
        this.g = b55Var;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        ux6 ux6Var2 = this.a;
        rya ryaVar = this.b;
        if (ux6Var == ux6Var2) {
            ryaVar.a = vx0.c0(this.c, null, null, new rna(this.f, this.g, null), 3);
            return;
        }
        if (ux6Var == this.d) {
            va6 va6Var = (va6) ryaVar.a;
            if (va6Var != null) {
                va6Var.m(null);
            }
            ryaVar.a = null;
        }
        if (ux6Var == ux6.ON_DESTROY) {
            this.e.resumeWith(c1e.a);
        }
    }
}
