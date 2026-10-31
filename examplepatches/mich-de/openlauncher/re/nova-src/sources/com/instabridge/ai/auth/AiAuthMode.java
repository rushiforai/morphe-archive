package com.instabridge.ai.auth;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \u00072\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0003\b\t\n¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthMode;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Login", "External", "Anonymous", k.O, "Lcom/instabridge/ai/auth/AiAuthMode$Anonymous;", "Lcom/instabridge/ai/auth/AiAuthMode$External;", "Lcom/instabridge/ai/auth/AiAuthMode$Login;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AiAuthMode {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthMode$Anonymous;", "Lcom/instabridge/ai/auth/AiAuthMode;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Anonymous extends AiAuthMode {
        public static final int $stable = 0;

        @NotNull
        public static final Anonymous INSTANCE = new Anonymous();

        private Anonymous() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Anonymous);
        }

        public int hashCode() {
            return -6429815;
        }

        @NotNull
        public String toString() {
            return "Anonymous";
        }
    }

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\b\u001a\u00020\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthMode$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "fromLegacy", "Lcom/instabridge/ai/auth/AiAuthMode;", "tokenProvider", "Lcom/instabridge/ai/auth/TokenProvider;", "useAnonymousAuth", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @Nullable
        public final AiAuthMode fromLegacy(@Nullable TokenProvider tokenProvider, boolean useAnonymousAuth) {
            if (tokenProvider != null) {
                return new External(tokenProvider);
            }
            if (useAnonymousAuth) {
                return Anonymous.INSTANCE;
            }
            return null;
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthMode$External;", "Lcom/instabridge/ai/auth/AiAuthMode;", "tokenProvider", "Lcom/instabridge/ai/auth/TokenProvider;", "<init>", "(Lcom/instabridge/ai/auth/TokenProvider;)V", "getTokenProvider", "()Lcom/instabridge/ai/auth/TokenProvider;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class External extends AiAuthMode {
        public static final int $stable = 8;

        @NotNull
        private final TokenProvider tokenProvider;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public External(@NotNull TokenProvider tokenProvider) {
            super(null);
            Intrinsics.g(tokenProvider, "tokenProvider");
            this.tokenProvider = tokenProvider;
        }

        public static /* synthetic */ External copy$default(External external, TokenProvider tokenProvider, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                tokenProvider = external.tokenProvider;
            }
            return external.copy(tokenProvider);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final TokenProvider getTokenProvider() {
            return this.tokenProvider;
        }

        @NotNull
        public final External copy(@NotNull TokenProvider tokenProvider) {
            Intrinsics.g(tokenProvider, "tokenProvider");
            return new External(tokenProvider);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof External) && Intrinsics.b(this.tokenProvider, ((External) other).tokenProvider);
        }

        @NotNull
        public final TokenProvider getTokenProvider() {
            return this.tokenProvider;
        }

        public int hashCode() {
            return this.tokenProvider.hashCode();
        }

        @NotNull
        public String toString() {
            return "External(tokenProvider=" + this.tokenProvider + ')';
        }
    }

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthMode$Login;", "Lcom/instabridge/ai/auth/AiAuthMode;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Login extends AiAuthMode {
        public static final int $stable = 0;

        @NotNull
        public static final Login INSTANCE = new Login();

        private Login() {
            super(null);
        }

        public boolean equals(@Nullable Object other) {
            return this == other || (other instanceof Login);
        }

        public int hashCode() {
            return -451195771;
        }

        @NotNull
        public String toString() {
            return "Login";
        }
    }

    public /* synthetic */ AiAuthMode(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AiAuthMode() {
    }
}
