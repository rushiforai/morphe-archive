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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.CheckoutRepository", f = "CheckoutRepository.kt", l = {103}, m = "verify-hUnOzRk")
/* loaded from: classes3.dex */
public final class CheckoutRepository$verify$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ CheckoutRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CheckoutRepository$verify$1(CheckoutRepository checkoutRepository, Continuation<? super CheckoutRepository$verify$1> continuation) {
        super(continuation);
        this.this$0 = checkoutRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM188verifyhUnOzRk = this.this$0.m188verifyhUnOzRk(null, null, null, null, null, this);
        return objM188verifyhUnOzRk == CoroutineSingletons.f71806a ? objM188verifyhUnOzRk : new Result(objM188verifyhUnOzRk);
    }
}
