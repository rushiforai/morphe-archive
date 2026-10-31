package com.moloco.sdk.internal.services.init;

import android.content.SharedPreferences;
import com.moloco.sdk.Init;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface g {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f38044a = a.f38045a;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f38045a = new a();

        @NotNull
        public final g a(@NotNull SharedPreferences sharedPreferences) {
            Intrinsics.g(sharedPreferences, "sharedPreferences");
            return new h(sharedPreferences, com.moloco.sdk.internal.scheduling.b.a().getIo());
        }
    }

    @Nullable
    Object a(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Init.SDKInitResponse sDKInitResponse, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super Init.SDKInitResponse> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object b(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super Unit> continuation);
}
