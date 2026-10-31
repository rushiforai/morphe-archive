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
public final class l extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ n f44398t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Throwable f44399u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Map f44400v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(n nVar, Throwable th2, Map map, Continuation continuation) {
        super(2, continuation);
        this.f44398t = nVar;
        this.f44399u = th2;
        this.f44400v = map;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new l(this.f44398t, this.f44399u, this.f44400v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        n.g(this.f44398t, new InternalPaymentResult.Failed(this.f44399u), null, this.f44400v, 2);
        return Unit.f71706a;
    }
}
