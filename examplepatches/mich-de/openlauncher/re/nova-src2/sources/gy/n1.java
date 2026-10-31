package gy;

import c0.h2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class n1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f58441t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58442u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ float f58443v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f58444w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ float f58445x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n1(float f11, float f12, float f13, Continuation continuation) {
        super(2, continuation);
        this.f58443v = f11;
        this.f58444w = f12;
        this.f58445x = f13;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        n1 n1Var = new n1(this.f58443v, this.f58444w, this.f58445x, continuation);
        n1Var.f58442u = obj;
        return n1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((n1) create((f1.w) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58441t;
        if (i5 == 0) {
            ResultKt.b(obj);
            f1.w wVar = (f1.w) this.f58442u;
            Ref.FloatRef floatRef = new Ref.FloatRef();
            float f11 = this.f58443v;
            floatRef.f71860a = f11;
            c0.e eVarA = c0.f.a(f11);
            Float f12 = new Float(this.f58444w);
            h2 h2Var = t1.f58553e;
            Float f13 = new Float(this.f58445x);
            m1 m1Var = new m1(wVar, floatRef, 0);
            this.f58441t = 1;
            if (eVarA.c(f12, h2Var, f13, m1Var, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
