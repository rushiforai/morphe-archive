package f1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class k extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public int f53690t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ u f53691u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ k2 f53692v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f53693w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ y f53694x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f53695y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(y yVar, float f11, Continuation continuation) {
        super(4, continuation);
        this.f53694x = yVar;
        this.f53695y = f11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        k kVar = new k(this.f53694x, this.f53695y, (Continuation) obj4);
        kVar.f53691u = (u) obj;
        kVar.f53692v = (k2) obj2;
        kVar.f53693w = obj3;
        return kVar.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f53690t;
        if (i5 == 0) {
            ResultKt.b(obj);
            u uVar = this.f53691u;
            float fC = this.f53692v.c(this.f53693w);
            if (!Float.isNaN(fC)) {
                Ref.FloatRef floatRef = new Ref.FloatRef();
                y yVar = this.f53694x;
                float fI = Float.isNaN(yVar.i()) ? 0.0f : yVar.i();
                floatRef.f71860a = fI;
                c0.m mVar = yVar.f54112b;
                b10.f1 f1Var = new b10.f1(23, uVar, floatRef);
                this.f53691u = null;
                this.f53692v = null;
                this.f53690t = 1;
                if (c0.s1.a(fI, fC, this.f53695y, mVar, f1Var, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
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
