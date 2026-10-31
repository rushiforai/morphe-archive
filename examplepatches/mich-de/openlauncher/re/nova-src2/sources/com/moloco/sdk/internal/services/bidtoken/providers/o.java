package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.F;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class o implements j<n> {

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final a f37807e = new a(null);

    /* renamed from: f, reason: collision with root package name */
    public static final int f37808f = 8;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final String f37809g = "DSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.y f37810b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final F f37811c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public n f37812d;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public o(@NotNull com.moloco.sdk.internal.services.y deviceInfoService, @NotNull F screenInfoService) {
        Intrinsics.g(deviceInfoService, "deviceInfoService");
        Intrinsics.g(screenInfoService, "screenInfoService");
        this.f37810b = deviceInfoService;
        this.f37811c = screenInfoService;
        this.f37812d = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37812d = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        n nVarE = e();
        boolean z11 = !Intrinsics.b(nVarE, this.f37812d);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37809g, "[CBT] DSP needsRefresh: " + z11 + ", with current: " + nVarE + ", cached: " + this.f37812d, false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37809g;
    }

    public final n e() {
        try {
            return new n(this.f37811c.b(), this.f37810b.c(), this.f37810b.d());
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37809g, "[CBT] DSP Error", e3, false, 8, null);
            return new n(null, null, null, 7, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public n d() {
        return this.f37812d;
    }
}
