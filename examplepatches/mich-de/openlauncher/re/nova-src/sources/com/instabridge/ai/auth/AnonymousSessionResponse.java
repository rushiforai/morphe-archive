package com.instabridge.ai.auth;

import aq.o;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B/\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u000eJ:\u0010\u0014\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0015J\u0013\u0010\u0016\u001a\u00020\u00072\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\u0006\u0010\u000e¨\u0006\u001b"}, d2 = {"Lcom/instabridge/ai/auth/AnonymousSessionResponse;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "personId", "token", "isLoggedIn", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V", "getStatus", "()Ljava/lang/String;", "getPersonId", "getToken", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Lcom/instabridge/ai/auth/AnonymousSessionResponse;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class AnonymousSessionResponse {

    @Nullable
    private final Boolean isLoggedIn;

    @NotNull
    private final String personId;

    @Nullable
    private final String status;

    @NotNull
    private final String token;

    public AnonymousSessionResponse(@Nullable String str, @o(name = "person_id") @NotNull String personId, @NotNull String token, @o(name = "is_logged_in") @Nullable Boolean bool) {
        Intrinsics.g(personId, "personId");
        Intrinsics.g(token, "token");
        this.status = str;
        this.personId = personId;
        this.token = token;
        this.isLoggedIn = bool;
    }

    public static /* synthetic */ AnonymousSessionResponse copy$default(AnonymousSessionResponse anonymousSessionResponse, String str, String str2, String str3, Boolean bool, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = anonymousSessionResponse.status;
        }
        if ((i5 & 2) != 0) {
            str2 = anonymousSessionResponse.personId;
        }
        if ((i5 & 4) != 0) {
            str3 = anonymousSessionResponse.token;
        }
        if ((i5 & 8) != 0) {
            bool = anonymousSessionResponse.isLoggedIn;
        }
        return anonymousSessionResponse.copy(str, str2, str3, bool);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPersonId() {
        return this.personId;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getToken() {
        return this.token;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Boolean getIsLoggedIn() {
        return this.isLoggedIn;
    }

    @NotNull
    public final AnonymousSessionResponse copy(@Nullable String status, @o(name = "person_id") @NotNull String personId, @NotNull String token, @o(name = "is_logged_in") @Nullable Boolean isLoggedIn) {
        Intrinsics.g(personId, "personId");
        Intrinsics.g(token, "token");
        return new AnonymousSessionResponse(status, personId, token, isLoggedIn);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AnonymousSessionResponse)) {
            return false;
        }
        AnonymousSessionResponse anonymousSessionResponse = (AnonymousSessionResponse) other;
        return Intrinsics.b(this.status, anonymousSessionResponse.status) && Intrinsics.b(this.personId, anonymousSessionResponse.personId) && Intrinsics.b(this.token, anonymousSessionResponse.token) && Intrinsics.b(this.isLoggedIn, anonymousSessionResponse.isLoggedIn);
    }

    @NotNull
    public final String getPersonId() {
        return this.personId;
    }

    @Nullable
    public final String getStatus() {
        return this.status;
    }

    @NotNull
    public final String getToken() {
        return this.token;
    }

    public int hashCode() {
        String str = this.status;
        int iE = c0.e(c0.e((str == null ? 0 : str.hashCode()) * 31, 31, this.personId), 31, this.token);
        Boolean bool = this.isLoggedIn;
        return iE + (bool != null ? bool.hashCode() : 0);
    }

    @Nullable
    public final Boolean isLoggedIn() {
        return this.isLoggedIn;
    }

    @NotNull
    public String toString() {
        return "AnonymousSessionResponse(status=" + this.status + ", personId=" + this.personId + ", token=" + this.token + ", isLoggedIn=" + this.isLoggedIn + ')';
    }
}
