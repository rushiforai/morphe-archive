package com.instabridge.ai.auth;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/auth/TokenResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Success", k.f40331e, "Lcom/instabridge/ai/auth/TokenResult$Error;", "Lcom/instabridge/ai/auth/TokenResult$Success;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class TokenResult {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/auth/TokenResult$Error;", "Lcom/instabridge/ai/auth/TokenResult;", PglCryptUtils.KEY_MESSAGE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Error extends TokenResult {
        public static final int $stable = 0;

        @NotNull
        private final String message;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Error(@NotNull String message) {
            super(null);
            Intrinsics.g(message, "message");
            this.message = message;
        }

        public static /* synthetic */ Error copy$default(Error error, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = error.message;
            }
            return error.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        @NotNull
        public final Error copy(@NotNull String message) {
            Intrinsics.g(message, "message");
            return new Error(message);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Error) && Intrinsics.b(this.message, ((Error) other).message);
        }

        @NotNull
        public final String getMessage() {
            return this.message;
        }

        public int hashCode() {
            return this.message.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("Error(message="), this.message, ')');
        }
    }

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\rJ0\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\r¨\u0006\u001b"}, d2 = {"Lcom/instabridge/ai/auth/TokenResult$Success;", "Lcom/instabridge/ai/auth/TokenResult;", "token", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "personId", "expiresAt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V", "getToken", "()Ljava/lang/String;", "getPersonId", "getExpiresAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lcom/instabridge/ai/auth/TokenResult$Success;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success extends TokenResult {
        public static final int $stable = 0;

        @Nullable
        private final Long expiresAt;

        @Nullable
        private final String personId;

        @NotNull
        private final String token;

        public /* synthetic */ Success(String str, String str2, Long l9, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : l9);
        }

        public static /* synthetic */ Success copy$default(Success success, String str, String str2, Long l9, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = success.token;
            }
            if ((i5 & 2) != 0) {
                str2 = success.personId;
            }
            if ((i5 & 4) != 0) {
                l9 = success.expiresAt;
            }
            return success.copy(str, str2, l9);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getToken() {
            return this.token;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getPersonId() {
            return this.personId;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final Long getExpiresAt() {
            return this.expiresAt;
        }

        @NotNull
        public final Success copy(@NotNull String token, @Nullable String personId, @Nullable Long expiresAt) {
            Intrinsics.g(token, "token");
            return new Success(token, personId, expiresAt);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Success)) {
                return false;
            }
            Success success = (Success) other;
            return Intrinsics.b(this.token, success.token) && Intrinsics.b(this.personId, success.personId) && Intrinsics.b(this.expiresAt, success.expiresAt);
        }

        @Nullable
        public final Long getExpiresAt() {
            return this.expiresAt;
        }

        @Nullable
        public final String getPersonId() {
            return this.personId;
        }

        @NotNull
        public final String getToken() {
            return this.token;
        }

        public int hashCode() {
            int iHashCode = this.token.hashCode() * 31;
            String str = this.personId;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Long l9 = this.expiresAt;
            return iHashCode2 + (l9 != null ? l9.hashCode() : 0);
        }

        @NotNull
        public String toString() {
            return "Success(token=" + this.token + ", personId=" + this.personId + ", expiresAt=" + this.expiresAt + ')';
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Success(@NotNull String token, @Nullable String str, @Nullable Long l9) {
            super(null);
            Intrinsics.g(token, "token");
            this.token = token;
            this.personId = str;
            this.expiresAt = l9;
        }
    }

    public /* synthetic */ TokenResult(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private TokenResult() {
    }
}
