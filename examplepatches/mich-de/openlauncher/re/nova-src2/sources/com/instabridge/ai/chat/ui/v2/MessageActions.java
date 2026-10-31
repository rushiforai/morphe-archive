package com.instabridge.ai.chat.ui.v2;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.protocol.Suggestion;
import java.util.Map;
import kotlin.Metadata;
import ninja.sesame.lib.bridge.v1.ShortcutType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0003\b`\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\b\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bH&J2\u0010\f\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u000e2\u0016\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u000e\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u000eH&J\b\u0010\u0012\u001a\u00020\u0003H&¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/MessageActions;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onCopy", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "item", "Lcom/instabridge/ai/chat/model/ChatItem$AiMessage;", "onThumbUp", "onThumbDown", "onRegenerate", "onSuggestionTap", ShortcutType.SUGGESTION, "Lcom/instabridge/ai/protocol/Suggestion;", "onToolResult", "callId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "result", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "error", "onSystemRetry", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface MessageActions {
    void onCopy(@NotNull ChatItem.AiMessage item);

    void onRegenerate(@NotNull ChatItem.AiMessage item);

    void onSuggestionTap(@NotNull Suggestion suggestion);

    void onSystemRetry();

    void onThumbDown(@NotNull ChatItem.AiMessage item);

    void onThumbUp(@NotNull ChatItem.AiMessage item);

    void onToolResult(@NotNull String callId, @Nullable Map<String, ? extends Object> result, @Nullable String error);
}
