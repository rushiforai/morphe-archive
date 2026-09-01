package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class g80 extends f52 {
    public final x45 b;

    public g80(List list, x45 x45Var) {
        super(list);
        this.b = x45Var;
    }

    @Override // defpackage.f52
    public final mn6 a(b38 b38Var) {
        co1 co1VarA;
        b38Var.getClass();
        mn6 mn6Var = (mn6) this.b.invoke(b38Var);
        if (!vm6.y(mn6Var) && (((co1VarA = mn6Var.j0().a()) == null || vm6.r(co1VarA) == null) && !vm6.B(mn6Var, lnc.W.a) && !vm6.B(mn6Var, lnc.X.a) && !vm6.B(mn6Var, lnc.Y.a))) {
            vm6.B(mn6Var, lnc.Z.a);
        }
        return mn6Var;
    }
}
