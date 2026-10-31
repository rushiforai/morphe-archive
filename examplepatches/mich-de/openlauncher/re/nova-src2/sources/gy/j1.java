package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class j1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f58387t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ w0 f58388u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ float f58389v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f58390w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ float f58391x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j1(w0 w0Var, float f11, float f12, float f13, Continuation continuation) {
        super(2, continuation);
        this.f58388u = w0Var;
        this.f58389v = f11;
        this.f58390w = f12;
        this.f58391x = f13;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new j1(this.f58388u, this.f58389v, this.f58390w, this.f58391x, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((j1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58387t;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f58387t = 1;
            float f11 = t1.f58549a;
            n1 n1Var = new n1(this.f58389v, this.f58390w, this.f58391x, null);
            Object objB = this.f58388u.b(e0.f1.f49976a, n1Var, this);
            if (objB != coroutineSingletons) {
                objB = Unit.f71706a;
            }
            if (objB == coroutineSingletons) {
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
