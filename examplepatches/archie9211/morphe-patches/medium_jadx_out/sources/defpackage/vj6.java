package defpackage;

import java.lang.reflect.Array;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vj6 implements qj6 {
    public static final /* synthetic */ fj6[] f;
    public final mn6 a;
    public final boolean b;
    public final k1b c;
    public final k1b d;
    public final k1b e;

    static {
        u4a u4aVar = new u4a(vj6.class, "classifier", "getClassifier()Lkotlin/reflect/KClassifier;", 0);
        s1b s1bVar = n1b.a;
        f = new fj6[]{s1bVar.g(u4aVar), km4.t(vj6.class, "arguments", "getArguments()Ljava/util/List;", 0, s1bVar)};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public vj6(mn6 mn6Var, m45 m45Var, boolean z) {
        mn6Var.getClass();
        this.a = mn6Var;
        this.b = z;
        k1b k1bVar = m45Var instanceof k1b ? (k1b) m45Var : null;
        this.c = k1bVar == null ? m45Var != null ? no7.y(null, m45Var) : null : k1bVar;
        this.d = no7.y(null, new sj6(this, 0));
        this.e = no7.y(null, new a3(this, m45Var, 0 == true ? 1 : 0, 16));
    }

    public final ih6 a(mn6 mn6Var) {
        mn6 mn6VarB;
        if (this.b) {
            co1 co1VarA = mn6Var.j0().a();
            di8 di8Var = co1VarA instanceof di8 ? (di8) co1VarA : null;
            if (di8Var != null) {
                return new rj6(f93.g(di8Var));
            }
        }
        co1 co1VarA2 = mn6Var.j0().a();
        if (co1VarA2 instanceof y28) {
            Class clsJ = bpe.j((y28) co1VarA2);
            if (clsJ != null) {
                if (!vm6.y(mn6Var)) {
                    if (nxd.e(mn6Var)) {
                        return new dh6(clsJ);
                    }
                    Class cls = (Class) e0b.b.get(clsJ);
                    if (cls != null) {
                        clsJ = cls;
                    }
                    return new dh6(clsJ);
                }
                xwd xwdVar = (xwd) bu1.c1(mn6Var.h0());
                if (xwdVar == null || (mn6VarB = xwdVar.b()) == null) {
                    return new dh6(clsJ);
                }
                ih6 ih6VarA = a(nxd.h(mn6VarB, true));
                if (ih6VarA != null) {
                    return new dh6(Array.newInstance((Class<?>) vx0.T(f76.D(ih6VarA)), 0).getClass());
                }
                rd6.r("Cannot determine classifier for array element type: ", this);
                return null;
            }
        } else if (co1VarA2 instanceof swd) {
            return new xj6(null, (swd) co1VarA2);
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof vj6)) {
            return false;
        }
        vj6 vj6Var = (vj6) obj;
        return g76.L(this.a, vj6Var.a) && g76.L(r(), vj6Var.r()) && o().equals(vj6Var.o());
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        throw null;
    }

    @Override // defpackage.qj6
    public final boolean h() {
        return this.a.k0();
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        ih6 ih6VarR = r();
        return o().hashCode() + ((iHashCode + (ih6VarR != null ? ih6VarR.hashCode() : 0)) * 31);
    }

    @Override // defpackage.qj6
    public final List o() {
        fj6 fj6Var = f[1];
        Object objInvoke = this.e.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.qj6
    public final ih6 r() {
        fj6 fj6Var = f[0];
        return (ih6) this.d.invoke();
    }

    public final String toString() {
        return vo7.L(this);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public vj6(mn6 mn6Var, int i) {
        this(mn6Var, null, false);
        mn6Var.getClass();
    }
}
