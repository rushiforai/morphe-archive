package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import com.amplitude.android.TrackingOptions;
import com.amplitude.core.events.Plan;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
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
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 52\u00020\u0001:\u000245Bg\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\f\u0010\rBk\b\u0010\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\f\u0010\u0012J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010$\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u001bJ\u000b\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003Jn\u0010&\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010'J\u0013\u0010(\u001a\u00020\n2\b\u0010)\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010*\u001a\u00020\u000fHÖ\u0001J\t\u0010+\u001a\u00020\u0003HÖ\u0001J%\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020\u00002\u0006\u0010/\u001a\u0002002\u0006\u00101\u001a\u000202H\u0001¢\u0006\u0002\b3R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0014R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0014R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0014R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0014R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0014R\u0015\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0014¨\u00066"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", b.f42142b, "country", b.f42142b, "postalCode", "state", TrackingOptions.AMP_TRACKING_OPTION_CITY, "line1", "line2", "accurate", b.f42142b, Plan.AMP_PLAN_SOURCE, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCountry", "()Ljava/lang/String;", "getPostalCode", "getState", "getCity", "getLine1", "getLine2", "getAccurate", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getSource", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class AddressInfo {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Boolean accurate;

    @Nullable
    private final String city;

    @Nullable
    private final String country;

    @Nullable
    private final String line1;

    @Nullable
    private final String line2;

    @Nullable
    private final String postalCode;

    @Nullable
    private final String source;

    @Nullable
    private final String state;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<AddressInfo> serializer() {
            return AddressInfo$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public AddressInfo() {
        this((String) null, (String) null, (String) null, (String) null, (String) null, (String) null, (Boolean) null, (String) null, 255, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ AddressInfo copy$default(AddressInfo addressInfo, String str, String str2, String str3, String str4, String str5, String str6, Boolean bool, String str7, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = addressInfo.country;
        }
        if ((i5 & 2) != 0) {
            str2 = addressInfo.postalCode;
        }
        if ((i5 & 4) != 0) {
            str3 = addressInfo.state;
        }
        if ((i5 & 8) != 0) {
            str4 = addressInfo.city;
        }
        if ((i5 & 16) != 0) {
            str5 = addressInfo.line1;
        }
        if ((i5 & 32) != 0) {
            str6 = addressInfo.line2;
        }
        if ((i5 & 64) != 0) {
            bool = addressInfo.accurate;
        }
        if ((i5 & 128) != 0) {
            str7 = addressInfo.source;
        }
        Boolean bool2 = bool;
        String str8 = str7;
        String str9 = str5;
        String str10 = str6;
        return addressInfo.copy(str, str2, str3, str4, str9, str10, bool2, str8);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(AddressInfo self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.country != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.country);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.postalCode != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.postalCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.state != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.state);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.city != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.city);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.line1 != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.line1);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.line2 != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.line2);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || !Intrinsics.b(self.accurate, Boolean.TRUE)) {
            output.encodeNullableSerializableElement(serialDesc, 6, BooleanSerializer.INSTANCE, self.accurate);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 7) && self.source == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 7, StringSerializer.INSTANCE, self.source);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getCountry() {
        return this.country;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getPostalCode() {
        return this.postalCode;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getState() {
        return this.state;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getCity() {
        return this.city;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getLine1() {
        return this.line1;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getLine2() {
        return this.line2;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final Boolean getAccurate() {
        return this.accurate;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final String getSource() {
        return this.source;
    }

    @NotNull
    public final AddressInfo copy(@Nullable String country, @Nullable String postalCode, @Nullable String state, @Nullable String city, @Nullable String line1, @Nullable String line2, @Nullable Boolean accurate, @Nullable String source) {
        return new AddressInfo(country, postalCode, state, city, line1, line2, accurate, source);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AddressInfo)) {
            return false;
        }
        AddressInfo addressInfo = (AddressInfo) other;
        return Intrinsics.b(this.country, addressInfo.country) && Intrinsics.b(this.postalCode, addressInfo.postalCode) && Intrinsics.b(this.state, addressInfo.state) && Intrinsics.b(this.city, addressInfo.city) && Intrinsics.b(this.line1, addressInfo.line1) && Intrinsics.b(this.line2, addressInfo.line2) && Intrinsics.b(this.accurate, addressInfo.accurate) && Intrinsics.b(this.source, addressInfo.source);
    }

    @Nullable
    public final Boolean getAccurate() {
        return this.accurate;
    }

    @Nullable
    public final String getCity() {
        return this.city;
    }

    @Nullable
    public final String getCountry() {
        return this.country;
    }

    @Nullable
    public final String getLine1() {
        return this.line1;
    }

    @Nullable
    public final String getLine2() {
        return this.line2;
    }

    @Nullable
    public final String getPostalCode() {
        return this.postalCode;
    }

    @Nullable
    public final String getSource() {
        return this.source;
    }

    @Nullable
    public final String getState() {
        return this.state;
    }

    public int hashCode() {
        String str = this.country;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.postalCode;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.state;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.city;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.line1;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.line2;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        Boolean bool = this.accurate;
        int iHashCode7 = (iHashCode6 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str7 = this.source;
        return iHashCode7 + (str7 != null ? str7.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.country;
        String str2 = this.postalCode;
        String str3 = this.state;
        String str4 = this.city;
        String str5 = this.line1;
        String str6 = this.line2;
        Boolean bool = this.accurate;
        String str7 = this.source;
        StringBuilder sbW = c0.w("AddressInfo(country=", str, ", postalCode=", str2, ", state=");
        c0.D(sbW, str3, ", city=", str4, ", line1=");
        c0.D(sbW, str5, ", line2=", str6, ", accurate=");
        sbW.append(bool);
        sbW.append(", source=");
        sbW.append(str7);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ AddressInfo(int i5, String str, String str2, String str3, String str4, String str5, String str6, Boolean bool, String str7, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.country = null;
        } else {
            this.country = str;
        }
        if ((i5 & 2) == 0) {
            this.postalCode = null;
        } else {
            this.postalCode = str2;
        }
        if ((i5 & 4) == 0) {
            this.state = null;
        } else {
            this.state = str3;
        }
        if ((i5 & 8) == 0) {
            this.city = null;
        } else {
            this.city = str4;
        }
        if ((i5 & 16) == 0) {
            this.line1 = null;
        } else {
            this.line1 = str5;
        }
        if ((i5 & 32) == 0) {
            this.line2 = null;
        } else {
            this.line2 = str6;
        }
        if ((i5 & 64) == 0) {
            this.accurate = Boolean.TRUE;
        } else {
            this.accurate = bool;
        }
        if ((i5 & 128) == 0) {
            this.source = null;
        } else {
            this.source = str7;
        }
    }

    public AddressInfo(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6, @Nullable Boolean bool, @Nullable String str7) {
        this.country = str;
        this.postalCode = str2;
        this.state = str3;
        this.city = str4;
        this.line1 = str5;
        this.line2 = str6;
        this.accurate = bool;
        this.source = str7;
    }

    public /* synthetic */ AddressInfo(String str, String str2, String str3, String str4, String str5, String str6, Boolean bool, String str7, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4, (i5 & 16) != 0 ? null : str5, (i5 & 32) != 0 ? null : str6, (i5 & 64) != 0 ? Boolean.TRUE : bool, (i5 & 128) != 0 ? null : str7);
    }
}
