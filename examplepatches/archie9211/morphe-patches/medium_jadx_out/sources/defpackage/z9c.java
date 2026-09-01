package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class z9c implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ SusiDestination d;
    public final /* synthetic */ boolean e;

    public /* synthetic */ z9c(String str, String str2, SusiDestination susiDestination, boolean z, int i) {
        this.a = i;
        this.b = str;
        this.c = str2;
        this.d = susiDestination;
        this.e = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        switch (this.a) {
            case 0:
                ds2 ds2Var = (ds2) obj;
                ds2Var.getClass();
                eo2 eo2Var = ds2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                vob vobVar = ys2Var.a;
                a13 a13VarV = eo2Var.b.v();
                dzb dzbVarV = ys2Var.v();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new wac(r13Var, a13VarV, vobVar, dzbVarV, this.d, this.b, this.c, this.e);
            default:
                vs2 vs2Var = (vs2) obj;
                vs2Var.getClass();
                eo2 eo2Var2 = vs2Var.a;
                a13 a13VarV2 = eo2Var2.b.v();
                ys2 ys2Var2 = (ys2) eo2Var2.e;
                dzb dzbVarV2 = ys2Var2.v();
                vob vobVar2 = ys2Var2.a;
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new e2e(r13Var2, a13VarV2, vobVar2, dzbVarV2, this.d, this.b, this.c, this.e);
        }
    }
}
