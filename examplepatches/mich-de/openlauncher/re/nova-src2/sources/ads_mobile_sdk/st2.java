package ads_mobile_sdk;

import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class st2 extends SuspendLambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public d f9659a;

    /* renamed from: b, reason: collision with root package name */
    public lu2 f9660b;

    /* renamed from: c, reason: collision with root package name */
    public int f9661c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ lu2 f9662d;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f9663t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ st2(lu2 lu2Var, Continuation continuation, int i5) {
        super(1, continuation);
        this.f9663t = i5;
        this.f9662d = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f9663t) {
            case 0:
                return new st2(this.f9662d, continuation, 0);
            default:
                return new st2(this.f9662d, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f9663t) {
            case 0:
                return new st2(this.f9662d, (Continuation) obj, 0).invokeSuspend(Unit.f71706a);
            default:
                return new st2(this.f9662d, (Continuation) obj, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        d dVar;
        lu2 lu2Var;
        d dVar2;
        lu2 lu2Var2;
        switch (this.f9663t) {
            case 0:
                Object duration = CoroutineSingletons.f71806a;
                int i5 = this.f9661c;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        lu2 lu2Var3 = this.f9662d;
                        dVar = lu2Var3.f6965e;
                        this.f9659a = dVar;
                        this.f9660b = lu2Var3;
                        this.f9661c = 1;
                        if (dVar.e(this) != duration) {
                            lu2Var = lu2Var3;
                        }
                        return duration;
                    }
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    lu2Var = this.f9660b;
                    dVar = this.f9659a;
                    ResultKt.b(obj);
                    duration = new Duration(lu2Var.f6973m);
                    return duration;
                } finally {
                    dVar.g(null);
                }
            default:
                Object duration2 = CoroutineSingletons.f71806a;
                int i11 = this.f9661c;
                try {
                    if (i11 == 0) {
                        ResultKt.b(obj);
                        lu2 lu2Var4 = this.f9662d;
                        dVar2 = lu2Var4.f6965e;
                        this.f9659a = dVar2;
                        this.f9660b = lu2Var4;
                        this.f9661c = 1;
                        if (dVar2.e(this) != duration2) {
                            lu2Var2 = lu2Var4;
                        }
                        return duration2;
                    }
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    lu2Var2 = this.f9660b;
                    dVar2 = this.f9659a;
                    ResultKt.b(obj);
                    duration2 = new Duration(lu2Var2.n);
                    return duration2;
                } finally {
                    dVar2.g(null);
                }
        }
    }
}
