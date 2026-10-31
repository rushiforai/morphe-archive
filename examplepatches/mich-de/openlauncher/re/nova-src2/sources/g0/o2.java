package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class o2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56646t;

    /* renamed from: u, reason: collision with root package name */
    public int f56647u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function3 f56648v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h1 f56649w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ v2.t f56650x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o2(Function3 function3, h1 h1Var, v2.t tVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f56646t = i5;
        this.f56648v = function3;
        this.f56649w = h1Var;
        this.f56650x = tVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f56646t) {
            case 0:
                return new o2(this.f56648v, this.f56649w, this.f56650x, continuation, 0);
            default:
                return new o2(this.f56648v, this.f56649w, this.f56650x, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f56646t) {
        }
        return ((o2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f56646t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f56647u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    h2.b bVar = new h2.b(this.f56650x.f91992c);
                    this.f56647u = 1;
                    if (this.f56648v.invoke(this.f56649w, bVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f56647u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    h2.b bVar2 = new h2.b(this.f56650x.f91992c);
                    this.f56647u = 1;
                    if (this.f56648v.invoke(this.f56649w, bVar2, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
