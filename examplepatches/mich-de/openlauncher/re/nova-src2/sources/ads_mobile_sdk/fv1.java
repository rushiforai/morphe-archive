package ads_mobile_sdk;

import b.fd;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class fv1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f3528a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fv1(long j11, Continuation continuation) {
        super(2, continuation);
        this.f3528a = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new fv1(this.f3528a, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new fv1(this.f3528a, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        fd fdVarR = zu1.r();
        Intrinsics.f(fdVarR, "newBuilder(...)");
        fdVarR.b();
        ((zu1) fdVarR.f1095b).appVersionCode_ = this.f3528a;
        return (zu1) fdVarR.a();
    }
}
