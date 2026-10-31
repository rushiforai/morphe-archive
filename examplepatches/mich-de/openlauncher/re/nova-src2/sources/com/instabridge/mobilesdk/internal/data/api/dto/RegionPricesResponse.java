package com.instabridge.mobilesdk.internal.data.api.dto;

import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 #2\u00020\u0001:\u0002\"#B#\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bB5\b\u0010\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u000e\u0010\u0002\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u0007\u0010\rJ\u000f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0006HÆ\u0003J%\u0010\u0014\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\nHÖ\u0001J\t\u0010\u0019\u001a\u00020\u0006HÖ\u0001J%\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 H\u0001¢\u0006\u0002\b!R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006$"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionPricesResponse;", b.f42142b, "amounts", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceAmountDto;", TrackingOptions.AMP_TRACKING_OPTION_REGION, b.f42142b, "<init>", "(Ljava/util/List;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/util/List;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getAmounts", "()Ljava/util/List;", "getRegion", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class RegionPricesResponse {

    @NotNull
    private final List<PriceAmountDto> amounts;

    @Nullable
    private final String region;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {new ArrayListSerializer(PriceAmountDto$$serializer.INSTANCE), null};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionPricesResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionPricesResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<RegionPricesResponse> serializer() {
            return RegionPricesResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public RegionPricesResponse() {
        this((List) null, (String) null, 3, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ RegionPricesResponse copy$default(RegionPricesResponse regionPricesResponse, List list, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = regionPricesResponse.amounts;
        }
        if ((i5 & 2) != 0) {
            str = regionPricesResponse.region;
        }
        return regionPricesResponse.copy(list, str);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(RegionPricesResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.amounts, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 0, kSerializerArr[0], self.amounts);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.region == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.region);
    }

    @NotNull
    public final List<PriceAmountDto> component1() {
        return this.amounts;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getRegion() {
        return this.region;
    }

    @NotNull
    public final RegionPricesResponse copy(@NotNull List<PriceAmountDto> amounts, @Nullable String region) {
        Intrinsics.g(amounts, "amounts");
        return new RegionPricesResponse(amounts, region);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RegionPricesResponse)) {
            return false;
        }
        RegionPricesResponse regionPricesResponse = (RegionPricesResponse) other;
        return Intrinsics.b(this.amounts, regionPricesResponse.amounts) && Intrinsics.b(this.region, regionPricesResponse.region);
    }

    @NotNull
    public final List<PriceAmountDto> getAmounts() {
        return this.amounts;
    }

    @Nullable
    public final String getRegion() {
        return this.region;
    }

    public int hashCode() {
        int iHashCode = this.amounts.hashCode() * 31;
        String str = this.region;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public String toString() {
        return "RegionPricesResponse(amounts=" + this.amounts + ", region=" + this.region + ")";
    }

    public RegionPricesResponse(List list, String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? EmptyList.f71733a : list, (i5 & 2) != 0 ? null : str);
    }

    public RegionPricesResponse(int i5, List list, String str, SerializationConstructorMarker serializationConstructorMarker) {
        this.amounts = (i5 & 1) == 0 ? EmptyList.f71733a : list;
        if ((i5 & 2) == 0) {
            this.region = null;
        } else {
            this.region = str;
        }
    }

    public RegionPricesResponse(@NotNull List<PriceAmountDto> amounts, @Nullable String str) {
        Intrinsics.g(amounts, "amounts");
        this.amounts = amounts;
        this.region = str;
    }
}
