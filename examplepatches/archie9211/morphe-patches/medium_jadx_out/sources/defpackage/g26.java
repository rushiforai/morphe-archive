package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class g26 {
    public static final /* synthetic */ int a = 0;

    static {
        y05 y05Var = new y05("kotlin.jvm.JvmInline");
        y05Var.b();
        n98 n98VarG = y05Var.a.g();
        y05 y05Var2 = y05.c;
        sgg.b0(n98VarG).a.c();
        new y05("kotlin.jvm.JvmName");
    }

    public static final boolean a(f41 f41Var) {
        cqe cqeVarP0;
        if (!(f41Var instanceof s4a)) {
            return false;
        }
        q4a q4aVar = ((s4a) f41Var).i;
        if (q4aVar.P() != null) {
            return false;
        }
        yv2 yv2VarH = q4aVar.h();
        y28 y28Var = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
        if (y28Var == null || (cqeVarP0 = y28Var.p0()) == null) {
            return false;
        }
        n98 name = q4aVar.getName();
        name.getClass();
        return cqeVarP0.a(name);
    }

    public static final boolean b(yv2 yv2Var) {
        yv2Var.getClass();
        return (yv2Var instanceof y28) && (((y28) yv2Var).p0() instanceof f26);
    }

    public static final boolean c(yv2 yv2Var) {
        return (yv2Var instanceof y28) && (((y28) yv2Var).p0() instanceof z48);
    }

    public static final boolean d(nqe nqeVar) {
        if (nqeVar.P() != null) {
            return false;
        }
        yv2 yv2VarH = nqeVar.h();
        n98 n98Var = null;
        y28 y28Var = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
        if (y28Var != null) {
            int i = f93.a;
            cqe cqeVarP0 = y28Var.p0();
            f26 f26Var = cqeVarP0 instanceof f26 ? (f26) cqeVarP0 : null;
            if (f26Var != null) {
                n98Var = f26Var.a;
            }
        }
        return g76.L(n98Var, nqeVar.getName());
    }

    public static final boolean e(yv2 yv2Var) {
        return b(yv2Var) || c(yv2Var);
    }

    public static final boolean f(mn6 mn6Var) {
        mn6Var.getClass();
        co1 co1VarA = mn6Var.j0().a();
        return (co1VarA == null || !c(co1VarA) || nxd.e(mn6Var)) ? false : true;
    }

    public static final hec g(mn6 mn6Var) {
        co1 co1VarA = mn6Var.j0().a();
        y28 y28Var = co1VarA instanceof y28 ? (y28) co1VarA : null;
        if (y28Var != null) {
            int i = f93.a;
            cqe cqeVarP0 = y28Var.p0();
            f26 f26Var = cqeVarP0 instanceof f26 ? (f26) cqeVarP0 : null;
            if (f26Var != null) {
                return (hec) f26Var.b;
            }
        }
        return null;
    }
}
