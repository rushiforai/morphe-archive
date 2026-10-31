package x1;

import kotlin.Function;
import kotlin.jvm.internal.Intrinsics;
import p1.t;
import p1.t1;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f94954a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static final m f94955b = new m(0, new long[0], new Object[0]);

    public static final int a(int i5, int i11) {
        return i5 << (((i11 % 10) * 3) + 1);
    }

    public static final e b(int i5, Function function, p1.o oVar) {
        e eVar;
        t tVar = (t) oVar;
        tVar.Z(Integer.rotateLeft(i5, 1), f94954a);
        Object objP = tVar.P();
        if (objP == p1.n.f81514a) {
            eVar = new e(function, true, i5);
            tVar.m0(eVar);
        } else {
            Intrinsics.e(objP, "null cannot be cast to non-null type androidx.compose.runtime.internal.ComposableLambdaImpl");
            eVar = (e) objP;
            eVar.k(function);
        }
        tVar.p(false);
        return eVar;
    }

    public static final long c() {
        return Thread.currentThread().getId();
    }

    public static final e d(int i5, Function function, p1.o oVar) {
        t tVar = (t) oVar;
        Object objP = tVar.P();
        if (objP == p1.n.f81514a) {
            objP = new e(function, true, i5);
            tVar.m0(objP);
        }
        e eVar = (e) objP;
        eVar.k(function);
        return eVar;
    }

    public static final boolean e(t1 t1Var, t1 t1Var2) {
        if (t1Var == null) {
            return true;
        }
        if (t1Var instanceof t1) {
            return !t1Var.b() || t1Var.equals(t1Var2) || Intrinsics.b(t1Var.f81582c, t1Var2.f81582c);
        }
        return false;
    }
}
