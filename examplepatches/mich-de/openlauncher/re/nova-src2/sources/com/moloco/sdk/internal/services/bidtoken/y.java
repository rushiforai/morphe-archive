package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface y {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f37907a = a.f37908a;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f37908a = new a();

        @NotNull
        public final y a() {
            return A.c();
        }
    }

    @Nullable
    Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super k> continuation);
}
