package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class i implements j<h> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37779d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37780e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37781f = "BInfoSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.q f37782b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public h f37783c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public i(@NotNull com.moloco.sdk.internal.services.q batteryInfoService) {
        Intrinsics.g(batteryInfoService, "batteryInfoService");
        this.f37782b = batteryInfoService;
        this.f37783c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37783c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        boolean z11 = !Intrinsics.b(this.f37783c, e());
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37781f, a2.c.l("[CBT][BIS]: needsRefresh: ", z11), false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37781f;
    }

    public final h e() {
        try {
            h hVar = new h(Integer.valueOf(this.f37782b.b()), Integer.valueOf(this.f37782b.a()), Boolean.valueOf(this.f37782b.c()));
            MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37781f, "[CBT][BIS]: blev: " + hVar.e() + ", bst: " + hVar.d() + ", psm: " + hVar.f(), false, 4, null);
            return hVar;
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f37781f, "[CBT][BIS]: Error", e3, false, 8, null);
            return new h(null, null, null, 7, null);
        }
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public h d() {
        return this.f37783c;
    }
}
