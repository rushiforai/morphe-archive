package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.InterfaceC2951a;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b implements j<com.moloco.sdk.internal.services.bidtoken.providers.a> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37750d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37751e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37752f = "AcSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC2951a f37753b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public com.moloco.sdk.internal.services.bidtoken.providers.a f37754c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public b(@NotNull InterfaceC2951a accessibilityInfoService) {
        Intrinsics.g(accessibilityInfoService, "accessibilityInfoService");
        this.f37753b = accessibilityInfoService;
        this.f37754c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37754c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        com.moloco.sdk.internal.services.bidtoken.providers.a aVarE = e();
        boolean z11 = !Intrinsics.b(aVarE, this.f37754c);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37752f, "[CBT] needsRefresh: " + z11 + ", with current: " + aVarE + ", cached: " + this.f37754c, false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37752f;
    }

    public final com.moloco.sdk.internal.services.bidtoken.providers.a e() {
        try {
            return new com.moloco.sdk.internal.services.bidtoken.providers.a(Boolean.valueOf(this.f37753b.c()), Boolean.valueOf(this.f37753b.b()), Boolean.valueOf(this.f37753b.a()), Float.valueOf(this.f37753b.getFontScale()));
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37752f, "[CBT] ACS Error", e3, false, 8, null);
            return new com.moloco.sdk.internal.services.bidtoken.providers.a(null, null, null, null, 15, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public com.moloco.sdk.internal.services.bidtoken.providers.a d() {
        return this.f37754c;
    }
}
