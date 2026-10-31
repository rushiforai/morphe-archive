package com.instabridge.ai.chat.ui;

import android.view.View;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35326a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35327b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f35326a = i5;
        this.f35327b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35326a) {
            case 0:
                ((AiChatActivity) this.f35327b).finish();
                break;
            case 1:
                AiChatView._init_$lambda$13((AiChatView) this.f35327b, view);
                break;
            case 2:
                ChatAdapter.AiMessageViewHolder.updateActionsRow$lambda$13((ChatAdapter) this.f35327b, view);
                break;
            case 3:
                ((j0) this.f35327b).invoke();
                break;
            case 4:
                ChatInputBar._init_$lambda$8((ChatInputBar) this.f35327b, view);
                break;
            default:
                ((ConversationListActivity) this.f35327b).finish();
                break;
        }
    }
}
