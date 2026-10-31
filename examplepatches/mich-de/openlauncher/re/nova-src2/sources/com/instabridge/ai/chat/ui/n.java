package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.AiChatView;
import com.instabridge.ai.protocol.Suggestion;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35386a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatView f35387b;

    public /* synthetic */ n(AiChatView aiChatView, int i5) {
        this.f35386a = i5;
        this.f35387b = aiChatView;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35386a) {
            case 0:
                return AiChatView.AnonymousClass2.invokeSuspend$lambda$0(this.f35387b, (ChatItem.AiMessage) obj);
            case 1:
                return AiChatView.AnonymousClass4.emit$lambda$20(this.f35387b, (ChatItem.AiMessage) obj);
            case 2:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$13(this.f35387b, (ChatItem.AiMessage) obj);
            case 3:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$16(this.f35387b, (ChatItem.AiMessage) obj);
            case 4:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$19(this.f35387b, (ChatItem.AiMessage) obj);
            case 5:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$1(this.f35387b, (ChatItem.AiMessage) obj);
            case 6:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$3(this.f35387b, (ChatItem.AiMessage) obj);
            case 7:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$6(this.f35387b, (ChatItem.AiMessage) obj);
            case 8:
                return AiChatView._init_$lambda$2(this.f35387b, (Suggestion) obj);
            case 9:
                return AiChatView._init_$lambda$3(this.f35387b, (ChatItem.AiMessage) obj);
            case 10:
                return AiChatView._init_$lambda$10(this.f35387b, (String) obj);
            case 11:
                return AiChatView._init_$lambda$12(this.f35387b, (String) obj);
            default:
                return AiChatView.processStream$lambda$36(this.f35387b, (ChatItem.AiMessage) obj);
        }
    }
}
