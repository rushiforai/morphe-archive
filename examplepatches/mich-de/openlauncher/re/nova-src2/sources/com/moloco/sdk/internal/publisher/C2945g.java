package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdLoad;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.internal.publisher.g, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2945g {
    public static /* synthetic */ z a(AdLoad.Listener listener, TimerEvent timerEvent, AdFormatType adFormatType, MetricsRecorder metricsRecorder, Function0 function0, int i5, Object obj) {
        if ((i5 & 16) != 0) {
            function0 = null;
        }
        return a(listener, timerEvent, adFormatType, metricsRecorder, function0);
    }

    @NotNull
    public static final z a(@Nullable AdLoad.Listener listener, @NotNull TimerEvent acmLoadTimerEvent, @NotNull AdFormatType adFormatType, @NotNull MetricsRecorder metricsRecorder, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        Intrinsics.g(acmLoadTimerEvent, "acmLoadTimerEvent");
        Intrinsics.g(adFormatType, "adFormatType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        return new C2944f(listener, com.moloco.sdk.internal.A.b(), acmLoadTimerEvent, adFormatType, metricsRecorder, function0);
    }
}
