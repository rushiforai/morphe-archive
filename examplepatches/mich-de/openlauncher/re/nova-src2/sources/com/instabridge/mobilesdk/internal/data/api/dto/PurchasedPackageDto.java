package com.instabridge.mobilesdk.internal.data.api.dto;

import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import com.amplitude.core.events.Plan;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b&\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 H2\u00020\u0001:\u0002GHB\u009d\u0001\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0014\u0010\u0015B\u0097\u0001\b\u0010\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0010\u001a\u00020\u000e\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u0014\u0010\u001aJ\u000b\u0010-\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010.\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010/\u001a\u00020\u0007HÆ\u0003J\u000b\u00100\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u00101\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u00102\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u00103\u001a\u0004\u0018\u00010\fHÆ\u0003J\t\u00104\u001a\u00020\u000eHÆ\u0003J\u000b\u00105\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u00106\u001a\u00020\u000eHÆ\u0003J\u000b\u00107\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u00108\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u00109\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u009f\u0001\u0010:\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0010\u001a\u00020\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010;\u001a\u00020\u000e2\b\u0010<\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010=\u001a\u00020\u0017HÖ\u0001J\t\u0010>\u001a\u00020\u0005HÖ\u0001J%\u0010?\u001a\u00020@2\u0006\u0010A\u001a\u00020\u00002\u0006\u0010B\u001a\u00020C2\u0006\u0010D\u001a\u00020EH\u0001¢\u0006\u0002\bFR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u001eR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u001eR\u0013\u0010\n\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001eR\u001e\u0010\u000b\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b$\u0010%\u001a\u0004\b&\u0010'R\u0011\u0010\r\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010(R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b)\u0010\u001eR\u0011\u0010\u0010\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010(R\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b*\u0010\u001cR\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b+\u0010\u001cR\u0013\u0010\u0013\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b,\u0010\u001e¨\u0006I"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackageDto;", b.f42142b, "mobileDataUsage", "Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;", "purchaseDate", b.f42142b, "purchaseId", b.f42142b, "startDate", "expirationDate", "regionCode", "packageModel", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;", "isSubscriptionCancelled", b.f42142b, "subscriptionEndDate", "isPending", "voiceUsage", "smsUsage", Plan.AMP_PLAN_SOURCE, "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;ZLjava/lang/String;ZLcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;ZLjava/lang/String;ZLcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getMobileDataUsage", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/UsageDto;", "getPurchaseDate", "()Ljava/lang/String;", "getPurchaseId", "()J", "getStartDate", "getExpirationDate", "getRegionCode", "getPackageModel$annotations", "()V", "getPackageModel", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;", "()Z", "getSubscriptionEndDate", "getVoiceUsage", "getSmsUsage", "getSource", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PurchasedPackageDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String expirationDate;
    private final boolean isPending;
    private final boolean isSubscriptionCancelled;

    @Nullable
    private final UsageDto mobileDataUsage;

    @Nullable
    private final PackageModelDto packageModel;

    @Nullable
    private final String purchaseDate;
    private final long purchaseId;

    @Nullable
    private final String regionCode;

    @Nullable
    private final UsageDto smsUsage;

    @Nullable
    private final String source;

    @Nullable
    private final String startDate;

    @Nullable
    private final String subscriptionEndDate;

    @Nullable
    private final UsageDto voiceUsage;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackageDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackageDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PurchasedPackageDto> serializer() {
            return PurchasedPackageDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PurchasedPackageDto() {
        this((UsageDto) null, (String) null, 0L, (String) null, (String) null, (String) null, (PackageModelDto) null, false, (String) null, false, (UsageDto) null, (UsageDto) null, (String) null, 8191, (DefaultConstructorMarker) null);
    }

    @SerialName("package")
    public static /* synthetic */ void getPackageModel$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PurchasedPackageDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.mobileDataUsage != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, UsageDto$$serializer.INSTANCE, self.mobileDataUsage);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.purchaseDate != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.purchaseDate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.purchaseId != 0) {
            output.encodeLongElement(serialDesc, 2, self.purchaseId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.startDate != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.startDate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.expirationDate != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.expirationDate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.regionCode != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.regionCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.packageModel != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, PackageModelDto$$serializer.INSTANCE, self.packageModel);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.isSubscriptionCancelled) {
            output.encodeBooleanElement(serialDesc, 7, self.isSubscriptionCancelled);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.subscriptionEndDate != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.subscriptionEndDate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.isPending) {
            output.encodeBooleanElement(serialDesc, 9, self.isPending);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.voiceUsage != null) {
            output.encodeNullableSerializableElement(serialDesc, 10, UsageDto$$serializer.INSTANCE, self.voiceUsage);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || self.smsUsage != null) {
            output.encodeNullableSerializableElement(serialDesc, 11, UsageDto$$serializer.INSTANCE, self.smsUsage);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 12) && self.source == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 12, StringSerializer.INSTANCE, self.source);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final UsageDto getMobileDataUsage() {
        return this.mobileDataUsage;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getIsPending() {
        return this.isPending;
    }

    @Nullable
    /* renamed from: component11, reason: from getter */
    public final UsageDto getVoiceUsage() {
        return this.voiceUsage;
    }

    @Nullable
    /* renamed from: component12, reason: from getter */
    public final UsageDto getSmsUsage() {
        return this.smsUsage;
    }

    @Nullable
    /* renamed from: component13, reason: from getter */
    public final String getSource() {
        return this.source;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    /* renamed from: component3, reason: from getter */
    public final long getPurchaseId() {
        return this.purchaseId;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getStartDate() {
        return this.startDate;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getExpirationDate() {
        return this.expirationDate;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getRegionCode() {
        return this.regionCode;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final PackageModelDto getPackageModel() {
        return this.packageModel;
    }

    /* renamed from: component8, reason: from getter */
    public final boolean getIsSubscriptionCancelled() {
        return this.isSubscriptionCancelled;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final String getSubscriptionEndDate() {
        return this.subscriptionEndDate;
    }

    @NotNull
    public final PurchasedPackageDto copy(@Nullable UsageDto mobileDataUsage, @Nullable String purchaseDate, long purchaseId, @Nullable String startDate, @Nullable String expirationDate, @Nullable String regionCode, @Nullable PackageModelDto packageModel, boolean isSubscriptionCancelled, @Nullable String subscriptionEndDate, boolean isPending, @Nullable UsageDto voiceUsage, @Nullable UsageDto smsUsage, @Nullable String source) {
        return new PurchasedPackageDto(mobileDataUsage, purchaseDate, purchaseId, startDate, expirationDate, regionCode, packageModel, isSubscriptionCancelled, subscriptionEndDate, isPending, voiceUsage, smsUsage, source);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedPackageDto)) {
            return false;
        }
        PurchasedPackageDto purchasedPackageDto = (PurchasedPackageDto) other;
        return Intrinsics.b(this.mobileDataUsage, purchasedPackageDto.mobileDataUsage) && Intrinsics.b(this.purchaseDate, purchasedPackageDto.purchaseDate) && this.purchaseId == purchasedPackageDto.purchaseId && Intrinsics.b(this.startDate, purchasedPackageDto.startDate) && Intrinsics.b(this.expirationDate, purchasedPackageDto.expirationDate) && Intrinsics.b(this.regionCode, purchasedPackageDto.regionCode) && Intrinsics.b(this.packageModel, purchasedPackageDto.packageModel) && this.isSubscriptionCancelled == purchasedPackageDto.isSubscriptionCancelled && Intrinsics.b(this.subscriptionEndDate, purchasedPackageDto.subscriptionEndDate) && this.isPending == purchasedPackageDto.isPending && Intrinsics.b(this.voiceUsage, purchasedPackageDto.voiceUsage) && Intrinsics.b(this.smsUsage, purchasedPackageDto.smsUsage) && Intrinsics.b(this.source, purchasedPackageDto.source);
    }

    @Nullable
    public final String getExpirationDate() {
        return this.expirationDate;
    }

    @Nullable
    public final UsageDto getMobileDataUsage() {
        return this.mobileDataUsage;
    }

    @Nullable
    public final PackageModelDto getPackageModel() {
        return this.packageModel;
    }

    @Nullable
    public final String getPurchaseDate() {
        return this.purchaseDate;
    }

    public final long getPurchaseId() {
        return this.purchaseId;
    }

    @Nullable
    public final String getRegionCode() {
        return this.regionCode;
    }

    @Nullable
    public final UsageDto getSmsUsage() {
        return this.smsUsage;
    }

    @Nullable
    public final String getSource() {
        return this.source;
    }

    @Nullable
    public final String getStartDate() {
        return this.startDate;
    }

    @Nullable
    public final String getSubscriptionEndDate() {
        return this.subscriptionEndDate;
    }

    @Nullable
    public final UsageDto getVoiceUsage() {
        return this.voiceUsage;
    }

    public int hashCode() {
        UsageDto usageDto = this.mobileDataUsage;
        int iHashCode = (usageDto == null ? 0 : usageDto.hashCode()) * 31;
        String str = this.purchaseDate;
        int iD = c0.d((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.purchaseId);
        String str2 = this.startDate;
        int iHashCode2 = (iD + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.expirationDate;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.regionCode;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        PackageModelDto packageModelDto = this.packageModel;
        int iF = c9.f((iHashCode4 + (packageModelDto == null ? 0 : packageModelDto.hashCode())) * 31, 31, this.isSubscriptionCancelled);
        String str5 = this.subscriptionEndDate;
        int iF2 = c9.f((iF + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.isPending);
        UsageDto usageDto2 = this.voiceUsage;
        int iHashCode5 = (iF2 + (usageDto2 == null ? 0 : usageDto2.hashCode())) * 31;
        UsageDto usageDto3 = this.smsUsage;
        int iHashCode6 = (iHashCode5 + (usageDto3 == null ? 0 : usageDto3.hashCode())) * 31;
        String str6 = this.source;
        return iHashCode6 + (str6 != null ? str6.hashCode() : 0);
    }

    public final boolean isPending() {
        return this.isPending;
    }

    public final boolean isSubscriptionCancelled() {
        return this.isSubscriptionCancelled;
    }

    @NotNull
    public String toString() {
        UsageDto usageDto = this.mobileDataUsage;
        String str = this.purchaseDate;
        long j11 = this.purchaseId;
        String str2 = this.startDate;
        String str3 = this.expirationDate;
        String str4 = this.regionCode;
        PackageModelDto packageModelDto = this.packageModel;
        boolean z11 = this.isSubscriptionCancelled;
        String str5 = this.subscriptionEndDate;
        boolean z12 = this.isPending;
        UsageDto usageDto2 = this.voiceUsage;
        UsageDto usageDto3 = this.smsUsage;
        String str6 = this.source;
        StringBuilder sb2 = new StringBuilder("PurchasedPackageDto(mobileDataUsage=");
        sb2.append(usageDto);
        sb2.append(", purchaseDate=");
        sb2.append(str);
        sb2.append(", purchaseId=");
        sb2.append(j11);
        sb2.append(", startDate=");
        sb2.append(str2);
        c0.D(sb2, ", expirationDate=", str3, ", regionCode=", str4);
        sb2.append(", packageModel=");
        sb2.append(packageModelDto);
        sb2.append(", isSubscriptionCancelled=");
        sb2.append(z11);
        sb2.append(", subscriptionEndDate=");
        sb2.append(str5);
        sb2.append(", isPending=");
        sb2.append(z12);
        sb2.append(", voiceUsage=");
        sb2.append(usageDto2);
        sb2.append(", smsUsage=");
        sb2.append(usageDto3);
        return c0.r(sb2, ", source=", str6, ")");
    }

    public /* synthetic */ PurchasedPackageDto(int i5, UsageDto usageDto, String str, long j11, String str2, String str3, String str4, PackageModelDto packageModelDto, boolean z11, String str5, boolean z12, UsageDto usageDto2, UsageDto usageDto3, String str6, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.mobileDataUsage = null;
        } else {
            this.mobileDataUsage = usageDto;
        }
        if ((i5 & 2) == 0) {
            this.purchaseDate = null;
        } else {
            this.purchaseDate = str;
        }
        if ((i5 & 4) == 0) {
            this.purchaseId = 0L;
        } else {
            this.purchaseId = j11;
        }
        if ((i5 & 8) == 0) {
            this.startDate = null;
        } else {
            this.startDate = str2;
        }
        if ((i5 & 16) == 0) {
            this.expirationDate = null;
        } else {
            this.expirationDate = str3;
        }
        if ((i5 & 32) == 0) {
            this.regionCode = null;
        } else {
            this.regionCode = str4;
        }
        if ((i5 & 64) == 0) {
            this.packageModel = null;
        } else {
            this.packageModel = packageModelDto;
        }
        if ((i5 & 128) == 0) {
            this.isSubscriptionCancelled = false;
        } else {
            this.isSubscriptionCancelled = z11;
        }
        if ((i5 & 256) == 0) {
            this.subscriptionEndDate = null;
        } else {
            this.subscriptionEndDate = str5;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.isPending = false;
        } else {
            this.isPending = z12;
        }
        if ((i5 & 1024) == 0) {
            this.voiceUsage = null;
        } else {
            this.voiceUsage = usageDto2;
        }
        if ((i5 & 2048) == 0) {
            this.smsUsage = null;
        } else {
            this.smsUsage = usageDto3;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.source = null;
        } else {
            this.source = str6;
        }
    }

    public PurchasedPackageDto(@Nullable UsageDto usageDto, @Nullable String str, long j11, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable PackageModelDto packageModelDto, boolean z11, @Nullable String str5, boolean z12, @Nullable UsageDto usageDto2, @Nullable UsageDto usageDto3, @Nullable String str6) {
        this.mobileDataUsage = usageDto;
        this.purchaseDate = str;
        this.purchaseId = j11;
        this.startDate = str2;
        this.expirationDate = str3;
        this.regionCode = str4;
        this.packageModel = packageModelDto;
        this.isSubscriptionCancelled = z11;
        this.subscriptionEndDate = str5;
        this.isPending = z12;
        this.voiceUsage = usageDto2;
        this.smsUsage = usageDto3;
        this.source = str6;
    }

    public /* synthetic */ PurchasedPackageDto(UsageDto usageDto, String str, long j11, String str2, String str3, String str4, PackageModelDto packageModelDto, boolean z11, String str5, boolean z12, UsageDto usageDto2, UsageDto usageDto3, String str6, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : usageDto, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? 0L : j11, (i5 & 8) != 0 ? null : str2, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : str4, (i5 & 64) != 0 ? null : packageModelDto, (i5 & 128) != 0 ? false : z11, (i5 & 256) != 0 ? null : str5, (i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? z12 : false, (i5 & 1024) != 0 ? null : usageDto2, (i5 & 2048) != 0 ? null : usageDto3, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str6);
    }
}
