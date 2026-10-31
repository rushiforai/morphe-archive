package com.stripe.android.payments.paymentlauncher;

import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class k extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ n f44395t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Throwable f44396u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Map f44397v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(n nVar, Throwable th2, Map map, Continuation continuation) {
        super(2, continuation);
        this.f44395t = nVar;
        this.f44396u = th2;
        this.f44397v = map;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k(this.f44395t, this.f44396u, this.f44397v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        n.g(this.f44395t, new InternalPaymentResult.Failed(this.f44396u), null, this.f44397v, 2);
        return Unit.f71706a;
    }
}
