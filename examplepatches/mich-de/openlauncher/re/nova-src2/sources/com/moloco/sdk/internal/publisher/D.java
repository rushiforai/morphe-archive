package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.BannerAdShowListener;
import com.moloco.sdk.publisher.MolocoAd;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class D implements A {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ A f36892a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final BannerAdShowListener f36893b;

    public D(@Nullable BannerAdShowListener bannerAdShowListener, @NotNull InterfaceC2958f appLifecycleTrackerService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull Function0<com.moloco.sdk.internal.ortb.model.D> provideSdkEvents, @NotNull Function0<C2949k> provideBUrlData, @NotNull AdFormatType adType, @NotNull MetricsRecorder metricsRecorder, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        Intrinsics.g(appLifecycleTrackerService, "appLifecycleTrackerService");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(provideSdkEvents, "provideSdkEvents");
        Intrinsics.g(provideBUrlData, "provideBUrlData");
        Intrinsics.g(adType, "adType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f36892a = C.a(bannerAdShowListener, appLifecycleTrackerService, customUserEventBuilderService, provideSdkEvents, provideBUrlData, null, null, adType, metricsRecorder, null, function0, 608, null);
        this.f36893b = bannerAdShowListener;
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a(@NotNull com.moloco.sdk.internal.t internalError) {
        Intrinsics.g(internalError, "internalError");
        this.f36892a.a(internalError);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void b() {
        this.f36892a.b();
    }

    @Nullable
    public final BannerAdShowListener c() {
        return this.f36893b;
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void onAdClicked(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36892a.onAdClicked(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void onAdHidden(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36892a.onAdHidden(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a(@NotNull MolocoAd molocoAd, @Nullable String str) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36892a.a(molocoAd, str);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a() {
        this.f36892a.a();
    }

    public /* synthetic */ D(BannerAdShowListener bannerAdShowListener, InterfaceC2958f interfaceC2958f, com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar, Function0 function0, Function0 function02, AdFormatType adFormatType, MetricsRecorder metricsRecorder, Function0 function03, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(bannerAdShowListener, interfaceC2958f, aVar, function0, function02, adFormatType, metricsRecorder, (i5 & 128) != 0 ? null : function03);
    }
}
