package com.vungle.ads;

import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.Serializable;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0014\n\u0002\u0010$\n\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001)J\u0013\u0010\u0005\u001a\u00020\u00042\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0096\u0002J\b\u0010\u0007\u001a\u00020\u0006H\u0016R\u0017\u0010\r\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0013\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0016\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0010\u001a\u0004\b\u0015\u0010\u0012R\u0017\u0010\u0019\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0010\u001a\u0004\b\u0018\u0010\u0012R\u0017\u0010\u001e\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u0017\u0010!\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001f\u0010 \u001a\u0004\b!\u0010\"R%\u0010(\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e\u0018\u00010#8\u0006¢\u0006\f\n\u0004\b$\u0010%\u001a\u0004\b&\u0010'¨\u0006*"}, d2 = {"Lcom/vungle/ads/VungleCSBData;", "Ljava/io/Serializable;", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", b.f42142b, "hashCode", b.f42142b, "a", "D", "getBidFloor", "()D", "bidFloor", b.f42142b, "b", "Ljava/lang/String;", "getAuctionId", "()Ljava/lang/String;", "auctionId", "c", "getCreativeId", "creativeId", "d", "getAdUnitId", "adUnitId", "e", "I", "getPhase", "()I", "phase", InneractiveMediationDefs.GENDER_FEMALE, "Z", "isVXWinner", "()Z", b.f42142b, "g", "Ljava/util/Map;", "getExtras", "()Ljava/util/Map;", "extras", "Builder", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class VungleCSBData implements Serializable {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final double bidFloor;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final String auctionId;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final String creativeId;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public final String adUnitId;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    public final int phase;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    public final boolean isVXWinner;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    public final Map extras;

    @Metadata(bv = {}, d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0003\u001a\u00020\u00002\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002J\u0010\u0010\u0004\u001a\u00020\u00002\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002J\u0010\u0010\u0005\u001a\u00020\u00002\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002J\u000e\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0006J\u000e\u0010\b\u001a\u00020\u00002\u0006\u0010\b\u001a\u00020\u0006J\u001c\u0010\u000b\u001a\u00020\u00002\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0002\u0018\u00010\tJ\u0006\u0010\r\u001a\u00020\f¨\u0006\u0012"}, d2 = {"Lcom/vungle/ads/VungleCSBData$Builder;", b.f42142b, b.f42142b, "auctionId", "creativeId", "adUnitId", b.f42142b, "isPriorityAccess", "isVXWinner", b.f42142b, "extras", "putExtras", "Lcom/vungle/ads/VungleCSBData;", "build", b.f42142b, "bidFloor", "<init>", "(D)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
    public static final class Builder {

        /* renamed from: a, reason: collision with root package name */
        public final double f46675a;

        /* renamed from: b, reason: collision with root package name */
        public String f46676b;

        /* renamed from: c, reason: collision with root package name */
        public String f46677c;

        /* renamed from: d, reason: collision with root package name */
        public String f46678d;

        /* renamed from: e, reason: collision with root package name */
        public boolean f46679e;

        /* renamed from: f, reason: collision with root package name */
        public boolean f46680f;

        /* renamed from: g, reason: collision with root package name */
        public Map f46681g;

        public Builder(double d5) {
            this.f46675a = d5;
        }

        @NotNull
        public final Builder adUnitId(@Nullable String adUnitId) {
            this.f46678d = adUnitId;
            return this;
        }

        @NotNull
        public final Builder auctionId(@Nullable String auctionId) {
            this.f46676b = auctionId;
            return this;
        }

        @NotNull
        public final VungleCSBData build() {
            double d5 = this.f46675a;
            String str = this.f46676b;
            String str2 = b.f42142b;
            if (str == null) {
                str = b.f42142b;
            }
            String str3 = this.f46677c;
            if (str3 == null) {
                str3 = b.f42142b;
            }
            String str4 = this.f46678d;
            if (str4 != null) {
                str2 = str4;
            }
            return new VungleCSBData(d5, str, str3, str2, this.f46680f ? 2 : 1, this.f46679e, this.f46681g, null);
        }

        @NotNull
        public final Builder creativeId(@Nullable String creativeId) {
            this.f46677c = creativeId;
            return this;
        }

        @NotNull
        public final Builder isPriorityAccess(boolean isPriorityAccess) {
            this.f46680f = isPriorityAccess;
            return this;
        }

        @NotNull
        public final Builder isVXWinner(boolean isVXWinner) {
            this.f46679e = isVXWinner;
            return this;
        }

        @NotNull
        public final Builder putExtras(@Nullable Map<String, String> extras) {
            this.f46681g = extras;
            return this;
        }
    }

    public /* synthetic */ VungleCSBData(double d5, String str, String str2, String str3, int i5, boolean z11, Map map, DefaultConstructorMarker defaultConstructorMarker) {
        this(d5, str, str2, str3, i5, z11, map);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof VungleCSBData)) {
            return false;
        }
        VungleCSBData vungleCSBData = (VungleCSBData) other;
        return Double.compare(this.bidFloor, vungleCSBData.bidFloor) == 0 && Intrinsics.b(this.auctionId, vungleCSBData.auctionId) && Intrinsics.b(this.creativeId, vungleCSBData.creativeId) && Intrinsics.b(this.adUnitId, vungleCSBData.adUnitId) && this.phase == vungleCSBData.phase && this.isVXWinner == vungleCSBData.isVXWinner && Intrinsics.b(this.extras, vungleCSBData.extras);
    }

    @NotNull
    public final String getAdUnitId() {
        return this.adUnitId;
    }

    @NotNull
    public final String getAuctionId() {
        return this.auctionId;
    }

    public final double getBidFloor() {
        return this.bidFloor;
    }

    @NotNull
    public final String getCreativeId() {
        return this.creativeId;
    }

    @Nullable
    public final Map<String, String> getExtras() {
        return this.extras;
    }

    public final int getPhase() {
        return this.phase;
    }

    public int hashCode() {
        int iF = c9.f((c0.e(c0.e(c0.e(Double.hashCode(this.bidFloor) * 31, 31, this.auctionId), 31, this.creativeId), 31, this.adUnitId) + this.phase) * 31, 31, this.isVXWinner);
        Map map = this.extras;
        return iF + (map != null ? map.hashCode() : 0);
    }

    /* renamed from: isVXWinner, reason: from getter */
    public final boolean getIsVXWinner() {
        return this.isVXWinner;
    }

    public VungleCSBData(double d5, String str, String str2, String str3, int i5, boolean z11, Map map) {
        this.bidFloor = d5;
        this.auctionId = str;
        this.creativeId = str2;
        this.adUnitId = str3;
        this.phase = i5;
        this.isVXWinner = z11;
        this.extras = map;
    }
}
