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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.PurchasedPackagesRepository", f = "PurchasedPackagesRepository.kt", l = {27}, m = "getPackages-IoAF18A")
/* loaded from: classes3.dex */
public final class PurchasedPackagesRepository$getPackages$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PurchasedPackagesRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PurchasedPackagesRepository$getPackages$1(PurchasedPackagesRepository purchasedPackagesRepository, Continuation<? super PurchasedPackagesRepository$getPackages$1> continuation) {
        super(continuation);
        this.this$0 = purchasedPackagesRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM196getPackagesIoAF18A = this.this$0.m196getPackagesIoAF18A(this);
        return objM196getPackagesIoAF18A == CoroutineSingletons.f71806a ? objM196getPackagesIoAF18A : new Result(objM196getPackagesIoAF18A);
    }
}
