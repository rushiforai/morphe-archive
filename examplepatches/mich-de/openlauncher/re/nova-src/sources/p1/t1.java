package p1;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public u1 f81580a;

    /* renamed from: b, reason: collision with root package name */
    public int f81581b;

    /* renamed from: c, reason: collision with root package name */
    public a f81582c;

    /* renamed from: d, reason: collision with root package name */
    public Function2 f81583d;

    /* renamed from: e, reason: collision with root package name */
    public int f81584e;

    /* renamed from: f, reason: collision with root package name */
    public z.h0 f81585f;

    /* renamed from: g, reason: collision with root package name */
    public z.o0 f81586g;

    public t1(u1 u1Var) {
        this.f81580a = u1Var;
    }

    public static boolean a(i0 i0Var, z.o0 o0Var) {
        Intrinsics.e(i0Var, "null cannot be cast to non-null type androidx.compose.runtime.DerivedState<kotlin.Any?>");
        t2 t2Var = i0Var.f81453c;
        if (t2Var == null) {
            t2Var = g1.f81425e;
        }
        return !t2Var.a(i0Var.p().f81443f, o0Var.d(i0Var));
    }

    public final boolean b() {
        if (this.f81580a != null) {
            a aVar = this.f81582c;
            if (aVar != null ? aVar.a() : false) {
                return true;
            }
        }
        return false;
    }

    public final void c() {
        u1 u1Var = this.f81580a;
        if (u1Var != null) {
            u1Var.b(this, null);
        }
    }

    public final u0 d(Object obj) {
        u0 u0VarB;
        u1 u1Var = this.f81580a;
        return (u1Var == null || (u0VarB = u1Var.b(this, obj)) == null) ? u0.f81593a : u0VarB;
    }

    public final void e() {
        u1 u1Var = this.f81580a;
        if (u1Var != null) {
            u1Var.a();
        }
        this.f81580a = null;
        this.f81585f = null;
        this.f81586g = null;
        this.f81583d = null;
    }

    public final void f(boolean z11) {
        int i5 = this.f81581b;
        this.f81581b = z11 ? i5 | 32 : i5 & (-33);
    }

    public final void g(Function2 function2) {
        this.f81583d = function2;
    }
}
