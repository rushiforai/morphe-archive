package com.instabridge.ai.chat.ui.v2;

/* loaded from: classes3.dex */
public final /* synthetic */ class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35455a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatViewV2 f35456b;

    public /* synthetic */ g(AiChatViewV2 aiChatViewV2, int i5) {
        this.f35455a = i5;
        this.f35456b = aiChatViewV2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f35455a) {
            case 0:
                AiChatViewV2.access$refreshJumpToBottomVisibility(this.f35456b);
                break;
            case 1:
                AiChatViewV2.scrollToBottomNow$lambda$47(this.f35456b);
                break;
            case 2:
                AiChatViewV2.scrollToBottomNow$lambda$47$lambda$46$lambda$45(this.f35456b);
                break;
            case 3:
                this.f35456b.refreshJumpToBottomVisibility();
                break;
            default:
                AiChatViewV2.executeSuggestionToolCall$lambda$24(this.f35456b);
                break;
        }
    }
}
