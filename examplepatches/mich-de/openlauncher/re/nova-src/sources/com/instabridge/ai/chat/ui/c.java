package com.instabridge.ai.chat.ui;

import android.content.DialogInterface;
import android.view.KeyEvent;
import com.instabridge.ai.chat.model.Conversation;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35331a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ KeyEvent.Callback f35332b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35333c;

    public /* synthetic */ c(KeyEvent.Callback callback, Object obj, int i5) {
        this.f35331a = i5;
        this.f35332b = callback;
        this.f35333c = obj;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        switch (this.f35331a) {
            case 0:
                AiChatActivity.onOptionsItemSelected$lambda$4((AiChatActivity) this.f35332b, (String) this.f35333c, dialogInterface, i5);
                break;
            default:
                ((ConversationListView) this.f35332b).deleteConversation((Conversation) this.f35333c);
                break;
        }
    }
}
