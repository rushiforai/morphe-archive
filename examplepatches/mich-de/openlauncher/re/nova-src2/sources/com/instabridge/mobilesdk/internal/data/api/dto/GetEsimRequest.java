package com.instabridge.mobilesdk.internal.data.api.dto;

import b.c0;
import b.c9;
import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
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
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 :2\u00020\u0001:\u00029:Bm\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\u000e\u0010\u000fBq\b\u0010\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\u0004\b\u000e\u0010\u0014J\t\u0010\"\u001a\u00020\u0003HÆ\u0003J\t\u0010#\u001a\u00020\u0005HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010&\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010'\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010(\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u0010\u0010)\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u001fJ\u000b\u0010*\u001a\u0004\u0018\u00010\u0007HÆ\u0003Jv\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010,J\u0013\u0010-\u001a\u00020\u00052\b\u0010.\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010/\u001a\u00020\u0011HÖ\u0001J\t\u00100\u001a\u00020\u0007HÖ\u0001J%\u00101\u001a\u0002022\u0006\u00103\u001a\u00020\u00002\u0006\u00104\u001a\u0002052\u0006\u00106\u001a\u000207H\u0001¢\u0006\u0002\b8R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0017R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0019R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0019R\u0013\u0010\n\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0019R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0019R\u0015\u0010\f\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010 \u001a\u0004\b\u001e\u0010\u001fR\u0013\u0010\r\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u0019¨\u0006;"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/GetEsimRequest;", b.f42142b, "packageId", b.f42142b, "isFreeTrial", b.f42142b, InneractiveMediationDefs.KEY_ZIPCODE, b.f42142b, PlaceTypes.ADDRESS, "state", TrackingOptions.AMP_TRACKING_OPTION_CITY, "referralCode", "activateOnAttach", "bypassCountry", "<init>", "(JZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V", "seen0", b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IJZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getPackageId", "()J", "()Z", "getZipCode", "()Ljava/lang/String;", "getAddress", "getState", "getCity", "getReferralCode", "getActivateOnAttach", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getBypassCountry", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "(JZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/data/api/dto/GetEsimRequest;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class GetEsimRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Boolean activateOnAttach;

    @Nullable
    private final String address;

    @Nullable
    private final String bypassCountry;

    @Nullable
    private final String city;
    private final boolean isFreeTrial;
    private final long packageId;

    @Nullable
    private final String referralCode;

    @Nullable
    private final String state;

    @Nullable
    private final String zipCode;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/dto/GetEsimRequest$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/GetEsimRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<GetEsimRequest> serializer() {
            return GetEsimRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ GetEsimRequest(int i5, long j11, boolean z11, String str, String str2, String str3, String str4, String str5, Boolean bool, String str6, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, GetEsimRequest$$serializer.INSTANCE.getDescriptor());
        }
        this.packageId = j11;
        if ((i5 & 2) == 0) {
            this.isFreeTrial = false;
        } else {
            this.isFreeTrial = z11;
        }
        if ((i5 & 4) == 0) {
            this.zipCode = null;
        } else {
            this.zipCode = str;
        }
        if ((i5 & 8) == 0) {
            this.address = null;
        } else {
            this.address = str2;
        }
        if ((i5 & 16) == 0) {
            this.state = null;
        } else {
            this.state = str3;
        }
        if ((i5 & 32) == 0) {
            this.city = null;
        } else {
            this.city = str4;
        }
        if ((i5 & 64) == 0) {
            this.referralCode = null;
        } else {
            this.referralCode = str5;
        }
        if ((i5 & 128) == 0) {
            this.activateOnAttach = null;
        } else {
            this.activateOnAttach = bool;
        }
        if ((i5 & 256) == 0) {
            this.bypassCountry = null;
        } else {
            this.bypassCountry = str6;
        }
    }

    public static /* synthetic */ GetEsimRequest copy$default(GetEsimRequest getEsimRequest, long j11, boolean z11, String str, String str2, String str3, String str4, String str5, Boolean bool, String str6, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = getEsimRequest.packageId;
        }
        long j12 = j11;
        if ((i5 & 2) != 0) {
            z11 = getEsimRequest.isFreeTrial;
        }
        boolean z12 = z11;
        if ((i5 & 4) != 0) {
            str = getEsimRequest.zipCode;
        }
        return getEsimRequest.copy(j12, z12, str, (i5 & 8) != 0 ? getEsimRequest.address : str2, (i5 & 16) != 0 ? getEsimRequest.state : str3, (i5 & 32) != 0 ? getEsimRequest.city : str4, (i5 & 64) != 0 ? getEsimRequest.referralCode : str5, (i5 & 128) != 0 ? getEsimRequest.activateOnAttach : bool, (i5 & 256) != 0 ? getEsimRequest.bypassCountry : str6);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(GetEsimRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeLongElement(serialDesc, 0, self.packageId);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.isFreeTrial) {
            output.encodeBooleanElement(serialDesc, 1, self.isFreeTrial);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.zipCode != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.zipCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.address != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.address);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.state != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.state);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.city != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.city);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.referralCode != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.referralCode);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.activateOnAttach != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, BooleanSerializer.INSTANCE, self.activateOnAttach);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 8) && self.bypassCountry == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.bypassCountry);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIsFreeTrial() {
        return this.isFreeTrial;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getZipCode() {
        return this.zipCode;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getAddress() {
        return this.address;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getState() {
        return this.state;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getCity() {
        return this.city;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getReferralCode() {
        return this.referralCode;
    }

    @Nullable
    /* renamed from: component8, reason: from getter */
    public final Boolean getActivateOnAttach() {
        return this.activateOnAttach;
    }

    @Nullable
    /* renamed from: component9, reason: from getter */
    public final String getBypassCountry() {
        return this.bypassCountry;
    }

    @NotNull
    public final GetEsimRequest copy(long packageId, boolean isFreeTrial, @Nullable String zipCode, @Nullable String address, @Nullable String state, @Nullable String city, @Nullable String referralCode, @Nullable Boolean activateOnAttach, @Nullable String bypassCountry) {
        return new GetEsimRequest(packageId, isFreeTrial, zipCode, address, state, city, referralCode, activateOnAttach, bypassCountry);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof GetEsimRequest)) {
            return false;
        }
        GetEsimRequest getEsimRequest = (GetEsimRequest) other;
        return this.packageId == getEsimRequest.packageId && this.isFreeTrial == getEsimRequest.isFreeTrial && Intrinsics.b(this.zipCode, getEsimRequest.zipCode) && Intrinsics.b(this.address, getEsimRequest.address) && Intrinsics.b(this.state, getEsimRequest.state) && Intrinsics.b(this.city, getEsimRequest.city) && Intrinsics.b(this.referralCode, getEsimRequest.referralCode) && Intrinsics.b(this.activateOnAttach, getEsimRequest.activateOnAttach) && Intrinsics.b(this.bypassCountry, getEsimRequest.bypassCountry);
    }

    @Nullable
    public final Boolean getActivateOnAttach() {
        return this.activateOnAttach;
    }

    @Nullable
    public final String getAddress() {
        return this.address;
    }

    @Nullable
    public final String getBypassCountry() {
        return this.bypassCountry;
    }

    @Nullable
    public final String getCity() {
        return this.city;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    @Nullable
    public final String getReferralCode() {
        return this.referralCode;
    }

    @Nullable
    public final String getState() {
        return this.state;
    }

    @Nullable
    public final String getZipCode() {
        return this.zipCode;
    }

    public int hashCode() {
        int iF = c9.f(Long.hashCode(this.packageId) * 31, 31, this.isFreeTrial);
        String str = this.zipCode;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.address;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.state;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.city;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.referralCode;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        Boolean bool = this.activateOnAttach;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str6 = this.bypassCountry;
        return iHashCode6 + (str6 != null ? str6.hashCode() : 0);
    }

    public final boolean isFreeTrial() {
        return this.isFreeTrial;
    }

    @NotNull
    public String toString() {
        long j11 = this.packageId;
        boolean z11 = this.isFreeTrial;
        String str = this.zipCode;
        String str2 = this.address;
        String str3 = this.state;
        String str4 = this.city;
        String str5 = this.referralCode;
        Boolean bool = this.activateOnAttach;
        String str6 = this.bypassCountry;
        StringBuilder sb2 = new StringBuilder("GetEsimRequest(packageId=");
        sb2.append(j11);
        sb2.append(", isFreeTrial=");
        sb2.append(z11);
        c0.D(sb2, ", zipCode=", str, ", address=", str2);
        c0.D(sb2, ", state=", str3, ", city=", str4);
        sb2.append(", referralCode=");
        sb2.append(str5);
        sb2.append(", activateOnAttach=");
        sb2.append(bool);
        return c0.r(sb2, ", bypassCountry=", str6, ")");
    }

    public GetEsimRequest(long j11, boolean z11, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable Boolean bool, @Nullable String str6) {
        this.packageId = j11;
        this.isFreeTrial = z11;
        this.zipCode = str;
        this.address = str2;
        this.state = str3;
        this.city = str4;
        this.referralCode = str5;
        this.activateOnAttach = bool;
        this.bypassCountry = str6;
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    public /* synthetic */ GetEsimRequest(long r14, boolean r16, java.lang.String r17, java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21, java.lang.Boolean r22, java.lang.String r23, int r24, kotlin.jvm.internal.DefaultConstructorMarker r25) {
        /*
            r13 = this;
            r0 = r24
            r1 = r0 & 2
            if (r1 == 0) goto L9
            r1 = 0
            r5 = r1
            goto Lb
        L9:
            r5 = r16
        Lb:
            r1 = r0 & 4
            r2 = 0
            if (r1 == 0) goto L12
            r6 = r2
            goto L14
        L12:
            r6 = r17
        L14:
            r1 = r0 & 8
            if (r1 == 0) goto L1a
            r7 = r2
            goto L1c
        L1a:
            r7 = r18
        L1c:
            r1 = r0 & 16
            if (r1 == 0) goto L22
            r8 = r2
            goto L24
        L22:
            r8 = r19
        L24:
            r1 = r0 & 32
            if (r1 == 0) goto L2a
            r9 = r2
            goto L2c
        L2a:
            r9 = r20
        L2c:
            r1 = r0 & 64
            if (r1 == 0) goto L32
            r10 = r2
            goto L34
        L32:
            r10 = r21
        L34:
            r1 = r0 & 128(0x80, float:1.8E-43)
            if (r1 == 0) goto L3a
            r11 = r2
            goto L3c
        L3a:
            r11 = r22
        L3c:
            r0 = r0 & 256(0x100, float:3.59E-43)
            if (r0 == 0) goto L44
            r12 = r2
            r3 = r14
            r2 = r13
            goto L48
        L44:
            r12 = r23
            r2 = r13
            r3 = r14
        L48:
            r2.<init>(r3, r5, r6, r7, r8, r9, r10, r11, r12)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.instabridge.mobilesdk.internal.data.api.dto.GetEsimRequest.<init>(long, boolean, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.Boolean, java.lang.String, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }
}
