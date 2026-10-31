package com.instabridge.ai.billing;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
@DebugMetadata(c = "com.instabridge.ai.billing.BillingManager$connectionListener$1$onBillingSetupFinished$1", f = "BillingManager.kt", l = {69, 70}, m = "invokeSuspend")
/* loaded from: classes3.dex */
public final class BillingManager$connectionListener$1$onBillingSetupFinished$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    int label;
    final /* synthetic */ BillingManager this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public BillingManager$connectionListener$1$onBillingSetupFinished$1(BillingManager billingManager, Continuation<? super BillingManager$connectionListener$1$onBillingSetupFinished$1> continuation) {
        super(2, continuation);
        this.this$0 = billingManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new BillingManager$connectionListener$1$onBillingSetupFinished$1(this.this$0, continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0032, code lost:
    
        if (r5.recoverPendingPurchases(r4) == r0) goto L15;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            BillingManager billingManager = this.this$0;
            this.label = 1;
            if (billingManager.fetchProducts(this) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        BillingManager billingManager2 = this.this$0;
        this.label = 2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
        return ((BillingManager$connectionListener$1$onBillingSetupFinished$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
