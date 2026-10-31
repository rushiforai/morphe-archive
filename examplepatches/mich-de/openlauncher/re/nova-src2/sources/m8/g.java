package m8;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes.dex */
public final class g extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f76056t;

    /* renamed from: u, reason: collision with root package name */
    public int f76057u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ k f76058v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ x8.k f76059w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(k kVar, x8.k kVar2, Continuation continuation, int i5) {
        super(2, continuation);
        this.f76056t = i5;
        this.f76058v = kVar;
        this.f76059w = kVar2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f76056t) {
            case 0:
                return new g(this.f76058v, this.f76059w, continuation, 0);
            default:
                return new g(this.f76058v, this.f76059w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f76056t) {
        }
        return ((g) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f76056t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f76057u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f76057u = 1;
                    obj = k.a(this.f76058v, this.f76059w, 0, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return obj;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f76057u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f76057u = 1;
                Object objA = k.a(this.f76058v, this.f76059w, 1, this);
                return objA == coroutineSingletons2 ? coroutineSingletons2 : objA;
        }
    }
}
