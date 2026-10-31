package com.instabridge.mobilesdk.internal.data.api.dto;

import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b!\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 =2\u00020\u0001:\u0002<=Bs\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u000f\u0010\u0010Bu\b\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0007\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0004\b\u000f\u0010\u0014J\u0010\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016J\u000b\u0010&\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0010\u0010'\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u001bJ\u000b\u0010(\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010)\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0010\u0010*\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0002\u0010 J\u000b\u0010+\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0010\u0010,\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u001bJ\u0010\u0010-\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016Jz\u0010.\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010/J\u0013\u00100\u001a\u00020\u000b2\b\u00101\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00102\u001a\u00020\u0007HÖ\u0001J\t\u00103\u001a\u00020\u0005HÖ\u0001J%\u00104\u001a\u0002052\u0006\u00106\u001a\u00020\u00002\u0006\u00107\u001a\u0002082\u0006\u00109\u001a\u00020:H\u0001¢\u0006\u0002\b;R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0019R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0019R\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\n\n\u0002\u0010!\u001a\u0004\b\u001f\u0010 R\u0013\u0010\f\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0019R\u0015\u0010\r\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b#\u0010\u001bR\u0015\u0010\u000e\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b$\u0010\u0016¨\u0006>"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", b.f42142b, "amount", b.f42142b, TrackingOptions.AMP_TRACKING_OPTION_REGION, b.f42142b, "durationHours", b.f42142b, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, TTConst.TRACK_TYPE, "subscription", b.f42142b, "interval", "intervalCount", "packageId", "<init>", "(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/Long;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getAmount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getRegion", "()Ljava/lang/String;", "getDurationHours", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getCurrency", "getType", "getSubscription", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getInterval", "getIntervalCount", "getPackageId", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;)Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PlanDetails {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Long amount;

    @Nullable
    private final String currency;

    @Nullable
    private final Integer durationHours;

    @Nullable
    private final String interval;

    @Nullable
    private final Integer intervalCount;

    @Nullable
    private final Long packageId;

    @Nullable
    private final String region;

    @Nullable
    private final Boolean subscription;

    @Nullable
    private final String type;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PlanDetails> serializer() {
            return PlanDetails$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PlanDetails() {
        this((Long) null, (String) null, (Integer) null, (String) null, (String) null, (Boolean) null, (String) null, (Integer) null, (Long) null, 511, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ PlanDetails copy$default(PlanDetails planDetails, Long l9, String str, Integer num, String str2, String str3, Boolean bool, String str4, Integer num2, Long l11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            l9 = planDetails.amount;
        }
        if ((i5 & 2) != 0) {
            str = planDetails.region;
        }
        if ((i5 & 4) != 0) {
            num = planDetails.durationHours;
        }
        if ((i5 & 8) != 0) {
            str2 = planDetails.currency;
        }
        if ((i5 & 16) != 0) {
            str3 = planDetails.type;
        }
        if ((i5 & 32) != 0) {
            bool = planDetails.subscription;
        }
        if ((i5 & 64) != 0) {
            str4 = planDetails.interval;
        }
        if ((i5 & 128) != 0) {
            num2 = planDetails.intervalCount;
        }
        if ((i5 & 256) != 0) {
            l11 = planDetails.packageId;
        }
        Integer num3 = num2;
        Long l12 = l11;
        Boolean bool2 = bool;
        String str5 = str4;
        String str6 = str3;
        Integer num4 = num;
        return planDetails.copy(l9, str, num4, str2, str6, bool2, str5, num3, l12);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PlanDetails self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.amount != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, LongSerializer.INSTANCE, self.amount);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.region != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.region);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.durationHours != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, IntSerializer.INSTANCE, self.durationHours);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.currency != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.currency);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.type != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.type);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.subscription != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, BooleanSerializer.INSTANCE, self.subscription);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.interval != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.interval);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.intervalCount != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, IntSerializer.INSTANCE, self.intervalCount);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 8) && self.packageId == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 8, LongSerializer.INSTANCE, self.packageId);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final Long getAmount() {
        return this.amount;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getRegion() {
        return this.region;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Integer getDurationHours() {
        return this.durationHours;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Boolean getSubscription() {
        return this.subscription;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getInterval() {
        return this.interval;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final Integer getIntervalCount() {
        return this.intervalCount;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final Long getPackageId() {
        return this.packageId;
    }

    @NotNull
    public final PlanDetails copy(@Nullable Long amount, @Nullable String region, @Nullable Integer durationHours, @Nullable String currency, @Nullable String type, @Nullable Boolean subscription, @Nullable String interval, @Nullable Integer intervalCount, @Nullable Long packageId) {
        return new PlanDetails(amount, region, durationHours, currency, type, subscription, interval, intervalCount, packageId);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PlanDetails)) {
            return false;
        }
        PlanDetails planDetails = (PlanDetails) other;
        return Intrinsics.b(this.amount, planDetails.amount) && Intrinsics.b(this.region, planDetails.region) && Intrinsics.b(this.durationHours, planDetails.durationHours) && Intrinsics.b(this.currency, planDetails.currency) && Intrinsics.b(this.type, planDetails.type) && Intrinsics.b(this.subscription, planDetails.subscription) && Intrinsics.b(this.interval, planDetails.interval) && Intrinsics.b(this.intervalCount, planDetails.intervalCount) && Intrinsics.b(this.packageId, planDetails.packageId);
    }

    @Nullable
    public final Long getAmount() {
        return this.amount;
    }

    @Nullable
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    public final Integer getDurationHours() {
        return this.durationHours;
    }

    @Nullable
    public final String getInterval() {
        return this.interval;
    }

    @Nullable
    public final Integer getIntervalCount() {
        return this.intervalCount;
    }

    @Nullable
    public final Long getPackageId() {
        return this.packageId;
    }

    @Nullable
    public final String getRegion() {
        return this.region;
    }

    @Nullable
    public final Boolean getSubscription() {
        return this.subscription;
    }

    @Nullable
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        Long l9 = this.amount;
        int iHashCode = (l9 == null ? 0 : l9.hashCode()) * 31;
        String str = this.region;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.durationHours;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        String str2 = this.currency;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.type;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Boolean bool = this.subscription;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str4 = this.interval;
        int iHashCode7 = (iHashCode6 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Integer num2 = this.intervalCount;
        int iHashCode8 = (iHashCode7 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Long l11 = this.packageId;
        return iHashCode8 + (l11 != null ? l11.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "PlanDetails(amount=" + this.amount + ", region=" + this.region + ", durationHours=" + this.durationHours + ", currency=" + this.currency + ", type=" + this.type + ", subscription=" + this.subscription + ", interval=" + this.interval + ", intervalCount=" + this.intervalCount + ", packageId=" + this.packageId + ")";
    }

    public /* synthetic */ PlanDetails(int i5, Long l9, String str, Integer num, String str2, String str3, Boolean bool, String str4, Integer num2, Long l11, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.amount = null;
        } else {
            this.amount = l9;
        }
        if ((i5 & 2) == 0) {
            this.region = null;
        } else {
            this.region = str;
        }
        if ((i5 & 4) == 0) {
            this.durationHours = null;
        } else {
            this.durationHours = num;
        }
        if ((i5 & 8) == 0) {
            this.currency = null;
        } else {
            this.currency = str2;
        }
        if ((i5 & 16) == 0) {
            this.type = null;
        } else {
            this.type = str3;
        }
        if ((i5 & 32) == 0) {
            this.subscription = null;
        } else {
            this.subscription = bool;
        }
        if ((i5 & 64) == 0) {
            this.interval = null;
        } else {
            this.interval = str4;
        }
        if ((i5 & 128) == 0) {
            this.intervalCount = null;
        } else {
            this.intervalCount = num2;
        }
        if ((i5 & 256) == 0) {
            this.packageId = null;
        } else {
            this.packageId = l11;
        }
    }

    public PlanDetails(@Nullable Long l9, @Nullable String str, @Nullable Integer num, @Nullable String str2, @Nullable String str3, @Nullable Boolean bool, @Nullable String str4, @Nullable Integer num2, @Nullable Long l11) {
        this.amount = l9;
        this.region = str;
        this.durationHours = num;
        this.currency = str2;
        this.type = str3;
        this.subscription = bool;
        this.interval = str4;
        this.intervalCount = num2;
        this.packageId = l11;
    }

    public /* synthetic */ PlanDetails(Long l9, String str, Integer num, String str2, String str3, Boolean bool, String str4, Integer num2, Long l11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : l9, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : num, (i5 & 8) != 0 ? null : str2, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : bool, (i5 & 64) != 0 ? null : str4, (i5 & 128) != 0 ? null : num2, (i5 & 256) != 0 ? null : l11);
    }
}
