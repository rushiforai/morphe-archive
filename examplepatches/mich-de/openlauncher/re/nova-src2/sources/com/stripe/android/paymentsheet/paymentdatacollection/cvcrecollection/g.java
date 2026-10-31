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
public final class g extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f44930t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f44931u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ String f44932v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(v vVar, String str, Continuation continuation) {
        super(2, continuation);
        this.f44931u = vVar;
        this.f44932v = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new g(this.f44931u, this.f44932v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f44930t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t1 t1Var = this.f44931u.f48040b;
            CvcRecollectionResult.Confirmed confirmed = new CvcRecollectionResult.Confirmed(this.f44932v);
            this.f44930t = 1;
            if (t1Var.emit(confirmed, this) == coroutineSingletons) {
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
