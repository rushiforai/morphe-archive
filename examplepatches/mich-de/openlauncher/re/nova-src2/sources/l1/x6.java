package l1;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes2.dex */
public final class x6 implements g0.l0 {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f74242a;

    /* renamed from: b, reason: collision with root package name */
    public final ClosedFloatingPointRange f74243b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.m2 f74244c;

    /* renamed from: d, reason: collision with root package name */
    public Function1 f74245d;

    /* renamed from: g, reason: collision with root package name */
    public boolean f74248g;

    /* renamed from: l, reason: collision with root package name */
    public final p1.m2 f74253l;

    /* renamed from: m, reason: collision with root package name */
    public final p1.m2 f74254m;
    public final f1.w n;
    public final e0.j1 o;

    /* renamed from: e, reason: collision with root package name */
    public final float[] f74246e = new float[0];

    /* renamed from: f, reason: collision with root package name */
    public final p1.o2 f74247f = androidx.compose.runtime.d.g(0);

    /* renamed from: h, reason: collision with root package name */
    public final p1.m2 f74249h = androidx.compose.runtime.d.f(0.0f);

    /* renamed from: i, reason: collision with root package name */
    public final p1.m2 f74250i = androidx.compose.runtime.d.f(0.0f);

    /* renamed from: j, reason: collision with root package name */
    public final p1.e1 f74251j = androidx.compose.runtime.d.k(Boolean.FALSE);

    /* renamed from: k, reason: collision with root package name */
    public final c3.c1 f74252k = new c3.c1(this, 17);

    public x6(float f11, Function0 function0, ClosedFloatingPointRange closedFloatingPointRange) {
        this.f74242a = function0;
        this.f74243b = closedFloatingPointRange;
        this.f74244c = androidx.compose.runtime.d.f(f11);
        float fFloatValue = ((Number) closedFloatingPointRange.c()).floatValue();
        float fFloatValue2 = ((Number) closedFloatingPointRange.e()).floatValue() - fFloatValue;
        this.f74253l = androidx.compose.runtime.d.f(bh.g.d0(0.0f, 0.0f, kotlin.ranges.a.d0(fFloatValue2 == 0.0f ? 0.0f : (f11 - fFloatValue) / fFloatValue2, 0.0f, 1.0f)));
        this.f74254m = androidx.compose.runtime.d.f(0.0f);
        this.n = new f1.w(this, 4);
        this.o = new e0.j1();
    }

    @Override // g0.l0
    public final void a(float f11) {
        float fM = this.f74247f.m();
        p1.m2 m2Var = this.f74250i;
        float f12 = 2;
        float fMax = Math.max(fM - (m2Var.m() / f12), 0.0f);
        float fMin = Math.min(m2Var.m() / f12, fMax);
        p1.m2 m2Var2 = this.f74253l;
        float fM2 = m2Var2.m() + f11;
        p1.m2 m2Var3 = this.f74254m;
        m2Var2.p(m2Var3.m() + fM2);
        m2Var3.p(0.0f);
        float fE = w6.e(m2Var2.m(), this.f74246e, fMin, fMax);
        ClosedFloatingPointRange closedFloatingPointRange = this.f74243b;
        float f13 = fMax - fMin;
        float fD0 = bh.g.d0(((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue(), kotlin.ranges.a.d0(f13 == 0.0f ? 0.0f : (fE - fMin) / f13, 0.0f, 1.0f));
        if (fD0 == this.f74244c.m()) {
            return;
        }
        Function1 function1 = this.f74245d;
        if (function1 != null) {
            function1.invoke(Float.valueOf(fD0));
        } else {
            d(fD0);
        }
    }

    @Override // g0.l0
    public final Object b(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        Object objD = t70.k0.d(new kw.s3(this, f1Var, function2, (Continuation) null), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public final float c() {
        ClosedFloatingPointRange closedFloatingPointRange = this.f74243b;
        float fFloatValue = ((Number) closedFloatingPointRange.c()).floatValue();
        float fFloatValue2 = ((Number) closedFloatingPointRange.e()).floatValue() - fFloatValue;
        return kotlin.ranges.a.d0(fFloatValue2 == 0.0f ? 0.0f : (kotlin.ranges.a.d0(this.f74244c.m(), ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()) - fFloatValue) / fFloatValue2, 0.0f, 1.0f);
    }

    public final void d(float f11) {
        ClosedFloatingPointRange closedFloatingPointRange = this.f74243b;
        this.f74244c.p(w6.e(kotlin.ranges.a.d0(f11, ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()), this.f74246e, ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()));
    }
}
