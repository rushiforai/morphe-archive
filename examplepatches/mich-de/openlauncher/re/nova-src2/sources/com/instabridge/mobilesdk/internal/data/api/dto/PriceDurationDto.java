package com.instabridge.mobilesdk.internal.data.api.dto;

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
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 #2\u00020\u0001:\u0002\"#B\u001b\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007B-\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\tHÖ\u0001J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J%\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0001¢\u0006\u0002\b!R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006$"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDurationDto;", b.f42142b, "durationHours", b.f42142b, "price", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDto;", "<init>", "(JLcom/instabridge/mobilesdk/internal/data/api/dto/PriceDto;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJLcom/instabridge/mobilesdk/internal/data/api/dto/PriceDto;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getDurationHours", "()J", "getPrice", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDto;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PriceDurationDto {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long durationHours;

    @NotNull
    private final PriceDto price;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDurationDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDurationDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PriceDurationDto> serializer() {
            return PriceDurationDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PriceDurationDto() {
        this(0L, (PriceDto) null, 3, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ PriceDurationDto copy$default(PriceDurationDto priceDurationDto, long j11, PriceDto priceDto, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = priceDurationDto.durationHours;
        }
        if ((i5 & 2) != 0) {
            priceDto = priceDurationDto.price;
        }
        return priceDurationDto.copy(j11, priceDto);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PriceDurationDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.durationHours != 0) {
            output.encodeLongElement(serialDesc, 0, self.durationHours);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && Intrinsics.b(self.price, new PriceDto((Double) null, (Double) null, (Double) null, (Double) null, (Double) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null))) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 1, PriceDto$$serializer.INSTANCE, self.price);
    }

    /* renamed from: component1, reason: from getter */
    public final long getDurationHours() {
        return this.durationHours;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final PriceDto getPrice() {
        return this.price;
    }

    @NotNull
    public final PriceDurationDto copy(long durationHours, @NotNull PriceDto price) {
        Intrinsics.g(price, "price");
        return new PriceDurationDto(durationHours, price);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PriceDurationDto)) {
            return false;
        }
        PriceDurationDto priceDurationDto = (PriceDurationDto) other;
        return this.durationHours == priceDurationDto.durationHours && Intrinsics.b(this.price, priceDurationDto.price);
    }

    public final long getDurationHours() {
        return this.durationHours;
    }

    @NotNull
    public final PriceDto getPrice() {
        return this.price;
    }

    public int hashCode() {
        return this.price.hashCode() + (Long.hashCode(this.durationHours) * 31);
    }

    @NotNull
    public String toString() {
        return "PriceDurationDto(durationHours=" + this.durationHours + ", price=" + this.price + ")";
    }

    public /* synthetic */ PriceDurationDto(int i5, long j11, PriceDto priceDto, SerializationConstructorMarker serializationConstructorMarker) {
        this.durationHours = (i5 & 1) == 0 ? 0L : j11;
        if ((i5 & 2) == 0) {
            this.price = new PriceDto((Double) null, (Double) null, (Double) null, (Double) null, (Double) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null);
        } else {
            this.price = priceDto;
        }
    }

    public PriceDurationDto(long j11, @NotNull PriceDto price) {
        Intrinsics.g(price, "price");
        this.durationHours = j11;
        this.price = price;
    }

    public /* synthetic */ PriceDurationDto(long j11, PriceDto priceDto, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? 0L : j11, (i5 & 2) != 0 ? new PriceDto((Double) null, (Double) null, (Double) null, (Double) null, (Double) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null) : priceDto);
    }
}
