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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.PlansRepository", f = "PlansRepository.kt", l = {38}, m = "loadPlans-BWLJW6A")
/* loaded from: classes3.dex */
public final class PlansRepository$loadPlans$1 extends ContinuationImpl {
    int I$0;
    Object L$0;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PlansRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PlansRepository$loadPlans$1(PlansRepository plansRepository, Continuation<? super PlansRepository$loadPlans$1> continuation) {
        super(continuation);
        this.this$0 = plansRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM194loadPlansBWLJW6A = this.this$0.m194loadPlansBWLJW6A(0, false, false, this);
        return objM194loadPlansBWLJW6A == CoroutineSingletons.f71806a ? objM194loadPlansBWLJW6A : new Result(objM194loadPlansBWLJW6A);
    }
}
