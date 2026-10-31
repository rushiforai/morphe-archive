package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
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

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 (2\u00020\u0001:\u0002'(B9\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\b\u0010\tBI\b\u0010\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\b\u0010\u000eJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J;\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u000bHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001J%\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020%H\u0001¢\u0006\u0002\b&R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0010¨\u0006)"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionDto;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, "displayName", "countryCodes", b.f42142b, "infoUrl", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCode", "()Ljava/lang/String;", "getDisplayName", "getCountryCodes", "()Ljava/util/List;", "getInfoUrl", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class RegionDto {

    @NotNull
    private final String code;

    @NotNull
    private final List<String> countryCodes;

    @Nullable
    private final String displayName;

    @Nullable
    private final String infoUrl;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @JvmField
    @NotNull
    private static final KSerializer<Object>[] $childSerializers = {null, null, new ArrayListSerializer(StringSerializer.INSTANCE), null};

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionDto$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/RegionDto;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<RegionDto> serializer() {
            return RegionDto$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public RegionDto() {
        this((String) null, (String) null, (List) null, (String) null, 15, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ RegionDto copy$default(RegionDto regionDto, String str, String str2, List list, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = regionDto.code;
        }
        if ((i5 & 2) != 0) {
            str2 = regionDto.displayName;
        }
        if ((i5 & 4) != 0) {
            list = regionDto.countryCodes;
        }
        if ((i5 & 8) != 0) {
            str3 = regionDto.infoUrl;
        }
        return regionDto.copy(str, str2, list, str3);
    }

    @JvmStatic
    public static final void write$Self$mobile_sdk_release(RegionDto self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = $childSerializers;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || !Intrinsics.b(self.code, b.f42142b)) {
            output.encodeStringElement(serialDesc, 0, self.code);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.displayName != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.displayName);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || !Intrinsics.b(self.countryCodes, EmptyList.f71733a)) {
            output.encodeSerializableElement(serialDesc, 2, kSerializerArr[2], self.countryCodes);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3) && self.infoUrl == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.infoUrl);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getCode() {
        return this.code;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    public final List<String> component3() {
        return this.countryCodes;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getInfoUrl() {
        return this.infoUrl;
    }

    @NotNull
    public final RegionDto copy(@NotNull String code, @Nullable String displayName, @NotNull List<String> countryCodes, @Nullable String infoUrl) {
        Intrinsics.g(code, "code");
        Intrinsics.g(countryCodes, "countryCodes");
        return new RegionDto(code, displayName, countryCodes, infoUrl);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof RegionDto)) {
            return false;
        }
        RegionDto regionDto = (RegionDto) other;
        return Intrinsics.b(this.code, regionDto.code) && Intrinsics.b(this.displayName, regionDto.displayName) && Intrinsics.b(this.countryCodes, regionDto.countryCodes) && Intrinsics.b(this.infoUrl, regionDto.infoUrl);
    }

    @NotNull
    public final String getCode() {
        return this.code;
    }

    @NotNull
    public final List<String> getCountryCodes() {
        return this.countryCodes;
    }

    @Nullable
    public final String getDisplayName() {
        return this.displayName;
    }

    @Nullable
    public final String getInfoUrl() {
        return this.infoUrl;
    }

    public int hashCode() {
        int iHashCode = this.code.hashCode() * 31;
        String str = this.displayName;
        int iC = u4.c((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.countryCodes);
        String str2 = this.infoUrl;
        return iC + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.code;
        String str2 = this.displayName;
        List<String> list = this.countryCodes;
        String str3 = this.infoUrl;
        StringBuilder sbW = c0.w("RegionDto(code=", str, ", displayName=", str2, ", countryCodes=");
        sbW.append(list);
        sbW.append(", infoUrl=");
        sbW.append(str3);
        sbW.append(")");
        return sbW.toString();
    }

    public RegionDto(int i5, String str, String str2, List list, String str3, SerializationConstructorMarker serializationConstructorMarker) {
        this.code = (i5 & 1) == 0 ? b.f42142b : str;
        if ((i5 & 2) == 0) {
            this.displayName = null;
        } else {
            this.displayName = str2;
        }
        if ((i5 & 4) == 0) {
            this.countryCodes = EmptyList.f71733a;
        } else {
            this.countryCodes = list;
        }
        if ((i5 & 8) == 0) {
            this.infoUrl = null;
        } else {
            this.infoUrl = str3;
        }
    }

    public RegionDto(@NotNull String code, @Nullable String str, @NotNull List<String> countryCodes, @Nullable String str2) {
        Intrinsics.g(code, "code");
        Intrinsics.g(countryCodes, "countryCodes");
        this.code = code;
        this.displayName = str;
        this.countryCodes = countryCodes;
        this.infoUrl = str2;
    }

    public RegionDto(String str, String str2, List list, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? b.f42142b : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? EmptyList.f71733a : list, (i5 & 8) != 0 ? null : str3);
    }
}
