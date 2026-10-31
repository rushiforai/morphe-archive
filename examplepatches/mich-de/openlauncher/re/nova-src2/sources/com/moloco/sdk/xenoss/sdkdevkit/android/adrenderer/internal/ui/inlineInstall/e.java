package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.service_locator.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class e implements k {

    /* renamed from: j, reason: collision with root package name */
    public static final int f39830j = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final g f39831a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final r f39832b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f39833c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f39834d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f39835e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f39836f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f39837g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f39838h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final MetricsRecorder f39839i;

    public e(@NotNull g inlineInstallSheetLauncher, @NotNull r fallbackHandler, boolean z11, boolean z12, boolean z13, boolean z14, @Nullable String str, @Nullable String str2, @Nullable MetricsRecorder metricsRecorder) {
        Intrinsics.g(inlineInstallSheetLauncher, "inlineInstallSheetLauncher");
        Intrinsics.g(fallbackHandler, "fallbackHandler");
        this.f39831a = inlineInstallSheetLauncher;
        this.f39832b = fallbackHandler;
        this.f39833c = z11;
        this.f39834d = z12;
        this.f39835e = z13;
        this.f39836f = z14;
        this.f39837g = str;
        this.f39838h = str2;
        this.f39839i = metricsRecorder;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void a(@NotNull String url) {
        Intrinsics.g(url, "url");
        if (this.f39833c) {
            this.f39831a.b(url, this.f39832b);
        } else {
            this.f39832b.a(url);
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void b(@Nullable String str) {
        if (this.f39834d && !this.f39836f) {
            this.f39831a.a(str, this.f39832b);
            return;
        }
        if (this.f39836f) {
            String str2 = this.f39837g;
            if (str2 != null) {
                str = str2;
            }
            if (str != null) {
                this.f39832b.a(str);
                MetricsRecorder metricsRecorder = this.f39839i;
                if (metricsRecorder != null) {
                    a2.c.w(com.moloco.sdk.internal.client_metrics_data.d.f36296d, new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.R.c()), "auto_fullsheet_shown_complete", metricsRecorder);
                }
                String str3 = this.f39838h;
                if (str3 != null) {
                    a.i.f38316a.c().a(str3);
                }
            }
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void c(@Nullable String str) {
        if (this.f39835e && !this.f39836f) {
            this.f39831a.a(str, this.f39832b);
            return;
        }
        if (this.f39836f) {
            String str2 = this.f39837g;
            if (str2 != null) {
                str = str2;
            }
            if (str != null) {
                this.f39832b.a(str);
                MetricsRecorder metricsRecorder = this.f39839i;
                if (metricsRecorder != null) {
                    a2.c.w(com.moloco.sdk.internal.client_metrics_data.d.f36296d, new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.R.c()), "auto_fullsheet_shown_skip", metricsRecorder);
                }
                String str3 = this.f39838h;
                if (str3 != null) {
                    a.i.f38316a.c().a(str3);
                }
            }
        }
    }
}
