package com.instabridge.mobilesdk.internal.data.api.dto;

import a80.m;
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

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 &2\u00020\u0001:\u0002%&B-\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0007¢\u0006\u0004\b\b\u0010\tB=\b\u0010\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0007\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\b\u0010\rJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\u0007HÆ\u0003J/\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0007HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001J\t\u0010\u001c\u001a\u00020\u0005HÖ\u0001J%\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u00002\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020#H\u0001¢\u0006\u0002\b$R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006'"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;", b.f42142b, "count", b.f42142b, "listUrl", b.f42142b, "codes", b.f42142b, "<init>", "(ILjava/lang/String;Ljava/util/List;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IILjava/lang/String;Ljava/util/List;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCount", "()I", "getListUrl", "()Ljava/lang/String;", "getCodes", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PurchasedRegionCountriesDto {

    @NotNull
    private final List<String> codes;
    private final int count;

    @Nullable
    private final String listUrl;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {null, null, new ArrayListSerializer(StringSerializer.INSTANCE)};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PurchasedRegionCountriesDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PurchasedRegionCountriesDto> serializer() {
            return PurchasedRegionCountriesDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PurchasedRegionCountriesDto() {
        this(0, (String) null, (List) null, 7, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PurchasedRegionCountriesDto copy$default(PurchasedRegionCountriesDto purchasedRegionCountriesDto, int i5, String str, List list, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = purchasedRegionCountriesDto.count;
        }
        if ((i11 & 2) != 0) {
            str = purchasedRegionCountriesDto.listUrl;
        }
        if ((i11 & 4) != 0) {
            list = purchasedRegionCountriesDto.codes;
        }
        return purchasedRegionCountriesDto.copy(i5, str, list);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(PurchasedRegionCountriesDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.count != 0) {
            output.encodeIntElement(serialDesc, 0, self.count);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.listUrl != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.listUrl);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 2) && Intrinsics.b(self.codes, EmptyList.f71733a)) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 2, kSerializerArr[2], self.codes);
    }

    /* renamed from: component1, reason: from getter */
    public final int getCount() {
        return this.count;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getListUrl() {
        return this.listUrl;
    }

    @NotNull
    public final List<String> component3() {
        return this.codes;
    }

    @NotNull
    public final PurchasedRegionCountriesDto copy(int count, @Nullable String listUrl, @NotNull List<String> codes) {
        Intrinsics.g(codes, "codes");
        return new PurchasedRegionCountriesDto(count, listUrl, codes);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasedRegionCountriesDto)) {
            return false;
        }
        PurchasedRegionCountriesDto purchasedRegionCountriesDto = (PurchasedRegionCountriesDto) other;
        return this.count == purchasedRegionCountriesDto.count && Intrinsics.b(this.listUrl, purchasedRegionCountriesDto.listUrl) && Intrinsics.b(this.codes, purchasedRegionCountriesDto.codes);
    }

    @NotNull
    public final List<String> getCodes() {
        return this.codes;
    }

    public final int getCount() {
        return this.count;
    }

    @Nullable
    public final String getListUrl() {
        return this.listUrl;
    }

    public int hashCode() {
        int iHashCode = Integer.hashCode(this.count) * 31;
        String str = this.listUrl;
        return this.codes.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    @NotNull
    public String toString() {
        int i5 = this.count;
        String str = this.listUrl;
        List<String> list = this.codes;
        StringBuilder sb2 = new StringBuilder("PurchasedRegionCountriesDto(count=");
        sb2.append(i5);
        sb2.append(", listUrl=");
        sb2.append(str);
        sb2.append(", codes=");
        return m.j(sb2, list, ")");
    }

    public PurchasedRegionCountriesDto(int i5, String str, List list, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this((i11 & 1) != 0 ? 0 : i5, (i11 & 2) != 0 ? null : str, (i11 & 4) != 0 ? EmptyList.f71733a : list);
    }

    public PurchasedRegionCountriesDto(int i5, int i11, String str, List list, SerializationConstructorMarker serializationConstructorMarker) {
        this.count = (i5 & 1) == 0 ? 0 : i11;
        if ((i5 & 2) == 0) {
            this.listUrl = null;
        } else {
            this.listUrl = str;
        }
        if ((i5 & 4) == 0) {
            this.codes = EmptyList.f71733a;
        } else {
            this.codes = list;
        }
    }

    public PurchasedRegionCountriesDto(int i5, @Nullable String str, @NotNull List<String> codes) {
        Intrinsics.g(codes, "codes");
        this.count = i5;
        this.listUrl = str;
        this.codes = codes;
    }
}
