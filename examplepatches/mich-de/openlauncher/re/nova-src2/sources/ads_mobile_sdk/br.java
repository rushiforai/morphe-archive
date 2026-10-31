package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.s1;
import t70.t0;

/* loaded from: classes.dex */
public final class br extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public d f1499a;

    /* renamed from: b, reason: collision with root package name */
    public Object f1500b;

    /* renamed from: c, reason: collision with root package name */
    public int f1501c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f1502d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f1503e;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1504t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ br(long j11, Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1504t = i5;
        this.f1502d = j11;
        this.f1503e = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1504t) {
            case 0:
                return new br(this.f1502d, (dr) this.f1503e, continuation, 0);
            default:
                return new br(this.f1502d, (lu2) this.f1503e, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1504t) {
            case 0:
                dr drVar = (dr) this.f1503e;
                return new br(this.f1502d, drVar, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                lu2 lu2Var = (lu2) this.f1503e;
                return new br(this.f1502d, lu2Var, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        d dVar;
        dr drVar;
        d dVar2;
        lu2 lu2Var;
        switch (this.f1504t) {
            case 0:
                Object obj2 = CoroutineSingletons.f71806a;
                int i5 = this.f1501c;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f1501c = 1;
                    if (t0.c(this.f1502d, this) != obj2) {
                    }
                    return obj2;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    drVar = (dr) this.f1500b;
                    dVar = this.f1499a;
                    ResultKt.b(obj);
                    try {
                        drVar.f2605j = drVar.b();
                        drVar.f2606k = null;
                        obj2 = Unit.f71706a;
                        return obj2;
                    } finally {
                        dVar.g(null);
                    }
                }
                ResultKt.b(obj);
                dr drVar2 = (dr) this.f1503e;
                dVar = drVar2.f2603h;
                this.f1499a = dVar;
                this.f1500b = drVar2;
                this.f1501c = 2;
                if (dVar.e(this) != obj2) {
                    drVar = drVar2;
                    drVar.f2605j = drVar.b();
                    drVar.f2606k = null;
                    obj2 = Unit.f71706a;
                }
                return obj2;
            default:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f1501c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f1501c = 1;
                    if (t0.c(this.f1502d, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        lu2Var = (lu2) this.f1500b;
                        dVar2 = this.f1499a;
                        ResultKt.b(obj);
                        try {
                            s1 s1Var = lu2Var.f6968h;
                            dVar2.g(null);
                            s1Var.j0();
                            return Unit.f71706a;
                        } catch (Throwable th2) {
                            dVar2.g(null);
                            throw th2;
                        }
                    }
                    ResultKt.b(obj);
                }
                lu2 lu2Var2 = (lu2) this.f1503e;
                dVar2 = lu2Var2.f6965e;
                this.f1499a = dVar2;
                this.f1500b = lu2Var2;
                this.f1501c = 2;
                if (dVar2.e(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                lu2Var = lu2Var2;
                s1 s1Var2 = lu2Var.f6968h;
                dVar2.g(null);
                s1Var2.j0();
                return Unit.f71706a;
        }
    }
}
