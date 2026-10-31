package com.instabridge.mobilesdk.internal.data.repo;

import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.PurchasedPackagesRepository", f = "PurchasedPackagesRepository.kt", l = {70}, m = "cancelSubscription-BWLJW6A")
/* loaded from: classes3.dex */
public final class PurchasedPackagesRepository$cancelSubscription$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PurchasedPackagesRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PurchasedPackagesRepository$cancelSubscription$1(PurchasedPackagesRepository purchasedPackagesRepository, Continuation<? super PurchasedPackagesRepository$cancelSubscription$1> continuation) {
        super(continuation);
        this.this$0 = purchasedPackagesRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM195cancelSubscriptionBWLJW6A = this.this$0.m195cancelSubscriptionBWLJW6A(0L, null, null, this);
        return objM195cancelSubscriptionBWLJW6A == CoroutineSingletons.f71806a ? objM195cancelSubscriptionBWLJW6A : new Result(objM195cancelSubscriptionBWLJW6A);
    }
}
