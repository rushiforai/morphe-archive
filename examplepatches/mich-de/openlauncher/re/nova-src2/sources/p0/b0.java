package p0;

import g0.d1;
import kotlin.collections.EmptyList;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import p1.s2;
import t70.k0;

/* loaded from: classes2.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f81129a = 56;

    /* renamed from: b, reason: collision with root package name */
    public static final q f81130b;

    /* renamed from: c, reason: collision with root package name */
    public static final a0 f81131c;

    static {
        EmptyList emptyList = EmptyList.f71733a;
        d1 d1Var = d1.f56493a;
        f81130b = new q(emptyList, 0, 0, 0, 0, 0, 0, h0.m.f58761a, new z(), k0.a(EmptyCoroutineContext.f71803a));
        f81131c = new a0();
    }

    public static b a(xu.d dVar) {
        return new b(0, 0.0f, dVar);
    }

    public static final long b(q qVar, int i5) {
        long j11 = (((i5 * (qVar.f81191c + qVar.f81190b)) + (-qVar.f81194f)) + qVar.f81192d) - qVar.f81191c;
        d1 d1Var = qVar.f81193e;
        d1 d1Var2 = d1.f56494b;
        long jE = qVar.e();
        int i11 = (int) (d1Var == d1Var2 ? jE >> 32 : jE & 4294967295L);
        qVar.n.getClass();
        long jE0 = j11 - (i11 - kotlin.ranges.a.e0(0, 0, i11));
        if (jE0 < 0) {
            return 0L;
        }
        return jE0;
    }

    public static final b c(Function0 function0, p1.o oVar, int i5) {
        Object[] objArr = new Object[0];
        ab.c0 c0Var = b.J;
        boolean zC = ((((i5 & 896) ^ 384) > 256 && ((p1.t) oVar).f(function0)) || (i5 & 384) == 256) | ((p1.t) oVar).c(0.0f);
        p1.t tVar = (p1.t) oVar;
        Object objP = tVar.P();
        if (zC || objP == p1.n.f81514a) {
            objP = new b20.v(function0, 24);
            tVar.m0(objP);
        }
        b bVar = (b) y1.j.d(objArr, c0Var, (Function0) objP, tVar, 0);
        ((s2) bVar.I).setValue(function0);
        return bVar;
    }
}
