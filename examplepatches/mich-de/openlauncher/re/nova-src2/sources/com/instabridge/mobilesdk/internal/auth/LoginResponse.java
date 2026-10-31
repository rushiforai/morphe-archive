package com.instabridge.mobilesdk.internal.auth;

import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
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
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000 ,2\u00020\u0001:\u0002+,B3\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\t\u0010\nB?\b\u0010\u0012\u0006\u0010\u000b\u001a\u00020\u0003\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\t\u0010\u000eJ\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0007HÆ\u0003J5\u0010\u001e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u001f\u001a\u00020\u00052\b\u0010 \u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010!\u001a\u00020\u0003HÖ\u0001J\t\u0010\"\u001a\u00020\u0007HÖ\u0001J%\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00002\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020)H\u0001¢\u0006\u0002\b*R\u001c\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0013\u0010\u0010\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u001e\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0018\u0010\u0010\u001a\u0004\b\u0019\u0010\u0017¨\u0006-"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/LoginResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "firstTime", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "currentName", "<init>", "(IZLjava/lang/String;Ljava/lang/String;)V", "seen0", "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(IIZLjava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getUserId$annotations", "()V", "getUserId", "()I", "getFirstTime$annotations", "getFirstTime", "()Z", "getName", "()Ljava/lang/String;", "getCurrentName$annotations", "getCurrentName", "component1", "component2", "component3", "component4", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class LoginResponse {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String currentName;
    private final boolean firstTime;

    @Nullable
    private final String name;
    private final int userId;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/LoginResponse$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/LoginResponse;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<LoginResponse> serializer() {
            return LoginResponse$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public LoginResponse() {
        this(0, false, (String) null, (String) null, 15, (DefaultConstructorMarker) null);
    }

    public static /* synthetic */ LoginResponse copy$default(LoginResponse loginResponse, int i5, boolean z11, String str, String str2, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = loginResponse.userId;
        }
        if ((i11 & 2) != 0) {
            z11 = loginResponse.firstTime;
        }
        if ((i11 & 4) != 0) {
            str = loginResponse.name;
        }
        if ((i11 & 8) != 0) {
            str2 = loginResponse.currentName;
        }
        return loginResponse.copy(i5, z11, str, str2);
    }

    @SerialName("current_name")
    public static /* synthetic */ void getCurrentName$annotations() {
    }

    @SerialName("first_time")
    public static /* synthetic */ void getFirstTime$annotations() {
    }

    @SerialName("user_id")
    public static /* synthetic */ void getUserId$annotations() {
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(LoginResponse self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.userId != 0) {
            output.encodeIntElement(serialDesc, 0, self.userId);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.firstTime) {
            output.encodeBooleanElement(serialDesc, 1, self.firstTime);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.name != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.name);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3) && self.currentName == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.currentName);
    }

    /* renamed from: component1, reason: from getter */
    public final int getUserId() {
        return this.userId;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getFirstTime() {
        return this.firstTime;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getCurrentName() {
        return this.currentName;
    }

    @NotNull
    public final LoginResponse copy(int userId, boolean firstTime, @Nullable String name, @Nullable String currentName) {
        return new LoginResponse(userId, firstTime, name, currentName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LoginResponse)) {
            return false;
        }
        LoginResponse loginResponse = (LoginResponse) other;
        return this.userId == loginResponse.userId && this.firstTime == loginResponse.firstTime && Intrinsics.b(this.name, loginResponse.name) && Intrinsics.b(this.currentName, loginResponse.currentName);
    }

    @Nullable
    public final String getCurrentName() {
        return this.currentName;
    }

    public final boolean getFirstTime() {
        return this.firstTime;
    }

    @Nullable
    public final String getName() {
        return this.name;
    }

    public final int getUserId() {
        return this.userId;
    }

    public int hashCode() {
        int iF = c9.f(Integer.hashCode(this.userId) * 31, 31, this.firstTime);
        String str = this.name;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.currentName;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        int i5 = this.userId;
        boolean z11 = this.firstTime;
        String str = this.name;
        String str2 = this.currentName;
        StringBuilder sb2 = new StringBuilder("LoginResponse(userId=");
        sb2.append(i5);
        sb2.append(", firstTime=");
        sb2.append(z11);
        sb2.append(", name=");
        return c0.s(sb2, str, ", currentName=", str2, ")");
    }

    public /* synthetic */ LoginResponse(int i5, int i11, boolean z11, String str, String str2, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.userId = 0;
        } else {
            this.userId = i11;
        }
        if ((i5 & 2) == 0) {
            this.firstTime = false;
        } else {
            this.firstTime = z11;
        }
        if ((i5 & 4) == 0) {
            this.name = null;
        } else {
            this.name = str;
        }
        if ((i5 & 8) == 0) {
            this.currentName = null;
        } else {
            this.currentName = str2;
        }
    }

    public LoginResponse(int i5, boolean z11, @Nullable String str, @Nullable String str2) {
        this.userId = i5;
        this.firstTime = z11;
        this.name = str;
        this.currentName = str2;
    }

    public /* synthetic */ LoginResponse(int i5, boolean z11, String str, String str2, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this((i11 & 1) != 0 ? 0 : i5, (i11 & 2) != 0 ? false : z11, (i11 & 4) != 0 ? null : str, (i11 & 8) != 0 ? null : str2);
    }
}
