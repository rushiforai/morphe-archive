package com.instabridge.mobilesdk.internal.esim;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/CarrierUnlockGuide;", b.f42142b, "carrierName", b.f42142b, "unlockUrl", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getCarrierName", "()Ljava/lang/String;", "getUnlockUrl", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class CarrierUnlockGuide {
    public static final int $stable = 0;

    @NotNull
    private final String carrierName;

    @NotNull
    private final String unlockUrl;

    public CarrierUnlockGuide(@NotNull String carrierName, @NotNull String unlockUrl) {
        Intrinsics.g(carrierName, "carrierName");
        Intrinsics.g(unlockUrl, "unlockUrl");
        this.carrierName = carrierName;
        this.unlockUrl = unlockUrl;
    }

    public static /* synthetic */ CarrierUnlockGuide copy$default(CarrierUnlockGuide carrierUnlockGuide, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = carrierUnlockGuide.carrierName;
        }
        if ((i5 & 2) != 0) {
            str2 = carrierUnlockGuide.unlockUrl;
        }
        return carrierUnlockGuide.copy(str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getCarrierName() {
        return this.carrierName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getUnlockUrl() {
        return this.unlockUrl;
    }

    @NotNull
    public final CarrierUnlockGuide copy(@NotNull String carrierName, @NotNull String unlockUrl) {
        Intrinsics.g(carrierName, "carrierName");
        Intrinsics.g(unlockUrl, "unlockUrl");
        return new CarrierUnlockGuide(carrierName, unlockUrl);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CarrierUnlockGuide)) {
            return false;
        }
        CarrierUnlockGuide carrierUnlockGuide = (CarrierUnlockGuide) other;
        return Intrinsics.b(this.carrierName, carrierUnlockGuide.carrierName) && Intrinsics.b(this.unlockUrl, carrierUnlockGuide.unlockUrl);
    }

    @NotNull
    public final String getCarrierName() {
        return this.carrierName;
    }

    @NotNull
    public final String getUnlockUrl() {
        return this.unlockUrl;
    }

    public int hashCode() {
        return this.unlockUrl.hashCode() + (this.carrierName.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return c0.n("CarrierUnlockGuide(carrierName=", this.carrierName, ", unlockUrl=", this.unlockUrl, ")");
    }
}
