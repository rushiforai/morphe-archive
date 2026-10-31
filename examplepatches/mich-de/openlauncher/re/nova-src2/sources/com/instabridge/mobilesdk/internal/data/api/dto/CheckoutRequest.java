package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
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
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 62\u00020\u0001:\u000256B[\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\r\u0010\u000eBa\b\u0010\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0012¢\u0006\u0004\b\r\u0010\u0013J\u000b\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u0010\u0010#\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0002\u0010\u001bJ\u000b\u0010$\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u0007HÆ\u0003Jb\u0010'\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010(J\u0013\u0010)\u001a\u00020\t2\b\u0010*\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010+\u001a\u00020\u0010HÖ\u0001J\t\u0010,\u001a\u00020\u0007HÖ\u0001J%\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u00020\u00002\u0006\u00100\u001a\u0002012\u0006\u00102\u001a\u000203H\u0001¢\u0006\u0002\b4R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0015\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\n\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0019R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0019R\u0013\u0010\f\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u0019¨\u00067"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutRequest;", b.f42142b, "planDetails", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "addressInfo", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "paymentIntent", b.f42142b, "calculateOnly", b.f42142b, "trackingId", "firstName", "lastName", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPlanDetails", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "getAddressInfo", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "getPaymentIntent", "()Ljava/lang/String;", "getCalculateOnly", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getTrackingId", "getFirstName", "getLastName", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutRequest;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class CheckoutRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final AddressInfo addressInfo;

    @Nullable
    private final Boolean calculateOnly;

    @Nullable
    private final String firstName;

    @Nullable
    private final String lastName;

    @Nullable
    private final String paymentIntent;

    @Nullable
    private final PlanDetails planDetails;

    @Nullable
    private final String trackingId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<CheckoutRequest> serializer() {
            return CheckoutRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public CheckoutRequest() {
        this((PlanDetails) null, (AddressInfo) null, (String) null, (Boolean) null, (String) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ CheckoutRequest copy$default(CheckoutRequest checkoutRequest, PlanDetails planDetails, AddressInfo addressInfo, String str, Boolean bool, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            planDetails = checkoutRequest.planDetails;
        }
        if ((i5 & 2) != 0) {
            addressInfo = checkoutRequest.addressInfo;
        }
        if ((i5 & 4) != 0) {
            str = checkoutRequest.paymentIntent;
        }
        if ((i5 & 8) != 0) {
            bool = checkoutRequest.calculateOnly;
        }
        if ((i5 & 16) != 0) {
            str2 = checkoutRequest.trackingId;
        }
        if ((i5 & 32) != 0) {
            str3 = checkoutRequest.firstName;
        }
        if ((i5 & 64) != 0) {
            str4 = checkoutRequest.lastName;
        }
        String str5 = str3;
        String str6 = str4;
        String str7 = str2;
        String str8 = str;
        return checkoutRequest.copy(planDetails, addressInfo, str8, bool, str7, str5, str6);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(CheckoutRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.planDetails != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, PlanDetails$$serializer.INSTANCE, self.planDetails);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.addressInfo != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, AddressInfo$$serializer.INSTANCE, self.addressInfo);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.paymentIntent != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.paymentIntent);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.calculateOnly, Boolean.FALSE)) {
            output.encodeNullableSerializableElement(serialDesc, 3, BooleanSerializer.INSTANCE, self.calculateOnly);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.trackingId != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.trackingId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.firstName != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.firstName);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.lastName == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.lastName);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final PlanDetails getPlanDetails() {
        return this.planDetails;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final AddressInfo getAddressInfo() {
        return this.addressInfo;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getPaymentIntent() {
        return this.paymentIntent;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Boolean getCalculateOnly() {
        return this.calculateOnly;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getTrackingId() {
        return this.trackingId;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getFirstName() {
        return this.firstName;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getLastName() {
        return this.lastName;
    }

    @NotNull
    public final CheckoutRequest copy(@Nullable PlanDetails planDetails, @Nullable AddressInfo addressInfo, @Nullable String paymentIntent, @Nullable Boolean calculateOnly, @Nullable String trackingId, @Nullable String firstName, @Nullable String lastName) {
        return new CheckoutRequest(planDetails, addressInfo, paymentIntent, calculateOnly, trackingId, firstName, lastName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CheckoutRequest)) {
            return false;
        }
        CheckoutRequest checkoutRequest = (CheckoutRequest) other;
        return Intrinsics.b(this.planDetails, checkoutRequest.planDetails) && Intrinsics.b(this.addressInfo, checkoutRequest.addressInfo) && Intrinsics.b(this.paymentIntent, checkoutRequest.paymentIntent) && Intrinsics.b(this.calculateOnly, checkoutRequest.calculateOnly) && Intrinsics.b(this.trackingId, checkoutRequest.trackingId) && Intrinsics.b(this.firstName, checkoutRequest.firstName) && Intrinsics.b(this.lastName, checkoutRequest.lastName);
    }

    @Nullable
    public final AddressInfo getAddressInfo() {
        return this.addressInfo;
    }

    @Nullable
    public final Boolean getCalculateOnly() {
        return this.calculateOnly;
    }

    @Nullable
    public final String getFirstName() {
        return this.firstName;
    }

    @Nullable
    public final String getLastName() {
        return this.lastName;
    }

    @Nullable
    public final String getPaymentIntent() {
        return this.paymentIntent;
    }

    @Nullable
    public final PlanDetails getPlanDetails() {
        return this.planDetails;
    }

    @Nullable
    public final String getTrackingId() {
        return this.trackingId;
    }

    public int hashCode() {
        PlanDetails planDetails = this.planDetails;
        int iHashCode = (planDetails == null ? 0 : planDetails.hashCode()) * 31;
        AddressInfo addressInfo = this.addressInfo;
        int iHashCode2 = (iHashCode + (addressInfo == null ? 0 : addressInfo.hashCode())) * 31;
        String str = this.paymentIntent;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.calculateOnly;
        int iHashCode4 = (iHashCode3 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str2 = this.trackingId;
        int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.firstName;
        int iHashCode6 = (iHashCode5 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.lastName;
        return iHashCode6 + (str4 != null ? str4.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        PlanDetails planDetails = this.planDetails;
        AddressInfo addressInfo = this.addressInfo;
        String str = this.paymentIntent;
        Boolean bool = this.calculateOnly;
        String str2 = this.trackingId;
        String str3 = this.firstName;
        String str4 = this.lastName;
        StringBuilder sb2 = new StringBuilder("CheckoutRequest(planDetails=");
        sb2.append(planDetails);
        sb2.append(", addressInfo=");
        sb2.append(addressInfo);
        sb2.append(", paymentIntent=");
        sb2.append(str);
        sb2.append(", calculateOnly=");
        sb2.append(bool);
        sb2.append(", trackingId=");
        c0.D(sb2, str2, ", firstName=", str3, ", lastName=");
        return c0.q(sb2, str4, ")");
    }

    public /* synthetic */ CheckoutRequest(int i5, PlanDetails planDetails, AddressInfo addressInfo, String str, Boolean bool, String str2, String str3, String str4, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.planDetails = null;
        } else {
            this.planDetails = planDetails;
        }
        if ((i5 & 2) == 0) {
            this.addressInfo = null;
        } else {
            this.addressInfo = addressInfo;
        }
        if ((i5 & 4) == 0) {
            this.paymentIntent = null;
        } else {
            this.paymentIntent = str;
        }
        if ((i5 & 8) == 0) {
            this.calculateOnly = Boolean.FALSE;
        } else {
            this.calculateOnly = bool;
        }
        if ((i5 & 16) == 0) {
            this.trackingId = null;
        } else {
            this.trackingId = str2;
        }
        if ((i5 & 32) == 0) {
            this.firstName = null;
        } else {
            this.firstName = str3;
        }
        if ((i5 & 64) == 0) {
            this.lastName = null;
        } else {
            this.lastName = str4;
        }
    }

    public CheckoutRequest(@Nullable PlanDetails planDetails, @Nullable AddressInfo addressInfo, @Nullable String str, @Nullable Boolean bool, @Nullable String str2, @Nullable String str3, @Nullable String str4) {
        this.planDetails = planDetails;
        this.addressInfo = addressInfo;
        this.paymentIntent = str;
        this.calculateOnly = bool;
        this.trackingId = str2;
        this.firstName = str3;
        this.lastName = str4;
    }

    public /* synthetic */ CheckoutRequest(PlanDetails planDetails, AddressInfo addressInfo, String str, Boolean bool, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : planDetails, (i5 & 2) != 0 ? null : addressInfo, (i5 & 4) != 0 ? null : str, (i5 & 8) != 0 ? Boolean.FALSE : bool, (i5 & 16) != 0 ? null : str2, (i5 & 32) != 0 ? null : str3, (i5 & 64) != 0 ? null : str4);
    }
}
