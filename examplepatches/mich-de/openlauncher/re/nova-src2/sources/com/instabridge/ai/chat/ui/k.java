package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35372a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35373b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35374c;

    public /* synthetic */ k(int i5, Object obj, Object obj2) {
        this.f35372a = i5;
        this.f35373b = obj;
        this.f35374c = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f35372a) {
            case 0:
                AiChatView.showChatToolCard$lambda$44((AiChatView) this.f35373b, (ChatItem.ToolCallCard) this.f35374c);
                break;
            case 1:
                ChatAdapter.AiMessageViewHolder.setThinkingTextWithCrossfade$lambda$8((ChatAdapter.AiMessageViewHolder) this.f35373b, (String) this.f35374c);
                break;
            default:
                ConversationListView.updateConversationTitle$lambda$5((ConversationListView) this.f35373b, (String) this.f35374c);
                break;
        }
    }
}
