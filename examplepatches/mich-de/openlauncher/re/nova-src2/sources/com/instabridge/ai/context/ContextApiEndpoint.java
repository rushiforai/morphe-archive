package com.instabridge.ai.context;

import gb0.i;
import gb0.o;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b`\u0018\u00002\u00020\u0001J6\u0010\u0002\u001a\u00020\u00032\b\b\u0001\u0010\u0004\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u00052\b\b\u0001\u0010\u0007\u001a\u00020\u00052\b\b\u0001\u0010\b\u001a\u00020\tH§@¢\u0006\u0002\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/context/ContextApiEndpoint;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "addContext", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "authorization", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appId", "productSurface", "request", "Lcom/instabridge/ai/context/AddContextRequest;", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/ai/context/AddContextRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ContextApiEndpoint {
    @o("api/context/add")
    @Nullable
    Object addContext(@i("Authorization") @NotNull String str, @i("X-App-Id") @NotNull String str2, @i("X-Product-Surface") @NotNull String str3, @gb0.a @NotNull AddContextRequest addContextRequest, @NotNull Continuation<? super Unit> continuation);
}
