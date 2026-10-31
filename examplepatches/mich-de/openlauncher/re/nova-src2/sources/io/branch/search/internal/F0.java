package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class F0 extends AbstractC3466y6<B0> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public F0(@NotNull String callerId, @NotNull String sessionId, @NotNull B0 requestData, @NotNull String requestId) {
        super("app_store_api", callerId, sessionId, requestId, requestData);
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(requestId, "requestId");
    }
}
