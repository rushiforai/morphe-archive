package com.instabridge.ai.bridge;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001:\u0001\u000fJ(\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0007\u001a\u00020\u00032\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\tH&J4\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0007\u001a\u00020\u00032\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\t2\u0006\u0010\f\u001a\u00020\rH\u0096@¢\u0006\u0002\u0010\u000eR\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/bridge/ChannelHandler;", b.f42142b, "domain", b.f42142b, "getDomain", "()Ljava/lang/String;", "handle", "action", "payload", b.f42142b, "handleAsync", b.f42142b, "responder", "Lcom/instabridge/ai/bridge/ChannelHandler$AsyncResponder;", "(Ljava/lang/String;Ljava/util/Map;Lcom/instabridge/ai/bridge/ChannelHandler$AsyncResponder;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "AsyncResponder", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ChannelHandler {

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J&\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0014\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007H&J\u0018\u0010\b\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u0005H&¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/bridge/ChannelHandler$AsyncResponder;", b.f42142b, "send", b.f42142b, "channel", b.f42142b, "payload", b.f42142b, "sendError", "error", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface AsyncResponder {
        void send(@NotNull String channel, @NotNull Map<String, ? extends Object> payload);

        void sendError(@NotNull String channel, @NotNull String error);
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        @Nullable
        public static Object handleAsync(@NotNull ChannelHandler channelHandler, @NotNull String str, @NotNull Map<String, ? extends Object> map, @NotNull AsyncResponder asyncResponder, @NotNull Continuation<? super Unit> continuation) {
            return Unit.f71706a;
        }
    }

    @NotNull
    String getDomain();

    @Nullable
    String handle(@NotNull String action, @NotNull Map<String, ? extends Object> payload);

    @Nullable
    Object handleAsync(@NotNull String str, @NotNull Map<String, ? extends Object> map, @NotNull AsyncResponder asyncResponder, @NotNull Continuation<? super Unit> continuation);
}
