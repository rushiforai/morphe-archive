package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class g implements j<f> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37770d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37771e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37772f = "AudSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.n f37773b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public f f37774c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public g(@NotNull com.moloco.sdk.internal.services.n audioService) {
        Intrinsics.g(audioService, "audioService");
        this.f37773b = audioService;
        this.f37774c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37774c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        f fVarE = e();
        boolean z11 = !Intrinsics.b(fVarE, this.f37774c);
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37772f, "[CBT] needsRefresh: " + z11 + ", with current: " + fVarE + ", cached: " + this.f37774c, false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37772f;
    }

    public final f e() {
        try {
            return new f(this.f37773b.a(), Integer.valueOf(this.f37773b.b()));
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37772f, "[CBT] AS Error", e3, false, 8, null);
            return new f(null, null, 3, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public f d() {
        return this.f37774c;
    }
}
