package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 32\u00020\u0001:\u000223B[\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\u000b\u0010\fBa\b\u0010\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\u000b\u0010\u0011J\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0013J\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0013J\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0013J\u0010\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0013J\u0010\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0013J\u000b\u0010!\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\tHÆ\u0003Jb\u0010#\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\tHÆ\u0001¢\u0006\u0002\u0010$J\u0013\u0010%\u001a\u00020&2\b\u0010'\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010(\u001a\u00020\u000eHÖ\u0001J\t\u0010)\u001a\u00020\tHÖ\u0001J%\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020\u00002\u0006\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u000200H\u0001¢\u0006\u0002\b1R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0012\u0010\u0013R\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0015\u0010\u0013R\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0016\u0010\u0013R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0017\u0010\u0013R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0014\u001a\u0004\b\u0018\u0010\u0013R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0013\u0010\n\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001a¨\u00064"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", b.f42142b, "subTotal", b.f42142b, "tax", "taxRate", "total", "discount", TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, b.f42142b, "discountName", "<init>", "(Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getSubTotal", "()Ljava/lang/Double;", "Ljava/lang/Double;", "getTax", "getTaxRate", "getTotal", "getDiscount", "getCurrency", "()Ljava/lang/String;", "getDiscountName", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "(Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PriceDetails {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String currency;

    @Nullable
    private final Double discount;

    @Nullable
    private final String discountName;

    @Nullable
    private final Double subTotal;

    @Nullable
    private final Double tax;

    @Nullable
    private final Double taxRate;

    @Nullable
    private final Double total;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PriceDetails> serializer() {
            return PriceDetails$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PriceDetails() {
        this((Double) null, (Double) null, (Double) null, (Double) null, (Double) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ PriceDetails copy$default(PriceDetails priceDetails, Double d5, Double d11, Double d12, Double d13, Double d14, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            d5 = priceDetails.subTotal;
        }
        if ((i5 & 2) != 0) {
            d11 = priceDetails.tax;
        }
        if ((i5 & 4) != 0) {
            d12 = priceDetails.taxRate;
        }
        if ((i5 & 8) != 0) {
            d13 = priceDetails.total;
        }
        if ((i5 & 16) != 0) {
            d14 = priceDetails.discount;
        }
        if ((i5 & 32) != 0) {
            str = priceDetails.currency;
        }
        if ((i5 & 64) != 0) {
            str2 = priceDetails.discountName;
        }
        String str3 = str;
        String str4 = str2;
        Double d15 = d14;
        Double d16 = d12;
        return priceDetails.copy(d5, d11, d16, d13, d15, str3, str4);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PriceDetails self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.subTotal != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, DoubleSerializer.INSTANCE, self.subTotal);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.tax != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, DoubleSerializer.INSTANCE, self.tax);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.taxRate != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, DoubleSerializer.INSTANCE, self.taxRate);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.total != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, DoubleSerializer.INSTANCE, self.total);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.discount != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, DoubleSerializer.INSTANCE, self.discount);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.currency != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.currency);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.discountName == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.discountName);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final Double getSubTotal() {
        return this.subTotal;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Double getTax() {
        return this.tax;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Double getTaxRate() {
        return this.taxRate;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Double getTotal() {
        return this.total;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final Double getDiscount() {
        return this.discount;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getDiscountName() {
        return this.discountName;
    }

    @NotNull
    public final PriceDetails copy(@Nullable Double subTotal, @Nullable Double tax, @Nullable Double taxRate, @Nullable Double total, @Nullable Double discount, @Nullable String currency, @Nullable String discountName) {
        return new PriceDetails(subTotal, tax, taxRate, total, discount, currency, discountName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PriceDetails)) {
            return false;
        }
        PriceDetails priceDetails = (PriceDetails) other;
        return Intrinsics.b(this.subTotal, priceDetails.subTotal) && Intrinsics.b(this.tax, priceDetails.tax) && Intrinsics.b(this.taxRate, priceDetails.taxRate) && Intrinsics.b(this.total, priceDetails.total) && Intrinsics.b(this.discount, priceDetails.discount) && Intrinsics.b(this.currency, priceDetails.currency) && Intrinsics.b(this.discountName, priceDetails.discountName);
    }

    @Nullable
    public final String getCurrency() {
        return this.currency;
    }

    @Nullable
    public final Double getDiscount() {
        return this.discount;
    }

    @Nullable
    public final String getDiscountName() {
        return this.discountName;
    }

    @Nullable
    public final Double getSubTotal() {
        return this.subTotal;
    }

    @Nullable
    public final Double getTax() {
        return this.tax;
    }

    @Nullable
    public final Double getTaxRate() {
        return this.taxRate;
    }

    @Nullable
    public final Double getTotal() {
        return this.total;
    }

    public int hashCode() {
        Double d5 = this.subTotal;
        int iHashCode = (d5 == null ? 0 : d5.hashCode()) * 31;
        Double d11 = this.tax;
        int iHashCode2 = (iHashCode + (d11 == null ? 0 : d11.hashCode())) * 31;
        Double d12 = this.taxRate;
        int iHashCode3 = (iHashCode2 + (d12 == null ? 0 : d12.hashCode())) * 31;
        Double d13 = this.total;
        int iHashCode4 = (iHashCode3 + (d13 == null ? 0 : d13.hashCode())) * 31;
        Double d14 = this.discount;
        int iHashCode5 = (iHashCode4 + (d14 == null ? 0 : d14.hashCode())) * 31;
        String str = this.currency;
        int iHashCode6 = (iHashCode5 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.discountName;
        return iHashCode6 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        Double d5 = this.subTotal;
        Double d11 = this.tax;
        Double d12 = this.taxRate;
        Double d13 = this.total;
        Double d14 = this.discount;
        String str = this.currency;
        String str2 = this.discountName;
        StringBuilder sb2 = new StringBuilder("PriceDetails(subTotal=");
        sb2.append(d5);
        sb2.append(", tax=");
        sb2.append(d11);
        sb2.append(", taxRate=");
        sb2.append(d12);
        sb2.append(", total=");
        sb2.append(d13);
        sb2.append(", discount=");
        sb2.append(d14);
        sb2.append(", currency=");
        sb2.append(str);
        sb2.append(", discountName=");
        return c0.q(sb2, str2, ")");
    }

    public /* synthetic */ PriceDetails(int i5, Double d5, Double d11, Double d12, Double d13, Double d14, String str, String str2, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.subTotal = null;
        } else {
            this.subTotal = d5;
        }
        if ((i5 & 2) == 0) {
            this.tax = null;
        } else {
            this.tax = d11;
        }
        if ((i5 & 4) == 0) {
            this.taxRate = null;
        } else {
            this.taxRate = d12;
        }
        if ((i5 & 8) == 0) {
            this.total = null;
        } else {
            this.total = d13;
        }
        if ((i5 & 16) == 0) {
            this.discount = null;
        } else {
            this.discount = d14;
        }
        if ((i5 & 32) == 0) {
            this.currency = null;
        } else {
            this.currency = str;
        }
        if ((i5 & 64) == 0) {
            this.discountName = null;
        } else {
            this.discountName = str2;
        }
    }

    public PriceDetails(@Nullable Double d5, @Nullable Double d11, @Nullable Double d12, @Nullable Double d13, @Nullable Double d14, @Nullable String str, @Nullable String str2) {
        this.subTotal = d5;
        this.tax = d11;
        this.taxRate = d12;
        this.total = d13;
        this.discount = d14;
        this.currency = str;
        this.discountName = str2;
    }

    public /* synthetic */ PriceDetails(Double d5, Double d11, Double d12, Double d13, Double d14, String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : d5, (i5 & 2) != 0 ? null : d11, (i5 & 4) != 0 ? null : d12, (i5 & 8) != 0 ? null : d13, (i5 & 16) != 0 ? null : d14, (i5 & 32) != 0 ? null : str, (i5 & 64) != 0 ? null : str2);
    }
}
