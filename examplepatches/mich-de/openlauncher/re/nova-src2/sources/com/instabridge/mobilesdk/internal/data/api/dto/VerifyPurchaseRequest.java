package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 .2\u00020\u0001:\u0002-.BI\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bBW\b\u0010\u0012\u0006\u0010\f\u001a\u00020\r\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\n\u0010\u0010J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\tHÆ\u0003JM\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tHÆ\u0001J\u0013\u0010 \u001a\u00020!2\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010#\u001a\u00020\rHÖ\u0001J\t\u0010$\u001a\u00020\u0003HÖ\u0001J%\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00020\u00002\u0006\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+H\u0001¢\u0006\u0002\b,R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0012R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0012R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018¨\u0006/"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseRequest;", b.f42142b, "purchaseToken", b.f42142b, "paymentType", EsimInstallStore.KEY_ICCID, "productId", "packageId", "price", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPurchaseToken", "()Ljava/lang/String;", "getPaymentType", "getIccid", "getProductId", "getPackageId", "getPrice", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class VerifyPurchaseRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String iccid;

    @Nullable
    private final String packageId;

    @NotNull
    private final String paymentType;

    @Nullable
    private final PriceDetails price;

    @Nullable
    private final String productId;

    @NotNull
    private final String purchaseToken;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<VerifyPurchaseRequest> serializer() {
            return VerifyPurchaseRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ VerifyPurchaseRequest(int i5, String str, String str2, String str3, String str4, String str5, PriceDetails priceDetails, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, VerifyPurchaseRequest$$serializer.INSTANCE.getDescriptor());
        }
        this.purchaseToken = str;
        if ((i5 & 2) == 0) {
            this.paymentType = "Stripe";
        } else {
            this.paymentType = str2;
        }
        if ((i5 & 4) == 0) {
            this.iccid = null;
        } else {
            this.iccid = str3;
        }
        if ((i5 & 8) == 0) {
            this.productId = null;
        } else {
            this.productId = str4;
        }
        if ((i5 & 16) == 0) {
            this.packageId = null;
        } else {
            this.packageId = str5;
        }
        if ((i5 & 32) == 0) {
            this.price = null;
        } else {
            this.price = priceDetails;
        }
    }

    public static /* synthetic */ VerifyPurchaseRequest copy$default(VerifyPurchaseRequest verifyPurchaseRequest, String str, String str2, String str3, String str4, String str5, PriceDetails priceDetails, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = verifyPurchaseRequest.purchaseToken;
        }
        if ((i5 & 2) != 0) {
            str2 = verifyPurchaseRequest.paymentType;
        }
        if ((i5 & 4) != 0) {
            str3 = verifyPurchaseRequest.iccid;
        }
        if ((i5 & 8) != 0) {
            str4 = verifyPurchaseRequest.productId;
        }
        if ((i5 & 16) != 0) {
            str5 = verifyPurchaseRequest.packageId;
        }
        if ((i5 & 32) != 0) {
            priceDetails = verifyPurchaseRequest.price;
        }
        String str6 = str5;
        PriceDetails priceDetails2 = priceDetails;
        return verifyPurchaseRequest.copy(str, str2, str3, str4, str6, priceDetails2);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(VerifyPurchaseRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.purchaseToken);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || !Intrinsics.b(self.paymentType, "Stripe")) {
            output.encodeStringElement(serialDesc, 1, self.paymentType);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.iccid != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.iccid);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.productId != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.productId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.packageId != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.packageId);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 5) && self.price == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 5, PriceDetails$$serializer.INSTANCE, self.price);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPurchaseToken() {
        return this.purchaseToken;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPaymentType() {
        return this.paymentType;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getIccid() {
        return this.iccid;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getProductId() {
        return this.productId;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getPackageId() {
        return this.packageId;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final PriceDetails getPrice() {
        return this.price;
    }

    @NotNull
    public final VerifyPurchaseRequest copy(@NotNull String purchaseToken, @NotNull String paymentType, @Nullable String iccid, @Nullable String productId, @Nullable String packageId, @Nullable PriceDetails price) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        Intrinsics.g(paymentType, "paymentType");
        return new VerifyPurchaseRequest(purchaseToken, paymentType, iccid, productId, packageId, price);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof VerifyPurchaseRequest)) {
            return false;
        }
        VerifyPurchaseRequest verifyPurchaseRequest = (VerifyPurchaseRequest) other;
        return Intrinsics.b(this.purchaseToken, verifyPurchaseRequest.purchaseToken) && Intrinsics.b(this.paymentType, verifyPurchaseRequest.paymentType) && Intrinsics.b(this.iccid, verifyPurchaseRequest.iccid) && Intrinsics.b(this.productId, verifyPurchaseRequest.productId) && Intrinsics.b(this.packageId, verifyPurchaseRequest.packageId) && Intrinsics.b(this.price, verifyPurchaseRequest.price);
    }

    @Nullable
    public final String getIccid() {
        return this.iccid;
    }

    @Nullable
    public final String getPackageId() {
        return this.packageId;
    }

    @NotNull
    public final String getPaymentType() {
        return this.paymentType;
    }

    @Nullable
    public final PriceDetails getPrice() {
        return this.price;
    }

    @Nullable
    public final String getProductId() {
        return this.productId;
    }

    @NotNull
    public final String getPurchaseToken() {
        return this.purchaseToken;
    }

    public int hashCode() {
        int iE = c0.e(this.purchaseToken.hashCode() * 31, 31, this.paymentType);
        String str = this.iccid;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.productId;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.packageId;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        PriceDetails priceDetails = this.price;
        return iHashCode3 + (priceDetails != null ? priceDetails.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.purchaseToken;
        String str2 = this.paymentType;
        String str3 = this.iccid;
        String str4 = this.productId;
        String str5 = this.packageId;
        PriceDetails priceDetails = this.price;
        StringBuilder sbW = c0.w("VerifyPurchaseRequest(purchaseToken=", str, ", paymentType=", str2, ", iccid=");
        c0.D(sbW, str3, ", productId=", str4, ", packageId=");
        sbW.append(str5);
        sbW.append(", price=");
        sbW.append(priceDetails);
        sbW.append(")");
        return sbW.toString();
    }

    public VerifyPurchaseRequest(@NotNull String purchaseToken, @NotNull String paymentType, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable PriceDetails priceDetails) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        Intrinsics.g(paymentType, "paymentType");
        this.purchaseToken = purchaseToken;
        this.paymentType = paymentType;
        this.iccid = str;
        this.productId = str2;
        this.packageId = str3;
        this.price = priceDetails;
    }

    public /* synthetic */ VerifyPurchaseRequest(String str, String str2, String str3, String str4, String str5, PriceDetails priceDetails, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? "Stripe" : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4, (i5 & 16) != 0 ? null : str5, (i5 & 32) != 0 ? null : priceDetails);
    }
}
