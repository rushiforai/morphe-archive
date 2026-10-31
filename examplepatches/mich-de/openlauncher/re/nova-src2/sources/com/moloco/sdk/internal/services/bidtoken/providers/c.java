package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.AbstractC2955c;
import com.moloco.sdk.internal.services.InterfaceC2956d;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class c implements j<AbstractC2955c> {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f37755d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f37756e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f37757f = "AdvertisingSignalProvider";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC2956d f37758b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public AbstractC2955c f37759c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public c(@NotNull InterfaceC2956d advertisingService) {
        Intrinsics.g(advertisingService, "advertisingService");
        this.f37758b = advertisingService;
        this.f37759c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37759c = e();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        boolean z11 = !Intrinsics.b(this.f37759c, e());
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37757f, a2.c.l("[CBT][ASP]: needsRefresh: ", z11), false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return f37757f;
    }

    public final AbstractC2955c e() {
        AbstractC2955c abstractC2955cA = this.f37758b.a();
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, f37757f, "[CBT][ASP]: adData: " + abstractC2955cA, false, 4, null);
        return abstractC2955cA;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public AbstractC2955c d() {
        return e();
    }
}
