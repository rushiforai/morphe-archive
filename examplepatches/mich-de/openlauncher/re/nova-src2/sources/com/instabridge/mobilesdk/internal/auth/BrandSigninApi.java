package com.instabridge.mobilesdk.internal.auth;

import eb0.p0;
import gb0.k;
import gb0.o;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b`\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0006\u0010\u0007J \u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\u00042\b\b\u0001\u0010\u0003\u001a\u00020\bH§@¢\u0006\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/auth/BrandSigninApi;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/internal/auth/ClientSignInRequest;", "body", "Leb0/p0;", "Lcom/instabridge/mobilesdk/internal/auth/ClientSignInResponse;", "clientSignin", "(Lcom/instabridge/mobilesdk/internal/auth/ClientSignInRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/instabridge/mobilesdk/internal/auth/BrandSigninRequest;", "Lcom/instabridge/mobilesdk/internal/auth/BrandSigninResponse;", "signin", "(Lcom/instabridge/mobilesdk/internal/auth/BrandSigninRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface BrandSigninApi {
    @k({"Cache-Control: no-store"})
    @o("v1/client/signin")
    @Nullable
    Object clientSignin(@gb0.a @NotNull ClientSignInRequest clientSignInRequest, @NotNull Continuation<? super p0<ClientSignInResponse>> continuation);

    @o("v1/brand/signin")
    @Nullable
    Object signin(@gb0.a @NotNull BrandSigninRequest brandSigninRequest, @NotNull Continuation<? super p0<BrandSigninResponse>> continuation);
}
