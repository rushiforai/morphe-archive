package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
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

@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 22\u00020\u0001:\u000212BC\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\n\u0010\u000bBM\b\u0010\u0012\u0006\u0010\f\u001a\u00020\r\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\n\u0010\u0010J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\bHÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003JE\u0010#\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010$\u001a\u00020%2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020\rHÖ\u0001J\t\u0010(\u001a\u00020\u0003HÖ\u0001J%\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020\u00002\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020/H\u0001¢\u0006\u0002\b0R\u001e\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u001e\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0015\u0010\u0012\u001a\u0004\b\u0016\u0010\u0014R\u001e\u0010\u0005\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0017\u0010\u0012\u001a\u0004\b\u0018\u0010\u0019R\u001e\u0010\u0007\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001a\u0010\u0012\u001a\u0004\b\u001b\u0010\u001cR\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0014¨\u00063"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse;", b.f42142b, "status", b.f42142b, "statusDescription", "addressInfo", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "price", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "purchaseId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getStatus$annotations", "()V", "getStatus", "()Ljava/lang/String;", "getStatusDescription$annotations", "getStatusDescription", "getAddressInfo$annotations", "getAddressInfo", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "getPrice$annotations", "getPrice", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "getPurchaseId", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class CheckoutResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final AddressInfo addressInfo;

    @Nullable
    private final PriceDetails price;

    @Nullable
    private final String purchaseId;

    @Nullable
    private final String status;

    @Nullable
    private final String statusDescription;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<CheckoutResponse> serializer() {
            return CheckoutResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public CheckoutResponse() {
        this((String) null, (String) null, (AddressInfo) null, (PriceDetails) null, (String) null, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ CheckoutResponse copy$default(CheckoutResponse checkoutResponse, String str, String str2, AddressInfo addressInfo, PriceDetails priceDetails, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = checkoutResponse.status;
        }
        if ((i5 & 2) != 0) {
            str2 = checkoutResponse.statusDescription;
        }
        if ((i5 & 4) != 0) {
            addressInfo = checkoutResponse.addressInfo;
        }
        if ((i5 & 8) != 0) {
            priceDetails = checkoutResponse.price;
        }
        if ((i5 & 16) != 0) {
            str3 = checkoutResponse.purchaseId;
        }
        String str4 = str3;
        AddressInfo addressInfo2 = addressInfo;
        return checkoutResponse.copy(str, str2, addressInfo2, priceDetails, str4);
    }

    @SerialName("addressInfo")
    public static /* synthetic */ void getAddressInfo$annotations() {
    }

    @SerialName("price")
    public static /* synthetic */ void getPrice$annotations() {
    }

    @SerialName("status")
    public static /* synthetic */ void getStatus$annotations() {
    }

    @SerialName("statusDescription")
    public static /* synthetic */ void getStatusDescription$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(CheckoutResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.status != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.status);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.statusDescription != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.statusDescription);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.addressInfo != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, AddressInfo$$serializer.INSTANCE, self.addressInfo);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.price != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, PriceDetails$$serializer.INSTANCE, self.price);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.purchaseId == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.purchaseId);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getStatusDescription() {
        return this.statusDescription;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final AddressInfo getAddressInfo() {
        return this.addressInfo;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final PriceDetails getPrice() {
        return this.price;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getPurchaseId() {
        return this.purchaseId;
    }

    @NotNull
    public final CheckoutResponse copy(@Nullable String status, @Nullable String statusDescription, @Nullable AddressInfo addressInfo, @Nullable PriceDetails price, @Nullable String purchaseId) {
        return new CheckoutResponse(status, statusDescription, addressInfo, price, purchaseId);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CheckoutResponse)) {
            return false;
        }
        CheckoutResponse checkoutResponse = (CheckoutResponse) other;
        return Intrinsics.b(this.status, checkoutResponse.status) && Intrinsics.b(this.statusDescription, checkoutResponse.statusDescription) && Intrinsics.b(this.addressInfo, checkoutResponse.addressInfo) && Intrinsics.b(this.price, checkoutResponse.price) && Intrinsics.b(this.purchaseId, checkoutResponse.purchaseId);
    }

    @Nullable
    public final AddressInfo getAddressInfo() {
        return this.addressInfo;
    }

    @Nullable
    public final PriceDetails getPrice() {
        return this.price;
    }

    @Nullable
    public final String getPurchaseId() {
        return this.purchaseId;
    }

    @Nullable
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    public final String getStatusDescription() {
        return this.statusDescription;
    }

    public int hashCode() {
        String str = this.status;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.statusDescription;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        AddressInfo addressInfo = this.addressInfo;
        int iHashCode3 = (iHashCode2 + (addressInfo == null ? 0 : addressInfo.hashCode())) * 31;
        PriceDetails priceDetails = this.price;
        int iHashCode4 = (iHashCode3 + (priceDetails == null ? 0 : priceDetails.hashCode())) * 31;
        String str3 = this.purchaseId;
        return iHashCode4 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.status;
        String str2 = this.statusDescription;
        AddressInfo addressInfo = this.addressInfo;
        PriceDetails priceDetails = this.price;
        String str3 = this.purchaseId;
        StringBuilder sbW = c0.w("CheckoutResponse(status=", str, ", statusDescription=", str2, ", addressInfo=");
        sbW.append(addressInfo);
        sbW.append(", price=");
        sbW.append(priceDetails);
        sbW.append(", purchaseId=");
        return c0.q(sbW, str3, ")");
    }

    public /* synthetic */ CheckoutResponse(int i5, String str, String str2, AddressInfo addressInfo, PriceDetails priceDetails, String str3, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.status = null;
        } else {
            this.status = str;
        }
        if ((i5 & 2) == 0) {
            this.statusDescription = null;
        } else {
            this.statusDescription = str2;
        }
        if ((i5 & 4) == 0) {
            this.addressInfo = null;
        } else {
            this.addressInfo = addressInfo;
        }
        if ((i5 & 8) == 0) {
            this.price = null;
        } else {
            this.price = priceDetails;
        }
        if ((i5 & 16) == 0) {
            this.purchaseId = null;
        } else {
            this.purchaseId = str3;
        }
    }

    public CheckoutResponse(@Nullable String str, @Nullable String str2, @Nullable AddressInfo addressInfo, @Nullable PriceDetails priceDetails, @Nullable String str3) {
        this.status = str;
        this.statusDescription = str2;
        this.addressInfo = addressInfo;
        this.price = priceDetails;
        this.purchaseId = str3;
    }

    public /* synthetic */ CheckoutResponse(String str, String str2, AddressInfo addressInfo, PriceDetails priceDetails, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : addressInfo, (i5 & 8) != 0 ? null : priceDetails, (i5 & 16) != 0 ? null : str3);
    }
}
