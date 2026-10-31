package com.instabridge.ai.chat.ui;

import android.view.View;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class a0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35323a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ChatItem.AiMessage f35324b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ChatAdapter f35325c;

    public /* synthetic */ a0(ChatItem.AiMessage aiMessage, ChatAdapter chatAdapter, int i5) {
        this.f35323a = i5;
        this.f35324b = aiMessage;
        this.f35325c = chatAdapter;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35323a) {
            case 0:
                ChatAdapter.AiMessageViewHolder.updateActionsRow$lambda$10(this.f35324b, this.f35325c, view);
                break;
            case 1:
                ChatAdapter.AiMessageViewHolder.updateActionsRow$lambda$11(this.f35324b, this.f35325c, view);
                break;
            default:
                ChatAdapter.AiMessageViewHolder.updateActionsRow$lambda$12(this.f35325c, this.f35324b, view);
                break;
        }
    }

    public /* synthetic */ a0(ChatAdapter chatAdapter, ChatItem.AiMessage aiMessage) {
        this.f35323a = 2;
        this.f35325c = chatAdapter;
        this.f35324b = aiMessage;
    }
}
