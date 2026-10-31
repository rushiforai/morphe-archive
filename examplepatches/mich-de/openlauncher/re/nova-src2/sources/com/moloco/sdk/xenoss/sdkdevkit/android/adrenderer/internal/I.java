package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import android.content.Context;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class I {
    @NotNull
    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.f> a(@NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull String adm, @NotNull r externalLinkHandler, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z watermark, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(context, "context");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(adm, "adm");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(watermark, "watermark");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        return new H(context, customUserEventBuilderService, adm, externalLinkHandler, watermark, metricsRecorder);
    }
}
