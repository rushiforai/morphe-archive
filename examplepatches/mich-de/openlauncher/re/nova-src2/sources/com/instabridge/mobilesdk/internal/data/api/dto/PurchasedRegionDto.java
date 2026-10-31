package com.instabridge.mobilesdk.internal.data.api.dto;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
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

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 \"2\u00020\u0001:\u0002!\"B\u001d\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007B/\b\u0010\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u0006\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\tHÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001J%\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00002\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0001¢\u0006\u0002\b R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006#"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, "countries", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;", "<init>", "(Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCode", "()Ljava/lang/String;", "getCountries", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PurchasedRegionDto {

    @NotNull
    private final String code;

    @Nullable
    private final PurchasedRegionCountriesDto countries;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PurchasedRegionDto> serializer() {
            return PurchasedRegionDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public PurchasedRegionDto() {
        this((String) null, (PurchasedRegionCountriesDto) (0 == true ? 1 : 0), 3, (DefaultConstructorMarker) (0 == true ? 1 : 0));
    }

    public static /* synthetic */ PurchasedRegionDto copy$default(PurchasedRegionDto purchasedRegionDto, String str, PurchasedRegionCountriesDto purchasedRegionCountriesDto, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = purchasedRegionDto.code;
        }
        if ((i5 & 2) != 0) {
            purchasedRegionCountriesDto = purchasedRegionDto.countries;
        }
        return purchasedRegionDto.copy(str, purchasedRegionCountriesDto);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PurchasedRegionDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.code, b.f42142b)) {
            output.encodeStringElement(serialDesc, 0, self.code);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && self.countries == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 1, PurchasedRegionCountriesDto$$serializer.INSTANCE, self.countries);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getCode() {
        return this.code;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final PurchasedRegionCountriesDto getCountries() {
        return this.countries;
    }

    @NotNull
    public final PurchasedRegionDto copy(@NotNull String code, @Nullable PurchasedRegionCountriesDto countries) {
        Intrinsics.g(code, "code");
        return new PurchasedRegionDto(code, countries);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedRegionDto)) {
            return false;
        }
        PurchasedRegionDto purchasedRegionDto = (PurchasedRegionDto) other;
        return Intrinsics.b(this.code, purchasedRegionDto.code) && Intrinsics.b(this.countries, purchasedRegionDto.countries);
    }

    @NotNull
    public final String getCode() {
        return this.code;
    }

    @Nullable
    public final PurchasedRegionCountriesDto getCountries() {
        return this.countries;
    }

    public int hashCode() {
        int iHashCode = this.code.hashCode() * 31;
        PurchasedRegionCountriesDto purchasedRegionCountriesDto = this.countries;
        return iHashCode + (purchasedRegionCountriesDto == null ? 0 : purchasedRegionCountriesDto.hashCode());
    }

    @NotNull
    public String toString() {
        return "PurchasedRegionDto(code=" + this.code + ", countries=" + this.countries + ")";
    }

    public /* synthetic */ PurchasedRegionDto(int i5, String str, PurchasedRegionCountriesDto purchasedRegionCountriesDto, SerializationConstructorMarker serializationConstructorMarker) {
        this.code = (i5 & 1) == 0 ? b.f42142b : str;
        if ((i5 & 2) == 0) {
            this.countries = null;
        } else {
            this.countries = purchasedRegionCountriesDto;
        }
    }

    public PurchasedRegionDto(@NotNull String code, @Nullable PurchasedRegionCountriesDto purchasedRegionCountriesDto) {
        Intrinsics.g(code, "code");
        this.code = code;
        this.countries = purchasedRegionCountriesDto;
    }

    public /* synthetic */ PurchasedRegionDto(String str, PurchasedRegionCountriesDto purchasedRegionCountriesDto, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? b.f42142b : str, (i5 & 2) != 0 ? null : purchasedRegionCountriesDto);
    }
}
