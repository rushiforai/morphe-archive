package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class jg extends AbstractC3466y6<gg> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jg(@NotNull String callerId, @NotNull String sessionId, @NotNull gg requestData, @NotNull String requestId) {
        super("zero_state", callerId, sessionId, requestId, requestData);
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(requestId, "requestId");
    }
}
