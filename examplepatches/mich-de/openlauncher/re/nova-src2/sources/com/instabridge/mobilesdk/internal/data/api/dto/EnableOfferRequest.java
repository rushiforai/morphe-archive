package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
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
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 -2\u00020\u0001:\u0002,-BC\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nBM\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\t\u0010\u000fJ\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u0014J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003JJ\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u001eJ\u0013\u0010\u001f\u001a\u00020 2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\"\u001a\u00020\fHÖ\u0001J\t\u0010#\u001a\u00020\u0003HÖ\u0001J%\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020\u00002\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*H\u0001¢\u0006\u0002\b+R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u0015\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0011¨\u0006."}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest;", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, b.f42142b, "device", "deviceVersion", b.f42142b, "deviceToken", "bypassCountry", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getCode", "()Ljava/lang/String;", "getDevice", "getDeviceVersion", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getDeviceToken", "getBypassCountry", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class EnableOfferRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String bypassCountry;

    @Nullable
    private final String code;

    @Nullable
    private final String device;

    @Nullable
    private final String deviceToken;

    @Nullable
    private final Long deviceVersion;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/EnableOfferRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<EnableOfferRequest> serializer() {
            return EnableOfferRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public EnableOfferRequest() {
        this((String) null, (String) null, (Long) null, (String) null, (String) null, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ EnableOfferRequest copy$default(EnableOfferRequest enableOfferRequest, String str, String str2, Long l9, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = enableOfferRequest.code;
        }
        if ((i5 & 2) != 0) {
            str2 = enableOfferRequest.device;
        }
        if ((i5 & 4) != 0) {
            l9 = enableOfferRequest.deviceVersion;
        }
        if ((i5 & 8) != 0) {
            str3 = enableOfferRequest.deviceToken;
        }
        if ((i5 & 16) != 0) {
            str4 = enableOfferRequest.bypassCountry;
        }
        String str5 = str4;
        Long l11 = l9;
        return enableOfferRequest.copy(str, str2, l11, str3, str5);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(EnableOfferRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.code != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.code);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.device != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.device);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.deviceVersion != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, LongSerializer.INSTANCE, self.deviceVersion);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.deviceToken != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.deviceToken);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.bypassCountry == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.bypassCountry);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getCode() {
        return this.code;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getDevice() {
        return this.device;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Long getDeviceVersion() {
        return this.deviceVersion;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getDeviceToken() {
        return this.deviceToken;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getBypassCountry() {
        return this.bypassCountry;
    }

    @NotNull
    public final EnableOfferRequest copy(@Nullable String code, @Nullable String device, @Nullable Long deviceVersion, @Nullable String deviceToken, @Nullable String bypassCountry) {
        return new EnableOfferRequest(code, device, deviceVersion, deviceToken, bypassCountry);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EnableOfferRequest)) {
            return false;
        }
        EnableOfferRequest enableOfferRequest = (EnableOfferRequest) other;
        return Intrinsics.b(this.code, enableOfferRequest.code) && Intrinsics.b(this.device, enableOfferRequest.device) && Intrinsics.b(this.deviceVersion, enableOfferRequest.deviceVersion) && Intrinsics.b(this.deviceToken, enableOfferRequest.deviceToken) && Intrinsics.b(this.bypassCountry, enableOfferRequest.bypassCountry);
    }

    @Nullable
    public final String getBypassCountry() {
        return this.bypassCountry;
    }

    @Nullable
    public final String getCode() {
        return this.code;
    }

    @Nullable
    public final String getDevice() {
        return this.device;
    }

    @Nullable
    public final String getDeviceToken() {
        return this.deviceToken;
    }

    @Nullable
    public final Long getDeviceVersion() {
        return this.deviceVersion;
    }

    public int hashCode() {
        String str = this.code;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.device;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l9 = this.deviceVersion;
        int iHashCode3 = (iHashCode2 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str3 = this.deviceToken;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.bypassCountry;
        return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.code;
        String str2 = this.device;
        Long l9 = this.deviceVersion;
        String str3 = this.deviceToken;
        String str4 = this.bypassCountry;
        StringBuilder sbW = c0.w("EnableOfferRequest(code=", str, ", device=", str2, ", deviceVersion=");
        sbW.append(l9);
        sbW.append(", deviceToken=");
        sbW.append(str3);
        sbW.append(", bypassCountry=");
        return c0.q(sbW, str4, ")");
    }

    public /* synthetic */ EnableOfferRequest(int i5, String str, String str2, Long l9, String str3, String str4, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.code = null;
        } else {
            this.code = str;
        }
        if ((i5 & 2) == 0) {
            this.device = null;
        } else {
            this.device = str2;
        }
        if ((i5 & 4) == 0) {
            this.deviceVersion = null;
        } else {
            this.deviceVersion = l9;
        }
        if ((i5 & 8) == 0) {
            this.deviceToken = null;
        } else {
            this.deviceToken = str3;
        }
        if ((i5 & 16) == 0) {
            this.bypassCountry = null;
        } else {
            this.bypassCountry = str4;
        }
    }

    public EnableOfferRequest(@Nullable String str, @Nullable String str2, @Nullable Long l9, @Nullable String str3, @Nullable String str4) {
        this.code = str;
        this.device = str2;
        this.deviceVersion = l9;
        this.deviceToken = str3;
        this.bypassCountry = str4;
    }

    public /* synthetic */ EnableOfferRequest(String str, String str2, Long l9, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : l9, (i5 & 8) != 0 ? null : str3, (i5 & 16) != 0 ? null : str4);
    }
}
