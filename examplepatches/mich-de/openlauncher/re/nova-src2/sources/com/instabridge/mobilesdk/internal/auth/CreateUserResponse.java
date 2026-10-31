package com.instabridge.mobilesdk.internal.auth;

import b.c0;
import b.u4;
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
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 ,2\u00020\u0001:\u0002+,B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nB?\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\t\u0010\u000eJ\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0005HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0007HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J3\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\u0007HÖ\u0001J\t\u0010\"\u001a\u00020\u0003HÖ\u0001J%\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00002\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020)H\u0001¢\u0006\u0002\b*R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u001c\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0015\u0010\u0012\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0010¨\u0006-"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/CreateUserResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "token", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "authId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "secret", "<init>", "(Ljava/lang/String;JILjava/lang/String;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;JILjava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getToken", "()Ljava/lang/String;", "getAuthId$annotations", "()V", "getAuthId", "()J", "getUserId$annotations", "getUserId", "()I", "getSecret", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class CreateUserResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    private final long authId;

    @Nullable
    private final String secret;

    @NotNull
    private final String token;
    private final int userId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/CreateUserResponse$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/CreateUserResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<CreateUserResponse> serializer() {
            return CreateUserResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ CreateUserResponse(int i5, String str, long j11, int i11, String str2, SerializationConstructorMarker serializationConstructorMarker) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, CreateUserResponse$$serializer.INSTANCE.getDescriptor());
        }
        this.token = str;
        if ((i5 & 2) == 0) {
            this.authId = 0L;
        } else {
            this.authId = j11;
        }
        if ((i5 & 4) == 0) {
            this.userId = 0;
        } else {
            this.userId = i11;
        }
        if ((i5 & 8) == 0) {
            this.secret = null;
        } else {
            this.secret = str2;
        }
    }

    public static /* synthetic */ CreateUserResponse copy$default(CreateUserResponse createUserResponse, String str, long j11, int i5, String str2, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = createUserResponse.token;
        }
        if ((i11 & 2) != 0) {
            j11 = createUserResponse.authId;
        }
        if ((i11 & 4) != 0) {
            i5 = createUserResponse.userId;
        }
        if ((i11 & 8) != 0) {
            str2 = createUserResponse.secret;
        }
        return createUserResponse.copy(str, j11, i5, str2);
    }

    @SerialName("auth_id")
    public static /* synthetic */ void getAuthId$annotations() {
    }

    @SerialName("user_id")
    public static /* synthetic */ void getUserId$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(CreateUserResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.token);
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.authId != 0) {
            output.encodeLongElement(serialDesc, 1, self.authId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.userId != 0) {
            output.encodeIntElement(serialDesc, 2, self.userId);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3) && self.secret == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.secret);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    /* renamed from: component2, reason: from getter */
    public final long getAuthId() {
        return this.authId;
    }

    /* renamed from: component3, reason: from getter */
    public final int getUserId() {
        return this.userId;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getSecret() {
        return this.secret;
    }

    @NotNull
    public final CreateUserResponse copy(@NotNull String token, long authId, int userId, @Nullable String secret) {
        Intrinsics.g(token, "token");
        return new CreateUserResponse(token, authId, userId, secret);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateUserResponse)) {
            return false;
        }
        CreateUserResponse createUserResponse = (CreateUserResponse) other;
        return Intrinsics.b(this.token, createUserResponse.token) && this.authId == createUserResponse.authId && this.userId == createUserResponse.userId && Intrinsics.b(this.secret, createUserResponse.secret);
    }

    public final long getAuthId() {
        return this.authId;
    }

    @Nullable
    public final String getSecret() {
        return this.secret;
    }

    @NotNull
    public final String getToken() {
        return this.token;
    }

    public final int getUserId() {
        return this.userId;
    }

    public int hashCode() {
        int iA = u4.a(this.userId, c0.d(this.token.hashCode() * 31, 31, this.authId), 31);
        String str = this.secret;
        return iA + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public String toString() {
        return "CreateUserResponse(token=" + this.token + ", authId=" + this.authId + ", userId=" + this.userId + ", secret=" + this.secret + ")";
    }

    public CreateUserResponse(@NotNull String token, long j11, int i5, @Nullable String str) {
        Intrinsics.g(token, "token");
        this.token = token;
        this.authId = j11;
        this.userId = i5;
        this.secret = str;
    }

    public /* synthetic */ CreateUserResponse(String str, long j11, int i5, String str2, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i11 & 2) != 0 ? 0L : j11, (i11 & 4) != 0 ? 0 : i5, (i11 & 8) != 0 ? null : str2);
    }
}
