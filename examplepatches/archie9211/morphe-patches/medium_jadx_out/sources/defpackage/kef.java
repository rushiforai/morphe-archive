package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class kef implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ kef(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        String str = this.b;
        switch (i) {
            case 0:
                ev4 ev4Var = (ev4) obj;
                if (ev4Var instanceof aw4) {
                    return ev4Var;
                }
                if (ev4Var instanceof jw4) {
                    jw4 jw4Var = (jw4) ev4Var;
                    return g76.L(jw4Var.a, str) ? jw4.a(jw4Var, false, 15) : jw4Var;
                }
                ygf.a();
                return null;
            case 1:
                dp2 dp2Var = (dp2) obj;
                dp2Var.getClass();
                eo2 eo2Var = dp2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                fr9 fr9VarR = ys2Var.r();
                tl tlVarP = ys2Var.p();
                ko2 ko2Var = eo2Var.b;
                ty2 ty2VarQ = ko2Var.q();
                dl2 dl2Var = new dl2(ys2Var.N());
                ax2 ax2VarT = ko2Var.t();
                ax2 ax2Var = new ax2(ko2Var.x(), 16);
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new sff(this.b, fr9VarR, tlVarP, ty2VarQ, dl2Var, ax2VarT, ax2Var, r13Var);
            default:
                return Boolean.valueOf(((dr9) obj).a.equals(str));
        }
    }
}
