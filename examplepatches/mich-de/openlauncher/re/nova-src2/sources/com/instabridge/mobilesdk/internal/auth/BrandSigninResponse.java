package com.instabridge.mobilesdk.internal.auth;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 02\u00020\u0001:\u0002/0BC\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nBM\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\t\u0010\u000fJ\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u0015J\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u0015J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003JJ\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010!J\u0013\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010%\u001a\u00020\fHÖ\u0001J\t\u0010&\u001a\u00020\u0003HÖ\u0001J%\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020\u00002\u0006\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020-H\u0001¢\u0006\u0002\b.R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R \u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0010\n\u0002\u0010\u0016\u0012\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R \u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0010\n\u0002\u0010\u0016\u0012\u0004\b\u0017\u0010\u0013\u001a\u0004\b\u0018\u0010\u0015R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0011¨\u00061"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/BrandSigninResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "token", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "authId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userId", "secret", "existingBrandUid", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getToken", "()Ljava/lang/String;", "getAuthId$annotations", "()V", "getAuthId", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getUserId$annotations", "getUserId", "getSecret", "getExistingBrandUid", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/auth/BrandSigninResponse;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class BrandSigninResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final Long authId;

    @Nullable
    private final String existingBrandUid;

    @Nullable
    private final String secret;

    @Nullable
    private final String token;

    @Nullable
    private final Long userId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/BrandSigninResponse$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/BrandSigninResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<BrandSigninResponse> serializer() {
            return BrandSigninResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public BrandSigninResponse() {
        this((String) null, (Long) null, (Long) null, (String) null, (String) null, 31, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ BrandSigninResponse copy$default(BrandSigninResponse brandSigninResponse, String str, Long l9, Long l11, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = brandSigninResponse.token;
        }
        if ((i5 & 2) != 0) {
            l9 = brandSigninResponse.authId;
        }
        if ((i5 & 4) != 0) {
            l11 = brandSigninResponse.userId;
        }
        if ((i5 & 8) != 0) {
            str2 = brandSigninResponse.secret;
        }
        if ((i5 & 16) != 0) {
            str3 = brandSigninResponse.existingBrandUid;
        }
        String str4 = str3;
        Long l12 = l11;
        return brandSigninResponse.copy(str, l9, l12, str2, str4);
    }

    @SerialName("auth_id")
    public static /* synthetic */ void getAuthId$annotations() {
    }

    @SerialName("user_id")
    public static /* synthetic */ void getUserId$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(BrandSigninResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.token != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.token);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.authId != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, LongSerializer.INSTANCE, self.authId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.userId != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, LongSerializer.INSTANCE, self.userId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.secret != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.secret);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.existingBrandUid == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.existingBrandUid);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Long getAuthId() {
        return this.authId;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Long getUserId() {
        return this.userId;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getSecret() {
        return this.secret;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getExistingBrandUid() {
        return this.existingBrandUid;
    }

    @NotNull
    public final BrandSigninResponse copy(@Nullable String token, @Nullable Long authId, @Nullable Long userId, @Nullable String secret, @Nullable String existingBrandUid) {
        return new BrandSigninResponse(token, authId, userId, secret, existingBrandUid);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BrandSigninResponse)) {
            return false;
        }
        BrandSigninResponse brandSigninResponse = (BrandSigninResponse) other;
        return Intrinsics.b(this.token, brandSigninResponse.token) && Intrinsics.b(this.authId, brandSigninResponse.authId) && Intrinsics.b(this.userId, brandSigninResponse.userId) && Intrinsics.b(this.secret, brandSigninResponse.secret) && Intrinsics.b(this.existingBrandUid, brandSigninResponse.existingBrandUid);
    }

    @Nullable
    public final Long getAuthId() {
        return this.authId;
    }

    @Nullable
    public final String getExistingBrandUid() {
        return this.existingBrandUid;
    }

    @Nullable
    public final String getSecret() {
        return this.secret;
    }

    @Nullable
    public final String getToken() {
        return this.token;
    }

    @Nullable
    public final Long getUserId() {
        return this.userId;
    }

    public int hashCode() {
        String str = this.token;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Long l9 = this.authId;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        Long l11 = this.userId;
        int iHashCode3 = (iHashCode2 + (l11 == null ? 0 : l11.hashCode())) * 31;
        String str2 = this.secret;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.existingBrandUid;
        return iHashCode4 + (str3 != null ? str3.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.token;
        Long l9 = this.authId;
        Long l11 = this.userId;
        String str2 = this.secret;
        String str3 = this.existingBrandUid;
        StringBuilder sb2 = new StringBuilder("BrandSigninResponse(token=");
        sb2.append(str);
        sb2.append(", authId=");
        sb2.append(l9);
        sb2.append(", userId=");
        sb2.append(l11);
        sb2.append(", secret=");
        sb2.append(str2);
        sb2.append(", existingBrandUid=");
        return c0.q(sb2, str3, ")");
    }

    public /* synthetic */ BrandSigninResponse(int i5, String str, Long l9, Long l11, String str2, String str3, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.token = null;
        } else {
            this.token = str;
        }
        if ((i5 & 2) == 0) {
            this.authId = null;
        } else {
            this.authId = l9;
        }
        if ((i5 & 4) == 0) {
            this.userId = null;
        } else {
            this.userId = l11;
        }
        if ((i5 & 8) == 0) {
            this.secret = null;
        } else {
            this.secret = str2;
        }
        if ((i5 & 16) == 0) {
            this.existingBrandUid = null;
        } else {
            this.existingBrandUid = str3;
        }
    }

    public BrandSigninResponse(@Nullable String str, @Nullable Long l9, @Nullable Long l11, @Nullable String str2, @Nullable String str3) {
        this.token = str;
        this.authId = l9;
        this.userId = l11;
        this.secret = str2;
        this.existingBrandUid = str3;
    }

    public /* synthetic */ BrandSigninResponse(String str, Long l9, Long l11, String str2, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : l9, (i5 & 4) != 0 ? null : l11, (i5 & 8) != 0 ? null : str2, (i5 & 16) != 0 ? null : str3);
    }
}
