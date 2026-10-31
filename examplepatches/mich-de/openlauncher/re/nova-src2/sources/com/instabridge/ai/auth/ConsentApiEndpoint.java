package com.instabridge.ai.auth;

import gb0.f;
import gb0.i;
import gb0.o;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bb\u0018\u00002\u00020\u0001J\"\u0010\u0002\u001a\u00020\u00032\b\b\u0001\u0010\u0004\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007H§@¢\u0006\u0002\u0010\bJ\u0018\u0010\t\u001a\u00020\n2\b\b\u0001\u0010\u0004\u001a\u00020\u0005H§@¢\u0006\u0002\u0010\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/auth/ConsentApiEndpoint;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "setConsent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "authorization", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "request", "Lcom/instabridge/ai/auth/ConsentRequest;", "(Ljava/lang/String;Lcom/instabridge/ai/auth/ConsentRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getConsent", "Lcom/instabridge/ai/auth/ConsentResponse;", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
interface ConsentApiEndpoint {
    @f("api/auth/consent/context")
    @Nullable
    Object getConsent(@i("Authorization") @NotNull String str, @NotNull Continuation<? super ConsentResponse> continuation);

    @o("api/auth/consent/context")
    @Nullable
    Object setConsent(@i("Authorization") @NotNull String str, @gb0.a @NotNull ConsentRequest consentRequest, @NotNull Continuation<? super Unit> continuation);
}
