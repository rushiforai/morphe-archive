package com.instabridge.ai.billing;

import com.android.billingclient.api.Purchase;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.billing.BillingManager$recoverPendingPurchases$2$2", f = "BillingManager.kt", l = {279}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class BillingManager$recoverPendingPurchases$2$2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ Purchase $purchase;
    int label;
    final /* synthetic */ BillingManager this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BillingManager$recoverPendingPurchases$2$2(BillingManager billingManager, Purchase purchase, Continuation<? super BillingManager$recoverPendingPurchases$2$2> continuation) {
        super(2, continuation);
        this.this$0 = billingManager;
        this.$purchase = purchase;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new BillingManager$recoverPendingPurchases$2$2(this.this$0, this.$purchase, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            BillingManager billingManager = this.this$0;
            Purchase purchase = this.$purchase;
            Intrinsics.d(purchase);
            this.label = 1;
            if (billingManager.handlePurchase(purchase, this) == coroutineSingletons) {
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

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
        return ((BillingManager$recoverPendingPurchases$2$2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
