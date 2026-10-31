package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.ui.AiChatView;
import com.instabridge.ai.protocol.AGUIEvent;

/* loaded from: classes3.dex */
public final /* synthetic */ class s implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35407a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatView f35408b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AGUIEvent.QuotaExceeded f35409c;

    public /* synthetic */ s(AiChatView aiChatView, AGUIEvent.QuotaExceeded quotaExceeded, int i5) {
        this.f35407a = i5;
        this.f35408b = aiChatView;
        this.f35409c = quotaExceeded;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f35407a) {
            case 0:
                AiChatView.AnonymousClass4.emit$lambda$19(this.f35408b, this.f35409c);
                break;
            default:
                this.f35408b.showQuotaExceededDialog(this.f35409c);
                break;
        }
    }
}
