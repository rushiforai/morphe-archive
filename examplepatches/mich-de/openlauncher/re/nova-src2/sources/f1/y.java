package f1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import l1.g6;

/* loaded from: classes2.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54111a;

    /* renamed from: b, reason: collision with root package name */
    public final c0.m f54112b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f54113c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f54114d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.i0 f54115e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.i0 f54116f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.m2 f54117g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.m2 f54118h;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f54119i;

    /* renamed from: j, reason: collision with root package name */
    public final p1.e1 f54120j;

    /* renamed from: k, reason: collision with root package name */
    public final Function1 f54121k;

    /* renamed from: l, reason: collision with root package name */
    public final Function0 f54122l;

    /* renamed from: m, reason: collision with root package name */
    public final Object f54123m;
    public final g0.l0 n;
    public final Object o;

    public y(g6 g6Var, androidx.fragment.app.p pVar, c3.c1 c1Var, c0.m mVar, Function1 function1) {
        this.f54111a = 1;
        this.f54121k = pVar;
        this.f54122l = c1Var;
        this.f54112b = mVar;
        this.f54113c = function1;
        this.f54123m = new m1.y();
        this.n = new x(this, (byte) 0);
        this.f54114d = androidx.compose.runtime.d.k(g6Var);
        this.f54115e = androidx.compose.runtime.d.d(new m1.n(this, 4));
        this.f54116f = androidx.compose.runtime.d.d(new m1.n(this, 2));
        this.f54117g = androidx.compose.runtime.d.f(Float.NaN);
        androidx.compose.runtime.d.e(new m1.n(this, 3), p1.g1.f81425e);
        this.f54118h = androidx.compose.runtime.d.f(0.0f);
        this.f54119i = androidx.compose.runtime.d.k(null);
        this.f54120j = androidx.compose.runtime.d.k(new m1.d0(b70.h.f17594a));
        this.o = new m1.p(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(e0.f1 f1Var, v vVar, ContinuationImpl continuationImpl) {
        r rVar;
        Object objA;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f53912v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f53912v = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        Object obj = rVar.f53910t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f53912v;
        Function1 function1 = this.f54121k;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                j2 j2Var = (j2) this.f54123m;
                a1.c cVar = new a1.c(this, vVar, null, 1);
                rVar.f53912v = 1;
                j2Var.getClass();
                if (t70.k0.d(new i2(f1Var, j2Var, cVar, null), rVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            if (objA != null && Math.abs(i() - g().c(objA)) <= 0.5f && ((Boolean) function1.invoke(objA)).booleanValue()) {
                m(objA);
            }
            return Unit.f71706a;
        } finally {
            objA = g().a(i());
            if (objA != null && Math.abs(i() - g().c(objA)) <= 0.5f && ((Boolean) function1.invoke(objA)).booleanValue()) {
                m(objA);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object b(Object obj, e0.f1 f1Var, k kVar, ContinuationImpl continuationImpl) {
        s sVar;
        Object objA;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f53937v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f53937v = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(this, continuationImpl);
            }
        }
        s sVar2 = sVar;
        Object obj2 = sVar2.f53935t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar2.f53937v;
        p1.e1 e1Var = this.f54119i;
        Function1 function1 = this.f54121k;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                if (!g().f53702a.containsKey(obj)) {
                    m(obj);
                    return Unit.f71706a;
                }
                j2 j2Var = (j2) this.f54123m;
                t tVar = new t(this, obj, kVar, continuation, 0);
                sVar2.f53937v = 1;
                j2Var.getClass();
                if (t70.k0.d(new i2(f1Var, j2Var, tVar, null), sVar2) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj2);
            }
            if (objA != null && Math.abs(i() - g().c(objA)) <= 0.5f && ((Boolean) function1.invoke(objA)).booleanValue()) {
                m(objA);
            }
            return Unit.f71706a;
        } finally {
            ((p1.s2) e1Var).setValue(null);
            objA = g().a(i());
            if (objA != null && Math.abs(i() - g().c(objA)) <= 0.5f && ((Boolean) function1.invoke(objA)).booleanValue()) {
                m(objA);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:66:? A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object c(Object obj, e0.f1 f1Var, m1.h hVar, ContinuationImpl continuationImpl) throws Throwable {
        m1.o oVar;
        y yVar;
        Throwable th2;
        Throwable th3;
        y yVar2;
        Object objA;
        Object objA2;
        if (continuationImpl instanceof m1.o) {
            oVar = (m1.o) continuationImpl;
            int i5 = oVar.f75735w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f75735w = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new m1.o(this, continuationImpl);
            }
        }
        Object obj2 = oVar.f75733u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f75735w;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj2);
            if (h().f75679a.containsKey(obj)) {
                try {
                    m1.y yVar3 = (m1.y) this.f54123m;
                    try {
                        yVar = this;
                        try {
                            t tVar = new t(yVar, obj, hVar, continuation, 2);
                            oVar.f75732t = yVar;
                            oVar.f75735w = 1;
                            try {
                                yVar3.getClass();
                                if (t70.k0.d(new m1.x(f1Var, yVar3, tVar, null), oVar) == coroutineSingletons) {
                                    return coroutineSingletons;
                                }
                                yVar2 = yVar;
                                yVar2.n(null);
                                objA2 = yVar2.h().a(yVar2.i());
                                if (objA2 != null) {
                                    yVar2.m(objA2);
                                }
                            } catch (Throwable th4) {
                                th2 = th4;
                                th3 = th2;
                                yVar2 = yVar;
                                yVar2.n(null);
                                objA = yVar2.h().a(yVar2.i());
                                if (objA == null || Math.abs(yVar2.i() - yVar2.h().c(objA)) > 0.5f || !((Boolean) yVar2.f54113c.invoke(objA)).booleanValue()) {
                                    throw th3;
                                }
                                yVar2.m(objA);
                                throw th3;
                            }
                        } catch (Throwable th5) {
                            th = th5;
                            th3 = th;
                            yVar2 = yVar;
                            yVar2.n(null);
                            objA = yVar2.h().a(yVar2.i());
                            if (objA == null) {
                                throw th3;
                            }
                            throw th3;
                        }
                    } catch (Throwable th6) {
                        th = th6;
                        yVar = this;
                    }
                } catch (Throwable th7) {
                    yVar = this;
                    th2 = th7;
                }
            } else {
                m(obj);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar2 = oVar.f75732t;
            try {
                ResultKt.b(obj2);
                yVar2.n(null);
                objA2 = yVar2.h().a(yVar2.i());
                if (objA2 != null && Math.abs(yVar2.i() - yVar2.h().c(objA2)) <= 0.5f && ((Boolean) yVar2.f54113c.invoke(objA2)).booleanValue()) {
                    yVar2.m(objA2);
                }
            } catch (Throwable th8) {
                th3 = th8;
                yVar2.n(null);
                objA = yVar2.h().a(yVar2.i());
                if (objA == null) {
                }
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object d(e0.f1 f1Var, v vVar, ContinuationImpl continuationImpl) throws Throwable {
        m1.m mVar;
        Throwable th2;
        y yVar;
        Object objA;
        Object objA2;
        if (continuationImpl instanceof m1.m) {
            mVar = (m1.m) continuationImpl;
            int i5 = mVar.f75722w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f75722w = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m1.m(this, continuationImpl);
            }
        }
        Object obj = mVar.f75720u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f75722w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = mVar.f75719t;
            try {
                ResultKt.b(obj);
                objA2 = yVar.h().a(yVar.i());
                if (objA2 != null && Math.abs(yVar.i() - yVar.h().c(objA2)) <= 0.5f && ((Boolean) yVar.f54113c.invoke(objA2)).booleanValue()) {
                    yVar.m(objA2);
                }
                return Unit.f71706a;
            } catch (Throwable th3) {
                th2 = th3;
                objA = yVar.h().a(yVar.i());
                if (objA != null) {
                }
                throw th2;
            }
        }
        ResultKt.b(obj);
        try {
            m1.y yVar2 = (m1.y) this.f54123m;
            try {
                a1.c cVar = new a1.c(this, vVar, null, 2);
                mVar.f75719t = this;
                mVar.f75722w = 1;
                try {
                    yVar2.getClass();
                    if (t70.k0.d(new m1.x(f1Var, yVar2, cVar, null), mVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    yVar = this;
                    objA2 = yVar.h().a(yVar.i());
                    if (objA2 != null) {
                        yVar.m(objA2);
                    }
                    return Unit.f71706a;
                } catch (Throwable th4) {
                    th = th4;
                    th2 = th;
                    yVar = this;
                    objA = yVar.h().a(yVar.i());
                    if (objA != null && Math.abs(yVar.i() - yVar.h().c(objA)) <= 0.5f && ((Boolean) yVar.f54113c.invoke(objA)).booleanValue()) {
                        yVar.m(objA);
                    }
                    throw th2;
                }
            } catch (Throwable th5) {
                th2 = th5;
                yVar = this;
                objA = yVar.h().a(yVar.i());
                if (objA != null) {
                    yVar.m(objA);
                }
                throw th2;
            }
        } catch (Throwable th6) {
            th = th6;
        }
    }

    public final Object e(float f11, float f12, Object obj) {
        Object objB;
        Object objB2;
        switch (this.f54111a) {
            case 0:
                k2 k2VarG = g();
                float fC = k2VarG.c(obj);
                float fFloatValue = ((Number) this.f54122l.invoke()).floatValue();
                if (fC == f11 || Float.isNaN(fC)) {
                    return obj;
                }
                Function1 function1 = this.f54113c;
                if (fC < f11) {
                    if (f12 >= fFloatValue) {
                        Object objB3 = k2VarG.b(f11, true);
                        Intrinsics.d(objB3);
                        return objB3;
                    }
                    objB = k2VarG.b(f11, true);
                    Intrinsics.d(objB);
                    if (f11 < Math.abs(Math.abs(((Number) function1.invoke(Float.valueOf(Math.abs(k2VarG.c(objB) - fC)))).floatValue()) + fC)) {
                        return obj;
                    }
                } else {
                    if (f12 <= (-fFloatValue)) {
                        Object objB4 = k2VarG.b(f11, false);
                        Intrinsics.d(objB4);
                        return objB4;
                    }
                    objB = k2VarG.b(f11, false);
                    Intrinsics.d(objB);
                    float fAbs = Math.abs(fC - Math.abs(((Number) function1.invoke(Float.valueOf(Math.abs(fC - k2VarG.c(objB))))).floatValue()));
                    if (f11 < 0.0f) {
                        if (Math.abs(f11) < fAbs) {
                            return obj;
                        }
                    } else if (f11 > fAbs) {
                        return obj;
                    }
                }
                return objB;
            default:
                androidx.fragment.app.p pVar = (androidx.fragment.app.p) this.f54121k;
                m1.d0 d0VarH = h();
                float fC2 = d0VarH.c(obj);
                float fFloatValue2 = ((Number) ((c3.c1) this.f54122l).invoke()).floatValue();
                if (fC2 == f11 || Float.isNaN(fC2)) {
                    return obj;
                }
                if (fC2 < f11) {
                    if (f12 >= fFloatValue2) {
                        Object objB5 = d0VarH.b(f11, true);
                        Intrinsics.d(objB5);
                        return objB5;
                    }
                    objB2 = d0VarH.b(f11, true);
                    Intrinsics.d(objB2);
                    if (f11 < Math.abs(Math.abs(((Number) pVar.invoke(Float.valueOf(Math.abs(d0VarH.c(objB2) - fC2)))).floatValue()) + fC2)) {
                        return obj;
                    }
                } else {
                    if (f12 <= (-fFloatValue2)) {
                        Object objB6 = d0VarH.b(f11, false);
                        Intrinsics.d(objB6);
                        return objB6;
                    }
                    objB2 = d0VarH.b(f11, false);
                    Intrinsics.d(objB2);
                    float fAbs2 = Math.abs(fC2 - Math.abs(((Number) pVar.invoke(Float.valueOf(Math.abs(fC2 - d0VarH.c(objB2))))).floatValue()));
                    if (f11 < 0.0f) {
                        if (Math.abs(f11) < fAbs2) {
                            return obj;
                        }
                    } else if (f11 > fAbs2) {
                        return obj;
                    }
                }
                return objB2;
        }
    }

    public final float f(float f11) {
        float fJ;
        float fI;
        switch (this.f54111a) {
            case 0:
                fJ = j(f11);
                fI = Float.isNaN(i()) ? 0.0f : i();
                this.f54117g.p(fJ);
                break;
            default:
                fJ = k(f11);
                fI = Float.isNaN(i()) ? 0.0f : i();
                this.f54117g.p(fJ);
                break;
        }
        return fJ - fI;
    }

    public k2 g() {
        return (k2) ((p1.s2) this.f54120j).getValue();
    }

    public m1.d0 h() {
        return (m1.d0) ((p1.s2) this.f54120j).getValue();
    }

    public final float i() {
        switch (this.f54111a) {
        }
        return this.f54117g.m();
    }

    public float j(float f11) {
        float fI = (Float.isNaN(i()) ? 0.0f : i()) + f11;
        Float fN1 = b70.g.n1(g().f53702a.values());
        float fFloatValue = fN1 != null ? fN1.floatValue() : Float.NaN;
        Float fL1 = b70.g.l1(g().f53702a.values());
        return kotlin.ranges.a.d0(fI, fFloatValue, fL1 != null ? fL1.floatValue() : Float.NaN);
    }

    public float k(float f11) {
        float fI = (Float.isNaN(i()) ? 0.0f : i()) + f11;
        Float fN1 = b70.g.n1(h().f75679a.values());
        float fFloatValue = fN1 != null ? fN1.floatValue() : Float.NaN;
        Float fL1 = b70.g.l1(h().f75679a.values());
        return kotlin.ranges.a.d0(fI, fFloatValue, fL1 != null ? fL1.floatValue() : Float.NaN);
    }

    public final float l() {
        switch (this.f54111a) {
            case 0:
                if (Float.isNaN(i())) {
                    throw new IllegalStateException("The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?");
                }
                return i();
            default:
                if (Float.isNaN(i())) {
                    throw new IllegalStateException("The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?");
                }
                return i();
        }
    }

    public final void m(Object obj) {
        switch (this.f54111a) {
            case 0:
                ((p1.s2) this.f54114d).setValue(obj);
                break;
            default:
                ((p1.s2) this.f54114d).setValue(obj);
                break;
        }
    }

    public void n(Object obj) {
        ((p1.s2) this.f54119i).setValue(obj);
    }

    public Object o(float f11, ContinuationImpl continuationImpl) {
        Object value = ((p1.s2) this.f54114d).getValue();
        Object objE = e(l(), f11, value);
        if (((Boolean) this.f54121k.invoke(objE)).booleanValue()) {
            Object objU = p10.c0.u(this, objE, f11, continuationImpl);
            return objU == CoroutineSingletons.f71806a ? objU : Unit.f71706a;
        }
        Object objU2 = p10.c0.u(this, value, f11, continuationImpl);
        return objU2 == CoroutineSingletons.f71806a ? objU2 : Unit.f71706a;
    }

    public y(Enum r22, Function1 function1, Function0 function0, c0.m mVar, Function1 function12) {
        this.f54111a = 0;
        this.f54113c = function1;
        this.f54122l = function0;
        this.f54112b = mVar;
        this.f54121k = function12;
        this.f54123m = new j2();
        this.n = new x(this);
        this.f54114d = androidx.compose.runtime.d.k(r22);
        this.f54115e = androidx.compose.runtime.d.d(new q(this, 0));
        this.f54116f = androidx.compose.runtime.d.d(new q(this, 1));
        this.f54117g = androidx.compose.runtime.d.f(Float.NaN);
        androidx.compose.runtime.d.e(new q(this, 2), p1.g1.f81425e);
        this.f54118h = androidx.compose.runtime.d.f(0.0f);
        this.f54119i = androidx.compose.runtime.d.k(null);
        this.f54120j = androidx.compose.runtime.d.k(new k2(b70.h.f17594a));
        this.o = new u(this);
    }
}
