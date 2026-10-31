package n0;

import e10.h4;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final y1.c f77395a;

    /* renamed from: b, reason: collision with root package name */
    public final iy.u f77396b;

    /* renamed from: c, reason: collision with root package name */
    public final z.o0 f77397c;

    public b0(y1.c cVar, iy.u uVar) {
        this.f77395a = cVar;
        this.f77396b = uVar;
        long[] jArr = z.z0.f97875a;
        this.f77397c = new z.o0();
    }

    public final Function2 a(int i5, Object obj, Object obj2) {
        z.o0 o0Var = this.f77397c;
        a0 a0Var = (a0) o0Var.d(obj);
        if (a0Var != null && a0Var.f77374c == i5 && Intrinsics.b(a0Var.f77373b, obj2)) {
            x1.e eVar = a0Var.f77375d;
            if (eVar != null) {
                return eVar;
            }
            x1.e eVar2 = new x1.e(new h4(4, a0Var.f77376e, a0Var), true, 818252804);
            a0Var.f77375d = eVar2;
            return eVar2;
        }
        a0 a0Var2 = new a0(this, i5, obj, obj2);
        o0Var.m(obj, a0Var2);
        x1.e eVar3 = a0Var2.f77375d;
        if (eVar3 != null) {
            return eVar3;
        }
        x1.e eVar4 = new x1.e(new h4(4, this, a0Var2), true, 818252804);
        a0Var2.f77375d = eVar4;
        return eVar4;
    }

    public final Object b(Object obj) {
        if (obj == null) {
            return null;
        }
        a0 a0Var = (a0) this.f77397c.d(obj);
        if (a0Var != null) {
            return a0Var.f77373b;
        }
        d0 d0Var = (d0) this.f77396b.invoke();
        int iC = d0Var.c(obj);
        if (iC != -1) {
            return d0Var.b(iC);
        }
        return null;
    }
}
