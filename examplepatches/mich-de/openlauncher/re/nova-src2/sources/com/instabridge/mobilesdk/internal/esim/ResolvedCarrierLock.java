package com.instabridge.mobilesdk.internal.esim;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B%\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0006HÆ\u0003J-\u0010\u0011\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/ResolvedCarrierLock;", b.f42142b, "carrierName", b.f42142b, "mccMnc", "guide", "Lcom/instabridge/mobilesdk/internal/esim/CarrierUnlockGuide;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/esim/CarrierUnlockGuide;)V", "getCarrierName", "()Ljava/lang/String;", "getMccMnc", "getGuide", "()Lcom/instabridge/mobilesdk/internal/esim/CarrierUnlockGuide;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ResolvedCarrierLock {
    public static final int $stable = 0;

    @Nullable
    private final String carrierName;

    @Nullable
    private final CarrierUnlockGuide guide;

    @Nullable
    private final String mccMnc;

    public ResolvedCarrierLock(@Nullable String str, @Nullable String str2, @Nullable CarrierUnlockGuide carrierUnlockGuide) {
        this.carrierName = str;
        this.mccMnc = str2;
        this.guide = carrierUnlockGuide;
    }

    public static /* synthetic */ ResolvedCarrierLock copy$default(ResolvedCarrierLock resolvedCarrierLock, String str, String str2, CarrierUnlockGuide carrierUnlockGuide, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = resolvedCarrierLock.carrierName;
        }
        if ((i5 & 2) != 0) {
            str2 = resolvedCarrierLock.mccMnc;
        }
        if ((i5 & 4) != 0) {
            carrierUnlockGuide = resolvedCarrierLock.guide;
        }
        return resolvedCarrierLock.copy(str, str2, carrierUnlockGuide);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getCarrierName() {
        return this.carrierName;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getMccMnc() {
        return this.mccMnc;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final CarrierUnlockGuide getGuide() {
        return this.guide;
    }

    @NotNull
    public final ResolvedCarrierLock copy(@Nullable String carrierName, @Nullable String mccMnc, @Nullable CarrierUnlockGuide guide) {
        return new ResolvedCarrierLock(carrierName, mccMnc, guide);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ResolvedCarrierLock)) {
            return false;
        }
        ResolvedCarrierLock resolvedCarrierLock = (ResolvedCarrierLock) other;
        return Intrinsics.b(this.carrierName, resolvedCarrierLock.carrierName) && Intrinsics.b(this.mccMnc, resolvedCarrierLock.mccMnc) && Intrinsics.b(this.guide, resolvedCarrierLock.guide);
    }

    @Nullable
    public final String getCarrierName() {
        return this.carrierName;
    }

    @Nullable
    public final CarrierUnlockGuide getGuide() {
        return this.guide;
    }

    @Nullable
    public final String getMccMnc() {
        return this.mccMnc;
    }

    public int hashCode() {
        String str = this.carrierName;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.mccMnc;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        CarrierUnlockGuide carrierUnlockGuide = this.guide;
        return iHashCode2 + (carrierUnlockGuide != null ? carrierUnlockGuide.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.carrierName;
        String str2 = this.mccMnc;
        CarrierUnlockGuide carrierUnlockGuide = this.guide;
        StringBuilder sbW = c0.w("ResolvedCarrierLock(carrierName=", str, ", mccMnc=", str2, ", guide=");
        sbW.append(carrierUnlockGuide);
        sbW.append(")");
        return sbW.toString();
    }
}
