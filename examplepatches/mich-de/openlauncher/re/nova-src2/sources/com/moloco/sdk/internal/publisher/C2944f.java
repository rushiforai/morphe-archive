package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.y;
import com.moloco.sdk.publisher.AdFormatType;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.MolocoAd;
import java.util.Locale;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.internal.publisher.f, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2944f implements z {

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final a f37094g = new a(null);

    /* renamed from: h, reason: collision with root package name */
    public static final int f37095h = 8;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f37096i = "AdLoadListenerTrackerImpl";

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final AdLoad.Listener f37097a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.y f37098b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final TimerEvent f37099c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final AdFormatType f37100d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f37101e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Function0<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> f37102f;

    /* renamed from: com.moloco.sdk.internal.publisher.f$a */
    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C2944f(@Nullable AdLoad.Listener listener, @NotNull com.moloco.sdk.internal.y sdkEventUrlTracker, @NotNull TimerEvent acmLoadTimerEvent, @NotNull AdFormatType adFormatType, @NotNull MetricsRecorder metricsRecorder, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        Intrinsics.g(sdkEventUrlTracker, "sdkEventUrlTracker");
        Intrinsics.g(acmLoadTimerEvent, "acmLoadTimerEvent");
        Intrinsics.g(adFormatType, "adFormatType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f37097a = listener;
        this.f37098b = sdkEventUrlTracker;
        this.f37099c = acmLoadTimerEvent;
        this.f37100d = adFormatType;
        this.f37101e = metricsRecorder;
        this.f37102f = function0;
    }

    @Override // com.moloco.sdk.internal.publisher.z
    public void a(@NotNull MolocoAd molocoAd, long j11, @Nullable com.moloco.sdk.internal.ortb.model.D d5) {
        String onAdLoadStart;
        Intrinsics.g(molocoAd, "molocoAd");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f37096i, "onAdLoadStarted: " + molocoAd + ", " + j11, null, false, 12, null);
        if (d5 == null || (onAdLoadStart = d5.getOnAdLoadStart()) == null) {
            return;
        }
        y.a.a(this.f37098b, onAdLoadStart, j11, null, 4, null);
    }

    @Override // com.moloco.sdk.internal.publisher.z
    public void a(@NotNull MolocoAd molocoAd, @Nullable com.moloco.sdk.internal.ortb.model.D d5) {
        String onAdLoadSuccess;
        Intrinsics.g(molocoAd, "molocoAd");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f37096i, "onAdLoadSuccess: " + molocoAd, null, false, 12, null);
        if (d5 != null && (onAdLoadSuccess = d5.getOnAdLoadSuccess()) != null) {
            y.a.a(this.f37098b, onAdLoadSuccess, System.currentTimeMillis(), null, 4, null);
        }
        MetricsRecorder metricsRecorder = this.f37101e;
        TimerEvent timerEventWithTag = this.f37099c.withTag(com.moloco.sdk.internal.client_metrics_data.d.f36296d.c(), "success");
        com.moloco.sdk.internal.client_metrics_data.d dVar = com.moloco.sdk.internal.client_metrics_data.d.f36295c;
        String strC = dVar.c();
        String strName = this.f37100d.name();
        Locale locale = Locale.ROOT;
        String lowerCase = strName.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        metricsRecorder.recordTimerEvent(C2946h.a(timerEventWithTag.withTag(strC, lowerCase), this.f37102f));
        MetricsRecorder metricsRecorder2 = this.f37101e;
        CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36276l.c());
        String strC2 = dVar.c();
        String lowerCase2 = this.f37100d.name().toLowerCase(locale);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        metricsRecorder2.recordCountEvent(C2946h.a(countEvent.withTag(strC2, lowerCase2), this.f37102f));
        AdLoad.Listener listener = this.f37097a;
        if (listener != null) {
            listener.onAdLoadSuccess(molocoAd);
        }
    }

    public /* synthetic */ C2944f(AdLoad.Listener listener, com.moloco.sdk.internal.y yVar, TimerEvent timerEvent, AdFormatType adFormatType, MetricsRecorder metricsRecorder, Function0 function0, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(listener, yVar, timerEvent, adFormatType, metricsRecorder, (i5 & 32) != 0 ? null : function0);
    }

    @Override // com.moloco.sdk.internal.publisher.z
    public void a(@NotNull com.moloco.sdk.internal.t internalError, @Nullable com.moloco.sdk.internal.ortb.model.D d5) {
        String onAdLoadFailed;
        Intrinsics.g(internalError, "internalError");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f37096i, "onAdLoadFailed: " + internalError, null, false, 12, null);
        if (d5 != null && (onAdLoadFailed = d5.getOnAdLoadFailed()) != null) {
            this.f37098b.a(onAdLoadFailed, System.currentTimeMillis(), internalError);
        }
        String str = internalError.d().get("missing_fields");
        MetricsRecorder metricsRecorder = this.f37101e;
        TimerEvent timerEventWithTag = this.f37099c.withTag(com.moloco.sdk.internal.client_metrics_data.d.f36296d.c(), "failure");
        com.moloco.sdk.internal.client_metrics_data.d dVar = com.moloco.sdk.internal.client_metrics_data.d.f36294b;
        TimerEvent timerEventWithTag2 = timerEventWithTag.withTag(dVar.c(), internalError.f().a());
        com.moloco.sdk.internal.client_metrics_data.d dVar2 = com.moloco.sdk.internal.client_metrics_data.d.f36295c;
        String strC = dVar2.c();
        String strName = this.f37100d.name();
        Locale locale = Locale.ROOT;
        String lowerCase = strName.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        metricsRecorder.recordTimerEvent(timerEventWithTag2.withTag(strC, lowerCase));
        CountEvent countEventWithTag = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.f36277m.c()).withTag("network", internalError.e().getNetworkName()).withTag(dVar.c(), internalError.f().a());
        String strC2 = dVar2.c();
        String lowerCase2 = this.f37100d.name().toLowerCase(locale);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        CountEvent countEventA = C2946h.a(countEventWithTag.withTag(strC2, lowerCase2), this.f37102f);
        if (str != null && !r70.k.U0(str)) {
            countEventA = countEventA.withTag(com.moloco.sdk.internal.client_metrics_data.d.f36301i.c(), str);
        }
        this.f37101e.recordCountEvent(countEventA);
        AdLoad.Listener listener = this.f37097a;
        if (listener != null) {
            listener.onAdLoadFailed(internalError.e());
        }
    }
}
