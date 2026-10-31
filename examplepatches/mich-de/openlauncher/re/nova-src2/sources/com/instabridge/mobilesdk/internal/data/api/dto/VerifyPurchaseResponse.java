package com.instabridge.mobilesdk.internal.data.api.dto;

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

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 )2\u00020\u0001:\u0002()B+\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tB9\b\u0010\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\b\u0010\u000eJ\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0007HÆ\u0003J-\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u000bHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001J%\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0001¢\u0006\u0002\b'R\u001e\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016¨\u0006*"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseResponse;", b.f42142b, "purchaseState", b.f42142b, "price", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "esim", "Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;", "<init>", "(Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPurchaseState$annotations", "()V", "getPurchaseState", "()Ljava/lang/String;", "getPrice", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "getEsim", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/TravelEsimDto;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class VerifyPurchaseResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final TravelEsimDto esim;

    @Nullable
    private final PriceDetails price;

    @Nullable
    private final String purchaseState;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/VerifyPurchaseResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<VerifyPurchaseResponse> serializer() {
            return VerifyPurchaseResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public VerifyPurchaseResponse() {
        this((String) null, (PriceDetails) null, (TravelEsimDto) null, 7, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ VerifyPurchaseResponse copy$default(VerifyPurchaseResponse verifyPurchaseResponse, String str, PriceDetails priceDetails, TravelEsimDto travelEsimDto, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = verifyPurchaseResponse.purchaseState;
        }
        if ((i5 & 2) != 0) {
            priceDetails = verifyPurchaseResponse.price;
        }
        if ((i5 & 4) != 0) {
            travelEsimDto = verifyPurchaseResponse.esim;
        }
        return verifyPurchaseResponse.copy(str, priceDetails, travelEsimDto);
    }

    @SerialName("status")
    public static /* synthetic */ void getPurchaseState$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(VerifyPurchaseResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.purchaseState != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.purchaseState);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.price != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, PriceDetails$$serializer.INSTANCE, self.price);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && self.esim == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 2, TravelEsimDto$$serializer.INSTANCE, self.esim);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getPurchaseState() {
        return this.purchaseState;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final PriceDetails getPrice() {
        return this.price;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final TravelEsimDto getEsim() {
        return this.esim;
    }

    @NotNull
    public final VerifyPurchaseResponse copy(@Nullable String purchaseState, @Nullable PriceDetails price, @Nullable TravelEsimDto esim) {
        return new VerifyPurchaseResponse(purchaseState, price, esim);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof VerifyPurchaseResponse)) {
            return false;
        }
        VerifyPurchaseResponse verifyPurchaseResponse = (VerifyPurchaseResponse) other;
        return Intrinsics.b(this.purchaseState, verifyPurchaseResponse.purchaseState) && Intrinsics.b(this.price, verifyPurchaseResponse.price) && Intrinsics.b(this.esim, verifyPurchaseResponse.esim);
    }

    @Nullable
    public final TravelEsimDto getEsim() {
        return this.esim;
    }

    @Nullable
    public final PriceDetails getPrice() {
        return this.price;
    }

    @Nullable
    public final String getPurchaseState() {
        return this.purchaseState;
    }

    public int hashCode() {
        String str = this.purchaseState;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        PriceDetails priceDetails = this.price;
        int iHashCode2 = (iHashCode + (priceDetails == null ? 0 : priceDetails.hashCode())) * 31;
        TravelEsimDto travelEsimDto = this.esim;
        return iHashCode2 + (travelEsimDto != null ? travelEsimDto.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "VerifyPurchaseResponse(purchaseState=" + this.purchaseState + ", price=" + this.price + ", esim=" + this.esim + ")";
    }

    public /* synthetic */ VerifyPurchaseResponse(int i5, String str, PriceDetails priceDetails, TravelEsimDto travelEsimDto, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.purchaseState = null;
        } else {
            this.purchaseState = str;
        }
        if ((i5 & 2) == 0) {
            this.price = null;
        } else {
            this.price = priceDetails;
        }
        if ((i5 & 4) == 0) {
            this.esim = null;
        } else {
            this.esim = travelEsimDto;
        }
    }

    public VerifyPurchaseResponse(@Nullable String str, @Nullable PriceDetails priceDetails, @Nullable TravelEsimDto travelEsimDto) {
        this.purchaseState = str;
        this.price = priceDetails;
        this.esim = travelEsimDto;
    }

    public /* synthetic */ VerifyPurchaseResponse(String str, PriceDetails priceDetails, TravelEsimDto travelEsimDto, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : priceDetails, (i5 & 4) != 0 ? null : travelEsimDto);
    }
}
