package c0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import p1.s2;

/* loaded from: classes2.dex */
public final class v1 {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f18988a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f18989b = androidx.compose.runtime.d.k(null);

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c2 f18990c;

    public v1(c2 c2Var, i2 i2Var, String str) {
        this.f18990c = c2Var;
        this.f18988a = i2Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final u1 a(Function1 function1, Function1 function12) {
        u1 u1VarB = b();
        c2 c2Var = this.f18990c;
        if (u1VarB == null) {
            Object objInvoke = function12.invoke(c2Var.f18730a.c());
            Object objInvoke2 = function12.invoke(c2Var.f18730a.c());
            i2 i2Var = this.f18988a;
            s sVar = (s) i2Var.f18832a.invoke(objInvoke2);
            sVar.d();
            y1 y1Var = new y1(c2Var, objInvoke, sVar, i2Var);
            u1VarB = new u1(this, y1Var, function1, function12);
            ((s2) this.f18989b).setValue(u1VarB);
            c2Var.f18738i.add(y1Var);
        }
        u1VarB.f18983c = (Lambda) function12;
        u1VarB.f18982b = function1;
        u1VarB.a(c2Var.f());
        return u1VarB;
    }

    public final u1 b() {
        return (u1) ((s2) this.f18989b).getValue();
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    /* JADX WARN: Type inference failed for: r4v2, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    public final void c() {
        u1 u1VarB = b();
        if (u1VarB != null) {
            y1 y1Var = u1VarB.f18981a;
            ?? r22 = u1VarB.f18983c;
            c2 c2Var = this.f18990c;
            y1Var.p(r22.invoke(c2Var.f().b()), u1VarB.f18983c.invoke(c2Var.f().a()), (c0) u1VarB.f18982b.invoke(c2Var.f()));
        }
    }
}
