package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.B;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class u implements j<t> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37841d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37842e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37843f = "NISignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final B f37844b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public t f37845c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public u(@NotNull B networkInfoService) {
        Intrinsics.g(networkInfoService, "networkInfoService");
        this.f37844b = networkInfoService;
        this.f37845c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37845c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        t tVarE = e();
        boolean z11 = !Intrinsics.b(tVarE, this.f37845c);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37843f, "[CBT] NIS needsRefresh: " + z11 + ", with nis: " + tVarE + ", cached: " + this.f37845c, false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37843f;
    }

    public final t e() {
        try {
            t tVar = new t(this.f37844b.d(), this.f37844b.b(), Boolean.valueOf(this.f37844b.a()), this.f37844b.c());
            MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37843f, "[CBT] NIS providing " + tVar, false, 4, null);
            return tVar;
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37843f, "[CBT] NIS Error", e3, false, 8, null);
            return new t(null, null, null, null, 15, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public t d() {
        return this.f37845c;
    }
}
