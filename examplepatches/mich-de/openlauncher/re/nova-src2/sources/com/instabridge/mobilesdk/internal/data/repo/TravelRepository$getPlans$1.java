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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.TravelRepository", f = "TravelRepository.kt", l = {328}, m = "getPlans-0E7RQCE")
/* loaded from: classes3.dex */
public final class TravelRepository$getPlans$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ TravelRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TravelRepository$getPlans$1(TravelRepository travelRepository, Continuation<? super TravelRepository$getPlans$1> continuation) {
        super(continuation);
        this.this$0 = travelRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM203getPlans0E7RQCE = this.this$0.m203getPlans0E7RQCE(null, null, this);
        return objM203getPlans0E7RQCE == CoroutineSingletons.f71806a ? objM203getPlans0E7RQCE : new Result(objM203getPlans0E7RQCE);
    }
}
