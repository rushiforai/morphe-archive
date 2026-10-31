package com.instabridge.ai.auth;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u000e\u0010\u0002\u001a\u00020\u0003H¦@¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/instabridge/ai/auth/TokenProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getToken", "Lcom/instabridge/ai/auth/TokenResult;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface TokenProvider {
    @Nullable
    Object getToken(@NotNull Continuation<? super TokenResult> continuation);
}
