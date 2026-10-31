package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface l {
    @Nullable
    Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super String> continuation);
}
