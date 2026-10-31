package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.AiChatView;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class o implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35390a;

    public /* synthetic */ o(int i5) {
        this.f35390a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35390a) {
            case 0:
                return AiChatView.AnonymousClass2.invokeSuspend$lambda$1((ChatItem.AiMessage) obj);
            case 1:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$0((ChatItem.AiMessage) obj);
            case 2:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$8((ChatItem.AiMessage) obj);
            case 3:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$14((ChatItem.AiMessage) obj);
            case 4:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$15((ChatItem.AiMessage) obj);
            case 5:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$17((ChatItem.AiMessage) obj);
            case 6:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$18((ChatItem.AiMessage) obj);
            case 7:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$4((ChatItem.AiMessage) obj);
            case 8:
                return AiChatView$sendMessageInternal$answerJob$1.invokeSuspend$lambda$5((ChatItem.AiMessage) obj);
            default:
                return Boolean.valueOf(AiChatView.removeCompletedToolCards$lambda$80((ChatItem) obj));
        }
    }
}
