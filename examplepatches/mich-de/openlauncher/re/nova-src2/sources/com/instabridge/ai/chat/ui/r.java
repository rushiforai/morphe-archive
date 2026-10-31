package com.instabridge.ai.chat.ui;

import android.content.Context;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.model.Conversation;
import com.instabridge.ai.chat.ui.AiChatView;
import com.instabridge.ai.protocol.AGUIEvent;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class r implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35402a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35403b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f35402a = i5;
        this.f35403b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35402a) {
            case 0:
                return AiChatView.AnonymousClass4.emit$lambda$18((AGUIEvent.QuotaExceeded) this.f35403b, (ChatItem.AiMessage) obj);
            case 1:
                return AiChatActivity.onCreate$lambda$3((AiChatActivity) this.f35403b, (AiChatView.ConversationState) obj);
            case 2:
                return AiChatView._init_$lambda$6((Context) this.f35403b, (String) obj);
            default:
                return ConversationListActivity.onCreate$lambda$1((ConversationListActivity) this.f35403b, (Conversation) obj);
        }
    }
}
