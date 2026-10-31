package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import b.u4;
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

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 ,2\u00020\u0001:\u0002+,BS\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\n\u0010\u000bBe\b\u0010\u0012\u0006\u0010\f\u001a\u00020\r\u0012\u000e\u0010\u0002\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0003\u0012\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\u000e\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\n\u0010\u0010J\u000f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003HÆ\u0003J\u000f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0004HÆ\u0003JU\u0010\u001d\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0004HÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\rHÖ\u0001J\t\u0010\"\u001a\u00020\u0004HÖ\u0001J%\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00002\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020)H\u0001¢\u0006\u0002\b*R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0012R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006-"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/SupportedRegionsResponse;", b.f42142b, "countryCodes", b.f42142b, b.f42142b, "regions", "Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionDto;", "recommendedCountryCodes", "pastCountryCodes", "currentCountryCode", "<init>", "(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCountryCodes", "()Ljava/util/List;", "getRegions", "getRecommendedCountryCodes", "getPastCountryCodes", "getCurrentCountryCode", "()Ljava/lang/String;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class SupportedRegionsResponse {

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers;

    @NotNull
    private final List<String> countryCodes;

    @Nullable
    private final String currentCountryCode;

    @NotNull
    private final List<String> pastCountryCodes;

    @NotNull
    private final List<String> recommendedCountryCodes;

    @NotNull
    private final List<RegionDto> regions;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/SupportedRegionsResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/SupportedRegionsResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<SupportedRegionsResponse> serializer() {
            return SupportedRegionsResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    static {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        $childSerializers = new KSerializer[]{new ArrayListSerializer(stringSerializer), new ArrayListSerializer(RegionDto$$serializer.INSTANCE), new ArrayListSerializer(stringSerializer), new ArrayListSerializer(stringSerializer), null};
    }

    public SupportedRegionsResponse() {
        this((List) null, (List) null, (List) null, (List) null, (String) null, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ SupportedRegionsResponse copy$default(SupportedRegionsResponse supportedRegionsResponse, List list, List list2, List list3, List list4, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = supportedRegionsResponse.countryCodes;
        }
        if ((i5 & 2) != 0) {
            list2 = supportedRegionsResponse.regions;
        }
        if ((i5 & 4) != 0) {
            list3 = supportedRegionsResponse.recommendedCountryCodes;
        }
        if ((i5 & 8) != 0) {
            list4 = supportedRegionsResponse.pastCountryCodes;
        }
        if ((i5 & 16) != 0) {
            str = supportedRegionsResponse.currentCountryCode;
        }
        String str2 = str;
        List list5 = list3;
        return supportedRegionsResponse.copy(list, list2, list5, list4, str2);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(SupportedRegionsResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.countryCodes, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 0, kSerializerArr[0], self.countryCodes);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || !Intrinsics.b(self.regions, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 1, kSerializerArr[1], self.regions);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || !Intrinsics.b(self.recommendedCountryCodes, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 2, kSerializerArr[2], self.recommendedCountryCodes);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.pastCountryCodes, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 3, kSerializerArr[3], self.pastCountryCodes);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.currentCountryCode == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.currentCountryCode);
    }

    @NotNull
    public final List<String> component1() {
        return this.countryCodes;
    }

    @NotNull
    public final List<RegionDto> component2() {
        return this.regions;
    }

    @NotNull
    public final List<String> component3() {
        return this.recommendedCountryCodes;
    }

    @NotNull
    public final List<String> component4() {
        return this.pastCountryCodes;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getCurrentCountryCode() {
        return this.currentCountryCode;
    }

    @NotNull
    public final SupportedRegionsResponse copy(@NotNull List<String> countryCodes, @NotNull List<RegionDto> regions, @NotNull List<String> recommendedCountryCodes, @NotNull List<String> pastCountryCodes, @Nullable String currentCountryCode) {
        Intrinsics.g(countryCodes, "countryCodes");
        Intrinsics.g(regions, "regions");
        Intrinsics.g(recommendedCountryCodes, "recommendedCountryCodes");
        Intrinsics.g(pastCountryCodes, "pastCountryCodes");
        return new SupportedRegionsResponse(countryCodes, regions, recommendedCountryCodes, pastCountryCodes, currentCountryCode);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SupportedRegionsResponse)) {
            return false;
        }
        SupportedRegionsResponse supportedRegionsResponse = (SupportedRegionsResponse) other;
        return Intrinsics.b(this.countryCodes, supportedRegionsResponse.countryCodes) && Intrinsics.b(this.regions, supportedRegionsResponse.regions) && Intrinsics.b(this.recommendedCountryCodes, supportedRegionsResponse.recommendedCountryCodes) && Intrinsics.b(this.pastCountryCodes, supportedRegionsResponse.pastCountryCodes) && Intrinsics.b(this.currentCountryCode, supportedRegionsResponse.currentCountryCode);
    }

    @NotNull
    public final List<String> getCountryCodes() {
        return this.countryCodes;
    }

    @Nullable
    public final String getCurrentCountryCode() {
        return this.currentCountryCode;
    }

    @NotNull
    public final List<String> getPastCountryCodes() {
        return this.pastCountryCodes;
    }

    @NotNull
    public final List<String> getRecommendedCountryCodes() {
        return this.recommendedCountryCodes;
    }

    @NotNull
    public final List<RegionDto> getRegions() {
        return this.regions;
    }

    public int hashCode() {
        int iC = u4.c(u4.c(u4.c(this.countryCodes.hashCode() * 31, 31, this.regions), 31, this.recommendedCountryCodes), 31, this.pastCountryCodes);
        String str = this.currentCountryCode;
        return iC + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public String toString() {
        List<String> list = this.countryCodes;
        List<RegionDto> list2 = this.regions;
        List<String> list3 = this.recommendedCountryCodes;
        List<String> list4 = this.pastCountryCodes;
        String str = this.currentCountryCode;
        StringBuilder sb2 = new StringBuilder("SupportedRegionsResponse(countryCodes=");
        sb2.append(list);
        sb2.append(", regions=");
        sb2.append(list2);
        sb2.append(", recommendedCountryCodes=");
        sb2.append(list3);
        sb2.append(", pastCountryCodes=");
        sb2.append(list4);
        sb2.append(", currentCountryCode=");
        return c0.q(sb2, str, ")");
    }

    public SupportedRegionsResponse(List list, List list2, List list3, List list4, String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? EmptyList.f71733a : list, (i5 & 2) != 0 ? EmptyList.f71733a : list2, (i5 & 4) != 0 ? EmptyList.f71733a : list3, (i5 & 8) != 0 ? EmptyList.f71733a : list4, (i5 & 16) != 0 ? null : str);
    }

    public SupportedRegionsResponse(int i5, List list, List list2, List list3, List list4, String str, SerializationConstructorMarker serializationConstructorMarker) {
        this.countryCodes = (i5 & 1) == 0 ? EmptyList.f71733a : list;
        if ((i5 & 2) == 0) {
            this.regions = EmptyList.f71733a;
        } else {
            this.regions = list2;
        }
        if ((i5 & 4) == 0) {
            this.recommendedCountryCodes = EmptyList.f71733a;
        } else {
            this.recommendedCountryCodes = list3;
        }
        if ((i5 & 8) == 0) {
            this.pastCountryCodes = EmptyList.f71733a;
        } else {
            this.pastCountryCodes = list4;
        }
        if ((i5 & 16) == 0) {
            this.currentCountryCode = null;
        } else {
            this.currentCountryCode = str;
        }
    }

    public SupportedRegionsResponse(@NotNull List<String> countryCodes, @NotNull List<RegionDto> regions, @NotNull List<String> recommendedCountryCodes, @NotNull List<String> pastCountryCodes, @Nullable String str) {
        Intrinsics.g(countryCodes, "countryCodes");
        Intrinsics.g(regions, "regions");
        Intrinsics.g(recommendedCountryCodes, "recommendedCountryCodes");
        Intrinsics.g(pastCountryCodes, "pastCountryCodes");
        this.countryCodes = countryCodes;
        this.regions = regions;
        this.recommendedCountryCodes = recommendedCountryCodes;
        this.pastCountryCodes = pastCountryCodes;
        this.currentCountryCode = str;
    }
}
