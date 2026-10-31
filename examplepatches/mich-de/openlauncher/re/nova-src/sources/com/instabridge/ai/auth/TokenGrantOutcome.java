package com.instabridge.ai.auth;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0005\t\n\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Granted", "AccountDeleted", "Rejected", "IdentityConflict", "Unavailable", "Lcom/instabridge/ai/auth/TokenGrantOutcome$AccountDeleted;", "Lcom/instabridge/ai/auth/TokenGrantOutcome$Granted;", "Lcom/instabridge/ai/auth/TokenGrantOutcome$IdentityConflict;", "Lcom/instabridge/ai/auth/TokenGrantOutcome$Rejected;", "Lcom/instabridge/ai/auth/TokenGrantOutcome$Unavailable;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class TokenGrantOutcome {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome$AccountDeleted;", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AccountDeleted extends TokenGrantOutcome {
        public static final int $stable = 0;

        @NotNull
        public static final AccountDeleted INSTANCE = new AccountDeleted();

        private AccountDeleted() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof AccountDeleted);
        }

        public int hashCode() {
            return 1568194338;
        }

        @NotNull
        public String toString() {
            return "AccountDeleted";
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome$Granted;", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "session", "Lcom/instabridge/ai/auth/LoginSession;", "<init>", "(Lcom/instabridge/ai/auth/LoginSession;)V", "getSession", "()Lcom/instabridge/ai/auth/LoginSession;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Granted extends TokenGrantOutcome {
        public static final int $stable = 0;

        @NotNull
        private final LoginSession session;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Granted(@NotNull LoginSession session) {
            super(null);
            Intrinsics.g(session, "session");
            this.session = session;
        }

        public static /* synthetic */ Granted copy$default(Granted granted, LoginSession loginSession, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                loginSession = granted.session;
            }
            return granted.copy(loginSession);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final LoginSession getSession() {
            return this.session;
        }

        @NotNull
        public final Granted copy(@NotNull LoginSession session) {
            Intrinsics.g(session, "session");
            return new Granted(session);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Granted) && Intrinsics.b(this.session, ((Granted) other).session);
        }

        @NotNull
        public final LoginSession getSession() {
            return this.session;
        }

        public int hashCode() {
            return this.session.hashCode();
        }

        @NotNull
        public String toString() {
            return "Granted(session=" + this.session + ')';
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome$IdentityConflict;", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class IdentityConflict extends TokenGrantOutcome {
        public static final int $stable = 0;

        @NotNull
        public static final IdentityConflict INSTANCE = new IdentityConflict();

        private IdentityConflict() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof IdentityConflict);
        }

        public int hashCode() {
            return -1051813082;
        }

        @NotNull
        public String toString() {
            return "IdentityConflict";
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome$Rejected;", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Rejected extends TokenGrantOutcome {
        public static final int $stable = 0;

        @NotNull
        public static final Rejected INSTANCE = new Rejected();

        private Rejected() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Rejected);
        }

        public int hashCode() {
            return 836903668;
        }

        @NotNull
        public String toString() {
            return "Rejected";
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0007J\u001a\u0010\n\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u000bJ\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/auth/TokenGrantOutcome$Unavailable;", "Lcom/instabridge/ai/auth/TokenGrantOutcome;", "retryAfterSeconds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/Long;)V", "getRetryAfterSeconds", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "copy", "(Ljava/lang/Long;)Lcom/instabridge/ai/auth/TokenGrantOutcome$Unavailable;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Unavailable extends TokenGrantOutcome {
        public static final int $stable = 0;

        @Nullable
        private final Long retryAfterSeconds;

        public Unavailable(@Nullable Long l9) {
            super(null);
            this.retryAfterSeconds = l9;
        }

        public static /* synthetic */ Unavailable copy$default(Unavailable unavailable, Long l9, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                l9 = unavailable.retryAfterSeconds;
            }
            return unavailable.copy(l9);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final Long getRetryAfterSeconds() {
            return this.retryAfterSeconds;
        }

        @NotNull
        public final Unavailable copy(@Nullable Long retryAfterSeconds) {
            return new Unavailable(retryAfterSeconds);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Unavailable) && Intrinsics.b(this.retryAfterSeconds, ((Unavailable) other).retryAfterSeconds);
        }

        @Nullable
        public final Long getRetryAfterSeconds() {
            return this.retryAfterSeconds;
        }

        public int hashCode() {
            Long l9 = this.retryAfterSeconds;
            if (l9 == null) {
                return 0;
            }
            return l9.hashCode();
        }

        @NotNull
        public String toString() {
            return "Unavailable(retryAfterSeconds=" + this.retryAfterSeconds + ')';
        }
    }

    public /* synthetic */ TokenGrantOutcome(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private TokenGrantOutcome() {
    }
}
