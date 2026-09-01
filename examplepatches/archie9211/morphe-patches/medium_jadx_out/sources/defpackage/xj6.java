package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import androidx.work.impl.yX.VrhD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xj6 implements jh6, ih6 {
    public static final /* synthetic */ fj6[] d;
    public final swd a;
    public final k1b b = no7.y(null, new v2(28, this));
    public final k1b c;

    public xj6(yj6 yj6Var, swd swdVar) {
        this.a = swdVar;
        this.c = no7.y(null, new a3(yj6Var, this, false, 17));
    }

    public static dh6 c(y28 y28Var) {
        Class clsJ = bpe.j(y28Var);
        dh6 dh6Var = (dh6) (clsJ != null ? n1b.a.b(clsJ) : null);
        if (dh6Var != null) {
            return dh6Var;
        }
        rd6.n("Type parameter container is not resolved: ", y28Var.h());
        return null;
    }

    @Override // defpackage.jh6
    public final co1 a() {
        return this.a;
    }

    public final String b() {
        String strB = this.a.getName().b();
        strB.getClass();
        return strB;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof xj6)) {
            return false;
        }
        fj6[] fj6VarArr = d;
        fj6 fj6Var = fj6VarArr[1];
        Object objInvoke = this.c.invoke();
        objInvoke.getClass();
        xj6 xj6Var = (xj6) obj;
        k1b k1bVar = xj6Var.c;
        fj6 fj6Var2 = fj6VarArr[1];
        Object objInvoke2 = k1bVar.invoke();
        objInvoke2.getClass();
        return ((yj6) objInvoke).equals((yj6) objInvoke2) && b().equals(xj6Var.b());
    }

    public final int hashCode() {
        fj6 fj6Var = d[1];
        Object objInvoke = this.c.invoke();
        objInvoke.getClass();
        return b().hashCode() + (((yj6) objInvoke).hashCode() * 31);
    }

    static {
        u4a u4aVar = new u4a(xj6.class, VrhD.QPTaNTF, "getUpperBounds()Ljava/util/List;", 0);
        s1b s1bVar = n1b.a;
        d = new fj6[]{s1bVar.g(u4aVar), km4.t(xj6.class, "container", "getContainer()Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;", 0, s1bVar)};
    }

    public final String toString() {
        bk6 bk6Var;
        StringBuilder sb = new StringBuilder();
        int i = wj6.a[this.a.z().ordinal()];
        if (i == 1) {
            bk6Var = bk6.INVARIANT;
        } else if (i == 2) {
            bk6Var = bk6.IN;
        } else {
            if (i != 3) {
                ygf.a();
                return null;
            }
            bk6Var = bk6.OUT;
        }
        int i2 = uwd.a[bk6Var.ordinal()];
        if (i2 != 1) {
            if (i2 == 2) {
                sb.append("in ");
            } else {
                if (i2 != 3) {
                    ygf.a();
                    return null;
                }
                sb.append(aJzfoQ.aRnVQEso);
            }
        }
        sb.append(b());
        return sb.toString();
    }
}
