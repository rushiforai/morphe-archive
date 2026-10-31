package c0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class f1 extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public int f18795t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Object f18796u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Object f18797v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i1 f18798w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c2 f18799x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f18800y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(Object obj, Object obj2, i1 i1Var, c2 c2Var, float f11, Continuation continuation) {
        super(1, continuation);
        this.f18796u = obj;
        this.f18797v = obj2;
        this.f18798w = i1Var;
        this.f18799x = c2Var;
        this.f18800y = f11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new f1(this.f18796u, this.f18797v, this.f18798w, this.f18799x, this.f18800y, continuation);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return ((f1) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f18795t;
        if (i5 == 0) {
            ResultKt.b(obj);
            e1 e1Var = new e1(this.f18796u, this.f18797v, this.f18798w, this.f18799x, this.f18800y, null);
            this.f18795t = 1;
            if (t70.k0.d(e1Var, this) == coroutineSingletons) {
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
