package com.instabridge.ai.auth;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.l;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0016\n\u0002\u0010\b\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\b\u0010\u0016\u001a\u00020\u0003H\u0016J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001c\u001a\u00020\nHÆ\u0003JE\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\nHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\n2\b\u0010\u001f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010 \u001a\u00020!HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000eR\u0011\u0010\b\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\""}, d2 = {"Lcom/instabridge/ai/auth/LoginSession;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "personId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "token", "expiresAt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "refreshToken", "refreshExpiresAt", "created", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;JZ)V", "getPersonId", "()Ljava/lang/String;", "getToken", "getExpiresAt", "()J", "getRefreshToken", "getRefreshExpiresAt", "getCreated", "()Z", "toString", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class LoginSession {
    public static final int $stable = 0;
    private final boolean created;
    private final long expiresAt;

    @NotNull
    private final String personId;
    private final long refreshExpiresAt;

    @NotNull
    private final String refreshToken;

    @NotNull
    private final String token;

    public LoginSession(@NotNull String personId, @NotNull String token, long j11, @NotNull String refreshToken, long j12, boolean z11) {
        Intrinsics.g(personId, "personId");
        Intrinsics.g(token, "token");
        Intrinsics.g(refreshToken, "refreshToken");
        this.personId = personId;
        this.token = token;
        this.expiresAt = j11;
        this.refreshToken = refreshToken;
        this.refreshExpiresAt = j12;
        this.created = z11;
    }

    public static /* synthetic */ LoginSession copy$default(LoginSession loginSession, String str, String str2, long j11, String str3, long j12, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = loginSession.personId;
        }
        if ((i5 & 2) != 0) {
            str2 = loginSession.token;
        }
        if ((i5 & 4) != 0) {
            j11 = loginSession.expiresAt;
        }
        if ((i5 & 8) != 0) {
            str3 = loginSession.refreshToken;
        }
        if ((i5 & 16) != 0) {
            j12 = loginSession.refreshExpiresAt;
        }
        if ((i5 & 32) != 0) {
            z11 = loginSession.created;
        }
        String str4 = str3;
        long j13 = j11;
        return loginSession.copy(str, str2, j13, str4, j12, z11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPersonId() {
        return this.personId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    /* renamed from: component3, reason: from getter */
    public final long getExpiresAt() {
        return this.expiresAt;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getRefreshToken() {
        return this.refreshToken;
    }

    /* renamed from: component5, reason: from getter */
    public final long getRefreshExpiresAt() {
        return this.refreshExpiresAt;
    }

    /* renamed from: component6, reason: from getter */
    public final boolean getCreated() {
        return this.created;
    }

    @NotNull
    public final LoginSession copy(@NotNull String personId, @NotNull String token, long expiresAt, @NotNull String refreshToken, long refreshExpiresAt, boolean created) {
        Intrinsics.g(personId, "personId");
        Intrinsics.g(token, "token");
        Intrinsics.g(refreshToken, "refreshToken");
        return new LoginSession(personId, token, expiresAt, refreshToken, refreshExpiresAt, created);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LoginSession)) {
            return false;
        }
        LoginSession loginSession = (LoginSession) other;
        return Intrinsics.b(this.personId, loginSession.personId) && Intrinsics.b(this.token, loginSession.token) && this.expiresAt == loginSession.expiresAt && Intrinsics.b(this.refreshToken, loginSession.refreshToken) && this.refreshExpiresAt == loginSession.refreshExpiresAt && this.created == loginSession.created;
    }

    public final boolean getCreated() {
        return this.created;
    }

    public final long getExpiresAt() {
        return this.expiresAt;
    }

    @NotNull
    public final String getPersonId() {
        return this.personId;
    }

    public final long getRefreshExpiresAt() {
        return this.refreshExpiresAt;
    }

    @NotNull
    public final String getRefreshToken() {
        return this.refreshToken;
    }

    @NotNull
    public final String getToken() {
        return this.token;
    }

    public int hashCode() {
        return Boolean.hashCode(this.created) + c0.d(c0.e(c0.d(c0.e(this.personId.hashCode() * 31, 31, this.token), 31, this.expiresAt), 31, this.refreshToken), 31, this.refreshExpiresAt);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("LoginSession(personId=");
        sb2.append(l.G1(8, this.personId));
        sb2.append("..., expiresAt=");
        sb2.append(this.expiresAt);
        sb2.append(", refreshExpiresAt=");
        sb2.append(this.refreshExpiresAt);
        sb2.append(", created=");
        return a2.c.p(sb2, this.created, ')');
    }
}
