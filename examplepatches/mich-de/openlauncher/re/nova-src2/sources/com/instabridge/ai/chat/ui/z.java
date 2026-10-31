package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.model.ChatMessage;
import com.instabridge.ai.chat.model.Conversation;
import com.instabridge.ai.chat.ui.ChatAdapter;
import com.instabridge.ai.chat.ui.ConversationListAdapter;
import com.instabridge.ai.protocol.Suggestion;

/* loaded from: classes3.dex */
public final /* synthetic */ class z implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35480a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35481b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35482c;

    public /* synthetic */ z(int i5, Object obj, Object obj2) {
        this.f35480a = i5;
        this.f35481b = obj;
        this.f35482c = obj2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35480a) {
            case 0:
                ChatAdapter.AiMessageViewHolder.showSuggestions$lambda$33$lambda$31$lambda$30((ChatAdapter) this.f35481b, (Suggestion) this.f35482c, view);
                break;
            case 1:
                ((ChatAdapter.AiMessageViewHolder) this.f35481b).showAnswerActionsMenu((ChatItem.AiMessage) this.f35482c);
                break;
            case 2:
                ChatAdapter.AiMessageViewHolder.showSources$lambda$23$lambda$22((Context) this.f35481b, (ChatMessage.Source) this.f35482c, view);
                break;
            case 3:
                ChatAdapter.AiMessageViewHolder.showSources$lambda$25((ChatAdapter.AiMessageViewHolder) this.f35481b, (ImageView) this.f35482c, view);
                break;
            default:
                ConversationListAdapter.ConversationViewHolder.bind$lambda$1((ConversationListAdapter) this.f35481b, (Conversation) this.f35482c, view);
                break;
        }
    }
}
