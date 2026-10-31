package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.publisher.privacy.MolocoPrivacy;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class v implements j<MolocoPrivacy.PrivacySettings> {

    /* renamed from: e, reason: collision with root package name */
    public static final int f37846e = 8;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.bidtoken.u f37847b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f37848c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public MolocoPrivacy.PrivacySettings f37849d;

    public v(@NotNull com.moloco.sdk.internal.services.bidtoken.u privacyProvider) {
        Intrinsics.g(privacyProvider, "privacyProvider");
        this.f37847b = privacyProvider;
        this.f37848c = "PrivacyStateSignalProvider";
        this.f37849d = privacyProvider.getPrivacy();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public void a() {
        this.f37849d = this.f37847b.getPrivacy();
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    public boolean b() {
        boolean zB = Intrinsics.b(this.f37849d, this.f37847b.getPrivacy());
        boolean z11 = !zB;
        MolocoLogger.debugBuildLog$default(MolocoLogger.INSTANCE, this.f37848c, !zB ? "[CBT] privacy updated" : "[CBT] privacy didn't change", false, 4, null);
        return z11;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    public String c() {
        return this.f37848c;
    }

    @Override // com.moloco.sdk.internal.services.bidtoken.providers.j
    @NotNull
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public MolocoPrivacy.PrivacySettings d() {
        return this.f37849d;
    }
}
