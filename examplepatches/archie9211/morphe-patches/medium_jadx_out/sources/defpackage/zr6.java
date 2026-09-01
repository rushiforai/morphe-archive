package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zr6 implements id9 {
    public static final /* synthetic */ fj6[] h;
    public final n0c a;
    public final f0b b;
    public final t67 c;
    public final u67 d;
    public final wmb e;
    public final u67 f;
    public final boolean g;

    static {
        u4a u4aVar = new u4a(zr6.class, "fqName", "getFqName()Lorg/jetbrains/kotlin/name/FqName;", 0);
        s1b s1bVar = n1b.a;
        h = new fj6[]{s1bVar.g(u4aVar), km4.t(zr6.class, "type", "getType()Lorg/jetbrains/kotlin/types/SimpleType;", 0, s1bVar), km4.t(zr6.class, "allValueArguments", "getAllValueArguments()Ljava/util/Map;", 0, s1bVar)};
    }

    public zr6(f0b f0bVar, n0c n0cVar, boolean z) {
        n0cVar.getClass();
        f0bVar.getClass();
        this.a = n0cVar;
        this.b = f0bVar;
        x67 x67Var = ((k96) n0cVar.b).a;
        this.c = new t67(x67Var, new yr6(this, 0));
        this.d = new u67(x67Var, new yr6(this, 1));
        this.e = rz5.I(f0bVar);
        this.f = new u67(x67Var, new yr6(this, 2));
        this.g = z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final f52 a(g0b g0bVar) throws Throwable {
        mn6 mn6VarH;
        if (g0bVar instanceof x0b) {
            return cd7.k(null, ((x0b) g0bVar).b);
        }
        if (g0bVar instanceof v0b) {
            Enum r6 = ((v0b) g0bVar).b;
            Class<?> enclosingClass = r6.getClass();
            if (!enclosingClass.isEnum()) {
                enclosingClass = enclosingClass.getEnclosingClass();
            }
            enclosingClass.getClass();
            return new r04(e0b.a(enclosingClass), n98.e(r6.name()));
        }
        boolean z = g0bVar instanceof i0b;
        n0c n0cVar = this.a;
        if (z) {
            i0b i0bVar = (i0b) g0bVar;
            n98 n98Var = i0bVar.a;
            if (n98Var == null) {
                n98Var = de6.b;
            }
            n98Var.getClass();
            ArrayList arrayListA = i0bVar.a();
            if (!kyd.a0((hec) mk7.z(this.d, h[1]))) {
                y28 y28VarD = f93.d(this);
                y28VarD.getClass();
                lqe lqeVarG = gx1.G(n98Var, y28VarD);
                if (lqeVarG == null || (mn6VarH = lqeVarG.getType()) == null) {
                    mn6VarH = ((k96) n0cVar.b).h.e.h(l24.c(k24.UNKNOWN_ARRAY_ELEMENT_TYPE_OF_ANNOTATION_ARGUMENT, new String[0]), pqe.INVARIANT);
                }
                ArrayList arrayList = new ArrayList(cu1.k0(arrayListA, 10));
                Iterator it2 = arrayListA.iterator();
                while (it2.hasNext()) {
                    f52 f52VarA = a((g0b) it2.next());
                    if (f52VarA == null) {
                        f52VarA = new sl8(null);
                    }
                    arrayList.add(f52VarA);
                }
                return new rxd(arrayList, mn6VarH);
            }
        } else {
            if (g0bVar instanceof h0b) {
                return new jy((Object) new zr6(new f0b(((h0b) g0bVar).b), n0cVar, false));
            }
            if (g0bVar instanceof r0b) {
                Class cls = ((r0b) g0bVar).b;
                mn6 mn6VarK = ((ku3) n0cVar.e).K(cls.isPrimitive() ? new b1b(cls) : ((cls instanceof GenericArrayType) || cls.isArray()) ? new j0b(cls) : cls instanceof WildcardType ? new g1b((WildcardType) cls) : new s0b(cls), gx1.e0(lxd.COMMON, false, null, 7));
                if (!kyd.a0(mn6VarK)) {
                    mn6 mn6VarB = mn6VarK;
                    int i = 0;
                    while (vm6.y(mn6VarB)) {
                        mn6VarB = ((xwd) bu1.a1(mn6VarB.h0())).b();
                        mn6VarB.getClass();
                        i++;
                    }
                    co1 co1VarA = mn6VarB.j0().a();
                    if (co1VarA instanceof y28) {
                        mn1 mn1VarF = f93.f(co1VarA);
                        return mn1VarF == null ? new hh6(new eh6(mn6VarK)) : new hh6(mn1VarF, i);
                    }
                    if (co1VarA instanceof swd) {
                        y05 y05VarI = lnc.a.i();
                        return new hh6(new mn1(y05VarI.b(), y05VarI.a.g()), 0);
                    }
                }
            }
        }
        return null;
    }

    @Override // defpackage.yx
    public final jkc d() {
        return this.e;
    }

    @Override // defpackage.yx
    public final y05 e() {
        fj6 fj6Var = h[0];
        t67 t67Var = this.c;
        t67Var.getClass();
        fj6Var.getClass();
        return (y05) t67Var.invoke();
    }

    @Override // defpackage.yx
    public final Map f() {
        return (Map) mk7.z(this.f, h[2]);
    }

    @Override // defpackage.yx
    public final mn6 getType() {
        return (hec) mk7.z(this.d, h[1]);
    }

    public final String toString() {
        return w83.c.w(this, null);
    }
}
