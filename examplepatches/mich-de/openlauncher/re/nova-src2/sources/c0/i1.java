package c0;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.ranges.IntRange;
import p1.s2;

/* loaded from: classes2.dex */
public final class i1 extends g2 {
    public static final o V = new o(0.0f);
    public static final o W = new o(1.0f);
    public long J;
    public final as.c K;
    public final p1.m2 L;
    public t70.m M;
    public final c80.d N;
    public final v0 O;
    public long P;
    public final z.j0 Q;
    public a1 R;
    public final z0 S;
    public float T;
    public final z0 U;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f18830f;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f18831l;
    public Object n;
    public c2 o;

    /* JADX WARN: Type inference failed for: r3v7, types: [c0.z0] */
    /* JADX WARN: Type inference failed for: r3v8, types: [c0.z0] */
    public i1(p6.n nVar) {
        super(0);
        this.f18830f = androidx.compose.runtime.d.k(nVar);
        this.f18831l = androidx.compose.runtime.d.k(nVar);
        this.n = nVar;
        this.K = new as.c(this, 8);
        this.L = androidx.compose.runtime.d.f(0.0f);
        this.N = new c80.d();
        this.O = new v0();
        this.P = Long.MIN_VALUE;
        this.Q = new z.j0();
        final int i5 = 0;
        this.S = new Function1(this) { // from class: c0.z0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ i1 f19028b;

            {
                this.f19028b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                Long l9 = (Long) obj;
                switch (i5) {
                    case 0:
                        this.f19028b.P = l9.longValue();
                        break;
                    default:
                        long jLongValue = l9.longValue();
                        i1 i1Var = this.f19028b;
                        long j11 = jLongValue - i1Var.P;
                        i1Var.P = jLongValue;
                        long jC = MathKt.c(j11 / i1Var.T);
                        z.j0 j0Var = i1Var.Q;
                        if (j0Var.e()) {
                            Object[] objArr = j0Var.f97840a;
                            int i11 = j0Var.f97841b;
                            int i12 = 0;
                            for (int i13 = 0; i13 < i11; i13++) {
                                a1 a1Var = (a1) objArr[i13];
                                i1.s(a1Var, jC);
                                a1Var.f18692c = true;
                            }
                            c2 c2Var = i1Var.o;
                            if (c2Var != null) {
                                c2Var.p();
                            }
                            int i14 = j0Var.f97841b;
                            Object[] objArr2 = j0Var.f97840a;
                            IntRange intRangeM0 = kotlin.ranges.a.m0(0, i14);
                            int i15 = intRangeM0.f71906a;
                            int i16 = intRangeM0.f71907b;
                            if (i15 <= i16) {
                                while (true) {
                                    objArr2[i15 - i12] = objArr2[i15];
                                    if (((a1) objArr2[i15]).f18692c) {
                                        i12++;
                                    }
                                    if (i15 != i16) {
                                        i15++;
                                    }
                                }
                            }
                            u90.b.B(i14 - i12, i14, null, objArr2);
                            j0Var.f97841b -= i12;
                        }
                        a1 a1Var2 = i1Var.R;
                        if (a1Var2 != null) {
                            a1Var2.f18696g = i1Var.J;
                            i1.s(a1Var2, jC);
                            i1Var.v(a1Var2.f18693d);
                            if (a1Var2.f18693d == 1.0f) {
                                i1Var.R = null;
                            }
                            i1Var.u();
                        }
                        break;
                }
                return Unit.f71706a;
            }
        };
        final int i11 = 1;
        this.U = new Function1(this) { // from class: c0.z0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ i1 f19028b;

            {
                this.f19028b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                Long l9 = (Long) obj;
                switch (i11) {
                    case 0:
                        this.f19028b.P = l9.longValue();
                        break;
                    default:
                        long jLongValue = l9.longValue();
                        i1 i1Var = this.f19028b;
                        long j11 = jLongValue - i1Var.P;
                        i1Var.P = jLongValue;
                        long jC = MathKt.c(j11 / i1Var.T);
                        z.j0 j0Var = i1Var.Q;
                        if (j0Var.e()) {
                            Object[] objArr = j0Var.f97840a;
                            int i112 = j0Var.f97841b;
                            int i12 = 0;
                            for (int i13 = 0; i13 < i112; i13++) {
                                a1 a1Var = (a1) objArr[i13];
                                i1.s(a1Var, jC);
                                a1Var.f18692c = true;
                            }
                            c2 c2Var = i1Var.o;
                            if (c2Var != null) {
                                c2Var.p();
                            }
                            int i14 = j0Var.f97841b;
                            Object[] objArr2 = j0Var.f97840a;
                            IntRange intRangeM0 = kotlin.ranges.a.m0(0, i14);
                            int i15 = intRangeM0.f71906a;
                            int i16 = intRangeM0.f71907b;
                            if (i15 <= i16) {
                                while (true) {
                                    objArr2[i15 - i12] = objArr2[i15];
                                    if (((a1) objArr2[i15]).f18692c) {
                                        i12++;
                                    }
                                    if (i15 != i16) {
                                        i15++;
                                    }
                                }
                            }
                            u90.b.B(i14 - i12, i14, null, objArr2);
                            j0Var.f97841b -= i12;
                        }
                        a1 a1Var2 = i1Var.R;
                        if (a1Var2 != null) {
                            a1Var2.f18696g = i1Var.J;
                            i1.s(a1Var2, jC);
                            i1Var.v(a1Var2.f18693d);
                            if (a1Var2.f18693d == 1.0f) {
                                i1Var.R = null;
                            }
                            i1Var.u();
                        }
                        break;
                }
                return Unit.f71706a;
            }
        };
    }

