package com.instabridge.ai.bridge;

import b.c0;
import com.instabridge.ai.bridge.ChannelHandler;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fo.d;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J(\u0010\b\u001a\u0004\u0018\u00010\u00052\u0006\u0010\t\u001a\u00020\u00052\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bH\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\r"}, d2 = {"Lcom/instabridge/ai/bridge/SessionChannelHandler;", "Lcom/instabridge/ai/bridge/ChannelHandler;", "<init>", "()V", "domain", b.f42142b, "getDomain", "()Ljava/lang/String;", "handle", "action", "payload", b.f42142b, b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class SessionChannelHandler implements ChannelHandler {
    public static final int $stable = 0;

    @NotNull
    private final String domain = "session";

    @Override // com.instabridge.ai.bridge.ChannelHandler
    @NotNull
    public String getDomain() {
        return this.domain;
    }

    @Override // com.instabridge.ai.bridge.ChannelHandler
    @Nullable
    public String handle(@NotNull String action, @NotNull Map<String, ? extends Object> payload) {
        Intrinsics.g(action, "action");
        Intrinsics.g(payload, "payload");
        if (!action.equals("info")) {
            return null;
        }
        String sessionId = d.j() ? d.h().getCurrentSessionId() : null;
        return sessionId != null ? c0.l("{\"session_id\":\"", sessionId, "\"}") : "{\"session_id\":null}";
    }

    @Override // com.instabridge.ai.bridge.ChannelHandler
    @Nullable
    public Object handleAsync(@NotNull String str, @NotNull Map<String, ? extends Object> map, @NotNull ChannelHandler.AsyncResponder asyncResponder, @NotNull Continuation<? super Unit> continuation) {
        return ChannelHandler.DefaultImpls.handleAsync(this, str, map, asyncResponder, continuation);
    }
}
