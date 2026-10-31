package com.instabridge.mobilesdk.internal.auth;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 ,2\u00020\u0001:\u0002+,BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nBW\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\t\u0010\u000fJ\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0019\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003JO\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\fHÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001J%\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00002\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020)H\u0001¢\u0006\u0002\b*R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0011¨\u0006-"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/BrandSigninRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "brandUid", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "socialProvider", "socialToken", "socialAccountId", ActionCategory.EMAIL, "phoneNumber", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getBrandUid", "()Ljava/lang/String;", "getSocialProvider", "getSocialToken", "getSocialAccountId", "getEmail", "getPhoneNumber", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class BrandSigninRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String brandUid;

    @Nullable
    private final String email;

    @Nullable
    private final String phoneNumber;

    @Nullable
    private final String socialAccountId;

    @Nullable
    private final String socialProvider;

    @Nullable
    private final String socialToken;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/BrandSigninRequest$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/BrandSigninRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<BrandSigninRequest> serializer() {
            return BrandSigninRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ BrandSigninRequest(int i5, String str, String str2, String str3, String str4, String str5, String str6, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, BrandSigninRequest$$serializer.INSTANCE.getDescriptor());
        }
        this.brandUid = str;
        if ((i5 & 2) == 0) {
            this.socialProvider = null;
        } else {
            this.socialProvider = str2;
        }
        if ((i5 & 4) == 0) {
            this.socialToken = null;
        } else {
            this.socialToken = str3;
        }
        if ((i5 & 8) == 0) {
            this.socialAccountId = null;
        } else {
            this.socialAccountId = str4;
        }
        if ((i5 & 16) == 0) {
            this.email = null;
        } else {
            this.email = str5;
        }
        if ((i5 & 32) == 0) {
            this.phoneNumber = null;
        } else {
            this.phoneNumber = str6;
        }
    }

    public static /* synthetic */ BrandSigninRequest copy$default(BrandSigninRequest brandSigninRequest, String str, String str2, String str3, String str4, String str5, String str6, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = brandSigninRequest.brandUid;
        }
        if ((i5 & 2) != 0) {
            str2 = brandSigninRequest.socialProvider;
        }
        if ((i5 & 4) != 0) {
            str3 = brandSigninRequest.socialToken;
        }
        if ((i5 & 8) != 0) {
            str4 = brandSigninRequest.socialAccountId;
        }
        if ((i5 & 16) != 0) {
            str5 = brandSigninRequest.email;
        }
        if ((i5 & 32) != 0) {
            str6 = brandSigninRequest.phoneNumber;
        }
        String str7 = str5;
        String str8 = str6;
        return brandSigninRequest.copy(str, str2, str3, str4, str7, str8);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(BrandSigninRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.brandUid);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.socialProvider != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.socialProvider);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.socialToken != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.socialToken);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.socialAccountId != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.socialAccountId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.email != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.email);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 5) && self.phoneNumber == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.phoneNumber);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getBrandUid() {
        return this.brandUid;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getSocialProvider() {
        return this.socialProvider;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getSocialToken() {
        return this.socialToken;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getSocialAccountId() {
        return this.socialAccountId;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getEmail() {
        return this.email;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getPhoneNumber() {
        return this.phoneNumber;
    }

    @NotNull
    public final BrandSigninRequest copy(@NotNull String brandUid, @Nullable String socialProvider, @Nullable String socialToken, @Nullable String socialAccountId, @Nullable String email, @Nullable String phoneNumber) {
        Intrinsics.g(brandUid, "brandUid");
        return new BrandSigninRequest(brandUid, socialProvider, socialToken, socialAccountId, email, phoneNumber);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BrandSigninRequest)) {
            return false;
        }
        BrandSigninRequest brandSigninRequest = (BrandSigninRequest) other;
        return Intrinsics.b(this.brandUid, brandSigninRequest.brandUid) && Intrinsics.b(this.socialProvider, brandSigninRequest.socialProvider) && Intrinsics.b(this.socialToken, brandSigninRequest.socialToken) && Intrinsics.b(this.socialAccountId, brandSigninRequest.socialAccountId) && Intrinsics.b(this.email, brandSigninRequest.email) && Intrinsics.b(this.phoneNumber, brandSigninRequest.phoneNumber);
    }

    @NotNull
    public final String getBrandUid() {
        return this.brandUid;
    }

    @Nullable
    public final String getEmail() {
        return this.email;
    }

    @Nullable
    public final String getPhoneNumber() {
        return this.phoneNumber;
    }

    @Nullable
    public final String getSocialAccountId() {
        return this.socialAccountId;
    }

    @Nullable
    public final String getSocialProvider() {
        return this.socialProvider;
    }

    @Nullable
    public final String getSocialToken() {
        return this.socialToken;
    }

    public int hashCode() {
        int iHashCode = this.brandUid.hashCode() * 31;
        String str = this.socialProvider;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.socialToken;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.socialAccountId;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.email;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.phoneNumber;
        return iHashCode5 + (str5 != null ? str5.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.brandUid;
        String str2 = this.socialProvider;
        String str3 = this.socialToken;
        String str4 = this.socialAccountId;
        String str5 = this.email;
        String str6 = this.phoneNumber;
        StringBuilder sbW = c0.w("BrandSigninRequest(brandUid=", str, ", socialProvider=", str2, ", socialToken=");
        c0.D(sbW, str3, ", socialAccountId=", str4, ", email=");
        return c0.s(sbW, str5, ", phoneNumber=", str6, ")");
    }

    public BrandSigninRequest(@NotNull String brandUid, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5) {
        Intrinsics.g(brandUid, "brandUid");
        this.brandUid = brandUid;
        this.socialProvider = str;
        this.socialToken = str2;
        this.socialAccountId = str3;
        this.email = str4;
        this.phoneNumber = str5;
    }

    public /* synthetic */ BrandSigninRequest(String str, String str2, String str3, String str4, String str5, String str6, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4, (i5 & 16) != 0 ? null : str5, (i5 & 32) != 0 ? null : str6);
    }
}
