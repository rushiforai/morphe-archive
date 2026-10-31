package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.nd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3287nd extends AbstractC3466y6<C3219jd> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3287nd(@NotNull String callerId, @NotNull String sessionId, @NotNull C3219jd requestData, @NotNull String requestId) {
        super("local_search", callerId, sessionId, requestId, requestData);
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(requestData, "requestData");
        Intrinsics.g(requestId, "requestId");
    }
}
