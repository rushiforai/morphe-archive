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
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 12\u00020\u0001:\u000201B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nBK\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\t\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u0015J\t\u0010\u001e\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0003HÆ\u0003JF\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\"J\u0013\u0010#\u001a\u00020$2\b\u0010%\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010&\u001a\u00020\fHÖ\u0001J\t\u0010'\u001a\u00020\u0003HÖ\u0001J%\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020\u00002\u0006\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.H\u0001¢\u0006\u0002\b/R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R \u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0010\n\u0002\u0010\u0016\u0012\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R\u001c\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0017\u0010\u0013\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0011¨\u00062"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/ClientSignInResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "token", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "authId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userId", "secret", "existingBrandUid", "<init>", "(Ljava/lang/String;Ljava/lang/Long;JLjava/lang/String;Ljava/lang/String;)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/Long;JLjava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getToken", "()Ljava/lang/String;", "getAuthId$annotations", "()V", "getAuthId", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getUserId$annotations", "getUserId", "()J", "getSecret", "getExistingBrandUid", "component1", "component2", "component3", "component4", "component5", "copy", "(Ljava/lang/String;Ljava/lang/Long;JLjava/lang/String;Ljava/lang/String;)Lcom/instabridge/mobilesdk/internal/auth/ClientSignInResponse;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class ClientSignInResponse {
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

    @NotNull
    private final String token;
    private final long userId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/ClientSignInResponse$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/ClientSignInResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<ClientSignInResponse> serializer() {
            return ClientSignInResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ ClientSignInResponse(int i5, String str, Long l9, long j11, String str2, String str3, SerializationConstructorMarker serializationConstructorMarker) {
        if (5 != (i5 & 5)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 5, ClientSignInResponse$$serializer.INSTANCE.getDescriptor());
        }
        this.token = str;
        if ((i5 & 2) == 0) {
            this.authId = null;
        } else {
            this.authId = l9;
        }
        this.userId = j11;
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

    public static /* synthetic */ ClientSignInResponse copy$default(ClientSignInResponse clientSignInResponse, String str, Long l9, long j11, String str2, String str3, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = clientSignInResponse.token;
        }
        if ((i5 & 2) != 0) {
            l9 = clientSignInResponse.authId;
        }
        if ((i5 & 4) != 0) {
            j11 = clientSignInResponse.userId;
        }
        if ((i5 & 8) != 0) {
            str2 = clientSignInResponse.secret;
        }
        if ((i5 & 16) != 0) {
            str3 = clientSignInResponse.existingBrandUid;
        }
        long j12 = j11;
        return clientSignInResponse.copy(str, l9, j12, str2, str3);
    }

    @SerialName("auth_id")
    public static /* synthetic */ void getAuthId$annotations() {
    }

    @SerialName("user_id")
    public static /* synthetic */ void getUserId$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(ClientSignInResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.token);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.authId != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, LongSerializer.INSTANCE, self.authId);
        }
        output.encodeLongElement(serialDesc, 2, self.userId);
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.secret != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.secret);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.existingBrandUid == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.existingBrandUid);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Long getAuthId() {
        return this.authId;
    }

    /* renamed from: component3, reason: from getter */
    public final long getUserId() {
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
    public final ClientSignInResponse copy(@NotNull String token, @Nullable Long authId, long userId, @Nullable String secret, @Nullable String existingBrandUid) {
        Intrinsics.g(token, "token");
        return new ClientSignInResponse(token, authId, userId, secret, existingBrandUid);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClientSignInResponse)) {
            return false;
        }
        ClientSignInResponse clientSignInResponse = (ClientSignInResponse) other;
        return Intrinsics.b(this.token, clientSignInResponse.token) && Intrinsics.b(this.authId, clientSignInResponse.authId) && this.userId == clientSignInResponse.userId && Intrinsics.b(this.secret, clientSignInResponse.secret) && Intrinsics.b(this.existingBrandUid, clientSignInResponse.existingBrandUid);
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

    @NotNull
    public final String getToken() {
        return this.token;
    }

    public final long getUserId() {
        return this.userId;
    }

    public int hashCode() {
        int iHashCode = this.token.hashCode() * 31;
        Long l9 = this.authId;
        int iD = c0.d((iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31, 31, this.userId);
        String str = this.secret;
        int iHashCode2 = (iD + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.existingBrandUid;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        String str = this.token;
        Long l9 = this.authId;
        long j11 = this.userId;
        String str2 = this.secret;
        String str3 = this.existingBrandUid;
        StringBuilder sb2 = new StringBuilder("ClientSignInResponse(token=");
        sb2.append(str);
        sb2.append(", authId=");
        sb2.append(l9);
        sb2.append(", userId=");
        sb2.append(j11);
        sb2.append(", secret=");
        sb2.append(str2);
        return c0.r(sb2, ", existingBrandUid=", str3, ")");
    }

    public ClientSignInResponse(@NotNull String token, @Nullable Long l9, long j11, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(token, "token");
        this.token = token;
        this.authId = l9;
        this.userId = j11;
        this.secret = str;
        this.existingBrandUid = str2;
    }

    public /* synthetic */ ClientSignInResponse(String str, Long l9, long j11, String str2, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : l9, j11, (i5 & 8) != 0 ? null : str2, (i5 & 16) != 0 ? null : str3);
    }
}
