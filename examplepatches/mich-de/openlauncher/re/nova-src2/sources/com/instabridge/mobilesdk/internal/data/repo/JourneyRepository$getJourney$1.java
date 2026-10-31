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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.JourneyRepository", f = "JourneyRepository.kt", l = {25, 30, 33}, m = "getJourney-gIAlu-s")
/* loaded from: classes3.dex */
public final class JourneyRepository$getJourney$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ JourneyRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JourneyRepository$getJourney$1(JourneyRepository journeyRepository, Continuation<? super JourneyRepository$getJourney$1> continuation) {
        super(continuation);
        this.this$0 = journeyRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM192getJourneygIAlus = this.this$0.m192getJourneygIAlus(null, this);
        return objM192getJourneygIAlus == CoroutineSingletons.f71806a ? objM192getJourneygIAlus : new Result(objM192getJourneygIAlus);
    }
}
