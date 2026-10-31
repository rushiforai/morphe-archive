package com.instabridge.ai.chat.data;

import com.instabridge.ai.protocol.Suggestion;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0006\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00062\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\b0\u0007J\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\u000b\u001a\u00020\u0006J\u0010\u0010\u000e\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\u0006J\u0006\u0010\u000f\u001a\u00020\nR \u0010\u0004\u001a\u0014\u0012\u0004\u0012\u00020\u0006\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00070\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/chat/data/ConversationSuggestionStore;", b.f42142b, "<init>", "()V", "suggestionsByConversation", "Ljava/util/concurrent/ConcurrentHashMap;", b.f42142b, b.f42142b, "Lcom/instabridge/ai/protocol/Suggestion;", "put", b.f42142b, "conversationId", "suggestions", "get", "clear", "clearAll", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ConversationSuggestionStore {

    @NotNull
    public static final ConversationSuggestionStore INSTANCE = new ConversationSuggestionStore();

    @NotNull
    private static final ConcurrentHashMap<String, List<Suggestion>> suggestionsByConversation = new ConcurrentHashMap<>();
    public static final int $stable = 8;

    private ConversationSuggestionStore() {
    }

    public final void clear(@Nullable String conversationId) {
        if (conversationId == null || k.U0(conversationId)) {
            return;
        }
        suggestionsByConversation.remove(conversationId);
    }

    public final void clearAll() {
        suggestionsByConversation.clear();
    }

    @NotNull
    public final List<Suggestion> get(@NotNull String conversationId) {
        Intrinsics.g(conversationId, "conversationId");
        List<Suggestion> list = suggestionsByConversation.get(conversationId);
        return list == null ? EmptyList.f71733a : list;
    }

    public final void put(@NotNull String conversationId, @NotNull List<Suggestion> suggestions) {
        Intrinsics.g(conversationId, "conversationId");
        Intrinsics.g(suggestions, "suggestions");
        if (suggestions.isEmpty()) {
            suggestionsByConversation.remove(conversationId);
        } else {
            suggestionsByConversation.put(conversationId, suggestions);
        }
    }
}
