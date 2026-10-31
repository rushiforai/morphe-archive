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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.TravelRepository", f = "TravelRepository.kt", l = {284}, m = "getDestinations-gIAlu-s")
/* loaded from: classes3.dex */
public final class TravelRepository$getDestinations$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ TravelRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TravelRepository$getDestinations$1(TravelRepository travelRepository, Continuation<? super TravelRepository$getDestinations$1> continuation) {
        super(continuation);
        this.this$0 = travelRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM200getDestinationsgIAlus = this.this$0.m200getDestinationsgIAlus(null, this);
        return objM200getDestinationsgIAlus == CoroutineSingletons.f71806a ? objM200getDestinationsgIAlus : new Result(objM200getDestinationsgIAlus);
    }
}
