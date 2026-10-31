package com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection;

import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionResult;
import cv.v;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f44928t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f44929u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(v vVar, Continuation continuation) {
        super(2, continuation);
        this.f44929u = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new f(this.f44929u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f44928t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t1 t1Var = this.f44929u.f48040b;
            this.f44928t = 1;
            if (t1Var.emit(CvcRecollectionResult.Cancelled.f44925a, this) == coroutineSingletons) {
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
