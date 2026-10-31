package com.instabridge.ai.chat.ui;

import android.widget.FrameLayout;
import com.instabridge.ai.chat.ui.AiChatView;

/* loaded from: classes3.dex */
public final /* synthetic */ class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35382a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FrameLayout f35383b;

    public /* synthetic */ m(FrameLayout frameLayout, int i5) {
        this.f35382a = i5;
        this.f35383b = frameLayout;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f35382a) {
            case 0:
                AiChatView.C28131.invokeSuspend$lambda$1((AiChatView) this.f35383b);
                break;
            case 1:
                AiChatView.continueFromBubble$lambda$29((AiChatView) this.f35383b);
                break;
            case 2:
                AiChatView.scrollToBottomIfNeeded$lambda$78((AiChatView) this.f35383b);
                break;
            case 3:
                ((AiChatView) this.f35383b).updateContentOverlayOffsets();
                break;
            case 4:
                ((AiChatView) this.f35383b).updateContentOverlayOffsets();
                break;
            case 5:
                ((AiChatView) this.f35383b).updateContentOverlayOffsets();
                break;
            case 6:
                ((AiChatView) this.f35383b).exitClarificationMode();
                break;
            case 7:
                AiChatView.scrollToBottomIfNeeded$lambda$78$lambda$76$lambda$75((AiChatView) this.f35383b);
                break;
            case 8:
                AiChatView.handleSuggestionClick$lambda$54((AiChatView) this.f35383b);
                break;
            default:
                ((ChatInputBar) this.f35383b).updateInputHeight(false);
                break;
        }
    }
}
