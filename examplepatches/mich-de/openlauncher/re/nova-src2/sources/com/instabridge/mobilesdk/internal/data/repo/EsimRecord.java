package com.instabridge.mobilesdk.internal.data.repo;

import a80.m;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0017\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u001e\u001a\u00020\u000bHÆ\u0003JQ\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\n\u001a\u00020\u000bHÆ\u0001J\u0013\u0010 \u001a\u00020\u000b2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\"\u001a\u00020#HÖ\u0001J\t\u0010$\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006%"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;", b.f42142b, "id", b.f42142b, EsimInstallStore.KEY_ICCID, b.f42142b, "activationCode", "smdpAddress", "manualActivationCode", "purchasedAt", EsimInstallStore.KEY_INSTALLED, b.f42142b, "<init>", "(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "getId", "()J", "getIccid", "()Ljava/lang/String;", "getActivationCode", "getSmdpAddress", "getManualActivationCode", "getPurchasedAt", "getInstalled", "()Z", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class EsimRecord {
    public static final int $stable = 0;

    @NotNull
    private final String activationCode;

    @NotNull
    private final String iccid;
    private final long id;
    private final boolean installed;

    @NotNull
    private final String manualActivationCode;

    @Nullable
    private final String purchasedAt;

    @NotNull
    private final String smdpAddress;

    public EsimRecord(long j11, @NotNull String iccid, @NotNull String activationCode, @NotNull String smdpAddress, @NotNull String manualActivationCode, @Nullable String str, boolean z11) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        this.id = j11;
        this.iccid = iccid;
        this.activationCode = activationCode;
        this.smdpAddress = smdpAddress;
        this.manualActivationCode = manualActivationCode;
        this.purchasedAt = str;
        this.installed = z11;
    }

    public static /* synthetic */ EsimRecord copy$default(EsimRecord esimRecord, long j11, String str, String str2, String str3, String str4, String str5, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = esimRecord.id;
        }
        long j12 = j11;
        if ((i5 & 2) != 0) {
            str = esimRecord.iccid;
        }
        String str6 = str;
        if ((i5 & 4) != 0) {
            str2 = esimRecord.activationCode;
        }
        String str7 = str2;
        if ((i5 & 8) != 0) {
            str3 = esimRecord.smdpAddress;
        }
        String str8 = str3;
        if ((i5 & 16) != 0) {
            str4 = esimRecord.manualActivationCode;
        }
        return esimRecord.copy(j12, str6, str7, str8, str4, (i5 & 32) != 0 ? esimRecord.purchasedAt : str5, (i5 & 64) != 0 ? esimRecord.installed : z11);
    }

    /* renamed from: component1, reason: from getter */
    public final long getId() {
        return this.id;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getIccid() {
        return this.iccid;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getActivationCode() {
        return this.activationCode;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final String getManualActivationCode() {
        return this.manualActivationCode;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getPurchasedAt() {
        return this.purchasedAt;
    }

    /* renamed from: component7, reason: from getter */
    public final boolean getInstalled() {
        return this.installed;
    }

    @NotNull
    public final EsimRecord copy(long id2, @NotNull String iccid, @NotNull String activationCode, @NotNull String smdpAddress, @NotNull String manualActivationCode, @Nullable String purchasedAt, boolean installed) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        return new EsimRecord(id2, iccid, activationCode, smdpAddress, manualActivationCode, purchasedAt, installed);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EsimRecord)) {
            return false;
        }
        EsimRecord esimRecord = (EsimRecord) other;
        return this.id == esimRecord.id && Intrinsics.b(this.iccid, esimRecord.iccid) && Intrinsics.b(this.activationCode, esimRecord.activationCode) && Intrinsics.b(this.smdpAddress, esimRecord.smdpAddress) && Intrinsics.b(this.manualActivationCode, esimRecord.manualActivationCode) && Intrinsics.b(this.purchasedAt, esimRecord.purchasedAt) && this.installed == esimRecord.installed;
    }

    @NotNull
    public final String getActivationCode() {
        return this.activationCode;
    }

    @NotNull
    public final String getIccid() {
        return this.iccid;
    }

    public final long getId() {
        return this.id;
    }

    public final boolean getInstalled() {
        return this.installed;
    }

    @NotNull
    public final String getManualActivationCode() {
        return this.manualActivationCode;
    }

    @Nullable
    public final String getPurchasedAt() {
        return this.purchasedAt;
    }

    @NotNull
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    public int hashCode() {
        int iE = c0.e(c0.e(c0.e(c0.e(Long.hashCode(this.id) * 31, 31, this.iccid), 31, this.activationCode), 31, this.smdpAddress), 31, this.manualActivationCode);
        String str = this.purchasedAt;
        return Boolean.hashCode(this.installed) + ((iE + (str == null ? 0 : str.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        long j11 = this.id;
        String str = this.iccid;
        String str2 = this.activationCode;
        String str3 = this.smdpAddress;
        String str4 = this.manualActivationCode;
        String str5 = this.purchasedAt;
        boolean z11 = this.installed;
        StringBuilder sbL = m.l(j11, "EsimRecord(id=", ", iccid=", str);
        c0.D(sbL, ", activationCode=", str2, ", smdpAddress=", str3);
        c0.D(sbL, ", manualActivationCode=", str4, ", purchasedAt=", str5);
        sbL.append(", installed=");
        sbL.append(z11);
        sbL.append(")");
        return sbL.toString();
    }
}
