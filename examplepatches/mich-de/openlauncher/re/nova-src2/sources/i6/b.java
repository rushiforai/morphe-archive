package i6;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import p1.p1;
import t70.j0;
import w70.m;

/* loaded from: classes2.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f61397t;

    /* renamed from: u, reason: collision with root package name */
    public int f61398u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m f61399v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p1 f61400w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(m mVar, p1 p1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f61397t = i5;
        this.f61399v = mVar;
        this.f61400w = p1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f61397t) {
            case 0:
                return new b(this.f61399v, this.f61400w, continuation, 0);
            default:
                return new b(this.f61399v, this.f61400w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f61397t) {
        }
        return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f61397t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f61398u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    a aVar = new a(this.f61400w, 1);
                    this.f61398u = 1;
                    if (this.f61399v.collect(aVar, this) == coroutineSingletons) {
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
                int i11 = this.f61398u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    a aVar2 = new a(this.f61400w, 2);
                    this.f61398u = 1;
                    if (this.f61399v.collect(aVar2, this) == coroutineSingletons2) {
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
