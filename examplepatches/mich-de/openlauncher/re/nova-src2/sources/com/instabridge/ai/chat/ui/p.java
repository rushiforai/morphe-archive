package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.AiChatView;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class p implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35393a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35394b;

    public /* synthetic */ p(String str, int i5) {
        this.f35393a = i5;
        this.f35394b = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35393a) {
            case 0:
                return AiChatView.AnonymousClass2.invokeSuspend$lambda$2(this.f35394b, (ChatItem.AiMessage) obj);
            case 1:
                return AiChatView.AnonymousClass4.emit$lambda$1$lambda$0(this.f35394b, (ChatItem.AiMessage) obj);
            case 2:
                return AiChatView.AnonymousClass4.emit$lambda$4(this.f35394b, (ChatItem.AiMessage) obj);
            case 3:
                return AiChatView.setThinkingTextIfStreaming$lambda$70(this.f35394b, (ChatItem.AiMessage) obj);
            case 4:
                return AiChatView.enterClarificationMode$lambda$45(this.f35394b, (ChatItem.AiMessage) obj);
            case 5:
                return AiChatView.processStream$flushPendingFrame$lambda$35(this.f35394b, (ChatItem.AiMessage) obj);
            default:
                return AiChatView.lambda$5$lambda$4(this.f35394b, (ChatItem.AiMessage) obj);
        }
    }
}
