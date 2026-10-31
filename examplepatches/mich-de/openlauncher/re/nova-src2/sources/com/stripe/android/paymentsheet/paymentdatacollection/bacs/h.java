package com.stripe.android.paymentsheet.paymentdatacollection.bacs;

import bv.n;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationResult;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class h extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f44913t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n f44914u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(n nVar, Continuation continuation) {
        super(2, continuation);
        this.f44914u = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new h(this.f44914u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((h) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f44913t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t1 t1Var = this.f44914u.f18639a;
            this.f44913t = 1;
            if (t1Var.emit(BacsMandateConfirmationResult.Confirmed.f44908a, this) == coroutineSingletons) {
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
