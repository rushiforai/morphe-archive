package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class He extends AbstractC3466y6<Ge> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public He(@NotNull String callerId, @NotNull String sessionId, @NotNull Ge requestData, @NotNull String requestId) {
        super("ads_suggested_apps", callerId, sessionId, requestId, requestData);
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(requestId, "requestId");
    }
}
