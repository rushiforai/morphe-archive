package com.instabridge.ai.context.collectors;

import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0014\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001BA\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u000fJ\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003JH\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u0019J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0006HÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\fR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\f¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/context/collectors/ConnectivityData;", b.f42142b, "networkType", b.f42142b, "wifiSsid", "wifiSignalStrength", b.f42142b, TrackingOptions.AMP_TRACKING_OPTION_CARRIER, "cellularType", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V", "getNetworkType", "()Ljava/lang/String;", "getWifiSsid", "getWifiSignalStrength", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getCarrier", "getCellularType", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/ai/context/collectors/ConnectivityData;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ConnectivityData {
    public static final int $stable = 0;

    @Nullable
    private final String carrier;

    @Nullable
    private final String cellularType;

    @NotNull
    private final String networkType;

    @Nullable
    private final Integer wifiSignalStrength;

    @Nullable
    private final String wifiSsid;

    public ConnectivityData() {
        this(null, null, null, null, null, 31, null);
    }

    public static /* synthetic */ ConnectivityData copy$default(ConnectivityData connectivityData, String str, String str2, Integer num, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = connectivityData.networkType;
        }
        if ((i5 & 2) != 0) {
            str2 = connectivityData.wifiSsid;
        }
        if ((i5 & 4) != 0) {
            num = connectivityData.wifiSignalStrength;
        }
        if ((i5 & 8) != 0) {
            str3 = connectivityData.carrier;
        }
        if ((i5 & 16) != 0) {
            str4 = connectivityData.cellularType;
        }
        String str5 = str4;
        Integer num2 = num;
        return connectivityData.copy(str, str2, num2, str3, str5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getNetworkType() {
        return this.networkType;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getWifiSsid() {
        return this.wifiSsid;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Integer getWifiSignalStrength() {
        return this.wifiSignalStrength;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getCarrier() {
        return this.carrier;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getCellularType() {
        return this.cellularType;
    }

    @NotNull
    public final ConnectivityData copy(@NotNull String networkType, @Nullable String wifiSsid, @Nullable Integer wifiSignalStrength, @Nullable String carrier, @Nullable String cellularType) {
        Intrinsics.g(networkType, "networkType");
        return new ConnectivityData(networkType, wifiSsid, wifiSignalStrength, carrier, cellularType);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ConnectivityData)) {
            return false;
        }
        ConnectivityData connectivityData = (ConnectivityData) other;
        return Intrinsics.b(this.networkType, connectivityData.networkType) && Intrinsics.b(this.wifiSsid, connectivityData.wifiSsid) && Intrinsics.b(this.wifiSignalStrength, connectivityData.wifiSignalStrength) && Intrinsics.b(this.carrier, connectivityData.carrier) && Intrinsics.b(this.cellularType, connectivityData.cellularType);
    }

    @Nullable
    public final String getCarrier() {
        return this.carrier;
    }

    @Nullable
    public final String getCellularType() {
        return this.cellularType;
    }

    @NotNull
    public final String getNetworkType() {
        return this.networkType;
    }

    @Nullable
    public final Integer getWifiSignalStrength() {
        return this.wifiSignalStrength;
    }

    @Nullable
    public final String getWifiSsid() {
        return this.wifiSsid;
    }

    public int hashCode() {
        int iHashCode = this.networkType.hashCode() * 31;
        String str = this.wifiSsid;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.wifiSignalStrength;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.carrier;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.cellularType;
        return iHashCode4 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ConnectivityData(networkType=");
        sb2.append(this.networkType);
        sb2.append(", wifiSsid=");
        sb2.append(this.wifiSsid);
        sb2.append(", wifiSignalStrength=");
        sb2.append(this.wifiSignalStrength);
        sb2.append(", carrier=");
        sb2.append(this.carrier);
        sb2.append(", cellularType=");
        return c1.t(sb2, this.cellularType, ')');
    }

    public ConnectivityData(@NotNull String networkType, @Nullable String str, @Nullable Integer num, @Nullable String str2, @Nullable String str3) {
        Intrinsics.g(networkType, "networkType");
        this.networkType = networkType;
        this.wifiSsid = str;
        this.wifiSignalStrength = num;
        this.carrier = str2;
        this.cellularType = str3;
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    public /* synthetic */ ConnectivityData(java.lang.String r2, java.lang.String r3, java.lang.Integer r4, java.lang.String r5, java.lang.String r6, int r7, kotlin.jvm.internal.DefaultConstructorMarker r8) {
        /*
            r1 = this;
            r8 = r7 & 1
            if (r8 == 0) goto L6
            java.lang.String r2 = "Unknown"
        L6:
            r8 = r7 & 2
            r0 = 0
            if (r8 == 0) goto Lc
            r3 = r0
        Lc:
            r8 = r7 & 4
            if (r8 == 0) goto L11
            r4 = r0
        L11:
            r8 = r7 & 8
            if (r8 == 0) goto L16
            r5 = r0
        L16:
            r7 = r7 & 16
            if (r7 == 0) goto L21
            r8 = r0
            r6 = r4
            r7 = r5
            r4 = r2
            r5 = r3
            r3 = r1
            goto L27
        L21:
            r8 = r6
            r7 = r5
            r5 = r3
            r6 = r4
            r3 = r1
            r4 = r2
        L27:
            r3.<init>(r4, r5, r6, r7, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.instabridge.ai.context.collectors.ConnectivityData.<init>(java.lang.String, java.lang.String, java.lang.Integer, java.lang.String, java.lang.String, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }
}
