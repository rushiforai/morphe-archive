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
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 $2\u00020\u0001:\u0002#$B#\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bB5\b\u0010\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u0007\u0010\rJ\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J%\u0010\u0014\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\nHÖ\u0001J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J%\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0001¢\u0006\u0002\b\"R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006%"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedMobileDatumDto;", b.f42142b, TrackingOptions.AMP_TRACKING_OPTION_REGION, "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;", "purchasedPackages", b.f42142b, "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedPackageDto;", "<init>", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;Ljava/util/List;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;Ljava/util/List;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getRegion", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;", "getPurchasedPackages", "()Ljava/util/List;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", b.f42142b, "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PurchasedMobileDatumDto {

    @NotNull
    private final List<PurchasedPackageDto> purchasedPackages;

    @Nullable
    private final PurchasedRegionDto region;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {null, new ArrayListSerializer(PurchasedPackageDto$$serializer.INSTANCE)};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedMobileDatumDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedMobileDatumDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PurchasedMobileDatumDto> serializer() {
            return PurchasedMobileDatumDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PurchasedMobileDatumDto() {
        this((PurchasedRegionDto) null, (List) null, 3, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PurchasedMobileDatumDto copy$default(PurchasedMobileDatumDto purchasedMobileDatumDto, PurchasedRegionDto purchasedRegionDto, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            purchasedRegionDto = purchasedMobileDatumDto.region;
        }
        if ((i5 & 2) != 0) {
            list = purchasedMobileDatumDto.purchasedPackages;
        }
        return purchasedMobileDatumDto.copy(purchasedRegionDto, list);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(PurchasedMobileDatumDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.region != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, PurchasedRegionDto$$serializer.INSTANCE, self.region);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && Intrinsics.b(self.purchasedPackages, EmptyList.f71733a)) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 1, kSerializerArr[1], self.purchasedPackages);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final PurchasedRegionDto getRegion() {
        return this.region;
    }

    @NotNull
    public final List<PurchasedPackageDto> component2() {
        return this.purchasedPackages;
    }

    @NotNull
    public final PurchasedMobileDatumDto copy(@Nullable PurchasedRegionDto region, @NotNull List<PurchasedPackageDto> purchasedPackages) {
        Intrinsics.g(purchasedPackages, "purchasedPackages");
        return new PurchasedMobileDatumDto(region, purchasedPackages);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedMobileDatumDto)) {
            return false;
        }
        PurchasedMobileDatumDto purchasedMobileDatumDto = (PurchasedMobileDatumDto) other;
        return Intrinsics.b(this.region, purchasedMobileDatumDto.region) && Intrinsics.b(this.purchasedPackages, purchasedMobileDatumDto.purchasedPackages);
    }

    @NotNull
    public final List<PurchasedPackageDto> getPurchasedPackages() {
        return this.purchasedPackages;
    }

    @Nullable
    public final PurchasedRegionDto getRegion() {
        return this.region;
    }

    public int hashCode() {
        PurchasedRegionDto purchasedRegionDto = this.region;
        return this.purchasedPackages.hashCode() + ((purchasedRegionDto == null ? 0 : purchasedRegionDto.hashCode()) * 31);
    }

    @NotNull
    public String toString() {
        return "PurchasedMobileDatumDto(region=" + this.region + ", purchasedPackages=" + this.purchasedPackages + ")";
    }

    public PurchasedMobileDatumDto(PurchasedRegionDto purchasedRegionDto, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : purchasedRegionDto, (i5 & 2) != 0 ? EmptyList.f71733a : list);
    }

    public PurchasedMobileDatumDto(int i5, PurchasedRegionDto purchasedRegionDto, List list, SerializationConstructorMarker serializationConstructorMarker) {
        this.region = (i5 & 1) == 0 ? null : purchasedRegionDto;
        if ((i5 & 2) == 0) {
            this.purchasedPackages = EmptyList.f71733a;
        } else {
            this.purchasedPackages = list;
        }
    }

    public PurchasedMobileDatumDto(@Nullable PurchasedRegionDto purchasedRegionDto, @NotNull List<PurchasedPackageDto> purchasedPackages) {
        Intrinsics.g(purchasedPackages, "purchasedPackages");
        this.region = purchasedRegionDto;
        this.purchasedPackages = purchasedPackages;
    }
}
