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
@DebugMetadata(c = "com.instabridge.mobilesdk.internal.data.repo.EsimRepository", f = "EsimRepository.kt", l = {24}, m = "requestEsim-BWLJW6A")
/* loaded from: classes3.dex */
public final class EsimRepository$requestEsim$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ EsimRepository this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EsimRepository$requestEsim$1(EsimRepository esimRepository, Continuation<? super EsimRepository$requestEsim$1> continuation) {
        super(continuation);
        this.this$0 = esimRepository;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object objM190requestEsimBWLJW6A = this.this$0.m190requestEsimBWLJW6A(0L, false, null, this);
        return objM190requestEsimBWLJW6A == CoroutineSingletons.f71806a ? objM190requestEsimBWLJW6A : new Result(objM190requestEsimBWLJW6A);
    }
}
