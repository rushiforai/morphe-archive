package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdShowListener;
import com.moloco.sdk.publisher.MolocoAd;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class E<T extends AdShowListener> implements A {

    /* renamed from: g, reason: collision with root package name */
    public static final int f36894g = 8;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ A f36895a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final T f36896b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC2958f f36897c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f36898d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final AdFormatType f36899e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f36900f;

    public E(@NotNull T adShowListener, @NotNull InterfaceC2958f appLifecycleTrackerService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull Function0<com.moloco.sdk.internal.ortb.model.D> provideSdkEvents, @NotNull Function0<C2949k> provideBUrlData, @NotNull AdFormatType adFormatType, @NotNull MetricsRecorder metricsRecorder, @NotNull Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> getCreativeType) {
        Intrinsics.g(adShowListener, "adShowListener");
        Intrinsics.g(appLifecycleTrackerService, "appLifecycleTrackerService");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(provideSdkEvents, "provideSdkEvents");
        Intrinsics.g(provideBUrlData, "provideBUrlData");
        Intrinsics.g(adFormatType, "adFormatType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        Intrinsics.g(getCreativeType, "getCreativeType");
        this.f36895a = C.a(adShowListener, appLifecycleTrackerService, customUserEventBuilderService, provideSdkEvents, provideBUrlData, null, null, adFormatType, metricsRecorder, null, getCreativeType, 608, null);
        this.f36896b = adShowListener;
        this.f36897c = appLifecycleTrackerService;
        this.f36898d = customUserEventBuilderService;
        this.f36899e = adFormatType;
        this.f36900f = metricsRecorder;
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a(@NotNull com.moloco.sdk.internal.t internalError) {
        Intrinsics.g(internalError, "internalError");
        this.f36895a.a(internalError);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void b() {
        this.f36895a.b();
    }

    @NotNull
    public final T c() {
        return this.f36896b;
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void onAdClicked(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36895a.onAdClicked(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void onAdHidden(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36895a.onAdHidden(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a(@NotNull MolocoAd molocoAd, @Nullable String str) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36895a.a(molocoAd, str);
    }

    @Override // com.moloco.sdk.internal.publisher.A
    public void a() {
        this.f36895a.a();
    }
}
