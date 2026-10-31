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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.CheckoutRepository", f = "CheckoutRepository.kt", l = {46}, m = "checkout-yxL6bBk")
/* loaded from: classes3.dex */
public final class CheckoutRepository$checkout$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ CheckoutRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CheckoutRepository$checkout$1(CheckoutRepository checkoutRepository, Continuation<? super CheckoutRepository$checkout$1> continuation) {
        super(continuation);
        this.this$0 = checkoutRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM186checkoutyxL6bBk = this.this$0.m186checkoutyxL6bBk(null, null, null, null, this);
        return objM186checkoutyxL6bBk == CoroutineSingletons.f71806a ? objM186checkoutyxL6bBk : new Result(objM186checkoutyxL6bBk);
    }
}
