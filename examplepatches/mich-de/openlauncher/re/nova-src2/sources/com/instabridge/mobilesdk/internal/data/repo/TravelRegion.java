package com.instabridge.mobilesdk.internal.data.repo;

import a80.m;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0081\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J-\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0001J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u000fHÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/TravelRegion;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, PendingUpgradeStore.KEY_NAME, "countryCodes", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getCode", "()Ljava/lang/String;", "getName", "getCountryCodes", "()Ljava/util/List;", "countryCount", b.f42142b, "getCountryCount", "()I", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class TravelRegion {
    public static final int $stable = 8;

    @NotNull
    private final String code;

    @NotNull
    private final List<String> countryCodes;

    @NotNull
    private final String name;

    public TravelRegion(@NotNull String code, @NotNull String name, @NotNull List<String> countryCodes) {
        Intrinsics.g(code, "code");
        Intrinsics.g(name, "name");
        Intrinsics.g(countryCodes, "countryCodes");
        this.code = code;
        this.name = name;
        this.countryCodes = countryCodes;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ TravelRegion copy$default(TravelRegion travelRegion, String str, String str2, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = travelRegion.code;
        }
        if ((i5 & 2) != 0) {
            str2 = travelRegion.name;
        }
        if ((i5 & 4) != 0) {
            list = travelRegion.countryCodes;
        }
        return travelRegion.copy(str, str2, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getCode() {
        return this.code;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final List<String> component3() {
        return this.countryCodes;
    }

    @NotNull
    public final TravelRegion copy(@NotNull String code, @NotNull String name, @NotNull List<String> countryCodes) {
        Intrinsics.g(code, "code");
        Intrinsics.g(name, "name");
        Intrinsics.g(countryCodes, "countryCodes");
        return new TravelRegion(code, name, countryCodes);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TravelRegion)) {
            return false;
        }
        TravelRegion travelRegion = (TravelRegion) other;
        return Intrinsics.b(this.code, travelRegion.code) && Intrinsics.b(this.name, travelRegion.name) && Intrinsics.b(this.countryCodes, travelRegion.countryCodes);
    }

    @NotNull
    public final String getCode() {
        return this.code;
    }

    @NotNull
    public final List<String> getCountryCodes() {
        return this.countryCodes;
    }

    public final int getCountryCount() {
        return this.countryCodes.size();
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public int hashCode() {
        return this.countryCodes.hashCode() + c0.e(this.code.hashCode() * 31, 31, this.name);
    }

    @NotNull
    public String toString() {
        String str = this.code;
        String str2 = this.name;
        return m.j(c0.w("TravelRegion(code=", str, ", name=", str2, ", countryCodes="), this.countryCodes, ")");
    }

    public TravelRegion(String str, String str2, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? EmptyList.f71733a : list);
    }
}
