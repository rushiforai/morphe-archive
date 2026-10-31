package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: h, reason: collision with root package name */
    public static final int f39852h = 8;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f39853a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f39854b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f39855c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f39856d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f39857e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f39858f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final MetricsRecorder f39859g;

    public i(boolean z11, boolean z12, boolean z13, boolean z14, @Nullable String str, @Nullable String str2, @Nullable MetricsRecorder metricsRecorder) {
        this.f39853a = z11;
        this.f39854b = z12;
        this.f39855c = z13;
        this.f39856d = z14;
        this.f39857e = str;
        this.f39858f = str2;
        this.f39859g = metricsRecorder;
    }

    @NotNull
    public final k a(@NotNull r externalLinkHandler, @Nullable g gVar) {
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        boolean z11 = this.f39853a;
        return ((z11 || this.f39855c || this.f39854b) && gVar != null) ? new e(gVar, externalLinkHandler, z11, this.f39854b, this.f39855c, this.f39856d, this.f39857e, this.f39858f, this.f39859g) : new f(externalLinkHandler);
    }
}
