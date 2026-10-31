package com.moloco.sdk.internal.services.init;

import com.moloco.sdk.Init;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.x;
import com.moloco.sdk.publisher.MediationInfo;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface d {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f38018a = a.f38020a;

    /* renamed from: b, reason: collision with root package name */
    public static final long f38019b = 3000;

    /* loaded from: classes4.dex */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f38020a = new a();

        /* renamed from: b, reason: collision with root package name */
        public static final long f38021b = 3000;
    }

    @Nullable
    Object a(@NotNull String str, @Nullable MediationInfo mediationInfo, @NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super x<Init.SDKInitResponse, j>> continuation);
}
