package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge;

import a80.m;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import b.c0;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import n7.z;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.a {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final a f39389c = new a(null);

    /* renamed from: d, reason: collision with root package name */
    public static final int f39390d = 8;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f39391e = "TemplateBridgeImpl";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final WebView f39392a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f39393b;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public b(@NotNull WebView webView, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(webView, "webView");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f39392a = webView;
        this.f39393b = metricsRecorder;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.a
    public void a() {
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f39391e, "viewReady called, invoking notifyReadyEvent in WebView", null, false, 12, null);
        this.f39393b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.S.c()).withTag("attached", String.valueOf(this.f39392a.isAttachedToWindow())));
        this.f39392a.evaluateJavascript("notifyReadyEvent()", new z(this, 4));
    }

    public static final void a(b bVar, String str) {
        bVar.f39393b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.T.c()).withTag("attached", String.valueOf(bVar.f39392a.isAttachedToWindow())));
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f39391e, c0.k("notifyReadyEvent call completed, result: ", str), null, false, 12, null);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.a
    public void a(final boolean z11) {
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f39391e, m.i("viewVisible: ", " called, invoking setIsViewable in WebView", z11), null, false, 12, null);
        this.f39393b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.U.c()).withTag("viewable", String.valueOf(z11)).withTag("attached", String.valueOf(this.f39392a.isAttachedToWindow())));
        this.f39392a.evaluateJavascript("setIsViewable(" + z11 + ')', new ValueCallback() { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.bridge.c
            @Override // android.webkit.ValueCallback
            public final void onReceiveValue(Object obj) {
                b.a(this.f39394a, z11, (String) obj);
            }
        });
    }

    public static final void a(b bVar, boolean z11, String str) {
        bVar.f39393b.recordCountEvent(new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.V.c()).withTag("viewable", String.valueOf(z11)).withTag("attached", String.valueOf(bVar.f39392a.isAttachedToWindow())));
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f39391e, c0.k("setIsViewable call completed, result: ", str), null, false, 12, null);
    }
}
