package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.Conversation;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0006\u0010\u000b\u001a\u00020\fR \u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\n¨\u0006\r"}, d2 = {"Lcom/instabridge/ai/chat/ui/ConversationListCache;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "items", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/model/Conversation;", "getItems", "()Ljava/util/List;", "setItems", "(Ljava/util/List;)V", "clear", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ConversationListCache {

    @NotNull
    public static final ConversationListCache INSTANCE = new ConversationListCache();

    @NotNull
    private static volatile List<Conversation> items = EmptyList.f71733a;
    public static final int $stable = 8;

    private ConversationListCache() {
    }

    public final void clear() {
        items = EmptyList.f71733a;
    }

    @NotNull
    public final List<Conversation> getItems() {
        return items;
    }

    public final void setItems(@NotNull List<Conversation> list) {
        Intrinsics.g(list, "<set-?>");
        items = list;
    }
}
