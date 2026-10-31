package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
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
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 /2\u00020\u0001:\u0002./B[\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\n\u0010\u000bBa\b\u0010\u0012\u0006\u0010\f\u001a\u00020\r\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0004\b\n\u0010\u0010J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J]\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020\rHÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001J%\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020\u00002\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0001¢\u0006\u0002\b-R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0012R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0012R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0012R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0012¨\u00060"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", b.f42142b, "paymentIntentId", b.f42142b, "paymentIntentClientSecret", "setupIntentId", "setupIntentClientSecret", "ephemeralKeySecret", "customerId", "publishableKey", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPaymentIntentId", "()Ljava/lang/String;", "getPaymentIntentClientSecret", "getSetupIntentId", "getSetupIntentClientSecret", "getEphemeralKeySecret", "getCustomerId", "getPublishableKey", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class PayIntentResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String customerId;

    @Nullable
    private final String ephemeralKeySecret;

    @Nullable
    private final String paymentIntentClientSecret;

    @Nullable
    private final String paymentIntentId;

    @Nullable
    private final String publishableKey;

    @Nullable
    private final String setupIntentClientSecret;

    @Nullable
    private final String setupIntentId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<PayIntentResponse> serializer() {
            return PayIntentResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public PayIntentResponse() {
        this((String) null, (String) null, (String) null, (String) null, (String) null, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ PayIntentResponse copy$default(PayIntentResponse payIntentResponse, String str, String str2, String str3, String str4, String str5, String str6, String str7, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = payIntentResponse.paymentIntentId;
        }
        if ((i5 & 2) != 0) {
            str2 = payIntentResponse.paymentIntentClientSecret;
        }
        if ((i5 & 4) != 0) {
            str3 = payIntentResponse.setupIntentId;
        }
        if ((i5 & 8) != 0) {
            str4 = payIntentResponse.setupIntentClientSecret;
        }
        if ((i5 & 16) != 0) {
            str5 = payIntentResponse.ephemeralKeySecret;
        }
        if ((i5 & 32) != 0) {
            str6 = payIntentResponse.customerId;
        }
        if ((i5 & 64) != 0) {
            str7 = payIntentResponse.publishableKey;
        }
        String str8 = str6;
        String str9 = str7;
        String str10 = str5;
        String str11 = str3;
        return payIntentResponse.copy(str, str2, str11, str4, str10, str8, str9);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(PayIntentResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.paymentIntentId != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.paymentIntentId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.paymentIntentClientSecret != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.paymentIntentClientSecret);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.setupIntentId != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.setupIntentId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.setupIntentClientSecret != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.setupIntentClientSecret);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.ephemeralKeySecret != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.ephemeralKeySecret);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.customerId != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.customerId);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.publishableKey == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.publishableKey);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getPaymentIntentId() {
        return this.paymentIntentId;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getPaymentIntentClientSecret() {
        return this.paymentIntentClientSecret;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getSetupIntentId() {
        return this.setupIntentId;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getSetupIntentClientSecret() {
        return this.setupIntentClientSecret;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getEphemeralKeySecret() {
        return this.ephemeralKeySecret;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getCustomerId() {
        return this.customerId;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getPublishableKey() {
        return this.publishableKey;
    }

    @NotNull
    public final PayIntentResponse copy(@Nullable String paymentIntentId, @Nullable String paymentIntentClientSecret, @Nullable String setupIntentId, @Nullable String setupIntentClientSecret, @Nullable String ephemeralKeySecret, @Nullable String customerId, @Nullable String publishableKey) {
        return new PayIntentResponse(paymentIntentId, paymentIntentClientSecret, setupIntentId, setupIntentClientSecret, ephemeralKeySecret, customerId, publishableKey);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PayIntentResponse)) {
            return false;
        }
        PayIntentResponse payIntentResponse = (PayIntentResponse) other;
        return Intrinsics.b(this.paymentIntentId, payIntentResponse.paymentIntentId) && Intrinsics.b(this.paymentIntentClientSecret, payIntentResponse.paymentIntentClientSecret) && Intrinsics.b(this.setupIntentId, payIntentResponse.setupIntentId) && Intrinsics.b(this.setupIntentClientSecret, payIntentResponse.setupIntentClientSecret) && Intrinsics.b(this.ephemeralKeySecret, payIntentResponse.ephemeralKeySecret) && Intrinsics.b(this.customerId, payIntentResponse.customerId) && Intrinsics.b(this.publishableKey, payIntentResponse.publishableKey);
    }

    @Nullable
    public final String getCustomerId() {
        return this.customerId;
    }

    @Nullable
    public final String getEphemeralKeySecret() {
        return this.ephemeralKeySecret;
    }

    @Nullable
    public final String getPaymentIntentClientSecret() {
        return this.paymentIntentClientSecret;
    }

    @Nullable
    public final String getPaymentIntentId() {
        return this.paymentIntentId;
    }

    @Nullable
    public final String getPublishableKey() {
        return this.publishableKey;
    }

    @Nullable
    public final String getSetupIntentClientSecret() {
        return this.setupIntentClientSecret;
    }

    @Nullable
    public final String getSetupIntentId() {
        return this.setupIntentId;
    }

    public int hashCode() {
        String str = this.paymentIntentId;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.paymentIntentClientSecret;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.setupIntentId;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.setupIntentClientSecret;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.ephemeralKeySecret;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.customerId;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.publishableKey;
        return iHashCode6 + (str7 != null ? str7.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.paymentIntentId;
        String str2 = this.paymentIntentClientSecret;
        String str3 = this.setupIntentId;
        String str4 = this.setupIntentClientSecret;
        String str5 = this.ephemeralKeySecret;
        String str6 = this.customerId;
        String str7 = this.publishableKey;
        StringBuilder sbW = c0.w("PayIntentResponse(paymentIntentId=", str, ", paymentIntentClientSecret=", str2, ", setupIntentId=");
        c0.D(sbW, str3, ", setupIntentClientSecret=", str4, ", ephemeralKeySecret=");
        c0.D(sbW, str5, ", customerId=", str6, ", publishableKey=");
        return c0.q(sbW, str7, ")");
    }

    public /* synthetic */ PayIntentResponse(int i5, String str, String str2, String str3, String str4, String str5, String str6, String str7, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.paymentIntentId = null;
        } else {
            this.paymentIntentId = str;
        }
        if ((i5 & 2) == 0) {
            this.paymentIntentClientSecret = null;
        } else {
            this.paymentIntentClientSecret = str2;
        }
        if ((i5 & 4) == 0) {
            this.setupIntentId = null;
        } else {
            this.setupIntentId = str3;
        }
        if ((i5 & 8) == 0) {
            this.setupIntentClientSecret = null;
        } else {
            this.setupIntentClientSecret = str4;
        }
        if ((i5 & 16) == 0) {
            this.ephemeralKeySecret = null;
        } else {
            this.ephemeralKeySecret = str5;
        }
        if ((i5 & 32) == 0) {
            this.customerId = null;
        } else {
            this.customerId = str6;
        }
        if ((i5 & 64) == 0) {
            this.publishableKey = null;
        } else {
            this.publishableKey = str7;
        }
    }

    public PayIntentResponse(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6, @Nullable String str7) {
        this.paymentIntentId = str;
        this.paymentIntentClientSecret = str2;
        this.setupIntentId = str3;
        this.setupIntentClientSecret = str4;
        this.ephemeralKeySecret = str5;
        this.customerId = str6;
        this.publishableKey = str7;
    }

    public /* synthetic */ PayIntentResponse(String str, String str2, String str3, String str4, String str5, String str6, String str7, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4, (i5 & 16) != 0 ? null : str5, (i5 & 32) != 0 ? null : str6, (i5 & 64) != 0 ? null : str7);
    }
}
