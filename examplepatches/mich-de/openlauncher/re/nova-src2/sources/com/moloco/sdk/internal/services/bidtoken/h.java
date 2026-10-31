package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.publisher.MediationInfo;
import com.moloco.sdk.publisher.MolocoBidTokenListener;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface h {
    @Nullable
    Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull MediationInfo mediationInfo, @NotNull MolocoBidTokenListener molocoBidTokenListener, @NotNull Continuation<? super Unit> continuation);
}
