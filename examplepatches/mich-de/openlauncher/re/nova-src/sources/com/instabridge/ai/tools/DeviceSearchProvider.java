package com.instabridge.ai.tools;

import java.util.List;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\bæ\u0080\u0001\u0018\u00002\u00020\u0001J$\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH¦@¢\u0006\u0002\u0010\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/tools/DeviceSearchProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "search", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/DeviceSearchResult;", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "maxResults", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface DeviceSearchProvider {
    @Nullable
    Object search(@NotNull String str, int i5, @NotNull Continuation<? super List<DeviceSearchResult>> continuation);
}
