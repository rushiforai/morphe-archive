package com.instabridge.ai.bridge;

import b70.k;
import com.instabridge.ai.bridge.ChannelHandler;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J&\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0014\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007H\u0016J\u0018\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0005H\u0016¨\u0006\u000b"}, d2 = {"com/instabridge/ai/bridge/AiWebBridge$send$responder$1", "Lcom/instabridge/ai/bridge/ChannelHandler$AsyncResponder;", "send", b.f42142b, "channel", b.f42142b, "payload", b.f42142b, b.f42142b, "sendError", "error", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiWebBridge$send$responder$1 implements ChannelHandler.AsyncResponder {
    final /* synthetic */ AiWebBridge this$0;

    public AiWebBridge$send$responder$1(AiWebBridge aiWebBridge) {
        this.this$0 = aiWebBridge;
    }

    @Override // com.instabridge.ai.bridge.ChannelHandler.AsyncResponder
    public void send(String channel, Map<String, ? extends Object> payload) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(payload, "payload");
        this.this$0.sendToWeb(channel, payload);
    }

    @Override // com.instabridge.ai.bridge.ChannelHandler.AsyncResponder
    public void sendError(String channel, String error) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(error, "error");
        this.this$0.sendToWeb(channel, k.e0(new Pair("error", error)));
    }
}
