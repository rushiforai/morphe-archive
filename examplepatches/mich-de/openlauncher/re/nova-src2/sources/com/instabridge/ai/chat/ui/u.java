package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.AiChatView;
import com.instabridge.ai.protocol.AGUIEvent;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class u implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35420a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35421b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AGUIEvent f35422c;

    public /* synthetic */ u(AGUIEvent.ToolCallStart toolCallStart, String str) {
        this.f35422c = toolCallStart;
        this.f35421b = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35420a) {
            case 0:
                return AiChatView.AnonymousClass4.emit$lambda$5((AGUIEvent.ToolCallStart) this.f35422c, this.f35421b, (ChatItem.AiMessage) obj);
            default:
                return AiChatView.AnonymousClass4.emit$lambda$10(this.f35421b, (AGUIEvent.ToolCallArgs) this.f35422c, (ChatItem.AiMessage) obj);
        }
    }

    public /* synthetic */ u(String str, AGUIEvent.ToolCallArgs toolCallArgs) {
        this.f35421b = str;
        this.f35422c = toolCallArgs;
    }
}
