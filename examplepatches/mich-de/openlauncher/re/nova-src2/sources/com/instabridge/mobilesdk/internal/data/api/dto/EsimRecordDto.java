package com.instabridge.mobilesdk.internal.data.api.dto;

import a80.m;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 22\u00020\u0001:\u000212BO\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rB]\b\u0010\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\f\u0010\u0012J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÆ\u0003J\t\u0010 \u001a\u00020\u0005HÆ\u0003J\t\u0010!\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010#\u001a\u00020\u000bHÆ\u0003JQ\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\n\u001a\u00020\u000bHÆ\u0001J\u0013\u0010%\u001a\u00020\u000b2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020\u000fHÖ\u0001J\t\u0010(\u001a\u00020\u0005HÖ\u0001J%\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020\u00002\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020/H\u0001¢\u0006\u0002\b0R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0016R\u0011\u0010\u0007\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0016R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0016R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0016R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001c¨\u00063"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/EsimRecordDto;", b.f42142b, "id", b.f42142b, EsimInstallStore.KEY_ICCID, b.f42142b, "activationCode", "manualActivationCode", "smdpAddress", "purchaseDate", EsimInstallStore.KEY_INSTALLED, b.f42142b, "<init>", "(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getId", "()J", "getIccid", "()Ljava/lang/String;", "getActivationCode", "getManualActivationCode", "getSmdpAddress", "getPurchaseDate", "getInstalled", "()Z", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class EsimRecordDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String activationCode;

    @NotNull
    private final String iccid;
    private final long id;
    private final boolean installed;

    @NotNull
    private final String manualActivationCode;

    @Nullable
    private final String purchaseDate;

    @NotNull
    private final String smdpAddress;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/EsimRecordDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/EsimRecordDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<EsimRecordDto> serializer() {
            return EsimRecordDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public EsimRecordDto() {
        this(0L, (String) null, (String) null, (String) null, (String) null, (String) null, false, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ EsimRecordDto copy$default(EsimRecordDto esimRecordDto, long j11, String str, String str2, String str3, String str4, String str5, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = esimRecordDto.id;
        }
        long j12 = j11;
        if ((i5 & 2) != 0) {
            str = esimRecordDto.iccid;
        }
        String str6 = str;
        if ((i5 & 4) != 0) {
            str2 = esimRecordDto.activationCode;
        }
        String str7 = str2;
        if ((i5 & 8) != 0) {
            str3 = esimRecordDto.manualActivationCode;
        }
        String str8 = str3;
        if ((i5 & 16) != 0) {
            str4 = esimRecordDto.smdpAddress;
        }
        return esimRecordDto.copy(j12, str6, str7, str8, str4, (i5 & 32) != 0 ? esimRecordDto.purchaseDate : str5, (i5 & 64) != 0 ? esimRecordDto.installed : z11);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(EsimRecordDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.id != 0) {
            output.encodeLongElement(serialDesc, 0, self.id);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || !Intrinsics.b(self.iccid, b.f42142b)) {
            output.encodeStringElement(serialDesc, 1, self.iccid);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || !Intrinsics.b(self.activationCode, b.f42142b)) {
            output.encodeStringElement(serialDesc, 2, self.activationCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.manualActivationCode, b.f42142b)) {
            output.encodeStringElement(serialDesc, 3, self.manualActivationCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || !Intrinsics.b(self.smdpAddress, b.f42142b)) {
            output.encodeStringElement(serialDesc, 4, self.smdpAddress);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.purchaseDate != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.purchaseDate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.installed) {
            output.encodeBooleanElement(serialDesc, 6, self.installed);
        }
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
    public final String getManualActivationCode() {
        return this.manualActivationCode;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    /* renamed from: component7, reason: from getter */
    public final boolean getInstalled() {
        return this.installed;
    }

    @NotNull
    public final EsimRecordDto copy(long id2, @NotNull String iccid, @NotNull String activationCode, @NotNull String manualActivationCode, @NotNull String smdpAddress, @Nullable String purchaseDate, boolean installed) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        return new EsimRecordDto(id2, iccid, activationCode, manualActivationCode, smdpAddress, purchaseDate, installed);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EsimRecordDto)) {
            return false;
        }
        EsimRecordDto esimRecordDto = (EsimRecordDto) other;
        return this.id == esimRecordDto.id && Intrinsics.b(this.iccid, esimRecordDto.iccid) && Intrinsics.b(this.activationCode, esimRecordDto.activationCode) && Intrinsics.b(this.manualActivationCode, esimRecordDto.manualActivationCode) && Intrinsics.b(this.smdpAddress, esimRecordDto.smdpAddress) && Intrinsics.b(this.purchaseDate, esimRecordDto.purchaseDate) && this.installed == esimRecordDto.installed;
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
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    @NotNull
    public final String getSmdpAddress() {
        return this.smdpAddress;
    }

    public int hashCode() {
        int iE = c0.e(c0.e(c0.e(c0.e(Long.hashCode(this.id) * 31, 31, this.iccid), 31, this.activationCode), 31, this.manualActivationCode), 31, this.smdpAddress);
        String str = this.purchaseDate;
        return Boolean.hashCode(this.installed) + ((iE + (str == null ? 0 : str.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        long j11 = this.id;
        String str = this.iccid;
        String str2 = this.activationCode;
        String str3 = this.manualActivationCode;
        String str4 = this.smdpAddress;
        String str5 = this.purchaseDate;
        boolean z11 = this.installed;
        StringBuilder sbL = m.l(j11, "EsimRecordDto(id=", ", iccid=", str);
        c0.D(sbL, ", activationCode=", str2, ", manualActivationCode=", str3);
        c0.D(sbL, ", smdpAddress=", str4, ", purchaseDate=", str5);
        sbL.append(", installed=");
        sbL.append(z11);
        sbL.append(")");
        return sbL.toString();
    }

    public /* synthetic */ EsimRecordDto(int i5, long j11, String str, String str2, String str3, String str4, String str5, boolean z11, SerializationConstructorMarker serializationConstructorMarker) {
        this.id = (i5 & 1) == 0 ? 0L : j11;
        if ((i5 & 2) == 0) {
            this.iccid = b.f42142b;
        } else {
            this.iccid = str;
        }
        if ((i5 & 4) == 0) {
            this.activationCode = b.f42142b;
        } else {
            this.activationCode = str2;
        }
        if ((i5 & 8) == 0) {
            this.manualActivationCode = b.f42142b;
        } else {
            this.manualActivationCode = str3;
        }
        if ((i5 & 16) == 0) {
            this.smdpAddress = b.f42142b;
        } else {
            this.smdpAddress = str4;
        }
        if ((i5 & 32) == 0) {
            this.purchaseDate = null;
        } else {
            this.purchaseDate = str5;
        }
        if ((i5 & 64) == 0) {
            this.installed = false;
        } else {
            this.installed = z11;
        }
    }

    public EsimRecordDto(long j11, @NotNull String iccid, @NotNull String activationCode, @NotNull String manualActivationCode, @NotNull String smdpAddress, @Nullable String str, boolean z11) {
        Intrinsics.g(iccid, "iccid");
        Intrinsics.g(activationCode, "activationCode");
        Intrinsics.g(manualActivationCode, "manualActivationCode");
        Intrinsics.g(smdpAddress, "smdpAddress");
        this.id = j11;
        this.iccid = iccid;
        this.activationCode = activationCode;
        this.manualActivationCode = manualActivationCode;
        this.smdpAddress = smdpAddress;
        this.purchaseDate = str;
        this.installed = z11;
    }

    public /* synthetic */ EsimRecordDto(long j11, String str, String str2, String str3, String str4, String str5, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? 0L : j11, (i5 & 2) != 0 ? b.f42142b : str, (i5 & 4) != 0 ? b.f42142b : str2, (i5 & 8) != 0 ? b.f42142b : str3, (i5 & 16) == 0 ? str4 : b.f42142b, (i5 & 32) != 0 ? null : str5, (i5 & 64) != 0 ? false : z11);
    }
}
