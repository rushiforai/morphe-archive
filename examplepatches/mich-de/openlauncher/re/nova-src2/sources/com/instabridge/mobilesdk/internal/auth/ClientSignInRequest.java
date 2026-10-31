package com.instabridge.mobilesdk.internal.auth;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0081\b\u0018\u0000  2\u00020\u0001:\u0002\u001f B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006B/\b\u0010\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u0005\u0010\u000bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\bHÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001J%\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dH\u0001¢\u0006\u0002\b\u001eR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\r¨\u0006!"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/ClientSignInRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "socialProvider", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "socialToken", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "seen0", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializationConstructorMarker", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "(ILjava/lang/String;Ljava/lang/String;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "getSocialProvider", "()Ljava/lang/String;", "getSocialToken", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "write$Self", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "self", "output", "Lkotlinx/serialization/encoding/CompositeEncoder;", "serialDesc", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "write$Self$mobile_sdk_release", "$serializer", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final /* data */ class ClientSignInRequest {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private final String socialProvider;

    @NotNull
    private final String socialToken;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/ClientSignInRequest$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/internal/auth/ClientSignInRequest;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final KSerializer<ClientSignInRequest> serializer() {
            return ClientSignInRequest$$serializer.INSTANCE;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ ClientSignInRequest(int i5, String str, String str2, SerializationConstructorMarker serializationConstructorMarker) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, ClientSignInRequest$$serializer.INSTANCE.getDescriptor());
        }
        this.socialProvider = str;
        this.socialToken = str2;
    }

    public static /* synthetic */ ClientSignInRequest copy$default(ClientSignInRequest clientSignInRequest, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = clientSignInRequest.socialProvider;
        }
        if ((i5 & 2) != 0) {
            str2 = clientSignInRequest.socialToken;
        }
        return clientSignInRequest.copy(str, str2);
    }

    @JvmStatic
    public static final /* synthetic */ void write$Self$mobile_sdk_release(ClientSignInRequest self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.socialProvider);
        output.encodeStringElement(serialDesc, 1, self.socialToken);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getSocialProvider() {
        return this.socialProvider;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getSocialToken() {
        return this.socialToken;
    }

    @NotNull
    public final ClientSignInRequest copy(@NotNull String socialProvider, @NotNull String socialToken) {
        Intrinsics.g(socialProvider, "socialProvider");
        Intrinsics.g(socialToken, "socialToken");
        return new ClientSignInRequest(socialProvider, socialToken);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClientSignInRequest)) {
            return false;
        }
        ClientSignInRequest clientSignInRequest = (ClientSignInRequest) other;
        return Intrinsics.b(this.socialProvider, clientSignInRequest.socialProvider) && Intrinsics.b(this.socialToken, clientSignInRequest.socialToken);
    }

    @NotNull
    public final String getSocialProvider() {
        return this.socialProvider;
    }

    @NotNull
    public final String getSocialToken() {
        return this.socialToken;
    }

    public int hashCode() {
        return this.socialToken.hashCode() + (this.socialProvider.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return c0.n("ClientSignInRequest(socialProvider=", this.socialProvider, ", socialToken=", this.socialToken, ")");
    }

    public ClientSignInRequest(@NotNull String socialProvider, @NotNull String socialToken) {
        Intrinsics.g(socialProvider, "socialProvider");
        Intrinsics.g(socialToken, "socialToken");
        this.socialProvider = socialProvider;
        this.socialToken = socialToken;
    }
}
