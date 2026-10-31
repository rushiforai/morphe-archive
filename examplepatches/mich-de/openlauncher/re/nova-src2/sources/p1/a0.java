package p1;

import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class a0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f81380a = new Object();

    /* JADX WARN: Removed duplicated region for block: B:46:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(r1 r1Var, Function2 function2, o oVar, int i5) {
        b3 b3Var;
        boolean z11;
        t1 t1VarU;
        t tVar = (t) oVar;
        tVar.d0(-149765515);
        fa.t tVar2 = tVar.f81574x;
        n1 n1VarL = tVar.l();
        tVar.Y(201, u.f81588b);
        Object objP = tVar.P();
        if (Intrinsics.b(objP, n.f81514a)) {
            b3Var = null;
        } else {
            Intrinsics.e(objP, "null cannot be cast to non-null type androidx.compose.runtime.ValueHolder<kotlin.Any?>");
            b3Var = (b3) objP;
        }
        androidx.compose.runtime.e eVar = r1Var.f81538a;
        b3 b3VarC = eVar.c(r1Var, b3Var);
        boolean zEquals = b3VarC.equals(b3Var);
        if (!zEquals) {
            tVar.m0(b3VarC);
        }
        if (!tVar.S) {
            f2 f2Var = tVar.G;
            Object objB = f2Var.b(f2Var.f81410b, f2Var.f81415g);
            Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.runtime.PersistentCompositionLocalMap");
            n1 n1Var = (n1) objB;
            if (!(tVar.E() && zEquals) && (r1Var.f81543f || !n1VarL.containsKey(eVar))) {
                n1VarL = ((x1.j) n1VarL).h(eVar, b3VarC);
            } else if ((zEquals && !tVar.f81573w) || !tVar.f81573w) {
                n1VarL = n1Var;
            }
            if (tVar.f81575y || n1Var != n1VarL) {
                z11 = true;
            }
            if (z11 && !tVar.S) {
                tVar.N(n1VarL);
            }
            tVar2.g(tVar.f81573w ? 1 : 0);
            tVar.f81573w = z11;
            tVar.K = n1VarL;
            tVar.W(u.f81589c, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 0, n1VarL);
            function2.invoke(tVar, Integer.valueOf((i5 >> 3) & 14));
            tVar.p(false);
            tVar.p(false);
            tVar.f81573w = tVar2.f() != 0;
            tVar.K = null;
            t1VarU = tVar.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new m0.i(r1Var, function2, i5, 2);
                return;
            }
            return;
        }
        if (r1Var.f81543f || !n1VarL.containsKey(eVar)) {
            n1VarL = ((x1.j) n1VarL).h(eVar, b3VarC);
        }
        tVar.J = true;
        z11 = false;
        if (z11) {
            tVar.N(n1VarL);
        }
        tVar2.g(tVar.f81573w ? 1 : 0);
        tVar.f81573w = z11;
        tVar.K = n1VarL;
        tVar.W(u.f81589c, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 0, n1VarL);
        function2.invoke(tVar, Integer.valueOf((i5 >> 3) & 14));
        tVar.p(false);
        tVar.p(false);
        tVar.f81573w = tVar2.f() != 0;
        tVar.K = null;
        t1VarU = tVar.u();
        if (t1VarU == null) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.lang.Object, p1.n1] */
    /* JADX WARN: Type inference failed for: r9v0, types: [java.lang.Object, kotlin.jvm.functions.Function2] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(r1[] r1VarArr, Function2 function2, o oVar, int i5) {
        x1.j jVarL0;
        boolean z11;
        t1 t1VarU;
        t tVar = (t) oVar;
        tVar.d0(415205898);
        fa.t tVar2 = tVar.f81574x;
        n1 n1VarL = tVar.l();
        tVar.Y(201, u.f81588b);
        if (tVar.S) {
            jVarL0 = tVar.l0(n1VarL, m(r1VarArr, n1VarL, x1.j.f94960g));
            tVar.J = true;
        } else {
            f2 f2Var = tVar.G;
            Object objH = f2Var.h(f2Var.f81415g, 0);
            Intrinsics.e(objH, "null cannot be cast to non-null type androidx.compose.runtime.PersistentCompositionLocalMap");
            ?? r22 = (n1) objH;
            f2 f2Var2 = tVar.G;
            Object objH2 = f2Var2.h(f2Var2.f81415g, 1);
            Intrinsics.e(objH2, "null cannot be cast to non-null type androidx.compose.runtime.PersistentCompositionLocalMap");
            n1 n1Var = (n1) objH2;
            x1.j jVarM = m(r1VarArr, n1VarL, n1Var);
            if (!tVar.E() || tVar.f81575y || !n1Var.equals(jVarM)) {
                jVarL0 = tVar.l0(n1VarL, jVarM);
                if (tVar.f81575y || !Intrinsics.b(jVarL0, r22)) {
                    z11 = true;
                }
                if (z11 && !tVar.S) {
                    tVar.N(jVarL0);
                }
                tVar2.g(tVar.f81573w ? 1 : 0);
                tVar.f81573w = z11;
                tVar.K = jVarL0;
                tVar.W(u.f81589c, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 0, jVarL0);
                function2.invoke(tVar, Integer.valueOf((i5 >> 3) & 14));
                tVar.p(false);
                tVar.p(false);
                tVar.f81573w = tVar2.f() != 0;
                tVar.K = null;
                t1VarU = tVar.u();
                if (t1VarU == null) {
                    t1VarU.f81583d = new m0.i(r1VarArr, function2, i5, 3);
                    return;
                }
                return;
            }
            tVar.f81564l = tVar.G.s() + tVar.f81564l;
            jVarL0 = r22;
        }
        z11 = false;
        if (z11) {
            tVar.N(jVarL0);
        }
        tVar2.g(tVar.f81573w ? 1 : 0);
        tVar.f81573w = z11;
        tVar.K = jVarL0;
        tVar.W(u.f81589c, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 0, jVarL0);
        function2.invoke(tVar, Integer.valueOf((i5 >> 3) & 14));
        tVar.p(false);
        tVar.p(false);
        tVar.f81573w = tVar2.f() != 0;
        tVar.K = null;
        t1VarU = tVar.u();
        if (t1VarU == null) {
        }
    }

    public static final void c(z.b0 b0Var, int i5) {
        if (b0Var.f97784b == 0 || !(b0Var.a(0) == i5 || b0Var.a(b0Var.f97784b - 1) == i5)) {
            int i11 = b0Var.f97784b;
            b0Var.c(i5);
            while (i11 > 0) {
                int i12 = ((i11 + 1) >>> 1) - 1;
                int iA = b0Var.a(i12);
                if (i5 <= iA) {
                    break;
                }
                b0Var.f(i11, iA);
                i11 = i12;
            }
            b0Var.f(i11, i5);
        }
    }

    public static void d(k2 k2Var, List list, u1 u1Var) {
        List list2 = list;
        if (list2.isEmpty()) {
            return;
        }
        int size = list2.size();
        for (int i5 = 0; i5 < size; i5++) {
            int iC = k2Var.c((a) list.get(i5));
            int iM = k2Var.M(k2Var.f81466b, k2Var.r(iC));
            Object obj = iM < k2Var.g(k2Var.f81466b, k2Var.r(iC + 1)) ? k2Var.f81467c[k2Var.h(iM)] : n.f81514a;
            t1 t1Var = obj instanceof t1 ? (t1) obj : null;
            if (t1Var != null) {
                t1Var.f81580a = u1Var;
            }
        }
    }

    public static final int e(o oVar) {
        oVar.getClass();
        return Long.hashCode(((t) oVar).T);
    }

    public static final long f(o oVar) {
        return ((t) oVar).T;
    }

    public static final t1 g(o oVar) {
        t tVar = (t) oVar;
        t1 t1VarA = tVar.A();
        if (t1VarA == null) {
            throw new IllegalStateException("no recompose scope found");
        }
        tVar.getClass();
        t1VarA.f81581b |= 1;
        return t1VarA;
    }

    public static final Object h(n1 n1Var, androidx.compose.runtime.e eVar) {
        Intrinsics.e(eVar, "null cannot be cast to non-null type androidx.compose.runtime.CompositionLocal<kotlin.Any?>");
        Object objB = n1Var.get(eVar);
        if (objB == null) {
            objB = eVar.b();
        }
        return ((b3) objB).a(n1Var);
    }

    public static final androidx.compose.runtime.a i(o oVar) {
        t tVar = (t) oVar;
        tVar.Y(Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, u.f81591e);
        if (tVar.S) {
            k2.y(tVar.I);
        }
        Object objH = tVar.H();
        r rVar = objH instanceof r ? (r) objH : null;
        if (rVar == null) {
            rVar = new r(new androidx.compose.runtime.a(tVar, tVar.T, tVar.f81567q, tVar.C, tVar.f81560h.f81685t));
            tVar.n0(rVar);
        }
        androidx.compose.runtime.a aVar = rVar.f81532a;
        ((s2) aVar.f14108f).setValue(tVar.l());
        tVar.p(false);
        return aVar;
    }

    public static final void j(Object obj, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        if (tVar.S || !Intrinsics.b(tVar.P(), obj)) {
            tVar.m0(obj);
            tVar.b(obj, function2);
        }
    }

    public static final int k(z.b0 b0Var) {
        int iA;
        int i5 = b0Var.f97784b;
        int iA2 = b0Var.a(0);
        while (b0Var.f97784b != 0 && b0Var.a(0) == iA2) {
            b0Var.f(0, b0Var.b());
            b0Var.e(b0Var.f97784b - 1);
            int i11 = b0Var.f97784b;
            int i12 = i11 >>> 1;
            int i13 = 0;
            while (i13 < i12) {
                int iA3 = b0Var.a(i13);
                int i14 = (i13 + 1) * 2;
                int i15 = i14 - 1;
                int iA4 = b0Var.a(i15);
                if (i14 >= i11 || (iA = b0Var.a(i14)) <= iA4) {
                    if (iA4 > iA3) {
                        b0Var.f(i13, iA4);
                        b0Var.f(i15, iA3);
                        i13 = i15;
                    }
                } else if (iA > iA3) {
                    b0Var.f(i13, iA);
                    b0Var.f(i14, iA3);
                    i13 = i14;
                }
            }
        }
        return iA2;
    }

    public static final int l(int i5) {
        int i11 = 306783378 & i5;
        int i12 = 613566756 & i5;
        return (i5 & (-920350135)) | (i12 >> 1) | i11 | ((i11 << 1) & i12);
    }

    public static final x1.j m(r1[] r1VarArr, n1 n1Var, n1 n1Var2) {
        x1.j jVar = x1.j.f94960g;
        jVar.getClass();
        x1.i iVar = new x1.i(jVar);
        iVar.f94959g = jVar;
        for (r1 r1Var : r1VarArr) {
            androidx.compose.runtime.e eVar = r1Var.f81538a;
            if (r1Var.f81543f || !n1Var.containsKey(eVar)) {
                iVar.put(eVar, eVar.c(r1Var, (b3) n1Var2.get(eVar)));
            }
        }
        return iVar.build();
    }
}
