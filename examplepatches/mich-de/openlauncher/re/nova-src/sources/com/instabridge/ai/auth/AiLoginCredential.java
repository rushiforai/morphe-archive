package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginCredential;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Google", "AppServerToken", "Lcom/instabridge/ai/auth/AiLoginCredential$AppServerToken;", "Lcom/instabridge/ai/auth/AiLoginCredential$Google;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AiLoginCredential {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\b\u0010\b\u001a\u00020\u0003H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginCredential$AppServerToken;", "Lcom/instabridge/ai/auth/AiLoginCredential;", "token", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getToken", "()Ljava/lang/String;", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AppServerToken extends AiLoginCredential {
        public static final int $stable = 0;

        @NotNull
        private final String token;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AppServerToken(@NotNull String token) {
            super(null);
            Intrinsics.g(token, "token");
            this.token = token;
        }

        @NotNull
        public final String getToken() {
            return this.token;
        }

        @NotNull
        public String toString() {
            return "AiLoginCredential.AppServerToken(token=<redacted>)";
        }
    }

    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\b\u0010\b\u001a\u00020\u0003H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/auth/AiLoginCredential$Google;", "Lcom/instabridge/ai/auth/AiLoginCredential;", "idToken", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getIdToken", "()Ljava/lang/String;", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Google extends AiLoginCredential {
        public static final int $stable = 0;

        @NotNull
        private final String idToken;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Google(@NotNull String idToken) {
            super(null);
            Intrinsics.g(idToken, "idToken");
            this.idToken = idToken;
        }

        @NotNull
        public final String getIdToken() {
            return this.idToken;
        }

        @NotNull
        public String toString() {
            return "AiLoginCredential.Google(idToken=<redacted>)";
        }
    }

    public /* synthetic */ AiLoginCredential(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AiLoginCredential() {
    }
}
