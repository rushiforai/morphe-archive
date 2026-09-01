package defpackage;

import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class f93 {
    public static final /* synthetic */ int a = 0;

    static {
        n98.e("value");
    }

    public static final boolean a(lqe lqeVar) {
        Boolean boolL = vc2.L(d46.Q(lqeVar), hpe.d, e93.a);
        boolL.getClass();
        return boolL.booleanValue();
    }

    public static f41 b(f41 f41Var, x45 x45Var) {
        f41Var.getClass();
        return (f41) vc2.F(d46.Q(f41Var), new uob(15), new tm2(x45Var, new rya()));
    }

    public static final y05 c(yv2 yv2Var) {
        z05 z05VarG = d93.g(yv2Var);
        z05VarG.getClass();
        if (!z05VarG.d()) {
            z05VarG = null;
        }
        if (z05VarG != null) {
            return z05VarG.i();
        }
        return null;
    }

    public static final y28 d(yx yxVar) {
        yxVar.getClass();
        co1 co1VarA = yxVar.getType().j0().a();
        if (co1VarA instanceof y28) {
            return (y28) co1VarA;
        }
        return null;
    }

    public static final vm6 e(yv2 yv2Var) {
        yv2Var.getClass();
        b38 b38VarD = d93.d(yv2Var);
        b38VarD.getClass();
        return b38VarD.e();
    }

    public static final mn1 f(co1 co1Var) {
        yv2 yv2VarH;
        mn1 mn1VarF;
        if (co1Var == null || (yv2VarH = co1Var.h()) == null) {
            return null;
        }
        if (yv2VarH instanceof wx8) {
            y05 y05Var = ((xx8) ((wx8) yv2VarH)).f;
            n98 name = co1Var.getName();
            name.getClass();
            return new mn1(y05Var, name);
        }
        if (!(yv2VarH instanceof do1) || (mn1VarF = f((co1) yv2VarH)) == null) {
            return null;
        }
        n98 name2 = co1Var.getName();
        name2.getClass();
        return mn1VarF.d(name2);
    }

    public static final y05 g(yv2 yv2Var) {
        yv2Var.getClass();
        y05 y05VarH = d93.h(yv2Var);
        return y05VarH != null ? y05VarH : d93.g(yv2Var.h()).a(yv2Var.getName()).i();
    }

    public static final void h(b38 b38Var) {
        b38Var.getClass();
        if (b38Var.G(hlg.g) == null) {
            return;
        }
        rd6.m();
    }

    public static final f41 i(f41 f41Var) {
        f41Var.getClass();
        return f41Var instanceof o4a ? ((o4a) f41Var).i : f41Var;
    }

    public static final ym4 j(f41 f41Var) {
        mzb mzbVarB0 = k80.b0(new f41[]{f41Var});
        Collection collectionI = f41Var.i();
        collectionI.getClass();
        return szb.I0(k80.b0(new mzb[]{mzbVarB0, new ym4(new j80(1, collectionI), new zkc(23), uzb.a)}));
    }
}
