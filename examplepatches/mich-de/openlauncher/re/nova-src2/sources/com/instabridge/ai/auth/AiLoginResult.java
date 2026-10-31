package com.instabridge.ai.auth;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0004\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Success", "SignInRequired", "IdentityConflict", "TemporaryFailure", "Lcom/instabridge/ai/auth/AiLoginResult$IdentityConflict;", "Lcom/instabridge/ai/auth/AiLoginResult$SignInRequired;", "Lcom/instabridge/ai/auth/AiLoginResult$Success;", "Lcom/instabridge/ai/auth/AiLoginResult$TemporaryFailure;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AiLoginResult {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginResult$IdentityConflict;", "Lcom/instabridge/ai/auth/AiLoginResult;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class IdentityConflict extends AiLoginResult {
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
            return -763273705;
        }

        @NotNull
        public String toString() {
            return "IdentityConflict";
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginResult$SignInRequired;", "Lcom/instabridge/ai/auth/AiLoginResult;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SignInRequired extends AiLoginResult {
        public static final int $stable = 0;

        @NotNull
        public static final SignInRequired INSTANCE = new SignInRequired();

        private SignInRequired() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof SignInRequired);
        }

        public int hashCode() {
            return -1168194904;
        }

        @NotNull
        public String toString() {
            return "SignInRequired";
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginResult$Success;", "Lcom/instabridge/ai/auth/AiLoginResult;", "personId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "created", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Z)V", "getPersonId", "()Ljava/lang/String;", "getCreated", "()Z", "component1", "component2", "copy", "equals", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success extends AiLoginResult {
        public static final int $stable = 0;
        private final boolean created;

        @NotNull
        private final String personId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Success(@NotNull String personId, boolean z11) {
            super(null);
            Intrinsics.g(personId, "personId");
            this.personId = personId;
            this.created = z11;
        }

        public static /* synthetic */ Success copy$default(Success success, String str, boolean z11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = success.personId;
            }
            if ((i5 & 2) != 0) {
                z11 = success.created;
            }
            return success.copy(str, z11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getPersonId() {
            return this.personId;
        }

        /* renamed from: component2, reason: from getter */
        public final boolean getCreated() {
            return this.created;
        }

        @NotNull
        public final Success copy(@NotNull String personId, boolean created) {
            Intrinsics.g(personId, "personId");
            return new Success(personId, created);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Success)) {
                return false;
            }
            Success success = (Success) other;
            return Intrinsics.b(this.personId, success.personId) && this.created == success.created;
        }

        public final boolean getCreated() {
            return this.created;
        }

        @NotNull
        public final String getPersonId() {
            return this.personId;
        }

        public int hashCode() {
            return Boolean.hashCode(this.created) + (this.personId.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Success(personId=");
            sb2.append(this.personId);
            sb2.append(", created=");
            return a2.c.p(sb2, this.created, ')');
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0013\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\t\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0007J\u001a\u0010\n\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u000bJ\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fHÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginResult$TemporaryFailure;", "Lcom/instabridge/ai/auth/AiLoginResult;", "retryAfterSeconds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/Long;)V", "getRetryAfterSeconds", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "copy", "(Ljava/lang/Long;)Lcom/instabridge/ai/auth/AiLoginResult$TemporaryFailure;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class TemporaryFailure extends AiLoginResult {
        public static final int $stable = 0;

        @Nullable
        private final Long retryAfterSeconds;

        /* JADX WARN: Multi-variable type inference failed */
        public TemporaryFailure() {
            this(null, 1, 0 == true ? 1 : 0);
        }

        public static /* synthetic */ TemporaryFailure copy$default(TemporaryFailure temporaryFailure, Long l9, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                l9 = temporaryFailure.retryAfterSeconds;
            }
            return temporaryFailure.copy(l9);
        }

        @Nullable
        /* renamed from: component1, reason: from getter */
        public final Long getRetryAfterSeconds() {
            return this.retryAfterSeconds;
        }

        @NotNull
        public final TemporaryFailure copy(@Nullable Long retryAfterSeconds) {
            return new TemporaryFailure(retryAfterSeconds);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof TemporaryFailure) && Intrinsics.b(this.retryAfterSeconds, ((TemporaryFailure) other).retryAfterSeconds);
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
            return "TemporaryFailure(retryAfterSeconds=" + this.retryAfterSeconds + ')';
        }

        public TemporaryFailure(@Nullable Long l9) {
            super(null);
            this.retryAfterSeconds = l9;
        }

        public /* synthetic */ TemporaryFailure(Long l9, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : l9);
        }
    }

    public /* synthetic */ AiLoginResult(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AiLoginResult() {
    }
}
