package h0;

import c0.l1;
import c0.n;
import c0.y;
import g0.n1;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import p0.q;
import p1.e1;
import p1.s2;
import t70.j0;

/* loaded from: classes2.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.FloatRef f58728t;

    /* renamed from: u, reason: collision with root package name */
    public int f58729u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f58730v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f58731w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Function1 f58732x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ n1 f58733y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(h hVar, float f11, Function1 function1, n1 n1Var, Continuation continuation) {
        super(2, continuation);
        this.f58730v = hVar;
        this.f58731w = f11;
        this.f58732x = function1;
        this.f58733y = n1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new e(this.f58730v, this.f58731w, this.f58732x, this.f58733y, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r4v4, types: [h0.d] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        final Function1 function1;
        float f11;
        int i5;
        long j11;
        float f12;
        final Ref.FloatRef floatRef;
        Object objB;
        float f13;
        float f14;
        h hVar = this.f58730v;
        b bVar = hVar.f58740a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.f58729u;
        Function1 function12 = this.f58732x;
        if (i11 == 0) {
            ResultKt.b(obj);
            y yVar = hVar.f58741b;
            float f15 = this.f58731w;
            float fC = c0.f.c(yVar, f15);
            p0.y yVar2 = bVar.f58719a;
            int iN = yVar2.n();
            e1 e1Var = yVar2.f81240p;
            int i12 = ((q) ((s2) e1Var).getValue()).f81191c + iN;
            if (i12 == 0) {
                function1 = function12;
                f12 = 0.0f;
                f11 = 0.0f;
            } else {
                int i13 = f15 < 0.0f ? yVar2.f81231e + 1 : yVar2.f81231e;
                int iE0 = kotlin.ranges.a.e0(((int) (fC / i12)) + i13, 0, yVar2.m());
                yVar2.n();
                int i14 = ((q) ((s2) e1Var).getValue()).f81191c;
                function1 = function12;
                long j12 = i13;
                long j13 = 1;
                long j14 = j12 - j13;
                if (j14 < 0) {
                    f11 = 0.0f;
                    i5 = i13;
                    j11 = 0;
                } else {
                    f11 = 0.0f;
                    i5 = i13;
                    j11 = j14;
                }
                int i15 = (int) j11;
                long j15 = j12 + j13;
                if (j15 > 2147483647L) {
                    j15 = 2147483647L;
                }
                int iAbs = Math.abs((kotlin.ranges.a.e0(kotlin.ranges.a.e0(iE0, i15, (int) j15), 0, yVar2.m()) - i5) * i12) - i12;
                if (iAbs < 0) {
                    iAbs = 0;
                }
                f12 = iAbs == 0 ? iAbs : iAbs * Math.signum(f15);
            }
            if (Float.isNaN(f12)) {
                j0.b.c("calculateApproachOffset returned NaN. Please use a valid value.");
            }
            floatRef = new Ref.FloatRef();
            float fSignum = Math.signum(f15) * Math.abs(f12);
            floatRef.f71860a = fSignum;
            function1.invoke(new Float(fSignum));
            float f16 = floatRef.f71860a;
            final int i16 = 0;
            ?? r42 = new Function1() { // from class: h0.d
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj2) {
                    int i17 = i16;
                    float fFloatValue = ((Float) obj2).floatValue();
                    switch (i17) {
                        case 0:
                            Ref.FloatRef floatRef2 = floatRef;
                            float f17 = floatRef2.f71860a - fFloatValue;
                            floatRef2.f71860a = f17;
                            function1.invoke(Float.valueOf(f17));
                            break;
                        default:
                            Ref.FloatRef floatRef3 = floatRef;
                            float f18 = floatRef3.f71860a - fFloatValue;
                            floatRef3.f71860a = f18;
                            function1.invoke(Float.valueOf(f18));
                            break;
                    }
                    return Unit.f71706a;
                }
            };
            this.f58728t = floatRef;
            this.f58729u = 1;
            objB = h.b(hVar, this.f58733y, f16, this.f58731w, r42, this);
            if (objB != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        Ref.FloatRef floatRef2 = this.f58728t;
        ResultKt.b(obj);
        floatRef = floatRef2;
        function1 = function12;
        f11 = 0.0f;
        objB = obj;
        n nVar = (n) objB;
        float fFloatValue = ((Number) nVar.a()).floatValue();
        p0.y yVar3 = bVar.f58719a;
        m mVar = yVar3.l().n;
        List list = yVar3.l().f81189a;
        int size = list.size();
        float f17 = Float.NEGATIVE_INFINITY;
        float f18 = Float.POSITIVE_INFINITY;
        for (int i17 = 0; i17 < size; i17++) {
            p0.g gVar = (p0.g) list.get(i17);
            io.sentry.config.a.H(yVar3.l());
            int i18 = yVar3.l().f81194f;
            int i19 = yVar3.l().f81192d;
            int i21 = yVar3.l().f81190b;
            int i22 = ((p0.f) gVar).f81163j;
            yVar3.m();
            mVar.getClass();
            float f19 = i22 - 0;
            if (f19 <= f11 && f19 > f17) {
                f17 = f19;
            }
            if (f19 >= f11 && f19 < f18) {
                f18 = f19;
            }
        }
        if (f17 == Float.NEGATIVE_INFINITY) {
            f17 = f18;
        }
        if (f18 == Float.POSITIVE_INFINITY) {
            f18 = f17;
        }
        if (!yVar3.e()) {
            if (t2.c.E(yVar3, fFloatValue)) {
                f17 = f11;
                f18 = f17;
            } else {
                f18 = f11;
            }
        }
        if (yVar3.c()) {
            f13 = f17;
            f14 = f18;
        } else if (t2.c.E(yVar3, fFloatValue)) {
            f14 = f18;
            f13 = f11;
        } else {
            f13 = f11;
            f14 = f13;
        }
        float fFloatValue2 = ((Number) bVar.f58720b.invoke(Float.valueOf(fFloatValue), Float.valueOf(f13), Float.valueOf(f14))).floatValue();
        if (fFloatValue2 != f13 && fFloatValue2 != f14 && fFloatValue2 != f11) {
            j0.b.c("Final Snapping Offset Should Be one of " + f13 + ", " + f14 + " or 0.0");
        }
        if (fFloatValue2 == Float.POSITIVE_INFINITY || fFloatValue2 == Float.NEGATIVE_INFINITY) {
            fFloatValue2 = f11;
        }
        if (Float.isNaN(fFloatValue2)) {
            j0.b.c("calculateSnapOffset returned NaN. Please use a valid value.");
        }
        floatRef.f71860a = fFloatValue2;
        float f21 = f11;
        n nVarE = c0.f.e(nVar, f21, f21, 30);
        l1 l1Var = hVar.f58742c;
        final int i23 = 1;
        Function1 function13 = new Function1() { // from class: h0.d
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj2) {
                int i172 = i23;
                float fFloatValue3 = ((Float) obj2).floatValue();
                switch (i172) {
                    case 0:
                        Ref.FloatRef floatRef22 = floatRef;
                        float f172 = floatRef22.f71860a - fFloatValue3;
                        floatRef22.f71860a = f172;
                        function1.invoke(Float.valueOf(f172));
                        break;
                    default:
                        Ref.FloatRef floatRef3 = floatRef;
                        float f182 = floatRef3.f71860a - fFloatValue3;
                        floatRef3.f71860a = f182;
                        function1.invoke(Float.valueOf(f182));
                        break;
                }
                return Unit.f71706a;
            }
        };
        this.f58728t = null;
        this.f58729u = 2;
        Object objB2 = l.b(this.f58733y, fFloatValue2, fFloatValue2, nVarE, l1Var, function13, this);
        return objB2 == coroutineSingletons ? coroutineSingletons : objB2;
    }
}