    public static final void j(i1 i1Var) {
        c2 c2Var = i1Var.o;
        if (c2Var == null) {
            return;
        }
        a1 a1Var = i1Var.R;
        if (a1Var == null) {
            if (i1Var.J <= 0 || i1Var.q() == 1.0f || Intrinsics.b(((s2) i1Var.f18831l).getValue(), ((s2) i1Var.f18830f).getValue())) {
                a1Var = null;
            } else {
                a1Var = new a1();
                a1Var.f18693d = i1Var.q();
                long j11 = i1Var.J;
                a1Var.f18696g = j11;
                a1Var.f18697h = MathKt.c((1.0d - i1Var.q()) * j11);
                a1Var.f18694e.e(i1Var.q(), 0);
            }
        }
        if (a1Var != null) {
            a1Var.f18696g = i1Var.J;
            i1Var.Q.g(a1Var);
            c2Var.n(a1Var);
        }
        i1Var.R = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object k(i1 i1Var, ContinuationImpl continuationImpl) {
        d1 d1Var;
        z.j0 j0Var = i1Var.Q;
        if (continuationImpl instanceof d1) {
            d1Var = (d1) continuationImpl;
            int i5 = d1Var.f18746v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d1Var.f18746v = i5 - Integer.MIN_VALUE;
            } else {
                d1Var = new d1(i1Var, continuationImpl);
            }
        }
        Object obj = d1Var.f18744t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = d1Var.f18746v;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (j0Var.d() && i1Var.R == null) {
                return Unit.f71706a;
            }
            if (s1.h(d1Var.getContext()) == 0.0f) {
                i1Var.o();
                i1Var.P = Long.MIN_VALUE;
                return Unit.f71706a;
            }
            if (i1Var.P == Long.MIN_VALUE) {
                z0 z0Var = i1Var.S;
                d1Var.f18746v = 1;
                if (p1.b1.a(d1Var.getContext()).s(z0Var, d1Var) != obj2) {
                }
            }
            return obj2;
        }
        if (i11 != 1 && i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        do {
            if (!j0Var.e() && i1Var.R == null) {
                i1Var.P = Long.MIN_VALUE;
                return Unit.f71706a;
            }
            d1Var.f18746v = 2;
        } while (i1Var.n(d1Var) != obj2);
        return obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object l(i1 i1Var, ContinuationImpl continuationImpl) {
        g1 g1Var;
        Object value;
        Object obj;
        c80.d dVar = i1Var.N;
        if (continuationImpl instanceof g1) {
            g1Var = (g1) continuationImpl;
            int i5 = g1Var.f18816w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g1Var.f18816w = i5 - Integer.MIN_VALUE;
            } else {
                g1Var = new g1(i1Var, continuationImpl);
            }
        }
        Object obj2 = g1Var.f18814u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g1Var.f18816w;
        if (i11 == 0) {
            ResultKt.b(obj2);
            value = ((s2) i1Var.f18830f).getValue();
            g1Var.f18813t = value;
            g1Var.f18816w = 1;
            if (dVar.e(g1Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            obj = g1Var.f18813t;
            ResultKt.b(obj2);
            if (!Intrinsics.b(obj2, obj)) {
                return Unit.f71706a;
            }
            i1Var.P = Long.MIN_VALUE;
            throw new CancellationException("targetState while waiting for composition");
        }
        Object obj3 = g1Var.f18813t;
        ResultKt.b(obj2);
        value = obj3;
        g1Var.f18813t = value;
        g1Var.f18816w = 2;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(g1Var));
        mVar.t();
        i1Var.M = mVar;
        dVar.g(null);
        Object objS = mVar.s();
        if (objS != coroutineSingletons) {
            obj = value;
            obj2 = objS;
            if (!Intrinsics.b(obj2, obj)) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object m(i1 i1Var, ContinuationImpl continuationImpl) {
        h1 h1Var;
        Object value;
        Object obj;
        c80.d dVar = i1Var.N;
        if (continuationImpl instanceof h1) {
            h1Var = (h1) continuationImpl;
            int i5 = h1Var.f18823w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h1Var.f18823w = i5 - Integer.MIN_VALUE;
            } else {
                h1Var = new h1(i1Var, continuationImpl);
            }
        }
        Object obj2 = h1Var.f18821u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h1Var.f18823w;
        if (i11 == 0) {
            ResultKt.b(obj2);
            value = ((s2) i1Var.f18830f).getValue();
            h1Var.f18820t = value;
            h1Var.f18823w = 1;
            if (dVar.e(h1Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            obj = h1Var.f18820t;
            ResultKt.b(obj2);
            if (!Intrinsics.b(obj2, obj)) {
                i1Var.P = Long.MIN_VALUE;
                throw new CancellationException("snapTo() was canceled because state was changed to " + obj2 + " instead of " + obj);
            }
            return Unit.f71706a;
        }
        Object obj3 = h1Var.f18820t;
        ResultKt.b(obj2);
        value = obj3;
        if (Intrinsics.b(value, i1Var.n)) {
            dVar.g(null);
            return Unit.f71706a;
        }
        h1Var.f18820t = value;
        h1Var.f18823w = 2;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(h1Var));
        mVar.t();
        i1Var.M = mVar;
        dVar.g(null);
        Object objS = mVar.s();
        if (objS != coroutineSingletons) {
            obj = value;
            obj2 = objS;
            if (!Intrinsics.b(obj2, obj)) {
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    public static void s(a1 a1Var, long j11) {
        long j12 = a1Var.f18690a;
        o oVar = a1Var.f18694e;
        long j13 = j12 + j11;
        a1Var.f18690a = j13;
        long j14 = a1Var.f18697h;
        if (j13 >= j14) {
            a1Var.f18693d = 1.0f;
            return;
        }
        m2 m2Var = a1Var.f18691b;
        if (m2Var == null) {
            float f11 = j13 / j14;
            a1Var.f18693d = (f11 * 1.0f) + ((1 - f11) * oVar.a(0));
            return;
        }
        o oVar2 = a1Var.f18695f;
        if (oVar2 == null) {
            oVar2 = V;
        }
        a1Var.f18693d = kotlin.ranges.a.d0(((o) m2Var.k(j13, oVar, W, oVar2)).a(0), 0.0f, 1.0f);
    }

    @Override // c0.g2
    public final Object c() {
        return ((s2) this.f18831l).getValue();
    }

    @Override // c0.g2
    public final Object f() {
        return ((s2) this.f18830f).getValue();
    }

    @Override // c0.g2
    public final void g(Object obj) {
        ((s2) this.f18831l).setValue(obj);
    }

    @Override // c0.g2
    public final void h(c2 c2Var) {
        c2 c2Var2 = this.o;
        if (c2Var2 != null && !c2Var.equals(c2Var2)) {
            w0.b("An instance of SeekableTransitionState has been used in different Transitions. Previous instance: " + this.o + ", new instance: " + c2Var);
        }
        this.o = c2Var;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, kotlin.Lazy] */
    @Override // c0.g2
    public final void i() {
        this.o = null;
        ((z1.v) f2.f18802b.getValue()).b(this);
    }

    public final Object n(ContinuationImpl continuationImpl) {
        float fH = s1.h(continuationImpl.getContext());
        if (fH <= 0.0f) {
            o();
            return Unit.f71706a;
        }
        this.T = fH;
        Object objS = p1.b1.a(continuationImpl.getContext()).s(this.U, continuationImpl);
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    public final void o() {
        c2 c2Var = this.o;
        if (c2Var != null) {
            c2Var.c();
        }
        this.Q.i();
        if (this.R != null) {
            this.R = null;
            v(1.0f);
            u();
        }
    }

    public final float q() {
        return this.L.m();
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, kotlin.Lazy] */
    public final void r() {
        long j11 = this.J;
        ((z1.v) f2.f18802b.getValue()).d(this, f2.f18801a, this.K);
        long j12 = this.J;
        if (j11 != j12) {
            a1 a1Var = this.R;
            if (a1Var == null) {
                if (j12 != 0) {
                    u();
                }
            } else {
                if (a1Var.f18690a > j12) {
                    o();
                    return;
                }
                a1Var.f18696g = j12;
                if (a1Var.f18691b == null) {
                    a1Var.f18697h = MathKt.c((1.0d - a1Var.f18694e.a(0)) * this.J);
                }
            }
        }
    }

    public final Object t(float f11, Object obj, SuspendLambda suspendLambda) {
        if (0.0f > f11 || f11 > 1.0f) {
            w0.a("Expecting fraction between 0 and 1. Got " + f11);
        }
        c2 c2Var = this.o;
        if (c2Var == null) {
            return Unit.f71706a;
        }
        Object objA = v0.a(this.O, new f1(obj, ((s2) this.f18830f).getValue(), this, c2Var, f11, null), suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final void u() {
        c2 c2Var = this.o;
        if (c2Var == null) {
            return;
        }
        c2Var.m(MathKt.c(q() * ((Number) c2Var.f18741l.getValue()).longValue()));
    }

    public final void v(float f11) {
        this.L.p(f11);
    }
}
