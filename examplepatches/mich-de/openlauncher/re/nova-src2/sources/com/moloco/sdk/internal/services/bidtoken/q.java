package com.moloco.sdk.internal.services.bidtoken;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.service_locator.a;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface q {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final a f37864a = a.f37865a;

    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f37865a = new a();

        @NotNull
        public final q a() {
            return new r(a.h.f38309a.i(), o.f37738a.a(), com.moloco.sdk.internal.services.encryption.a.f37948a.a(), com.moloco.sdk.internal.services.bidtoken.providers.l.f37797a.a());
        }
    }

    @Nullable
    Object a(@NotNull MetricsRecorder metricsRecorder, @NotNull String str, @NotNull f fVar, @NotNull Continuation<? super Result<String>> continuation);
}
