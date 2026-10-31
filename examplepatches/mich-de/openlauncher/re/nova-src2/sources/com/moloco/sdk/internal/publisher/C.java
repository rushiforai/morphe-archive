package com.moloco.sdk.internal.publisher;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdShowListener;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class C {
    public static /* synthetic */ A a(AdShowListener adShowListener, InterfaceC2958f interfaceC2958f, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, Function0 function0, Function0 function02, com.moloco.sdk.internal.y yVar, com.moloco.sdk.internal.f fVar, AdFormatType adFormatType, MetricsRecorder metricsRecorder, com.moloco.sdk.internal.client_metrics_data.a aVar2, Function0 function03, int i5, Object obj) {
        MetricsRecorder metricsRecorder2;
        com.moloco.sdk.internal.client_metrics_data.a aVar3;
        com.moloco.sdk.internal.y yVarB = (i5 & 32) != 0 ? com.moloco.sdk.internal.A.b() : yVar;
        com.moloco.sdk.internal.f fVarA = (i5 & 64) != 0 ? com.moloco.sdk.internal.h.a() : fVar;
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            metricsRecorder2 = metricsRecorder;
            aVar3 = new com.moloco.sdk.internal.client_metrics_data.a(metricsRecorder2);
        } else {
            metricsRecorder2 = metricsRecorder;
            aVar3 = aVar2;
        }
        return a(adShowListener, interfaceC2958f, aVar, function0, function02, yVarB, fVarA, adFormatType, metricsRecorder2, aVar3, (i5 & 1024) != 0 ? null : function03);
    }

    @NotNull
    public static final A a(@Nullable AdShowListener adShowListener, @NotNull InterfaceC2958f appLifecycleTrackerService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull Function0<com.moloco.sdk.internal.ortb.model.D> provideSdkEvents, @NotNull Function0<C2949k> provideBUrlData, @NotNull com.moloco.sdk.internal.y sdkEventUrlTracker, @NotNull com.moloco.sdk.internal.f bUrlTracker, @NotNull AdFormatType adType, @NotNull MetricsRecorder metricsRecorder, @NotNull com.moloco.sdk.internal.client_metrics_data.a acmClickDeduper, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        Intrinsics.g(appLifecycleTrackerService, "appLifecycleTrackerService");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(provideSdkEvents, "provideSdkEvents");
        Intrinsics.g(provideBUrlData, "provideBUrlData");
        Intrinsics.g(sdkEventUrlTracker, "sdkEventUrlTracker");
        Intrinsics.g(bUrlTracker, "bUrlTracker");
        Intrinsics.g(adType, "adType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        Intrinsics.g(acmClickDeduper, "acmClickDeduper");
        return new B(adShowListener, appLifecycleTrackerService, customUserEventBuilderService, provideSdkEvents, provideBUrlData, sdkEventUrlTracker, bUrlTracker, adType, metricsRecorder, acmClickDeduper, function0);
    }
}
